# RNL benchmark

100 schematics from the [Analog Canvas](https://analog-canvas.tokenzhang.com) Gallery, frozen, and a harness that sends each one through **SPICE+RNL** and **Spectre+RNL** and back into Analog Canvas, then grades what came back against the original.

It answers one question per change to RNL or to Canvas's RNL adapter: do more circuits survive the round trip than before, and did any get worse?

> **Private.** The circuits belong to their Gallery authors (55 people). They are here to test RNL and nothing else. Do not publish, redistribute, or train on them, and do not copy them into a public repository.

## Layout

| Path | What |
|---|---|
| `circuits/<id>.icproj.json` | The 100 Analog Canvas project files, byte for byte as stored. Never edited. |
| `manifest.json` | Per circuit: name, author, part count, source snapshot, Gallery URL, SHA-256 of the file, feature tags. |
| `harness/rnl-benchmark.test.ts` | The round-trip harness (runs inside an analog-canvas checkout). |
| `summarize.py` | Turns a run's reports into `summary.json` and `SUMMARY.md`. |
| `results/<date>-<label>/` | One run: `reports/<id>.json`, `summary.json`, `SUMMARY.md`, and `rnl/<id>.{spice,spectre}.rnl`, the files Canvas wrote. |

The `.rnl` files of a run are also plain inputs for the RNL runtime and Viewer on their own.

## Levels

Each circuit is graded separately for SPICE+RNL and Spectre+RNL:

| Level | Meaning | Checked |
|---|---|---|
| L0 | Fails | RNL export blocked, or import throws, fails or reports an error |
| **L1** | Imports cleanly | Export ready; import returns a project with no error diagnostic |
| **L2** | Same circuit | L1, the electrical graphs compare `equal`, and the design netlist Canvas writes from the imported project is line-for-line the original's (comments and line order ignored) |
| **L3** | Same drawing | L2 and no drawing difference: same Cells; every instance with the same symbol (a Cell instance by its Cell), position, orientation (equivalent rotation/mirror pairs count as equal) and parameters; same unnamed pins and glyphs; same number of wires; same junction positions; same annotations by kind; same drafting objects (every field but ids); and no label-census difference |

Drawing differences are listed in each report for every circuit that imports, also below L2.

## How the 100 were chosen

From the 1497 public Gallery circuits whose netlist Canvas can write (snapshot of 2026-10-19; redrawn reference datasets excluded; at most 200 parts):

1. Seven circuits already round-tripped by hand are always in (`k6bybqnz4b nznez6ma4p hm22f22b56 924v8n26es dhfnzqqagg tc5v5zbja4 qjpfesczpd`). `dhfnzqqagg` (6-bit SAR ADC) is newer than the snapshot and was taken from the live Gallery on 2026-10-23.
2. The rest are picked greedily to meet a quota per feature (`select.py` logic, recorded in `manifest.json` as `features`), at most 12 per author, ties broken by a hash of the id so the choice is reproducible.

Coverage (circuits with the feature):

| Area | Features |
|---|---|
| Structure | hierarchy 14 (4+ Cells: 13), Cell symbols 12, custom symbols 6 |
| Devices | MOS 84, BJT 11, diode 7, resistor 57, capacitor 69, inductor 15, transformer/T-coil 3, variable C 4, variable R 4, switch 12, current source 30, voltage source 14, controlled source 3, op-amp/comparator blocks 20, logic gates 17, flip-flops 4, DAC/ADC/adder/chopper 4 |
| Supplies | VDD port 55, ground 87, filled port 21, power label 46, power rail 40 |
| Drawing | net labels 46, hidden labels 19, mirrored parts 89, rotated parts 86, free text 34, arrows 10, rectangles 13, dashed 13, construction lines 5, circles 2, instance annotations 3, route markers 2, no-connect marks 2 |
| Models | sky130 bindings 74, generic models 16, external subcircuits 76, parameter expressions 5 |
| Size | small (≤10 parts) 25, medium 50, large (>40) 25; 55 authors |

Gaps: no circuit uses native buses (shipped after the snapshot), and few use no-connect marks or generic models. A later set can add them; this one stays frozen.

## Run

From an [analog-canvas](https://github.com/cascode-ai/analog-canvas) checkout with dependencies installed:

```bash
cp <this repo>/harness/rnl-benchmark.test.ts apps/editor/src/features/netlist-export/
RNL_BENCH_CORPUS=<this repo>/circuits RNL_BENCH_OUT=<out dir> \
  npx vitest run apps/editor/src/features/netlist-export/rnl-benchmark.test.ts
python3 <this repo>/summarize.py <out dir>/reports <this repo>/manifest.json <out dir> "<label>"
```

`RNL_BENCH_IDS=id1,id2` runs only those circuits. All 100 take about 20 seconds. Remove the copied test file afterwards; it is not part of analog-canvas.

Save a run worth keeping as `results/<date>-<label>/` with the analog-canvas commit and the `@rich-netlist/runtime` version in the label or in its `SUMMARY.md`.

## Baseline

`results/2026-10-23-baseline/`: analog-canvas `1052ca1be`, `@rich-netlist/runtime@0.1.0-preview.14`, `analog-canvas-extensions` 0.1.

| | L1 imports cleanly | L2 same circuit | L3 same drawing |
|---|---|---|---|
| SPICE+RNL | 68 | 34 | 0 |
| Spectre+RNL | 57 | 3 | 0 |

See its `SUMMARY.md` for the problems by circuits affected and the issues tracking them ([#1783](https://github.com/cascode-ai/analog-canvas/issues/1783)–[#1789](https://github.com/cascode-ai/analog-canvas/issues/1789) in analog-canvas).
