// RNL benchmark harness: every benchmark circuit through SPICE+RNL and
// Spectre+RNL and back into Analog Canvas, graded L0–L3 against the original.
//
// Run from an analog-canvas checkout (see README.md):
//   RNL_BENCH_CORPUS=<repo>/circuits RNL_BENCH_OUT=<dir> [RNL_BENCH_IDS=a,b] \
//     [RNL_BENCH_STRICT=all | hidden-absent,hidden-extra,…] \
//     npx vitest run apps/editor/src/features/netlist-export/rnl-benchmark.test.ts
import { mkdirSync, readdirSync, readFileSync, writeFileSync } from "node:fs";
import { join } from "node:path";
import { afterAll, it } from "vitest";

import { arrowEndStyles } from "@icm/derived";
import type { CircuitProject, SchematicDocument } from "@icm/model";
import {
  compareElectricalGraphs,
  createDesignNetlistExport,
  projectElectricalGraph,
} from "@icm/netlist";
import { parseProject, serializeProject } from "@icm/project-protocol";
import { createRnlExport, type RnlSnapshot } from "@icm/rnl";

import { labelCensus, labelDifferences } from "../../../e2e/label-census";
import { createRnlTestCore } from "./rnl-core.test-support";
import { planRnlImport } from "./rnl-import";
import type { RnlRuntime } from "./rnl-runtime";

const CORPUS = process.env.RNL_BENCH_CORPUS ?? "";
const OUT = process.env.RNL_BENCH_OUT ?? "";
const IDS = process.env.RNL_BENCH_IDS
  ? process.env.RNL_BENCH_IDS.split(",").filter(Boolean)
  : CORPUS
    ? readdirSync(CORPUS)
        .filter((name) => name.endsWith(".icproj.json"))
        .map((name) => name.replace(/\.icproj\.json$/u, ""))
        .sort()
    : [];
const FORMATS = ["spice", "spectre"] as const;

const core = await createRnlTestCore();
afterAll(() => core.terminate());
const runtime: RnlRuntime = {
  write: (request) =>
    core.write(request as unknown as Parameters<typeof core.write>[0]),
  snapshot: (request) =>
    core.snapshot(request) as unknown as Promise<RnlSnapshot>,
};

type Diagnostic = { severity: string; code: string; message: string };
const tally = (items: readonly Diagnostic[]) => {
  const out: Record<string, number> = {};
  for (const item of items)
    out[`${item.severity} ${item.code}`] =
      (out[`${item.severity} ${item.code}`] ?? 0) + 1;
  return out;
};

/** Mirror "horizontal" is "vertical" turned 180°, "both" is a 180° turn. */
function orientation(rotation: number, mirror: string) {
  if (mirror === "horizontal") return `r${(rotation + 180) % 360} vertical`;
  if (mirror === "both") return `r${(rotation + 180) % 360} none`;
  return `r${rotation} ${mirror}`;
}

const cellKey = (name: string) =>
  name.toLowerCase().replace(/[^a-z0-9]+/gu, "_");

function documentPairs(a: CircuitProject, b: CircuitProject) {
  const byKey = new Map(b.documents.map((item) => [cellKey(item.name), item]));
  const topB = b.documents.find((item) => item.id === b.topDocumentId);
  return a.documents.map((document) => ({
    a: document,
    b:
      document.id === a.topDocumentId
        ? topB
        : byKey.get(cellKey(document.name)),
  }));
}

function symbolOf(project: CircuitProject, instance: SchematicDocument["instances"][number]) {
  const binding = instance.netlist?.binding;
  if (binding?.kind === "subcircuit") {
    const child = project.documents.find((item) => item.id === binding.childDocumentId);
    return `cell:${cellKey(child?.name ?? "?")}`;
  }
  return instance.symbolId;
}

function placed(project: CircuitProject, document: SchematicDocument) {
  const named = new Map<string, string>();
  const unnamed: string[] = [];
  for (const instance of document.instances) {
    const at = instance.placement
      ? `${instance.placement.position.x},${instance.placement.position.y} ${orientation(instance.placement.rotation, instance.placement.mirror)}`
      : "unplaced";
    const symbol = symbolOf(project, instance);
    if (instance.reference)
      named.set(
        instance.reference,
        `${symbol} @ ${at} ${JSON.stringify(Object.fromEntries(Object.entries(instance.netlist?.parameters ?? {}).sort()))}`,
      );
    else unnamed.push(`${symbol} @ ${at}`);
  }
  return { named, unnamed: unnamed.sort() };
}

function multisetDiff(a: readonly string[], b: readonly string[]) {
  const left = new Map<string, number>();
  for (const item of a) left.set(item, (left.get(item) ?? 0) + 1);
  const added: string[] = [];
  for (const item of b) {
    const n = left.get(item) ?? 0;
    if (n > 0) left.set(item, n - 1);
    else added.push(item);
  }
  const missing = [...left].flatMap(([item, n]) => Array(n).fill(item));
  return { missing, added };
}

/**
 * Differences that draw the same, each counted as none unless named in
 * RNL_BENCH_STRICT (or `all`):
 * - hidden-absent: a hidden label the import does not bring back is still
 *   hidden; only one that comes back shown counts;
 * - hidden-extra: annotations are counted as shown, so a hidden one the
 *   import adds, which draws nothing, does not count;
 * - text-styles: a drawing object's text is compared by the characters it
 *   shows and the styles of each, as Analog Canvas compares styled text
 *   (sameStyledText), not by how its spans are nested or split;
 * - arrow-ends: an arrow's heads are compared as Analog Canvas draws them
 *   (arrowEndStyles), so the legacy fields and the defaults they mean match
 *   the explicit ends;
 * - style-defaults: a style flag set false, or a size scale of 1, is the
 *   same as one left unset.
 */
const EQUIVALENCES = [
  "hidden-absent",
  "hidden-extra",
  "text-styles",
  "arrow-ends",
  "style-defaults",
] as const;
type Equivalence = (typeof EQUIVALENCES)[number];
const STRICT = (process.env.RNL_BENCH_STRICT ?? "").split(",").filter(Boolean);
const ENABLED = new Set<Equivalence>(
  EQUIVALENCES.filter((name) => !STRICT.includes("all") && !STRICT.includes(name)),
);

/** A rich text as the characters it shows, each with its sorted styles. */
function styledCharacters(value: unknown, styles: readonly string[] = []): string[] {
  if (Array.isArray(value)) return value.flatMap((item) => styledCharacters(item, styles));
  if (!value || typeof value !== "object") return [];
  const run = value as Record<string, unknown>;
  if (run.kind === "text" && typeof run.value === "string")
    return [...run.value].map((character) => `${character}|${[...new Set(styles)].sort().join(",")}`);
  if (run.kind === "span")
    return styledCharacters(run.children, [...styles, String(run.style)]);
  if (run.kind === "line-break") return ["<br>"];
  return Object.entries(run)
    .filter(([key]) => key !== "kind")
    .flatMap(([key, item]) => styledCharacters(item, [...styles, key]));
}

/** A drawing object as its drawing compares, the equivalences applied. */
function comparable(object: Record<string, unknown>, equivalences: ReadonlySet<Equivalence>) {
  let next: Record<string, unknown> = { ...object };
  const style = { ...((next.styleOverride as Record<string, unknown> | undefined) ?? {}) };
  if (equivalences.has("text-styles") && next.content && typeof next.content === "object")
    next.content = styledCharacters((next.content as { runs?: unknown }).runs);
  if (equivalences.has("arrow-ends") && next.kind === "arrow") {
    next.arrowEnds = arrowEndStyles(next as Parameters<typeof arrowEndStyles>[0]);
    for (const key of ["arrowHead", "arrowHeadAt", "arrowHeadScale", "arrowStart", "arrowEnd"])
      delete style[key];
  }
  if (equivalences.has("style-defaults"))
    for (const [key, item] of Object.entries(style))
      if (item === false || (key === "sizeScale" && item === 1)) delete style[key];
  next.styleOverride = style;
  return next;
}

const byKind = (items: readonly { kind?: string }[]) => {
  const out: Record<string, number> = {};
  for (const item of items) out[item.kind ?? "?"] = (out[item.kind ?? "?"] ?? 0) + 1;
  return JSON.stringify(Object.fromEntries(Object.entries(out).sort()));
};

const withoutIds = (value: unknown): unknown =>
  Array.isArray(value)
    ? value.map(withoutIds)
    : value && typeof value === "object"
      ? Object.fromEntries(
          Object.entries(value)
            .filter(
              ([key, item]) =>
                key !== "id" &&
                key !== "zIndex" &&
                item !== undefined &&
                !(item && typeof item === "object" && !Array.isArray(item) && Object.keys(item).length === 0),
            )
            .sort(([x], [y]) => x.localeCompare(y))
            .map(([key, item]) => [key, withoutIds(item)]),
        )
      : value;

/** Where two JSON values differ, as "path: before -> after". */
function changedPaths(a: unknown, b: unknown, path = ""): string[] {
  if (JSON.stringify(a) === JSON.stringify(b)) return [];
  if (a && b && typeof a === "object" && typeof b === "object") {
    const keys = new Set([...Object.keys(a), ...Object.keys(b)]);
    return [...keys].flatMap((key) =>
      changedPaths(
        (a as Record<string, unknown>)[key],
        (b as Record<string, unknown>)[key],
        path ? `${path}.${key}` : key,
      ),
    );
  }
  return [`${path}: ${JSON.stringify(a)} -> ${JSON.stringify(b)}`];
}

/** Every drawing difference between two projects, as "category: detail". */
function drawingDifferences(
  a: CircuitProject,
  b: CircuitProject,
  equivalences: ReadonlySet<Equivalence> = ENABLED,
): string[] {
  const out: string[] = [];
  const counted = (items: readonly { kind?: string; visible?: boolean }[]) =>
    equivalences.has("hidden-extra") ? items.filter((item) => item.visible !== false) : items;
  if (a.documents.length !== b.documents.length)
    out.push(`document: ${a.documents.length} Cells -> ${b.documents.length}`);
  for (const { a: da, b: db } of documentPairs(a, b)) {
    const cell = da.name;
    if (!db) {
      out.push(`document: ${cell} not found after import`);
      continue;
    }
    const pa = placed(a, da);
    const pb = placed(b, db);
    for (const [reference, value] of pa.named) {
      const after = pb.named.get(reference) ?? pb.named.get(`X${reference}`);
      if (!pb.named.has(reference) && pb.named.has(`X${reference}`))
        out.push(`reference: ${cell} ${reference} -> X${reference}`);
      if (!after) out.push(`instance: ${cell} ${reference} missing`);
      else if (after !== value)
        out.push(`instance: ${cell} ${reference} ${value} -> ${after}`);
    }
    for (const reference of pb.named.keys())
      if (!pa.named.has(reference) && !pa.named.has(reference.replace(/^X/u, "")))
        out.push(`instance: ${cell} ${reference} added`);
    const pins = multisetDiff(pa.unnamed, pb.unnamed);
    for (const item of pins.missing) out.push(`pin-or-glyph: ${cell} missing ${item}`);
    for (const item of pins.added) out.push(`pin-or-glyph: ${cell} added ${item}`);
    if (da.routes.length !== db.routes.length)
      out.push(`route: ${cell} ${da.routes.length} -> ${db.routes.length}`);
    const junctions = multisetDiff(
      da.junctions.map((item) => `${item.position.x},${item.position.y}`),
      db.junctions.map((item) => `${item.position.x},${item.position.y}`),
    );
    if (junctions.missing.length || junctions.added.length)
      out.push(
        `junction: ${cell} -${junctions.missing.length} +${junctions.added.length}`,
      );
    const ka = byKind(counted(da.annotations));
    const kb = byKind(counted(db.annotations));
    if (ka !== kb) out.push(`annotation: ${cell} ${ka} -> ${kb}`);
    const drawn = (objects: readonly unknown[]) =>
      objects.map((item) =>
        JSON.stringify(withoutIds(comparable(item as Record<string, unknown>, equivalences))),
      );
    const drafting = multisetDiff(
      drawn(da.drafting?.objects ?? []),
      drawn(db.drafting?.objects ?? []),
    );
    const unmatched = [...drafting.added];
    for (const item of drafting.missing) {
      const before = JSON.parse(item) as Record<string, unknown>;
      const index = unmatched.findIndex(
        (candidate) => (JSON.parse(candidate) as Record<string, unknown>).kind === before.kind,
      );
      if (index < 0) {
        out.push(`drafting: ${cell} ${String(before.kind)} lost`);
        continue;
      }
      const after = JSON.parse(unmatched.splice(index, 1)[0]!) as unknown;
      out.push(`drafting: ${cell} ${String(before.kind)} ${changedPaths(before, after).join("; ")}`);
    }
    for (const item of unmatched)
      out.push(`drafting: ${cell} ${String((JSON.parse(item) as Record<string, unknown>).kind)} added`);
  }
  // The census knows a Cell by its netlist name, which the netlist may have to
  // spell otherwise ("Bootstrap switch" prints as bootstrap_switch): the
  // original's labels go by the name of the Cell it is paired with above.
  const censusName = (document: SchematicDocument) =>
    (document.netlist?.name ?? document.name).toLowerCase();
  const renamed = new Map(
    documentPairs(a, b).flatMap(({ a: da, b: db }) =>
      db ? [[censusName(da), censusName(db)] as const] : [],
    ),
  );
  const before = labelCensus(a).map((label) => ({
    ...label,
    cell: renamed.get(label.cell) ?? label.cell,
  }));
  const after = labelCensus(b);
  const labelled = new Set(after.map((label) => `${label.cell} ${label.kind} ${label.owner}`));
  for (const line of labelDifferences(before, after)) {
    const hidden = /^(.*): hidden before, shown$/u.exec(line);
    if (equivalences.has("hidden-absent") && hidden && !labelled.has(hidden[1]!)) continue;
    out.push(`label: ${line}`);
  }
  return out;
}

const netlistLines = (text: string) =>
  text
    .split("\n")
    .map((line) => line.trim())
    .filter((line) => line && !line.startsWith("*") && !line.startsWith("//"))
    .sort();
const definitions = (text: string) =>
  new Set(
    [...text.matchAll(/^\s*\.?(?:model|subckt)\s+(\S+)/gimu)].map((match) =>
      match[1]!.toLowerCase(),
    ),
  );

function netlistComparison(a: CircuitProject, b: CircuitProject, format: "spice" | "spectre") {
  const before = createDesignNetlistExport(a, { format });
  const after = createDesignNetlistExport(b, { format });
  if (before.status !== "ready" || after.status !== "ready")
    return { identical: false, note: `${before.status}/${after.status}`, lostDefinitions: [] as string[] };
  const ta = before.file.text;
  const tb = after.file.text;
  const lines = multisetDiff(netlistLines(ta), netlistLines(tb));
  const kept = definitions(tb);
  return {
    identical: lines.missing.length === 0 && lines.added.length === 0,
    linesMissing: lines.missing.slice(0, 20),
    linesAdded: lines.added.slice(0, 20),
    lostDefinitions: [...definitions(ta)].filter((name) => !kept.has(name)),
  };
}

async function roundTrip(id: string, project: CircuitProject, format: "spice" | "spectre") {
  const result: Record<string, unknown> = { level: 0 };
  const exported = createRnlExport(project, { format });
  result.exportStatus = exported.status;
  result.exportDiagnostics = tally(exported.diagnostics as Diagnostic[]);
  if (exported.status !== "ready") {
    result.failure = "export-blocked";
    // A netlist the design itself cannot write blocks RNL too; say why.
    result.netlistDiagnostics = tally(
      ((exported as { netlistDiagnostics?: Diagnostic[] }).netlistDiagnostics ?? []).filter(
        (item) => item.severity === "error",
      ),
    );
    result.errors = ((exported as { netlistDiagnostics?: Diagnostic[] }).netlistDiagnostics ?? [])
      .filter((item) => item.severity === "error")
      .map((item) => `${item.code}: ${item.message}`);
    return result;
  }
  let text: string;
  try {
    text = (await runtime.write({ write: exported.request, svg: false })).text;
  } catch (error) {
    result.failure = "write-threw";
    result.error = String(error).slice(0, 2000);
    return result;
  }
  writeFileSync(join(OUT, "rnl", `${id}.${format}.rnl`), text);
  const path = format === "spice" ? "circuit.sp" : "circuit.scs";
  let plan: Awaited<ReturnType<typeof planRnlImport>>;
  try {
    plan = await planRnlImport({
      inputs: [{ path, bytes: new TextEncoder().encode(text) }],
      entryPath: path,
      runtime,
    });
  } catch (error) {
    result.failure = "import-threw";
    result.error = String(error).slice(0, 2000);
    return result;
  }
  result.importStatus = plan.status;
  result.importDiagnostics = tally(plan.diagnostics as Diagnostic[]);
  if (plan.status !== "ready") {
    result.failure = "import-failed";
    return result;
  }
  const errors = (plan.diagnostics as Diagnostic[]).filter((item) => item.severity === "error");
  if (errors.length > 0) {
    result.failure = "import-errors";
    result.errors = errors.map((item) => `${item.code}: ${item.message}`);
    return result;
  }
  // A Project the editor could not save is no import.
  try {
    serializeProject(plan.project);
  } catch (error) {
    result.failure = "import-unsaveable";
    result.errors = [String(error instanceof Error ? error.message : error).slice(0, 2000)];
    return result;
  }
  result.level = 1;
  const back = plan.project;
  const a = projectElectricalGraph(project);
  const b = projectElectricalGraph(back);
  result.electrical =
    a.status === "ready" && b.status === "ready"
      ? compareElectricalGraphs(a.graph, b.graph)
      : `${a.status}/${b.status}`;
  const netlist = netlistComparison(project, back, format);
  result.netlist = netlist;
  // Listed at every level that imported, so a circuit failing L2 still shows
  // what its drawing lost.
  const differences = drawingDifferences(project, back);
  result.drawingDifferences = differences;
  // What the equivalences count as none, listed so a reader sees each.
  if (ENABLED.size) {
    const strict = drawingDifferences(project, back, new Set());
    const kept = new Set(differences);
    const absorbed = strict.filter((line) => !kept.has(line));
    if (absorbed.length) result.equivalentDifferences = absorbed;
  }
  if (result.electrical !== "equal" || !netlist.identical) return result;
  result.level = differences.length === 0 ? 3 : 2;
  return result;
}

it.each(IDS)(
  "RNL benchmark %s",
  async (id) => {
    mkdirSync(join(OUT, "rnl"), { recursive: true });
    mkdirSync(join(OUT, "reports"), { recursive: true });
    const project = parseProject(readFileSync(join(CORPUS, `${id}.icproj.json`), "utf8"));
    const report: Record<string, unknown> = { id };
    for (const format of FORMATS) {
      const started = performance.now();
      const result = await roundTrip(id, project, format);
      result.milliseconds = Math.round(performance.now() - started);
      report[format] = result;
    }
    writeFileSync(join(OUT, "reports", `${id}.json`), `${JSON.stringify(report, null, 1)}\n`);
  },
  300_000,
);
