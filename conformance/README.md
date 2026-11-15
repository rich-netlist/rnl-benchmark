# RNL conformance suite

A tool supports RNL when what it reads, it can write again. The suite gives RNL files; the tool reads each one and writes it out; [`grade.mjs`](grade.mjs) compares what came out with what went in using the [RNL runtime](https://github.com/rich-netlist/rnl) alone. Any schematic tool that reads and writes SPICE+RNL or Spectre+RNL can be graded, the same way for every tool.

| Level | Meaning |
|---|---|
| **R1** reads | The written file reads with no error. |
| **R2** same circuit | Every level has the same parts, values and connections. Names of parts and of unnamed nets may change; named ports and globals may not. |
| **R3** same drawing | R2, and every part and glyph draws the same line art at the same place (its outlines as rendered, rounded to 0.01 units; texts, styles and the symbol's name aside), and every wire runs through the same points. |

## Cases

`cases/<case>/` holds one design: its entry netlists (`.sp` SPICE+RNL, `.scs` Spectre+RNL), any files they include, and `case.json` with its source, licence and the features it was chosen for. [`manifest.json`](manifest.json) lists the Gallery cases.

- **50 circuits from the [Analog Canvas Gallery](https://analog-canvas.tokenzhang.com)** (snapshot 2026-11-11), each written in RNL 0.4 as SPICE+RNL and as Spectre+RNL (49, one circuit's Spectre is not written), none from the frozen 100 of the round-trip benchmark. Chosen by feature: parts outside RNL's standard series (`analog-canvas-extensions`), external subcircuits, hierarchy (3+ Cells), large circuits (120+ parts), no-connect marks, formulas in drawing text, document styles, and circuits redrawn from four reference datasets (AnalogGenie MIT, AMS-Net GPL-3.0, CircuitThink Apache-2.0, AnalogRetriever MIT), at most 3–6 per author; the rest community circuits. Each case keeps its source's licence (`case.json`).
- Designs written outside Analog Canvas come from [rnl-gallery](https://github.com/rich-netlist/rnl-gallery) once it publishes them in RNL 0.4. Its two 0.3 designs (`ext-pll`, `ext-risca`) left the suite when it moved to 0.4; `rnl upgrade` cannot choose for their authors how the standard definitions 0.4 split or removed should be read.

## Run

```bash
cd conformance && npm install
# your tool: for every case, read each entry and write it to <written>/<case>/<entry, / as __>
node grade.mjs cases <written> <out> "<tool and version>"
```

The cases are RNL 0.4. No release of `@rich-netlist/runtime` on npm reads 0.4 yet, so `package.json` uses the package built from rich-netlist/rnl `main` at `b4c3f857` (`vendor/`), the one Analog Canvas uses. Public packages a file names are fetched from the [package catalog](https://rich-netlist.github.io/rnl-packages/catalog.json) and verified by SHA-256. A self-check (each original graded against itself) must give every entry R3: [`results/2026-11-12-self-check`](results/2026-11-12-self-check/SUMMARY.md).

Analog Canvas runs it with its driver `apps/editor/src/features/netlist-export/rnl-conformance.test.ts` (`RNL_CONF_CORPUS=… RNL_CONF_OUT=…`), which also writes the Gallery cases from a Gallery download.

## Results

| Run | Tool | RNL, runtime | R1 / R2 / R3 (entries) |
|---|---|---|---|
| [`results/2026-11-12-analog-canvas`](results/2026-11-12-analog-canvas/SUMMARY.md) | Analog Canvas `6bcce5731` | 0.3, 0.5.5 | 99 / 99 / 91 (of 101) |
| [`results/2026-11-12-analog-canvas-357eb4815`](results/2026-11-12-analog-canvas-357eb4815/SUMMARY.md) | Analog Canvas `357eb4815` | 0.3, 0.5.5 | 101 / 101 / 99 (of 101) |
| [`results/2026-11-15-analog-canvas-f966cdf94`](results/2026-11-15-analog-canvas-f966cdf94/SUMMARY.md) | Analog Canvas `f966cdf94` | 0.4, 0.6.0-dev.6bdd5ce6 | 99 / 99 / 99 (of 99) |
| [`results/2026-11-15-analog-canvas-751e0e3ad`](results/2026-11-15-analog-canvas-751e0e3ad/SUMMARY.md) | Analog Canvas `751e0e3ad` | 0.4, 0.6.0-dev.b4c3f857 | 99 / 99 / 99 (of 99) |

Each `SUMMARY.md` lists the entries below R3 and their first difference.
