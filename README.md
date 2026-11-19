# RNL benchmark

Two suites: the frozen **round-trip benchmark** below (200 Analog Canvas circuits, graded inside Analog Canvas, and a separate set of 160, **[Season 1](season1/README.md)**, chosen by people for Schematic Arena, 20 in each of eight circuit families), and the tool-neutral **[conformance suite](conformance/README.md)**, which grades any tool that reads and writes RNL with the RNL runtime alone.

200 schematics from the [Analog Canvas](https://analog-canvas.tokenzhang.com) Gallery, frozen (the first 100 since 2026-10-23, the second 100 since 2026-11-15), and a harness (in analog-canvas) that sends each one through **SPICE+RNL** and **Spectre+RNL** and back into Analog Canvas, then grades what came back against the original.

It answers one question per change to RNL or to Canvas's RNL adapter: do more circuits survive the round trip than before, and did any get worse?

## Layout

| Path | What |
|---|---|
| `circuits/<id>.icproj.json` | The 200 Analog Canvas project files, byte for byte as stored. Never edited. |
| `manifest.json` | Per circuit: name, author, part count, source snapshot, Gallery URL, SHA-256 of the file, feature tags. |
| `summarize.py` | Turns a run's reports into `summary.json` and `SUMMARY.md`. |
| `results/<date>-<label>/` | One run: `reports/<id>.json`, `summary.json`, `SUMMARY.md`, and `rnl/<id>.{spice,spectre}.rnl`, the files Canvas wrote. |
| `season1/` | The second set, 160 circuits frozen on 2026-11-15, laid out the same way (`circuits/`, `manifest.json`, `results/`), with how it was made (`freeze.py`). |

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

L3 also needs the two projects to render the same in Analog Canvas's SVG (`renderedDifferences` in each report): the fields compared above cannot see all of a drawing, such as a Cell's symbol, a wire's dash or a subscript's slant. Only what shows is compared: hit lines and ids are left out, straight strokes are merged per stroke style, text is compared character by character, and sizes are compared to 0.1. A circuit whose rendering differs stays at L2. `RNL_BENCH_SKIP_RENDERED=1` grades by the compared fields alone.

Some differences draw the same and are counted as none: a hidden label the import does not bring back (`hidden-absent`); hidden annotations, since annotations are counted as shown (`hidden-extra`); a drawing text's span nesting or splitting, its characters and their styles compared as Analog Canvas compares styled text (`text-styles`); an arrow's legacy or default head fields, its heads compared as Analog Canvas draws them (`arrow-ends`); a style flag set false or a size scale of 1, the same as one unset (`style-defaults`); the anchor of an arrow, construction line, rectangle or circle, which Analog Canvas draws from its own points (`unused-anchor`); a junction no wire touches, which draws nothing (`orphan-junction`); a source's AC phase of 0, the default, the same as one unset (`default-ac-phase`); a drawing text with no characters and no polarity mark, which draws nothing (`empty-note`). Each report lists the differences they count as none (`equivalentDifferences`), and `SUMMARY.md` counts them; `RNL_BENCH_STRICT=all`, or a comma-separated list of those names, counts them again.

Before comparing, an external definition of a reviewed device (a SKY130 transistor or BJT) that the original declares with no formal parameters is compared as declaring the reviewed interface's, with their defaults. Older Gallery projects lack them, Canvas's placement and import both declare them today, and every call gives the values. Each report lists the definitions brought up this way (`normalizedDefinitions`), and `SUMMARY.md` counts them; `RNL_BENCH_KEEP_ORIGINAL_FORMALS=1` compares against the original as stored.

## How the 200 were chosen

### The first 100

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

Gaps: no circuit uses native buses (shipped after the snapshot), and few use no-connect marks or generic models.

### The second 100

Added on 2026-11-15 from the live Gallery (`select_more.py`, then `freeze_more.py`), the first 100 left as they were. From the 7726 public circuits whose netlist Canvas can write, the community's and those redrawn from the reference datasets (AnalogGenie, AnalogRetriever, Image2Net, AMS-Net, CircuitThink) alike, at most 200 parts, at least 3, and none with a placeholder or coursework name, an "(AI)" copy of a circuit that is there without it, or the name of a circuit already in:

1. picked greedily as `select.py` picks, toward quotas for the 200 together (twice its own), counted from the first 100 on, with more weight on what the first 100 lack: no-connect marks, generic models, hierarchy, large circuits;
2. at most 12 per author and 25 per reference dataset across the 200; a circuit of the Season 1 board gets a small bonus (19 are on it).

73 are community circuits, 27 redrawn from the reference datasets (AnalogGenie 15, Image2Net 8, AnalogRetriever 2, AMS-Net 1, CircuitThink 1). Coverage of the second 100:

| Area | Features |
|---|---|
| Structure | hierarchy 12, Cell symbols 12, custom symbols 7 |
| Devices | MOS 73, BJT 16, diode 8, resistor 60, capacitor 60, inductor 14, transformer/T-coil 3, variable C 4, variable R 2, switch 12, current source 24, voltage source 12, controlled source 3, op-amp/comparator blocks 12, logic gates 10, flip-flops 3, DAC/ADC/adder/chopper 1 |
| Supplies | VDD port 58, ground 81, filled port 16, power label 23, power rail 18 |
| Drawing | net labels 39, hidden labels 19, mirrored parts 79, rotated parts 76, free text 28, arrows 12, rectangles 3, dashed 4, construction lines 3, circles 1, instance annotations 3, route markers 1, no-connect marks 8 |
| Models | sky130 bindings 71, generic models 12, external subcircuits 72, parameter expressions 6 |
| Size | small (≤10 parts) 40, medium 48, large (>40) 12; 71 authors |

No public circuit uses native buses yet, so that gap stays.

## Run

From an [analog-canvas](https://github.com/cascode-ai/analog-canvas) checkout with dependencies installed:

```bash
RNL_BENCH_CORPUS=<this repo>/circuits RNL_BENCH_OUT=<out dir> \
  npx vitest run apps/editor/src/features/netlist-export/rnl-benchmark.test.ts
python3 <this repo>/summarize.py <out dir>/reports <this repo>/manifest.json <out dir> "<label>"
```

`RNL_BENCH_IDS=id1,id2` runs only those circuits; `RNL_BENCH_STRICT=all` turns off the equivalences above, and `RNL_BENCH_KEEP_ORIGINAL_FORMALS=1` the normalization. All 200 take about three minutes. The harness lives in analog-canvas (`apps/editor/src/features/netlist-export/rnl-benchmark.test.ts`, since cascode-ai/analog-canvas#2258), next to the importer it grades, and is skipped there unless `RNL_BENCH_CORPUS` is set.

Save a run worth keeping as `results/<date>-<label>/` with the analog-canvas commit and the `@rich-netlist/runtime` version in the label or in its `SUMMARY.md`.

## Results

| Run | analog-canvas | runtime | SPICE+RNL L1 / L2 / L3 | Spectre+RNL L1 / L2 / L3 |
|---|---|---|---|---|
| `results/2026-10-23-baseline/` | `1052ca1be` | `0.1.0-preview.14` | 68 / 34 / 0 | 57 / 3 / 0 |
| `results/2026-10-26-after-review/` | `acd08e069` | `0.5.1` | 73 / 34 / 6 | 72 / 3 / 0 |
| `results/2026-10-26-reviewed-formals/` | `acd08e069` | `0.5.1` | 73 / 38 / 6 | 72 / 3 / 0 |
| `results/2026-10-26-equivalences/` | `a7eb32743` | `0.5.2` | 92 / 68 / 21 | 91 / 64 / 21 |
| `results/2026-10-31-rendered/` | `1abf83781` | `0.5.2` | 99 / 83 / 60 | 95 / 83 / 60 |
| `results/2026-11-11-runtime-0.5.5/` | `57a1cd5af` | `0.5.5` | 100 / 97 / 83 | 100 / 92 / 83 |
| `results/2026-11-15-rnl-0.4/` | `9cef3e7b1` (merged as `f966cdf94`) | `0.6.0-dev.6bdd5ce6`, RNL 0.4 | 100 / 100 / 86 | 100 / 100 / 86 |
| `results/2026-11-15-200/` (200 circuits) | `0d7abbb87` | `0.6.0-dev.6bdd5ce6`, RNL 0.4 | 198 / 197 / 157 | 196 / 192 / 154 |
| `results/2026-11-20-200/` (200 circuits) | `f290362e3` | `0.6.0`, RNL 0.4 | 198 / 197 / 157 | 197 / 197 / 156 |

Each count is the circuits at that level or above. Runs up to `2026-11-15-rnl-0.4` grade the first 100; from `2026-11-15-200` on, all 200. In `2026-11-15-200` the first 100 grade as before (100 / 100 / 86 both ways) and the second 100 grade 98 / 97 / 71 (SPICE+RNL) and 96 / 92 / 68 (Spectre+RNL); `6ahgdzh25k`, `ar-1485`, `b9afqhsjzv` and `i2n-1477` reach L0 in one format or both. In `2026-11-20-200` five Spectre+RNL circuits move up (cascode-ai/analog-canvas#2374: braced numbers, renamed cards and couplings) and none moves down; `ar-1485` (a 45° part) and `b9afqhsjzv` (an added `GND` pin read back before `VSS`) still reach L0, and `i2n-1477`'s Spectre still cannot be written (a SPICE-only Zener model). `2026-10-26-reviewed-formals` is the same commit and runtime as `2026-10-26-after-review`, graded with the external-definition normalization (above): its `.rnl` files are that run's, byte for byte, so it keeps only its reports and summary. Without the normalization it grades as `2026-10-26-after-review`. `2026-10-26-equivalences` is graded with the equivalences above, without the normalization; with `RNL_BENCH_STRICT=all` the same commit grades 92 / 68 / 13 and 91 / 64 / 13. Since 2026-10-26 L1 also requires that the editor can save the imported project; the baseline was graded without that check, and one of its Spectre L1 circuits (`xrbakw3dn5`) would not pass it.

Each run's `SUMMARY.md` lists the problems by circuits affected and the issues tracking them (in analog-canvas).
