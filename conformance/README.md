# RNL conformance suite

A tool supports RNL when what it reads, it can write again. The suite gives RNL files; the tool reads each one and writes it out; [`grade.mjs`](grade.mjs) compares what came out with what went in using the [RNL runtime](https://github.com/rich-netlist/rnl) alone. Any schematic tool that reads and writes SPICE+RNL or Spectre+RNL can be graded, the same way for every tool.

| Level | Meaning |
|---|---|
| **R1** reads | The written file reads with no error. |
| **R2** same circuit | Every level has the same parts, values and connections. Names of parts and of unnamed nets may change; named ports and globals may not. |
| **R3** same drawing | R2, and every part and glyph is drawn with the same symbol at the same place and orientation, and every wire runs through the same points. An object with no symbol (a semantic usage) draws nothing and is not compared. |

## Cases

`cases/<case>/` holds one design: its entry netlists (`.sp` SPICE+RNL, `.scs` Spectre+RNL), any files they include, and `case.json` with its source, licence and the features it was chosen for. [`manifest.json`](manifest.json) lists the Gallery cases.

- **50 circuits from the [Analog Canvas Gallery](https://analog-canvas.tokenzhang.com)** (snapshot 2026-11-11), each written as SPICE+RNL and as Spectre+RNL (49, one circuit's Spectre is not written), none from the frozen 100 of the round-trip benchmark. Chosen by feature: parts outside RNL's standard series (`analog-canvas-extensions`), external subcircuits, hierarchy (3+ Cells), large circuits (120+ parts), no-connect marks, formulas in drawing text, document styles, and circuits redrawn from four reference datasets (AnalogGenie MIT, AMS-Net GPL-3.0, CircuitThink Apache-2.0, AnalogRetriever MIT), at most 3–6 per author; the rest community circuits. Each case keeps its source's licence (`case.json`).
- **2 designs written outside Analog Canvas**, from [rnl-gallery](https://github.com/rich-netlist/rnl-gallery): `ext-pll` (CC0-1.0) and `ext-risca` (CC-BY-4.0, attribution in its `LICENSE`), hierarchical Spectre with includes.

## Run

```bash
cd conformance && npm install
# your tool: for every case, read each entry and write it to <written>/<case>/<entry, / as __>
node grade.mjs cases <written> <out> "<tool and version>"
```

Public packages a file names are fetched from the [package catalog](https://rich-netlist.github.io/rnl-packages/catalog.json) and verified by SHA-256. A self-check (each original graded against itself) must give every entry R3: [`results/2026-11-12-self-check`](results/2026-11-12-self-check/SUMMARY.md).

Analog Canvas runs it with its driver `apps/editor/src/features/netlist-export/rnl-conformance.test.ts` (`RNL_CONF_CORPUS=… RNL_CONF_OUT=…`), which also writes the Gallery cases from a Gallery download.

## Results

| Run | Tool | runtime | R1 / R2 / R3 (of 101 entries) |
|---|---|---|---|
| [`results/2026-11-12-analog-canvas`](results/2026-11-12-analog-canvas/SUMMARY.md) | Analog Canvas `6bcce5731` | 0.5.5 | 99 / 99 / 91 |
| [`results/2026-11-12-analog-canvas-357eb4815`](results/2026-11-12-analog-canvas-357eb4815/SUMMARY.md) | Analog Canvas `357eb4815` | 0.5.5 | 101 / 101 / 99 |

Each `SUMMARY.md` lists the entries below R3 and their first difference.
