# Season 1 set: 160 circuits

A second frozen set for the round-trip benchmark: the 160 circuits of Schematic Arena's Season 1 selection board, chosen by people for a netlist-to-schematic benchmark, 20 in each of eight circuit families. It runs through the same harness and levels as the first 100 (see the [README](../README.md)); only the corpus differs.

| Path | What |
|---|---|
| `ids.tsv` | The 160 Gallery entries in the board's order, each with its family. |
| `circuits/<id>.icproj.json` | The project files, byte for byte as the live Gallery served them on 2026-11-15. Never edited. |
| `manifest.json` | Per circuit, as the first set's: name, author, part count, source, Gallery URL, SHA-256 of the file, feature tags (`select.py`'s own `features()`), plus `schemaVersion`, `family` and, for a circuit redrawn from a reference dataset, `license`. |
| `freeze.py` | How the files and the manifest were made: `python3 season1/freeze.py 2026-11-15` takes them again from the live Gallery. |

## What is in it

- **Families**, 20 each: power management; references and bias; op amps and OTAs; signal-chain amplifiers and filters; data conversion and sampling; RF; clocking and timing; interfaces and drivers.
- **Authors**: 32. 128 community circuits and 32 redrawn from reference datasets: AnalogGenie 19 (MIT), Image2Net 7, CircuitThink 4 (Apache-2.0), AnalogRetriever 1 (MIT), AMS-Net 1 (GPL-3.0). Each keeps its source's licence (`license` in the manifest).
- **Size**: small (≤10 parts) 19, medium 127, large (>40) 14.
- **Structure**: hierarchy 10 (4+ Cells: 4), Cell symbols 10, one bus.
- **Schema**: 128 files in Project schema 83, the rest 70–80, as the Gallery stores them.
- **Overlap**: 15 are also in the first set, each as the Gallery stores it now, so their files may differ from the first set's: `7r4qr4j9pa mh8wdf6h3t 924v8n26es m7n7k5jn7b fx52v6fzbg 57xa4r682t 58t3fmnnmj 3575r7k3gg af6prxthxw ez4m9ggesf hxakhrwq8b csbw6k9aby 7q6a6v9ank bvy25zrhzz dyggxk29c4`.

Before the set was frozen, two of its circuits were fixed in the Gallery so that Analog Canvas's Check and Save reports no error: Ring Amplifier (`sm663cbs8b`, a MOS parameter `multi` renamed `m`) and Floating Charge-Transferer (`b9afqhsjzv`, switch S11 wired to its VDD).

## Run

As for the first set, with this corpus and this manifest:

```bash
RNL_BENCH_CORPUS=<this repo>/season1/circuits RNL_BENCH_OUT=<out dir> \
  npx vitest run apps/editor/src/features/netlist-export/rnl-benchmark.test.ts
python3 <this repo>/summarize.py <out dir>/reports <this repo>/season1/manifest.json <out dir> "<label>"
```

Save a run worth keeping as `season1/results/<date>-<label>/`.

## Results

| Run | analog-canvas | runtime | SPICE+RNL L1 / L2 / L3 | Spectre+RNL L1 / L2 / L3 |
|---|---|---|---|---|
| `results/2026-11-15-baseline/` | `0d7abbb87` | `0.6.0-dev.6bdd5ce6`, RNL 0.4 | 158 / 155 / 141 | 158 / 154 / 140 |

Each count is the circuits at that level or above, graded with the equivalences and the normalization of the first set's runs. Both L0 circuits import undrawn (`RNL_IMPORT_CHANGES_NETLIST`, the RNL drawing would change the netlist): Floating Charge-Transferer (`b9afqhsjzv`) and SEFIA-based SC integrator (`bqvdxv2755`). The first has wires that end at a junction away from the pin they join, so the drawing shows a circuit other than the one its nets hold; the run's `SUMMARY.md` lists the rest by problem.
