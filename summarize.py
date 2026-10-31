#!/usr/bin/env python3
"""Summarize harness reports into summary.json and SUMMARY.md.

Usage: python3 summarize.py REPORTS_DIR MANIFEST_JSON OUT_DIR "LABEL"
"""
import collections, glob, json, os, re, sys

reports_dir, manifest_path, out_dir, label = sys.argv[1:5]
manifest = {e["id"]: e for e in json.load(open(manifest_path))}
FORMATS = ("spice", "spectre")

# Each difference line -> a problem class (and the issue tracking it, if any).
CLASSES = [
    ("import throws", "#1788 (route crash only)", lambda f, d: f.get("failure") == "import-threw"),
    ("export blocked", "", lambda f, d: f.get("failure") == "export-blocked"),
    ("import reports errors", "", lambda f, d: f.get("failure") in ("import-errors", "import-failed")),
    ("import cannot be saved", "", lambda f, d: f.get("failure") == "import-unsaveable"),
    ("model/subcircuit definition lost", "#1789", lambda f, d: bool((f.get("netlist") or {}).get("lostDefinitions"))),
    ("electrically different", "#1783", lambda f, d: f.get("electrical") not in (None, "equal")),
    ("netlist text changed", "#1785", lambda f, d: f.get("netlist") is not None and not f["netlist"].get("identical")),
    ("extra or missing pins/glyphs", "#1783", lambda f, d: any(x.startswith("pin-or-glyph:") for x in d)),
    ("reference renamed (M1 -> XM1)", "#1785", lambda f, d: any(x.startswith("reference:") for x in d)),
    ("instance symbol/placement/parameters changed", "#1785 #1786", lambda f, d: any(x.startswith("instance:") for x in d)),
    ("wires lost or added", "#1784", lambda f, d: any(x.startswith("route:") for x in d)),
    ("junctions moved/lost", "#1784", lambda f, d: any(x.startswith("junction:") for x in d)),
    ("annotations changed", "#1785", lambda f, d: any(x.startswith("annotation:") for x in d)),
    ("drafting objects changed", "#1787", lambda f, d: any(x.startswith("drafting:") for x in d)),
    ("labels changed/shown/hidden", "#1785 #1787", lambda f, d: any(x.startswith("label:") for x in d)),
    ("drawn differently (rendered)", "", lambda f, d: bool(f.get("renderedDifferences"))),
    ("Cells lost or renamed", "", lambda f, d: any(x.startswith("document:") for x in d)),
]

rows, levels, classes = [], {f: collections.Counter() for f in FORMATS}, {f: collections.Counter() for f in FORMATS}
examples = collections.defaultdict(list)
for path in sorted(glob.glob(os.path.join(reports_dir, "*.json"))):
    r = json.load(open(path))
    e = manifest.get(r["id"], {})
    row = {"id": r["id"], "name": e.get("name", ""), "author": e.get("author", ""), "components": e.get("componentCount")}
    for fmt in FORMATS:
        f = r[fmt]
        d = f.get("drawingDifferences") or []
        levels[fmt][f["level"]] += 1
        hit = [name for name, _, test in CLASSES if test(f, d)]
        for name in hit:
            classes[fmt][name] += 1
            if len(examples[name]) < 3 and fmt == "spice" or (name == "import throws" and len(examples[name]) < 3):
                examples[name].append(r["id"])
        row[fmt] = {"level": f["level"], "failure": f.get("failure"), "problems": hit, "differences": len(d)}
        if f.get("equivalentDifferences"):
            row[fmt]["equivalentDifferences"] = len(f["equivalentDifferences"])
        if f.get("normalizedDefinitions"):
            row[fmt]["normalizedDefinitions"] = f["normalizedDefinitions"]
    rows.append(row)

summary = {
    "label": label,
    "circuits": len(rows),
    "levels": {fmt: {f"L{k}": levels[fmt][k] for k in range(4)} for fmt in FORMATS},
    "atLeast": {fmt: {f"L{k}": sum(v for lv, v in levels[fmt].items() if lv >= k) for k in range(1, 4)} for fmt in FORMATS},
    "problems": {fmt: dict(classes[fmt].most_common()) for fmt in FORMATS},
    "circuitsByProblem": {name: examples[name] for name, _, _ in CLASSES if examples[name]},
    "normalized": {fmt: {r["id"]: r[fmt]["normalizedDefinitions"] for r in rows if r[fmt].get("normalizedDefinitions")} for fmt in FORMATS},
    "rows": rows,
}
json.dump(summary, open(os.path.join(out_dir, "summary.json"), "w"), ensure_ascii=False, indent=1)

issue = {name: ref for name, ref, _ in CLASSES}
md = [f"# Results: {label}", "", f"{len(rows)} circuits, each round-tripped as SPICE+RNL and Spectre+RNL.", "",
      "| | L1 imports cleanly | L2 same circuit | L3 same drawing |", "|---|---|---|---|"]
for fmt in FORMATS:
    a = summary["atLeast"][fmt]
    md.append(f"| {'SPICE+RNL' if fmt == 'spice' else 'Spectre+RNL'} | {a['L1']} | {a['L2']} | {a['L3']} |")
md += ["", "Counts are circuits reaching at least that level."]
equivalent = {fmt: [r for r in rows if r[fmt].get("equivalentDifferences")] for fmt in FORMATS}
if any(equivalent.values()):
    md += ["", "## Counted as drawing the same", "",
           "Differences the harness's equivalences count as none (hidden-absent, hidden-extra, text-styles, arrow-ends,"
           " style-defaults, unused-anchor, orphan-junction, default-ac-phase; `RNL_BENCH_STRICT=all` or a list of them turns them off), listed in each report as"
           " `equivalentDifferences`:", "",
           "| Format | Circuits | Differences |", "|---|---|---|"]
    for fmt in FORMATS:
        if equivalent[fmt]:
            md.append(f"| {fmt} | {len(equivalent[fmt])} | {sum(r[fmt]['equivalentDifferences'] for r in equivalent[fmt])} |")
normalized = summary["normalized"]
if any(normalized.values()):
    md += ["", "## Normalized before comparing", "",
           "External definitions the original declared no formal parameters for, compared as declaring the reviewed interface's"
           " (harness `withReviewedFormals`; `RNL_BENCH_KEEP_ORIGINAL_FORMALS=1` turns it off):", "",
           "| Format | Circuits | Circuit: definitions |", "|---|---|---|"]
    for fmt in FORMATS:
        if normalized[fmt]:
            md.append(f"| {fmt} | {len(normalized[fmt])} | " + "; ".join(f"{cid}: {', '.join(names)}" for cid, names in sorted(normalized[fmt].items())) + " |")
else:
    md += ["", "No external definition was normalized before comparing."]
md += ["", "## Problems, by circuits affected", "",
       "| Problem | Tracked in | SPICE+RNL | Spectre+RNL | e.g. |", "|---|---|---|---|---|"]
for name, ref, _ in CLASSES:
    s, p = classes["spice"][name], classes["spectre"][name]
    if s or p:
        md.append(f"| {name} | {ref} | {s} | {p} | {', '.join(examples[name][:3])} |")
md += ["", "## Failures, by message", "", "| Format | Failure | Message | Circuits |", "|---|---|---|---|"]
failures = collections.defaultdict(list)
for path in sorted(glob.glob(os.path.join(reports_dir, "*.json"))):
    r = json.load(open(path))
    for fmt in FORMATS:
        f = r[fmt]
        kind = f.get("failure")
        if not kind:
            continue
        if kind == "import-threw":
            found = sorted(set(re.findall(r'"message": "([^"]+)"', f.get("error", ""))))
            message = " / ".join(found) if found else re.sub(r"(circuit\.\w+:)\d+|in [0-9.]+\w+\.", r"\1N", f.get("error", ""))[:120]
        elif kind in ("import-errors", "import-failed"):
            message = " / ".join(sorted({e.split(":")[0] for e in f.get("errors", [])})) or " / ".join(
                sorted(k.split(" ", 1)[1] for k in f.get("importDiagnostics", {}) if k.startswith("error")))
        elif kind == "export-blocked":
            message = " / ".join(
                [k for k in f.get("exportDiagnostics", {}) if k.startswith("error")]
                + sorted({e.split(":")[0] + ": " + e.split(": ", 2)[-1][:60] for e in f.get("errors", [])})
            ) or "blocked without an error diagnostic"
        elif kind == "import-unsaveable":
            message = (f.get("errors") or [""])[0][:120]
        else:
            message = f.get("error", "")[:120]
        failures[(fmt, kind, message)].append(r["id"])
for (fmt, kind, message), ids in sorted(failures.items(), key=lambda item: (-len(item[1]), item[0])):
    md.append(f"| {fmt} | {kind} | {message} | {len(ids)}: {' '.join(ids[:6])}{' …' if len(ids) > 6 else ''} |")
md += ["", "## Per circuit", "", "| Circuit | Author | Parts | SPICE | Spectre | Problems (SPICE) |", "|---|---|---|---|---|---|"]
for row in sorted(rows, key=lambda x: (x["spice"]["level"] + x["spectre"]["level"], x["id"])):
    probs = ", ".join(row["spice"]["problems"]) or "—"
    md.append(f"| `{row['id']}` {row['name'][:40]} | {row['author']} | {row['components']} | L{row['spice']['level']} | L{row['spectre']['level']} | {probs} |")
open(os.path.join(out_dir, "SUMMARY.md"), "w").write("\n".join(md) + "\n")
print(json.dumps({k: summary[k] for k in ("levels", "atLeast", "problems")}, ensure_ascii=False, indent=1))
