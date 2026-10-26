# RNL benchmark

100 schematics from the [Analog Canvas](https://analog-canvas.tokenzhang.com) Gallery, frozen, and a harness that sends each one through **SPICE+RNL** and **Spectre+RNL** and back into Analog Canvas, then grades what came back against the original.

It answers one question per change to RNL or to Canvas's RNL adapter: do more circuits survive the round trip than before, and did any get worse?

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
| L0 | Fails | RNL export blocked, or import throws, fails, reports an error or returns a project the editor cannot save |
| **L1** | Imports cleanly | Export ready; import returns a project with no error diagnostic, which the editor can save |
| **L2** | Same circuit | L1, the electrical graphs compare `equal`, and the design netlist Canvas writes from the imported project is line-for-line the original's (comments and line order ignored) |
| **L3** | Same drawing | L2 and no drawing difference: same Cells; every instance with the same symbol (a Cell instance by its Cell), position, orientation (equivalent rotation/mirror pairs count as equal) and parameters; same unnamed pins and glyphs; same number of wires; same junction positions; same annotations by kind; same drafting objects (every field but ids); and no label-census difference, each Cell's labels compared with those of the Cell it is paired with, whose name the netlist may spell otherwise, and a Cell's name so rewritten counted as a difference of its own (`cell-name`); ids are not compared, nor the id a drawing object's anchor names, only the part it names |

Drawing differences are listed in each report for every circuit that imports, also below L2.

Some differences draw the same and are counted as none: a hidden label the import does not bring back (`hidden-absent`); hidden annotations, since annotations are counted as shown (`hidden-extra`); a drawing text's span nesting or splitting, its characters and their styles compared as Analog Canvas compares styled text (`text-styles`); an arrow's legacy or default head fields, its heads compared as Analog Canvas draws them (`arrow-ends`); a style flag set false or a size scale of 1, the same as one unset (`style-defaults`); the anchor of an arrow, construction line, rectangle or circle, which Analog Canvas draws from its own points (`unused-anchor`); a junction no wire touches, which draws nothing (`orphan-junction`); a source's AC phase of 0, the default, the same as one unset (`default-ac-phase`). Each report lists the differences they count as none (`equivalentDifferences`), and `SUMMARY.md` counts them; `RNL_BENCH_STRICT=all`, or a comma-separated list of those names, counts them again.

Before comparing, an external definition of a reviewed device (a SKY130 transistor or BJT) that the original declares with no formal parameters is compared as declaring the reviewed interface's, with their defaults. Older Gallery projects lack them, Canvas's placement and import both declare them today, and every call gives the values. Each report lists the definitions brought up this way (`normalizedDefinitions`), and `SUMMARY.md` counts them; `RNL_BENCH_KEEP_ORIGINAL_FORMALS=1` compares against the original as stored.

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

`RNL_BENCH_IDS=id1,id2` runs only those circuits; `RNL_BENCH_STRICT=all` turns off the equivalences above, and `RNL_BENCH_KEEP_ORIGINAL_FORMALS=1` the normalization. All 100 take about 20 seconds. Remove the copied test file afterwards; it is not part of analog-canvas.

Save a run worth keeping as `results/<date>-<label>/` with the analog-canvas commit and the `@rich-netlist/runtime` version in the label or in its `SUMMARY.md`.

## Results

| Run | analog-canvas | runtime | SPICE+RNL L1 / L2 / L3 | Spectre+RNL L1 / L2 / L3 |
|---|---|---|---|---|
| `results/2026-10-23-baseline/` | `1052ca1be` | `0.1.0-preview.14` | 68 / 34 / 0 | 57 / 3 / 0 |
| `results/2026-10-26-after-review/` | `acd08e069` | `0.5.1` | 73 / 34 / 6 | 72 / 3 / 0 |
| `results/2026-10-26-reviewed-formals/` | `acd08e069` | `0.5.1` | 73 / 38 / 6 | 72 / 3 / 0 |
| `results/2026-10-26-equivalences/` | `a7eb32743` | `0.5.2` | 92 / 68 / 21 | 91 / 64 / 21 |

Each count is the circuits at that level or above. `2026-10-26-reviewed-formals` is the same commit and runtime as `2026-10-26-after-review`, graded with the external-definition normalization (above): its `.rnl` files are that run's, byte for byte, so it keeps only its reports and summary. Without the normalization it grades as `2026-10-26-after-review`. `2026-10-26-equivalences` is graded with the equivalences above, without the normalization; with `RNL_BENCH_STRICT=all` the same commit grades 92 / 68 / 13 and 91 / 64 / 13. Since 2026-10-26 L1 also requires that the editor can save the imported project; the baseline was graded without that check, and one of its Spectre L1 circuits (`xrbakw3dn5`) would not pass it.

Each run's `SUMMARY.md` lists the problems by circuits affected and the issues tracking them (in analog-canvas).
