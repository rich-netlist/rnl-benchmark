# Results: analog-canvas 0d7abbb87, runtime 0.6.0-dev.6bdd5ce6, RNL 0.4, 200 circuits

200 circuits, each round-tripped as SPICE+RNL and Spectre+RNL.

| | L1 imports cleanly | L2 same circuit | L3 same drawing |
|---|---|---|---|
| SPICE+RNL | 198 | 197 | 157 |
| Spectre+RNL | 196 | 192 | 154 |

Counts are circuits reaching at least that level.

## Counted as drawing the same

Differences the harness's equivalences count as none (hidden-absent, hidden-extra, text-styles, arrow-ends, style-defaults, unused-anchor, orphan-junction, default-ac-phase; `RNL_BENCH_STRICT=all` or a list of them turns them off), listed in each report as `equivalentDifferences`:

| Format | Circuits | Differences |
|---|---|---|
| spice | 114 | 446 |
| spectre | 113 | 442 |

## Normalized before comparing

External definitions the original declared no formal parameters for, compared as declaring the reviewed interface's (harness `withReviewedFormals`; `RNL_BENCH_KEEP_ORIGINAL_FORMALS=1` turns it off):

| Format | Circuits | Circuit: definitions |
|---|---|---|
| spice | 9 | 2rmm2vb45f: sky130_fd_pr__pfet_01v8, sky130_fd_pr__nfet_01v8; 2zr5gwx42v: sky130_fd_pr__npn_05v5_W1p00L1p00; 92ncf3h4s8: sky130_fd_pr__pnp_05v5_W0p68L0p68; af6prxthxw: sky130_fd_pr__pnp_05v5_W0p68L0p68, sky130_fd_pr__npn_05v5_W1p00L1p00; ggzkc58xpq: sky130_fd_pr__pfet_01v8; mh8wdf6h3t: sky130_fd_pr__pnp_05v5_W0p68L0p68; ptf9v5dbak: sky130_fd_pr__pnp_05v5_W0p68L0p68; sfwnhg6ckd: sky130_fd_pr__npn_05v5_W1p00L1p00; ycg43babwa: sky130_fd_pr__npn_05v5_W1p00L1p00 |
| spectre | 9 | 2rmm2vb45f: sky130_fd_pr__pfet_01v8, sky130_fd_pr__nfet_01v8; 2zr5gwx42v: sky130_fd_pr__npn_05v5_W1p00L1p00; 92ncf3h4s8: sky130_fd_pr__pnp_05v5_W0p68L0p68; af6prxthxw: sky130_fd_pr__pnp_05v5_W0p68L0p68, sky130_fd_pr__npn_05v5_W1p00L1p00; ggzkc58xpq: sky130_fd_pr__pfet_01v8; mh8wdf6h3t: sky130_fd_pr__pnp_05v5_W0p68L0p68; ptf9v5dbak: sky130_fd_pr__pnp_05v5_W0p68L0p68; sfwnhg6ckd: sky130_fd_pr__npn_05v5_W1p00L1p00; ycg43babwa: sky130_fd_pr__npn_05v5_W1p00L1p00 |

## Problems, by circuits affected

| Problem | Tracked in | SPICE+RNL | Spectre+RNL | e.g. |
|---|---|---|---|---|
| export blocked |  | 1 | 2 | ar-1485 |
| import reports errors |  | 1 | 2 | b9afqhsjzv |
| electrically different | #1783 | 1 | 0 | i2n-1477 |
| netlist text changed | #1785 | 0 | 4 |  |
| extra or missing pins/glyphs | #1783 | 2 | 3 | 2n6rvfpbcc, zj2kxb229f |
| reference renamed (M1 -> XM1) | #1785 | 0 | 2 |  |
| instance symbol/placement/parameters changed | #1785 #1786 | 6 | 8 | 2eamzf6z3h, 3h96hmvpyv, ag-1103 |
| wires lost or added | #1784 | 5 | 6 | 3yb6zz6j2y, 6ahgdzh25k, jkazvdj5zv |
| annotations changed | #1785 | 9 | 9 | 2n6rvfpbcc, 3yb6zz6j2y, 6ahgdzh25k |
| drafting objects changed | #1787 | 14 | 15 | 3bwccvqje9, 3dryra4xaq, 3yb6zz6j2y |
| labels changed/shown/hidden | #1785 #1787 | 18 | 20 | 2eamzf6z3h, 2n6rvfpbcc, 3h96hmvpyv |
| drawn differently (rendered) |  | 35 | 37 | 2eamzf6z3h, 2n6rvfpbcc, 3bwccvqje9 |
| Cells lost or renamed |  | 1 | 1 | 924v8n26es |

## Failures, by message

| Format | Failure | Message | Circuits |
|---|---|---|---|
| spectre | export-blocked | ZENER_BUILTIN_SPICE_ONLY: Instance D3 uses a generated ngspice Zener model; select SPI / ZENER_BUILTIN_SPICE_ONLY: Instance D4 uses a generated ngspice Zener model; select SPI | 1: i2n-1477 |
| spectre | export-blocked | error RNL_ROTATION_NOT_QUARTER | 1: ar-1485 |
| spectre | import-errors | RNL_IMPORT_CHANGES_NETLIST | 1: b9afqhsjzv |
| spectre | import-failed | RNL_IMPORT_FAILED | 1: 6ahgdzh25k |
| spice | export-blocked | error RNL_ROTATION_NOT_QUARTER | 1: ar-1485 |
| spice | import-errors | RNL_IMPORT_CHANGES_NETLIST | 1: b9afqhsjzv |

## Per circuit

| Circuit | Author | Parts | SPICE | Spectre | Problems (SPICE) |
|---|---|---|---|---|---|
| `ar-1485` AnalogRetriever #1485 · Rectifier power  | AnalogRetriever (redrawn) | 10 | L0 | L0 | export blocked |
| `b9afqhsjzv` Floating Charge-Transferer | Wang hr | 69 | L0 | L0 | import reports errors |
| `i2n-1477` Image2Net #1477 · V-FET power amplifier  | Image2Net (redrawn) | 45 | L1 | L0 | electrically different |
| `6ahgdzh25k` PTAT Bias Current Generator | boboIC | 16 | L2 | L0 | wires lost or added, annotations changed, drafting objects changed, labels changed/shown/hidden, drawn differently (rendered) |
| `ag-1103` AnalogGenie #1103 · Concurrent combining | AnalogGenie (redrawn) | 40 | L2 | L1 | instance symbol/placement/parameters changed, drawn differently (rendered) |
| `i2n-1692` Image2Net #1692 · Amateur TV transmitter | Image2Net (redrawn) | 42 | L2 | L1 | drawn differently (rendered) |
| `2eamzf6z3h` CPPLL | Elara | 11 | L2 | L2 | instance symbol/placement/parameters changed, labels changed/shown/hidden, drawn differently (rendered) |
| `2n6rvfpbcc` Drain-Tracking NMOS Class AB Bias Genera | boboIC | 6 | L2 | L2 | extra or missing pins/glyphs, annotations changed, labels changed/shown/hidden, drawn differently (rendered) |
| `3bwccvqje9` Linear model | Rgeph | 4 | L2 | L2 | drafting objects changed, drawn differently (rendered) |
| `3dryra4xaq` Cross-Coupled Interpolating Delay Cell | Zengchun Chen | 21 | L2 | L2 | drafting objects changed, drawn differently (rendered) |
| `3h96hmvpyv` Bipolar Op-Amp Architecture with Local E | boboIC | 25 | L2 | L2 | instance symbol/placement/parameters changed, labels changed/shown/hidden, drawn differently (rendered) |
| `3tfmrzevfe` deadtime | ll jiang | 22 | L2 | L2 | drawn differently (rendered) |
| `3yb6zz6j2y` Floating Current Source with a Bipolar E | boboIC | 19 | L2 | L2 | wires lost or added, annotations changed, drafting objects changed, labels changed/shown/hidden, drawn differently (rendered) |
| `6wa2cf4zcm` 三运放IA | L | 13 | L2 | L2 | labels changed/shown/hidden, drawn differently (rendered) |
| `924v8n26es` LCVCO | Tzyer | 11 | L2 | L2 | Cells lost or renamed |
| `92ncf3h4s8` BGR2 | Lokesh Garg | 14 | L2 | L2 | annotations changed, labels changed/shown/hidden |
| `ag-1182` AnalogGenie #1182 · Transformer-coupled  | AnalogGenie (redrawn) | 45 | L2 | L2 | drawn differently (rendered) |
| `ag-1344` AnalogGenie #1344 · Power converters | AnalogGenie (redrawn) | 28 | L2 | L2 | drafting objects changed, drawn differently (rendered) |
| `ag-1474` AnalogGenie #1474 · Bandgap references | AnalogGenie (redrawn) | 14 | L2 | L2 | drafting objects changed, drawn differently (rendered) |
| `ag-1758` AnalogGenie #1758 · Bandgap references | AnalogGenie (redrawn) | 11 | L2 | L2 | drawn differently (rendered) |
| `ag-2533` AnalogGenie #2533 · Low-dropout regulato | AnalogGenie (redrawn) | 30 | L3 | L1 | — |
| `b5dqwtrbn3` pixel | zsxin_2011 | 7 | L2 | L2 | drawn differently (rendered) |
| `c8y9j9djzt` 3-bit flash ADC with NAND encoder | shixuan wang | 41 | L2 | L2 | drawn differently (rendered) |
| `cygmjcn976` conventional BGR | yi583 gain | 14 | L2 | L2 | drafting objects changed, drawn differently (rendered) |
| `dhfnzqqagg` 6-bit SAR ADC | Zengchun Chen | 103 | L2 | L2 | labels changed/shown/hidden |
| `f64bvmxv5e` Common Gate LNA | Ethan Zhong | 14 | L2 | L2 | drafting objects changed, drawn differently (rendered) |
| `f8j5xr43ha` AnalogGenie #1285 · Power converters | Yao Lai | 37 | L2 | L2 | drafting objects changed, drawn differently (rendered) |
| `i2n-1617` Image2Net #1617 · First-order delta-sigm | Image2Net (redrawn) | 9 | L2 | L2 | drawn differently (rendered) |
| `jecdz8zk6n` New Circuit | 吳中瑜 | 20 | L2 | L2 | drawn differently (rendered) |
| `jkazvdj5zv` Feedback Current Source for Reduced Impa | boboIC | 8 | L2 | L2 | instance symbol/placement/parameters changed, wires lost or added, annotations changed, drafting objects changed, labels changed/shown/hidden, drawn differently (rendered) |
| `kj3b7bt3e4` Adjustable Load-Protection Current Limit | boboIC | 24 | L2 | L2 | annotations changed, drafting objects changed, labels changed/shown/hidden, drawn differently (rendered) |
| `mthfqxzyk8` Miller | Gloria Piacentini | 12 | L2 | L2 | labels changed/shown/hidden, drawn differently (rendered) |
| `p4v8mz39ms` CMOS feedback shunt regulator | GPT-6.1 Sol | 11 | L2 | L2 | labels changed/shown/hidden |
| `pxxj67dmag` V to I circuit | MWW-001 | 6 | L2 | L2 | drafting objects changed, drawn differently (rendered) |
| `secn3fpsvj` Low-Headroom Class AB Output Stage with  | boboIC | 23 | L2 | L2 | instance symbol/placement/parameters changed, wires lost or added, annotations changed, drafting objects changed, labels changed/shown/hidden, drawn differently (rendered) |
| `sm663cbs8b` Ring Amplifier | Wang hr | 51 | L2 | L2 | drawn differently (rendered) |
| `t3j9dvy3q8` Hybrid-Nested-Miller Four-Stage Operatio | boboIC | 51 | L3 | L1 | — |
| `v4dfj332kp` Three-stage switched-capacitor ring ampl | Kezhuo Liu | 43 | L2 | L2 | labels changed/shown/hidden |
| `vvqs4x9h96` AMP_FC_chopper | shunqing | 19 | L2 | L2 | labels changed/shown/hidden, drawn differently (rendered) |
| `wk9n5bgqwq` DIV 7 Cicuit | Ethan Zhong | 9 | L2 | L2 | drawn differently (rendered) |
| `wx6egngfgf` Nested Miller Compensation | 云飞歌 | 5 | L2 | L2 | drawn differently (rendered) |
| `x3gnj7svkn` Shared-Bias Cascode Current-Source Bank | boboIC | 12 | L2 | L2 | annotations changed, drafting objects changed, labels changed/shown/hidden, drawn differently (rendered) |
| `zbq2cgqygw` D-latch | 陈宗良 | 5 | L2 | L2 | drawn differently (rendered) |
| `zj2kxb229f` Complementary-Input Amplifier with Class | boboIC | 39 | L2 | L2 | extra or missing pins/glyphs, instance symbol/placement/parameters changed, wires lost or added, annotations changed, labels changed/shown/hidden, drawn differently (rendered) |
| `zn7fyb3xp3` non-overlapping clock phase generator | 楊任勛 | 11 | L2 | L2 | labels changed/shown/hidden, drawn differently (rendered) |
| `i2n-2139` Image2Net #2139 · Segmented reference bu | Image2Net (redrawn) | 17 | L3 | L2 | — |
| `23v5t7erxh` CG CIS | Zhishuai Zhang | 32 | L3 | L3 | — |
| `2hxyaemr8h` ClassB nmos LC-VCO | Qingyu Zheng | 5 | L3 | L3 | — |
| `2rmm2vb45f` Switched_Capacitor_DAC_6bit (SPICE Impor | Zengchun Chen | 14 | L3 | L3 | — |
| `2zr5gwx42v` SEF | self zaster | 3 | L3 | L3 | — |
| `3575r7k3gg` Regulated cross-coupled charge pump | Zhishuai Zhang | 16 | L3 | L3 | — |
| `35nyqjtrkh` Simplified implementation of Gm2. | Magic Li | 42 | L3 | L3 | — |
| `386ggqhz53` FIA | Tzu Han Wang | 9 | L3 | L3 | — |
| `38m8wdesbh` Complimentary Folded-Cascoded Gm Cell | Lu Jie | 22 | L3 | L3 | — |
| `3ndjfc3ys7` PMOS input continuous time comparator | 黃子玄 | 13 | L3 | L3 | — |
| `3ze5gasahn` brokaw bandgap | hjwqqq | 7 | L3 | L3 | — |
| `435zm6qgpa` Two stage amplifier with an auxiliary of | Magic Li | 32 | L3 | L3 | — |
| `4f72zv97ez` Folded-cascode amplifiers with Re | Rahim Najafian | 4 | L3 | L3 | — |
| `4vdb4hbfe3` Gain Stage with series pealing and T-coi | YILIN XU | 6 | L3 | L3 | — |
| `557r4atgn5` ClassAB | lance chang | 15 | L3 | L3 | — |
| `55va4g6rjt` capacitor-less LDO | Magic Li | 44 | L3 | L3 | — |
| `57xa4r682t` Fully differential Gm-C Butterworth biqu | Zhishuai Zhang | 15 | L3 | L3 | — |
| `58t3fmnnmj` Differential bottom-plate sampler with b | Zhishuai Zhang | 28 | L3 | L3 | — |
| `5etmybq44s` Delaycell | Emmett Young | 8 | L3 | L3 | — |
| `5jk4a2xnxs` Cascode Source-degenerated LNA | 王若宁 | 8 | L3 | L3 | — |
| `66yyhzeg2b` CVR | Magic Li | 59 | L3 | L3 | — |
| `69hf32pe5d` Current-to-Phase Convertor based on Ring | D9sus4 | 11 | L3 | L3 | — |
| `6arzwp68jh` 4-bit flash ADC with XOR encoder | Zhishuai Zhang | 135 | L3 | L3 | — |
| `6c58xn673d` biasing network | Ahmed Mahmoud | 10 | L3 | L3 | — |
| `7cf5c6mjqj` Peak detector | Yung1120 | 4 | L3 | L3 | — |
| `7jb4jzcmah` CMOS asynchronous-reset phase-frequency  | GPT-6.1 Sol | 55 | L3 | L3 | — |
| `7q6a6v9ank` hysteresis comparator | sugar paradox | 23 | L3 | L3 | — |
| `7r4qr4j9pa` 4:1 Series-Parallel | Switched-Capacitor | charonwow | 16 | L3 | L3 | — |
| `7x7wb88z4c` StrongARM Latch | Xu Mai | 11 | L3 | L3 | — |
| `84apethqad` static_comparator | qingsheng shu | 19 | L3 | L3 | — |
| `8aswrx2vta` Two-phase interleaved switched-capacitor | Zhishuai Zhang | 56 | L3 | L3 | — |
| `9dcdex4rhn` Rail-to-Rail Class-AB amplifier with vol | 詹凯华 | 28 | L3 | L3 | — |
| `9nrfdtqnta` differential amplifier | zhangerheng | 7 | L3 | L3 | — |
| `9z2n9ms4bq` Rail-to-Rail Folded Cascode with Class-A | shawn.wwx9591 | 30 | L3 | L3 | — |
| `a3mjtfmdhx` pn latch lc vco | hopeful | 12 | L3 | L3 | — |
| `a5tz83j7hp` Transimpedance Amplifier with PD | 岩孙 | 3 | L3 | L3 | — |
| `af6prxthxw` CMBGR | y529259298-ux | 34 | L3 | L3 | — |
| `ag-1070` AnalogGenie #1070 · Latch comparator wit | AnalogGenie (redrawn) | 22 | L3 | L3 | — |
| `ag-1094` AnalogGenie #1094 · Direct-conversion re | AnalogGenie (redrawn) | 42 | L3 | L3 | — |
| `ag-1107` AnalogGenie #1107 · Stacked distributed  | AnalogGenie (redrawn) | 65 | L3 | L3 | — |
| `ag-1164` AnalogGenie #1164 · Dual-tank switched L | AnalogGenie (redrawn) | 25 | L3 | L3 | — |
| `ag-2345` AnalogGenie #2345 · Low-dropout regulato | AnalogGenie (redrawn) | 25 | L3 | L3 | — |
| `ag-3473` AnalogGenie #3473 · Switched-capacitor s | AnalogGenie (redrawn) | 43 | L3 | L3 | — |
| `ag-362` AnalogGenie #362 · CMFB loop around a te | AnalogGenie (redrawn) | 23 | L3 | L3 | — |
| `ag-515` AnalogGenie #515 · Double-balanced upcon | AnalogGenie (redrawn) | 11 | L3 | L3 | — |
| `ag-555` AnalogGenie #555 · CML AND gate with inp | AnalogGenie (redrawn) | 18 | L3 | L3 | — |
| `ajfd3c7h36` Double Tail Comparator | Zhangfm | 12 | L3 | L3 | — |
| `amsnet-359` AMS-Net #359 · Amplifier A1 with RC netw | AMS-Net (redrawn) | 8 | L3 | L3 | — |
| `ar-6082` AnalogRetriever #6082 · CS amplifier wit | AnalogRetriever (redrawn) | 12 | L3 | L3 | — |
| `astd8h7a2w` TIA | A Liangliang | 5 | L3 | L3 | — |
| `atrwhd4c55` Cascode Amp | Zengchun Chen | 2 | L3 | L3 | — |
| `aw5m493vtr` Figure 16.60 | Rgeph | 2 | L3 | L3 | — |
| `ax88crfm22` precision rectifier | bug-sprout | 3 | L3 | L3 | — |
| `bfzpwrhc4s` Fully differential, self-resetting, bias | Magic Li | 78 | L3 | L3 | — |
| `bsjc9sctvh` CMOS 1.2 V to 3.3 V level shifter | GPT-6.1 Sol | 12 | L3 | L3 | — |
| `bvy25zrhzz` CMOS tri-state driver with bus keeper | GPT-6.1 Sol | 13 | L3 | L3 | — |
| `bxf9mf7gd2` First-order bandgap reference with NPN Δ | yuki15532233 | 30 | L3 | L3 | — |
| `c27cw7zxn7` zero current detector circuit diagram | Magic Li | 46 | L3 | L3 | — |
| `c5vhrjv95h` BJT bias core with trimmed outputs | Claude Opus 5.5 | 51 | L3 | L3 | — |
| `ckxxp76d57` CMOS two-stage scan register | GPT-6.1 Sol | 46 | L3 | L3 | — |
| `cmbb75na5q` czy_lowNS_comp | 陈志禹 | 13 | L3 | L3 | — |
| `crpphvtva6` Two Stage OTA with Flying Cap CMFB (Star | Zengchun Chen | 52 | L3 | L3 | — |
| `cs5yz8ppc5` Static CMOS divide-by-2 with D flip-flop | Zhishuai Zhang | 8 | L3 | L3 | — |
| `csbw6k9aby` Mixer-first receiver front end | KIBA | 13 | L3 | L3 | — |
| `ct-037` CircuitThink #037 · Three-stage differen | CircuitThink (redrawn) | 15 | L3 | L3 | — |
| `cwmesegne8` Two Stage OTA with Flying Cap CMFB | Zengchun Chen | 48 | L3 | L3 | — |
| `d294ejx3g9` CMOS SW | 2116454268 | 4 | L3 | L3 | — |
| `d3tfb8q693` CMOS three-bit Fibonacci LFSR | GPT-6.1 Sol | 57 | L3 | L3 | — |
| `d55gzdaggq` QPD Detection Circuit | Pengcheng Zhang | 38 | L3 | L3 | — |
| `d9a2snyhxz` 3-stage amplifier | Oscar Toomey | 16 | L3 | L3 | — |
| `dma8n9tykv` Ringamp with replica bias | Mintzh | 81 | L3 | L3 | — |
| `dyggxk29c4` Transformer-coupled class-AB PA | Claude Opus 5.5 | 17 | L3 | L3 | — |
| `dz689bvy2n` 6-bit asynchronous SAR ADC | Zhishuai Zhang | 5 | L3 | L3 | — |
| `dzxbj9k5as` 2 stage miller amplifier | curry_yun | 13 | L3 | L3 | — |
| `eas5ayethn` 3-Stage Bootstrap Charge Pump | Aidar Iglesias | 13 | L3 | L3 | — |
| `egf2yfcdth` Differential Switched-Capacitor Gain Sta | Litie Lin | 17 | L3 | L3 | — |
| `ez4m9ggesf` Dynamic Switch | He Yuan | 11 | L3 | L3 | — |
| `f1a0b46a-180f-47cc-9bb2-815554aa7575` Common-Source Amplifier | Analog Canvas | 6 | L3 | L3 | — |
| `f3anf69kk6` two-core complementary DCO | David | 10 | L3 | L3 | — |
| `frw3b53jtz` Charge Pump | 臧臧毓成 | 8 | L3 | L3 | — |
| `fv87gdk257` gain boosted current source | matheus Pimenta | 8 | L3 | L3 | — |
| `fx52v6fzbg` IDAC | zhouzhou | 44 | L3 | L3 | — |
| `g37crxfgf7` sense amplifier 1 | 18867155892 | 9 | L3 | L3 | — |
| `g3cdgsa8jp` Three-stage switched-capacitor ring ampl | Zhishuai Zhang | 48 | L3 | L3 | — |
| `gebpb6er9t` Fig. 5.17 (b) | Nicolas Herrera | 6 | L3 | L3 | — |
| `ggzkc58xpq` Fully Differential CMOS Amplifier with R | Chen Zengchun | 14 | L3 | L3 | — |
| `gw6naca4r6` RC-coupled BJT voltage amplifier | GPT-6 Astra | 16 | L3 | L3 | — |
| `gwer4fr5c3` Half-bridge class-D amplifier with dead- | zhuang | 5 | L3 | L3 | — |
| `h7yxkmnezp` Common-Drain Amplifier | handsomegary | 6 | L3 | L3 | — |
| `hk6jba37az` BIASING | 阳雨 | 20 | L3 | L3 | — |
| `hm22f22b56` fully differential switched-capacitor in | ziyuanW-coder | 15 | L3 | L3 | — |
| `hxakhrwq8b` Rectifier_CCP | dkhoatrang | 16 | L3 | L3 | — |
| `i2n-1215` Image2Net #1215 · Avalanche-transistor L | Image2Net (redrawn) | 6 | L3 | L3 | — |
| `i2n-1713` Image2Net #1713 · Single-supply quasi-co | Image2Net (redrawn) | 45 | L3 | L3 | — |
| `i2n-249` Image2Net #249 · MOSFET large-signal mod | Image2Net (redrawn) | 10 | L3 | L3 | — |
| `i2n-451` Image2Net #451 · Common-mode half circui | Image2Net (redrawn) | 22 | L3 | L3 | — |
| `j9cfz6mfs7` ADSL | Magic Li | 21 | L3 | L3 | — |
| `k6bybqnz4b` Two-Stage Opamp | s1ham | 10 | L3 | L3 | — |
| `kdzrh2z7w4` PMOS Dynamic Comparator | dongyang liu | 12 | L3 | L3 | — |
| `krp97s8npd` CMOS 2-bit flash ADC | GPT-6.1 Sol | 41 | L3 | L3 | — |
| `m3ek9hty4p` Active Ind CTLE | yanglt24 | 9 | L3 | L3 | — |
| `m7n7k5jn7b` novel charge pump. | Magic Li | 67 | L3 | L3 | — |
| `mf5c5v8g7s` Self-Bias Low-Voltage Cascode Current Mi | YANG, Chaowei | 7 | L3 | L3 | — |
| `mh8wdf6h3t` Bandgap_with_sourceR | 温雪岱 | 16 | L3 | L3 | — |
| `mt6pwaxaqm` MOS two-phase Dickson charge pump | GPT-6.1 Sol | 11 | L3 | L3 | — |
| `ncqgzdy4zf` slopecontrol | jaesin hwang | 49 | L3 | L3 | — |
| `nkj35a4ndr` Rail-to-rail folded-cascode op amp with  | Zhishuai Zhang | 59 | L3 | L3 | — |
| `nqksde5dtj` 4PortLC | Pullepu Guna Sekhar ee23d402 | 4 | L3 | L3 | — |
| `nx3bc6w68r` PFD, charge pump and loop filter | Claude Opus 5.5 | 13 | L3 | L3 | — |
| `nxt979sfnb` RC network | Purusa | 11 | L3 | L3 | — |
| `nznez6ma4p` bandgap | Magic Li | 13 | L3 | L3 | — |
| `p3af2sg23j` Small Signal Model of CS AMP | Zengchun Chen | 8 | L3 | L3 | — |
| `p3xa7xf47y` CMOS_FSM_NOR_28T | sohrab amiri | 33 | L3 | L3 | — |
| `p8efzmbdd6` Inverting Integrator | Haoyang Li | 3 | L3 | L3 | — |
| `pbp5aw5waq` 4-bit flash ADC with XOR encoder | Kezhuo Liu | 112 | L3 | L3 | — |
| `pngpj38rva` Positive CMFB of Even Cascode Flying Cap | Zengchun Chen | 33 | L3 | L3 | — |
| `ptf9v5dbak` low-voltage, low-noise operational ampli | Magic Li | 55 | L3 | L3 | — |
| `pyvwf32qtm` Miyahara Comoparator | Chen2609 | 15 | L3 | L3 | — |
| `q53pvffgpx` Operational amplifier with class AB outp | g1286012685 | 29 | L3 | L3 | — |
| `qjpfesczpd` Wien-Bridge Osc | s1ham | 13 | L3 | L3 | — |
| `qmcsgaepwd` 3-bit Johnson counter | Claude Opus 5.5 | 3 | L3 | L3 | — |
| `rej732tpap` CDS | 2108199927 | 11 | L3 | L3 | — |
| `s7ngrw8566` tri-swich | 羅俊能 | 6 | L3 | L3 | — |
| `s7sr67mv5y` ota-bjt | why250 | 8 | L3 | L3 | — |
| `sf6e58mmjb` CTLE | THDCH | 10 | L3 | L3 | — |
| `sfwnhg6ckd` Two-stage BJT amplifier | royal0421 | 11 | L3 | L3 | — |
| `srexdrehyh` buck | hunk man | 18 | L3 | L3 | — |
| `stayz7tm4a` Figure 16.6 | Rgeph | 10 | L3 | L3 | — |
| `tc5v5zbja4` Folded Opamp | s1ham | 18 | L3 | L3 | — |
| `ted9j68az2` CML buffer | Bilal Ramadan | 5 | L3 | L3 | — |
| `tqy9f3gztf` LNA with Degeneration | Kerollos Ashraf | 12 | L3 | L3 | — |
| `tzndtf98tg` single side VGA | LiNlIn4968 | 4 | L3 | L3 | — |
| `v2xe2c79gy` Two-phase interleaved switched-capacitor | 2331843037 | 56 | L3 | L3 | — |
| `v73tvd92wz` Double-tail dynamic comparator | Zha Liyuan | 15 | L3 | L3 | — |
| `vcfdca5hqp` NMOS-QFGMOS Symbol | Ruchita Gupta | 5 | L3 | L3 | — |
| `vrenfp5n3w` Differential Voltage-Controlled Delay Ce | 索罗斯的猫 | 6 | L3 | L3 | — |
| `vsz7w8xyx8` RC OSC | zczhou | 12 | L3 | L3 | — |
| `w2nyfcn28e` Hybrid SIBO | chi zhang | 9 | L3 | L3 | — |
| `w3sn8wh2jn` fanduishu | 王世聪 | 10 | L3 | L3 | — |
| `w783xzjxwc` Current detector | runzhanghe | 4 | L3 | L3 | — |
| `x58affkk5b` Preamp | 眯眯眼 | 5 | L3 | L3 | — |
| `x7nesskg5g` Four-stage delay-line TDC with TSPC flip | Zhishuai Zhang | 52 | L3 | L3 | — |
| `xdpwyfdj7q` Differential bootstrap gate driver for t | Zhishuai Zhang | 2 | L3 | L3 | — |
| `xmkspetv6a` BPA with feedback pseudo-resistors | Magic Li | 26 | L3 | L3 | — |
| `xr9crqb93w` V mode and C mode cap multiplier | Feng23 Yuan | 5 | L3 | L3 | — |
| `xrbakw3dn5` Calibratable Strongarm Comparator | zhuang | 16 | L3 | L3 | — |
| `yb27wfgqkz` Small Signal Model of NMOS CG AMP | Zengchun Chen | 7 | L3 | L3 | — |
| `ybpwp23m8f` Self-biased compartor | Yichen XU | 16 | L3 | L3 | — |
| `ycg43babwa` LTC3452 | 林琼宇 | 19 | L3 | L3 | — |
| `z636m9949r` PMOS LDO | Yi Liu | 6 | L3 | L3 | — |
| `zkgtc257w2` Overall digitizer frontend with AC coupl | Magic Li | 18 | L3 | L3 | — |
| `zkpzejysxn` The_3_level | 1546748151 | 8 | L3 | L3 | — |
| `znhrweves6` NOR | 陳昱蓁 | 4 | L3 | L3 | — |
| `ztv7v8zh2k` 2 stage miller amplifier | Alex He | 19 | L3 | L3 | — |
| `zxja47h4yb` LV oscillation loop | 陳恩宇 | 22 | L3 | L3 | — |
