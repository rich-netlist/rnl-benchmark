#!/usr/bin/env node
// Grade a tool against the RNL conformance suite, with the RNL runtime alone.
//
// A tool reads each case's entry and writes it again; this script compares
// what it wrote with what it read:
//   R1 reads          the written file reads with no error
//   R2 same circuit   every level has the same parts, values and connections
//                     (names of parts and of unnamed nets may differ)
//   R3 same drawing   and every part, glyph and wire is drawn as before:
//                     the same symbol at the same place and orientation
//                     (an object with no symbol, such as a semantic usage,
//                     draws nothing and is not compared)
//
//   node conformance/grade.mjs <cases dir> <written dir> <out dir> [label]
//
// <written dir>/<case>/<entry with / as __> is the tool's file for each entry.
import { createHash } from "node:crypto";
import {
  existsSync,
  mkdirSync,
  readdirSync,
  readFileSync,
  statSync,
  writeFileSync,
} from "node:fs";
import { join, relative } from "node:path";
import { createRequire } from "node:module";
import { loadCore } from "@rich-netlist/runtime/core";

const [CASES, WRITTEN, OUT, LABEL = ""] = process.argv.slice(2);
if (!CASES || !WRITTEN || !OUT) {
  console.error("usage: node grade.mjs <cases dir> <written dir> <out dir> [label]");
  process.exit(2);
}
const CATALOG = "https://rich-netlist.github.io/rnl-packages/catalog.json";
const NETLIST = /\.(sp|spi|cir|net|scs)$/iu;
const require = createRequire(import.meta.url);
const core = await loadCore(
  readFileSync(require.resolve("@rich-netlist/runtime/package.json").replace(/package\.json$/u, "rnl_runtime_wasm.wasm")),
);

function filesIn(root, dir = root) {
  return readdirSync(dir).flatMap((name) => {
    const path = join(dir, name);
    return statSync(path).isDirectory() ? filesIn(root, path) : [relative(root, path)];
  });
}

// Public packages a file names, from the verified catalog (16.2).
let catalog;
const packageCache = new Map();
async function packagesFor(texts) {
  const wanted = new Set();
  for (const text of texts)
    for (const m of text.matchAll(/@USE-PACKAGE\(\s*name="([^"]+)"\s*,\s*version="([^"]+)"/gu))
      wanted.add(`${m[1]}@${m[2]}`);
  catalog ??= await (await fetch(CATALOG)).json();
  const files = {};
  for (const key of wanted) {
    const [name, version] = key.split("@");
    const record = catalog.packages.find((p) => p.name === name && p.version === version);
    if (!record) continue; // a standard package, built into the core
    if (!packageCache.has(key)) {
      const bytes = Buffer.from(await (await fetch(new URL(record.url, CATALOG))).arrayBuffer());
      if (createHash("sha256").update(bytes).digest("hex") !== record.sha256)
        throw new Error(`${key}: SHA-256 mismatch`);
      packageCache.set(key, bytes.toString("utf8"));
    }
    files[`pkgs/${name}/${version}/${name}.rnl`] = packageCache.get(key);
  }
  return files;
}

async function snapshot(entry, files) {
  const pkgs = await packagesFor(Object.values(files));
  const dirs = [...new Set(Object.keys(pkgs).map((p) => p.replace(/\/[^/]+$/u, "")))];
  const all = { ...files, ...pkgs };
  const roots = [...new Set(Object.keys(files).map((p) => (p.includes("/") ? p.replace(/\/[^/]+$/u, "") : ".")))];
  return core.snapshot({
    entry,
    files: all,
    package_dirs: [...dirs, ...roots],
    parts: { host: true, model: true },
  });
}

const errorsOf = (snap) => (snap.diagnostics ?? []).filter((d) => d.severity === "error");
const round = (v) => Math.round(v * 1000) / 1000;
const levelKey = (l) => `${l.kind}:${(l.name ?? "").toLowerCase()}`;

/** Each part of a level as its master, values and connections, names aside (R2). */
function circuitOf(level) {
  const host = level.host;
  if (!host) return [];
  const params = new Map(
    (level.model?.objects ?? []).filter((o) => o.kind === "instance").map((o) => [o.id, o.params ?? {}]),
  );
  // Nets by refinement: a named port or global keeps its name, any other net
  // is told by what it connects, so internal names may differ.
  const fixed = new Map(host.nets.map((n) => [n.id, n.port || n.global ? `=${(n.name ?? n.id).toLowerCase()}` : ""]));
  let label = new Map(host.nets.map((n) => [n.id, fixed.get(n.id)]));
  const termsOf = (i) => i.terminals.map((t) => t.net);
  for (let round = 0; round < 4; round++) {
    const seen = new Map(host.nets.map((n) => [n.id, []]));
    for (const i of host.instances)
      termsOf(i).forEach((net, k) => seen.get(net)?.push(`${(i.master ?? "").toLowerCase()}#${k}`));
    label = new Map(
      host.nets.map((n) => [
        n.id,
        fixed.get(n.id) ||
          createHash("sha1").update(`${label.get(n.id)}|${seen.get(n.id).sort().join(",")}`).digest("hex").slice(0, 12),
      ]),
    );
  }
  return host.instances
    .map((i) => {
      const p = params.get(i.id) ?? {};
      const values = Object.keys(p).sort().map((k) => `${k.toLowerCase()}=${String(p[k]).toLowerCase()}`);
      return `${(i.master ?? "").toLowerCase()}(${termsOf(i).map((n) => label.get(n)).join(",")})[${values.join(",")}]`;
    })
    .sort();
}

/** What a level draws: parts and glyphs by symbol, place and turn; wires by their points (R3). */
function drawingOf(level) {
  const model = level.model;
  if (!model) return { items: [], wires: [] };
  const symbolName = (o) => o.symbol?.value ?? "";
  // A usage with no symbol, such as a semantic one, draws nothing.
  const items = model.objects
    .filter((o) => o.at?.value && symbolName(o))
    .map((o) => `${o.kind}:${symbolName(o)}@${o.at.value.map(round).join(",")}/${o.orient?.value ?? "R0"}`)
    .sort();
  const wires = model.wires
    .map((w) => {
      const pts = w.points.map((p) => p.map(round).join(","));
      const a = pts.join(" "), b = [...pts].reverse().join(" ");
      return a < b ? a : b;
    })
    .sort();
  return { items, wires };
}

const diff = (a, b) => {
  const count = (xs) => xs.reduce((m, x) => m.set(x, (m.get(x) ?? 0) + 1), new Map());
  const ca = count(a), cb = count(b);
  const missing = [...ca].flatMap(([k, n]) => Array(Math.max(0, n - (cb.get(k) ?? 0))).fill(k));
  const added = [...cb].flatMap(([k, n]) => Array(Math.max(0, n - (ca.get(k) ?? 0))).fill(k));
  return { missing, added };
};

mkdirSync(OUT, { recursive: true });
const reports = [];
for (const name of readdirSync(CASES).filter((n) => statSync(join(CASES, n)).isDirectory()).sort()) {
  const files = Object.fromEntries(filesIn(join(CASES, name)).map((p) => [p, readFileSync(join(CASES, name, p), "utf8")]));
  const manifest = files["case.json"] ? JSON.parse(files["case.json"]) : {};
  const entries = manifest.entries ?? Object.keys(files).filter((p) => NETLIST.test(p));
  for (const entry of entries) {
    const report = { case: name, entry, level: 0 };
    reports.push(report);
    const writtenPath = join(WRITTEN, name, entry.replace(/\//gu, "__"));
    if (!existsSync(writtenPath)) {
      report.failure = "not-written";
      continue;
    }
    let before, after;
    try {
      before = await snapshot(entry, files);
      // The written file stands in for the entry, where its includes are.
      after = await snapshot(entry, { ...files, [entry]: readFileSync(writtenPath, "utf8") });
    } catch (error) {
      report.failure = "runtime-threw";
      report.error = String(error).slice(0, 1000);
      continue;
    }
    report.originalErrors = errorsOf(before).length;
    const errors = errorsOf(after);
    if (errors.length || after.failed) {
      report.failure = "written-file-errors";
      report.errors = errors.slice(0, 10).map((d) => d.message ?? d.code);
      continue;
    }
    report.level = 1;
    const levelsBefore = new Map(before.levels.map((l) => [levelKey(l), l]));
    const levelsAfter = new Map(after.levels.map((l) => [levelKey(l), l]));
    const circuit = [], drawing = [];
    for (const [key, l] of levelsBefore) {
      if (l.kind === "file" && !(l.host?.instances?.length)) continue;
      const m = levelsAfter.get(key) ?? (l.kind === "file" ? [...levelsAfter.values()].find((x) => x.kind === "file" && x.host?.instances?.length) : undefined);
      if (!m) {
        circuit.push(`${key}: missing`);
        continue;
      }
      const c = diff(circuitOf(l), circuitOf(m));
      if (c.missing.length || c.added.length) circuit.push(`${key}: -${c.missing.length} +${c.added.length} ${c.missing.slice(0, 2).join(" ")} → ${c.added.slice(0, 2).join(" ")}`);
      const da = drawingOf(l), db = drawingOf(m);
      const di = diff(da.items, db.items), dw = diff(da.wires, db.wires);
      if (di.missing.length || di.added.length) drawing.push(`${key} items: -${di.missing.length} +${di.added.length} ${di.missing.slice(0, 2).join(" ")} → ${di.added.slice(0, 2).join(" ")}`);
      if (dw.missing.length || dw.added.length) drawing.push(`${key} wires: -${dw.missing.length} +${dw.added.length}`);
    }
    report.circuitDifferences = circuit;
    report.drawingDifferences = drawing;
    if (circuit.length) continue;
    report.level = 2;
    if (!drawing.length) report.level = 3;
  }
}
writeFileSync(join(OUT, "reports.json"), `${JSON.stringify(reports, null, 1)}\n`);
const at = (n) => reports.filter((r) => r.level >= n).length;
const lines = [
  `# RNL conformance${LABEL ? `: ${LABEL}` : ""}`,
  "",
  `${reports.length} entries in ${new Set(reports.map((r) => r.case)).size} cases.`,
  "",
  "| R1 reads | R2 same circuit | R3 same drawing |",
  "|---|---|---|",
  `| ${at(1)} | ${at(2)} | ${at(3)} |`,
  "",
  "| Case | Entry | Level | First difference |",
  "|---|---|---|---|",
  ...reports
    .filter((r) => r.level < 3)
    .map((r) => `| ${r.case} | ${r.entry} | R${r.level} | ${(r.failure ?? r.circuitDifferences?.[0] ?? r.drawingDifferences?.[0] ?? "").replace(/\|/gu, "\\|").slice(0, 160)} |`),
  "",
];
writeFileSync(join(OUT, "SUMMARY.md"), lines.join("\n"));
console.log(lines.slice(0, 8).join("\n"));
