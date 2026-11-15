# Results: analog-canvas 0d7abbb87, runtime 0.6.0-dev.6bdd5ce6, RNL 0.4

160 circuits, each round-tripped as SPICE+RNL and Spectre+RNL.

| | L1 imports cleanly | L2 same circuit | L3 same drawing |
|---|---|---|---|
| SPICE+RNL | 158 | 155 | 141 |
| Spectre+RNL | 158 | 154 | 140 |

Counts are circuits reaching at least that level.

## Counted as drawing the same

Differences the harness's equivalences count as none (hidden-absent, hidden-extra, text-styles, arrow-ends, style-defaults, unused-anchor, orphan-junction, default-ac-phase; `RNL_BENCH_STRICT=all` or a list of them turns them off), listed in each report as `equivalentDifferences`:

| Format | Circuits | Differences |
|---|---|---|
| spice | 61 | 197 |
| spectre | 61 | 197 |

## Normalized before comparing

External definitions the original declared no formal parameters for, compared as declaring the reviewed interface's (harness `withReviewedFormals`; `RNL_BENCH_KEEP_ORIGINAL_FORMALS=1` turns it off):

| Format | Circuits | Circuit: definitions |
|---|---|---|
| spice | 6 | 2rmm2vb45f: sky130_fd_pr__pfet_01v8, sky130_fd_pr__nfet_01v8; af6prxthxw: sky130_fd_pr__pnp_05v5_W0p68L0p68, sky130_fd_pr__npn_05v5_W1p00L1p00; gv7amdyd6h: sky130_fd_pr__pnp_05v5_W0p68L0p68; gvhphqkxcz: sky130_fd_pr__pnp_05v5_W0p68L0p68; mh8wdf6h3t: sky130_fd_pr__pnp_05v5_W0p68L0p68; w5bejn2fzb: sky130_fd_pr__pfet_01v8, sky130_fd_pr__nfet_01v8 |
| spectre | 6 | 2rmm2vb45f: sky130_fd_pr__pfet_01v8, sky130_fd_pr__nfet_01v8; af6prxthxw: sky130_fd_pr__pnp_05v5_W0p68L0p68, sky130_fd_pr__npn_05v5_W1p00L1p00; gv7amdyd6h: sky130_fd_pr__pnp_05v5_W0p68L0p68; gvhphqkxcz: sky130_fd_pr__pnp_05v5_W0p68L0p68; mh8wdf6h3t: sky130_fd_pr__pnp_05v5_W0p68L0p68; w5bejn2fzb: sky130_fd_pr__pfet_01v8, sky130_fd_pr__nfet_01v8 |

## Problems, by circuits affected

| Problem | Tracked in | SPICE+RNL | Spectre+RNL | e.g. |
|---|---|---|---|---|
| import reports errors |  | 2 | 2 | b9afqhsjzv, bqvdxv2755 |
| electrically different | #1783 | 3 | 4 | geyj8trvrm, hmvkem497t, mgvpymt7pe |
| extra or missing pins/glyphs | #1783 | 1 | 1 | dgr5ep645b |
| instance symbol/placement/parameters changed | #1785 #1786 | 0 | 1 |  |
| wires lost or added | #1784 | 1 | 1 | m8mpcxy2gz |
| annotations changed | #1785 | 3 | 3 | geyj8trvrm, hmvkem497t, mgvpymt7pe |
| drafting objects changed | #1787 | 6 | 6 | ag-1344, e2gfbh8ef6, f8j5xr43ha |
| labels changed/shown/hidden | #1785 #1787 | 9 | 9 | 22wv6hdc7x, 2z5g2ehvq6, ag-1093 |
| drawn differently (rendered) |  | 12 | 12 | 2z5g2ehvq6, 3tfmrzevfe, ag-1093 |

## Failures, by message

| Format | Failure | Message | Circuits |
|---|---|---|---|
| spectre | import-errors | RNL_IMPORT_CHANGES_NETLIST | 2: b9afqhsjzv bqvdxv2755 |
| spice | import-errors | RNL_IMPORT_CHANGES_NETLIST | 2: b9afqhsjzv bqvdxv2755 |

## Per circuit

| Circuit | Author | Parts | SPICE | Spectre | Problems (SPICE) |
|---|---|---|---|---|---|
| `b9afqhsjzv` Floating Charge-Transferer | Wang hr | 69 | L0 | L0 | import reports errors |
| `bqvdxv2755` SEFIA-based SC integrator | Magic Li | 50 | L0 | L0 | import reports errors |
| `geyj8trvrm` Seevinck Temperature-Compensated Voltage | boboIC | 11 | L1 | L1 | electrically different, annotations changed, drafting objects changed, labels changed/shown/hidden, drawn differently (rendered) |
| `hmvkem497t` SCM-Biased All-MOS Temperature-Compensat | boboIC | 18 | L1 | L1 | electrically different, annotations changed, drafting objects changed, labels changed/shown/hidden, drawn differently (rendered) |
| `mgvpymt7pe` Oguey All-MOS Current Reference | boboIC | 10 | L1 | L1 | electrically different, annotations changed, drafting objects changed, labels changed/shown/hidden, drawn differently (rendered) |
| `22wv6hdc7x` comparator | Magic Li | 23 | L2 | L2 | labels changed/shown/hidden |
| `2z5g2ehvq6` FIA | Zhishuai Zhang | 11 | L2 | L2 | labels changed/shown/hidden, drawn differently (rendered) |
| `3tfmrzevfe` deadtime | ll jiang | 22 | L2 | L2 | drawn differently (rendered) |
| `ag-1093` AnalogGenie #1093 · AC-coupled folded-sw | AnalogGenie (redrawn) | 19 | L2 | L2 | labels changed/shown/hidden, drawn differently (rendered) |
| `ag-1170` AnalogGenie #1170 · Quadrature LC VCO (t | AnalogGenie (redrawn) | 20 | L2 | L2 | labels changed/shown/hidden |
| `ag-1344` AnalogGenie #1344 · Power converters | AnalogGenie (redrawn) | 28 | L2 | L2 | drafting objects changed, drawn differently (rendered) |
| `cadjtmm5z9` Comparator with two input pairs | Magic Li | 16 | L2 | L2 | labels changed/shown/hidden, drawn differently (rendered) |
| `dgr5ep645b` Bootstrap Switch | Zhishuai Zhang | 12 | L2 | L2 | extra or missing pins/glyphs |
| `e2gfbh8ef6` Feedforward Compensation Two Stage OTA | Zengchun Chen | 16 | L2 | L2 | drafting objects changed |
| `ed3pxrrc8z` Differential dynamic zero-crossing detec | Magic Li | 13 | L2 | L2 | drawn differently (rendered) |
| `f8j5xr43ha` AnalogGenie #1285 · Power converters | Yao Lai | 37 | L2 | L2 | drafting objects changed, drawn differently (rendered) |
| `i2n-835` Image2Net #835 · Coupled state-variable  | Image2Net (redrawn) | 37 | L3 | L1 | — |
| `m8mpcxy2gz` bandgap voltage reference | Magic Li | 66 | L2 | L2 | wires lost or added, drawn differently (rendered) |
| `p4v8mz39ms` CMOS feedback shunt regulator | GPT-6.1 Sol | 11 | L2 | L2 | labels changed/shown/hidden |
| `sm663cbs8b` Ring Amplifier | Wang hr | 51 | L2 | L2 | drawn differently (rendered) |
| `2edb8358-a4a1-45c8-a246-29d593d4e317` StrongArm Comparator | Zhishuai Zhang | 11 | L3 | L3 | — |
| `2rmm2vb45f` Switched_Capacitor_DAC_6bit (SPICE Impor | Zengchun Chen | 14 | L3 | L3 | — |
| `2t2hsbbt9e` Fully differential single-stage amplifie | Magic Li | 46 | L3 | L3 | — |
| `3575r7k3gg` Regulated cross-coupled charge pump | Zhishuai Zhang | 16 | L3 | L3 | — |
| `38m8wdesbh` Complimentary Folded-Cascoded Gm Cell | Lu Jie | 22 | L3 | L3 | — |
| `3g24v4ts6a` Reflection-type phase shifter | Claude Opus 5.5 | 12 | L3 | L3 | — |
| `4dcbscjsw7` Capacitor cross-coupled common-gate LNA | Claude Opus 5.5 | 22 | L3 | L3 | — |
| `4gq2yqaxad` Lanuzza’s LS | Magic Li | 15 | L3 | L3 | — |
| `4jc85dzn26` Floating Dual-Junction Bandgap Reference | Elara | 28 | L3 | L3 | — |
| `529yav6ayc` Wide_Band_LNA | KIBA | 16 | L3 | L3 | — |
| `57xa4r682t` Fully differential Gm-C Butterworth biqu | Zhishuai Zhang | 15 | L3 | L3 | — |
| `58t3fmnnmj` Differential bottom-plate sampler with b | Zhishuai Zhang | 28 | L3 | L3 | — |
| `5evbr4sm3r` Precision Common-Mode Feedback OTA | Elara | 18 | L3 | L3 | — |
| `5xxmmm5qyg` RF T/R switch | Claude Opus 5.5 | 17 | L3 | L3 | — |
| `66fgy9aetr` LDO | Magic Li | 48 | L3 | L3 | — |
| `68ntchd9dt` Rail to Rail OP AMP | Zengchun Chen | 33 | L3 | L3 | — |
| `6ax4qhqj7v` gain-boosted two-stage operational ampli | Magic Li | 41 | L3 | L3 | — |
| `6s67mqbxx9` Double-balanced passive mixer | Zhishuai Zhang | 6 | L3 | L3 | — |
| `76j6gwmhmp` 18-Transistors Single-Phase Clocked FF ( | Magic Li | 18 | L3 | L3 | — |
| `76jjgf2eg5` Rail-to-rail amplifier | Zhishuai Zhang | 24 | L3 | L3 | — |
| `7cc2ta86dn` Channel-Length-Modulation-Compensated CM | Elara | 20 | L3 | L3 | — |
| `7dy7eqd5cb` Differential ringamp schematic | Magic Li | 30 | L3 | L3 | — |
| `7q6a6v9ank` hysteresis comparator | sugar paradox | 23 | L3 | L3 | — |
| `7r4qr4j9pa` 4:1 Series-Parallel | Switched-Capacitor | charonwow | 16 | L3 | L3 | — |
| `85c84m4tjv` Push-pull source follower | Zhishuai Zhang | 6 | L3 | L3 | — |
| `8nm6fak8ez` Continuous-Time Comparator with Preampli | Magic Li | 24 | L3 | L3 | — |
| `8pvqfhsxqr` Circuit diagram of the proposed cascoded | Magic Li | 27 | L3 | L3 | — |
| `924v8n26es` LCVCO | Tzyer | 4 | L3 | L3 | — |
| `95sngv3pqv` nA-range CWT reference | Magic Li | 16 | L3 | L3 | — |
| `9f6t2b8t98` Selective Delay Tuning (SDT) Cell | YILIN XU | 12 | L3 | L3 | — |
| `9z2n9ms4bq` Rail-to-Rail Folded Cascode with Class-A | shawn.wwx9591 | 30 | L3 | L3 | — |
| `a69fbzawkw` LVDS driver with CMFB | Claude Opus 5.5 | 17 | L3 | L3 | — |
| `aa4ebq9n2d` Complementary FVF-based Gm cell | Zhishuai Zhang | 20 | L3 | L3 | — |
| `aa9hgr9vrt` Double-Rate Discharge Time-Amplifier Cor | YILIN XU | 18 | L3 | L3 | — |
| `af6prxthxw` CMBGR | y529259298-ux | 34 | L3 | L3 | — |
| `ag-1008` AnalogGenie #1008 · Class AB differentia | AnalogGenie (redrawn) | 30 | L3 | L3 | — |
| `ag-1070` AnalogGenie #1070 · Latch comparator wit | AnalogGenie (redrawn) | 22 | L3 | L3 | — |
| `ag-1072` AnalogGenie #1072 · Active-rectifier mai | AnalogGenie (redrawn) | 16 | L3 | L3 | — |
| `ag-1086` AnalogGenie #1086 · Narrowband LNA with  | AnalogGenie (redrawn) | 6 | L3 | L3 | — |
| `ag-1098` AnalogGenie #1098 · Double-balanced mixe | AnalogGenie (redrawn) | 15 | L3 | L3 | — |
| `ag-1107` AnalogGenie #1107 · Stacked distributed  | AnalogGenie (redrawn) | 65 | L3 | L3 | — |
| `ag-1108` AnalogGenie #1108 · Differential three-s | AnalogGenie (redrawn) | 26 | L3 | L3 | — |
| `ag-1164` AnalogGenie #1164 · Dual-tank switched L | AnalogGenie (redrawn) | 25 | L3 | L3 | — |
| `ag-3473` AnalogGenie #3473 · Switched-capacitor s | AnalogGenie (redrawn) | 43 | L3 | L3 | — |
| `ag-383` AnalogGenie #383 · Beta-multiplier refer | AnalogGenie (redrawn) | 9 | L3 | L3 | — |
| `ag-515` AnalogGenie #515 · Double-balanced upcon | AnalogGenie (redrawn) | 11 | L3 | L3 | — |
| `ag-568` AnalogGenie #568 · TSPC flip-flop with m | AnalogGenie (redrawn) | 10 | L3 | L3 | — |
| `ag-640` AnalogGenie #640 · CMOS 555 timer | AnalogGenie (redrawn) | 30 | L3 | L3 | — |
| `ag-728` AnalogGenie #728 · Cascoded constant-gm  | AnalogGenie (redrawn) | 7 | L3 | L3 | — |
| `ag-877` AnalogGenie #877 · CMOS class-AB source- | AnalogGenie (redrawn) | 7 | L3 | L3 | — |
| `ag-950` AnalogGenie #950 · Low-TC voltage refere | AnalogGenie (redrawn) | 34 | L3 | L3 | — |
| `amsnet-233` AMS-Net #233 · Gilbert cell variable-gai | AMS-Net (redrawn) | 9 | L3 | L3 | — |
| `ap24mb6xgb` low-voltage BGR with high-order compensa | Magic Li | 32 | L3 | L3 | — |
| `aqxag9n5a2` osc loop | 陳恩宇 | 16 | L3 | L3 | — |
| `ar-5141` AnalogRetriever #5141 · LC ladder low-pa | AnalogRetriever (redrawn) | 8 | L3 | L3 | — |
| `axasvds564` 2-stage Miller Opamp with biasing | Zhishuai Zhang | 27 | L3 | L3 | — |
| `bsjc9sctvh` CMOS 1.2 V to 3.3 V level shifter | GPT-6.1 Sol | 12 | L3 | L3 | — |
| `bvy25zrhzz` CMOS tri-state driver with bus keeper | GPT-6.1 Sol | 13 | L3 | L3 | — |
| `byjc54m3ns` POR | Magic Li | 11 | L3 | L3 | — |
| `c325e583zy` VCCG gate-supply regulator | Claude Opus 5.5 | 11 | L3 | L3 | — |
| `csbw6k9aby` Mixer-first receiver front end | KIBA | 13 | L3 | L3 | — |
| `ct-025` CircuitThink #025 · Differential super s | CircuitThink (redrawn) | 13 | L3 | L3 | — |
| `ct-037` CircuitThink #037 · Three-stage differen | CircuitThink (redrawn) | 15 | L3 | L3 | — |
| `ct-040` CircuitThink #040 · Differential noise-c | CircuitThink (redrawn) | 16 | L3 | L3 | — |
| `ct-076` CircuitThink #076 · CML XOR gate | CircuitThink (redrawn) | 9 | L3 | L3 | — |
| `czmmfvytar` Self-Biased Ring Amplifier | Magic Li | 10 | L3 | L3 | — |
| `d8fvakcbjn` Time-Amplifier Core with Replica Dischar | YILIN XU | 22 | L3 | L3 | — |
| `de47b9g8hy` divide-by-two circuit. | Magic Li | 9 | L3 | L3 | — |
| `dma8n9tykv` Ringamp with replica bias | Mintzh | 81 | L3 | L3 | — |
| `dyggxk29c4` Transformer-coupled class-AB PA | Claude Opus 5.5 | 17 | L3 | L3 | — |
| `eas5ayethn` 3-Stage Bootstrap Charge Pump | Aidar Iglesias | 13 | L3 | L3 | — |
| `ebfk2kbk8k` Regeneration-Tunable Latch Cell for Time | YILIN XU | 11 | L3 | L3 | — |
| `ez4m9ggesf` Dynamic Switch | He Yuan | 11 | L3 | L3 | — |
| `fahyqvetc6` NMOS-pass LDO with symmetric error ampli | Zhishuai Zhang | 4 | L3 | L3 | — |
| `fdfbwrcjk7` adaptive rectifier | Magic Li | 13 | L3 | L3 | — |
| `ffe27gpsj6` 2T voltage reference | Magic Li | 19 | L3 | L3 | — |
| `fkvphe5x7d` Vector-modulator phase shifter | Claude Opus 5.5 | 16 | L3 | L3 | — |
| `fmxzesg47y` LS FVF-based fast transient LDO. | Magic Li | 39 | L3 | L3 | — |
| `fx52v6fzbg` IDAC | zhouzhou | 44 | L3 | L3 | — |
| `g23knh4ppd` The adjustable current amplifier (CA). | Magic Li | 76 | L3 | L3 | — |
| `gb94zdd524` Push-pull source follower with cascode | Zhishuai Zhang | 12 | L3 | L3 | — |
| `gtxz4bazxp` Biasing circuit with the data-driven sch | Magic Li | 30 | L3 | L3 | — |
| `gv7amdyd6h` Simplified core of the bandgap circuit r | Rgeph | 11 | L3 | L3 | — |
| `gvhphqkxcz` Overall circuit of the bandgap generator | Rgeph | 36 | L3 | L3 | — |
| `gwgpte67qy` SF based differential input buffer with  | Magic Li | 23 | L3 | L3 | — |
| `h82f7c5cx8` Banba sub-1 V bandgap reference | Claude Opus 5.5 | 17 | L3 | L3 | — |
| `hxakhrwq8b` Rectifier_CCP | dkhoatrang | 16 | L3 | L3 | — |
| `hxktnffk2d` A Sub-100mV Ultra-Low Voltage Level-Shif | Magic Li | 13 | L3 | L3 | — |
| `i2n-1720` Image2Net #1720 · Class-AB buffer with h | Image2Net (redrawn) | 36 | L3 | L3 | — |
| `i2n-1750` Image2Net #1750 · Self-biased current re | Image2Net (redrawn) | 18 | L3 | L3 | — |
| `i2n-2028` Image2Net #2028 · Switched-capacitor wei | Image2Net (redrawn) | 22 | L3 | L3 | — |
| `i2n-2062` Image2Net #2062 · Fully differential RGC | Image2Net (redrawn) | 36 | L3 | L3 | — |
| `i2n-2097` Image2Net #2097 · Cascode-mirror bandgap | Image2Net (redrawn) | 29 | L3 | L3 | — |
| `i2n-218` Image2Net #218 · Switched-capacitor samp | Image2Net (redrawn) | 28 | L3 | L3 | — |
| `j77dy3tcbr` Negative charge pump | Claude Opus 5.5 | 13 | L3 | L3 | — |
| `jacacvhbk7` Res&Cap Parallel Common Mode Feedback OT | Zengchun Chen | 17 | L3 | L3 | — |
| `jheembvda7` Dual-Loop CMFB Fully Differential OTA | Elara | 17 | L3 | L3 | — |
| `jjb2vms3c6` OCL-LDO regulator | Magic Li | 26 | L3 | L3 | — |
| `jqy8y3rbea` NMOS LDO voltage regulator | Magic Li | 46 | L3 | L3 | — |
| `k5hhxwmvj9` Cascode LNA | Zhishuai Zhang | 18 | L3 | L3 | — |
| `kd5dgfy8rj` Schematic of the active low-pass filter | Magic Li | 17 | L3 | L3 | — |
| `kkw2jjh467` CML flipflop | THDCH | 18 | L3 | L3 | — |
| `kphd35kje3` Simple CMFB loops around each stage. | Rgeph | 13 | L3 | L3 | — |
| `kx43x4aqja` Interpolating delay stage | Rgeph | 14 | L3 | L3 | — |
| `m7n7k5jn7b` novel charge pump. | Magic Li | 67 | L3 | L3 | — |
| `mh8wdf6h3t` Bandgap_with_sourceR | 温雪岱 | 16 | L3 | L3 | — |
| `mjxmkr2taq` Bias circuit | Magic Li | 23 | L3 | L3 | — |
| `mk4srtfmtt` DTSAL | Magic Li | 23 | L3 | L3 | — |
| `mqqfbj7x4j` ringamp | Magic Li | 29 | L3 | L3 | — |
| `mt6pwaxaqm` MOS two-phase Dickson charge pump | GPT-6.1 Sol | 11 | L3 | L3 | — |
| `mtchec4xdp` Ron Hogervorst Driver | Zengchun Chen | 14 | L3 | L3 | — |
| `mx4xm4j2s6` CMOS Schmitt trigger | Magic Li | 6 | L3 | L3 | — |
| `p9em7tfbkw` Improved Input Buffer Architecture | Magic Li | 12 | L3 | L3 | — |
| `peyzxabxgg` Static Single-Phase Contention-Free FF ( | Magic Li | 21 | L3 | L3 | — |
| `pkg8nv2xmm` Dynamic VTC with Auxiliary Bias Branches | YILIN XU | 12 | L3 | L3 | — |
| `pkykvqappt` ERFC OTA | Magic Li | 38 | L3 | L3 | — |
| `ppzgs289t8` Frequency Divider | YILIN XU | 9 | L3 | L3 | — |
| `pw25rtdxvq` ringamp | Magic Li | 20 | L3 | L3 | — |
| `q44rkdkb5b` Hybrid-Tuned Differential Ring VCO Cell | Elara | 21 | L3 | L3 | — |
| `qcrn79g3p6` Complementary Rail-to-Rail Input Stage | Elara | 14 | L3 | L3 | — |
| `qt6vr4d7t6` Topologically-Compressed FF (TCFF) | Magic Li | 19 | L3 | L3 | — |
| `qx9tbdam8e` Passive mixer with TIA | Claude Opus 5.5 | 22 | L3 | L3 | — |
| `r5ec42jrgd` Double-balanced Gilbert-cell mixer | Zhishuai Zhang | 15 | L3 | L3 | — |
| `reeg83efcr` Two stage op-amp with folded cascode | Magic Li | 22 | L3 | L3 | — |
| `rqbcvf64gk` Reference-Based Switched-Capacitor CMFB | Elara | 14 | L3 | L3 | — |
| `sahr77a4gy` 5T-LDO | Zhishuai Zhang | 6 | L3 | L3 | — |
| `se56vpywnx` Modified WCMLS with hybrid buffer | Magic Li | 13 | L3 | L3 | — |
| `sg65pkwcpw` 3-tap current-mode FFE driver | Claude Opus 5.5 | 14 | L3 | L3 | — |
| `ss2hsg8c7j` high-slew-rate op amp | Elara | 15 | L3 | L3 | — |
| `t3mdpddxdp` I/O output driver with slew control | Claude Opus 5.5 | 12 | L3 | L3 | — |
| `tgbjwynedy` Self-Resetting Two-Latch Time Comparator | YILIN XU | 22 | L3 | L3 | — |
| `vdpx2ckq2y` Bootstrapped high-side gate driver | Claude Opus 5.5 | 14 | L3 | L3 | — |
| `w5bejn2fzb` Folded-Cascode Op Amp (PMOS Cascode Load | Zengchun Chen | 11 | L3 | L3 | — |
| `wehnxd32br` Buck power stage with dead-time generato | Claude Opus 5.5 | 25 | L3 | L3 | — |
| `xbgk9x4qcy` Limiting amplifier with offset cancellat | Claude Opus 5.5 | 24 | L3 | L3 | — |
| `xh66m4bprj` Transistor-level schematics of various p | Magic Li | 29 | L3 | L3 | — |
| `xtjmmcpapy` current injector | Magic Li | 33 | L3 | L3 | — |
| `ygxdggdh8z` Single-Stage Analog MMD | Zhishuai Zhang | 8 | L3 | L3 | — |
| `z2dgwbvjfq` Input-Boosted Inverter-Based Amplifier | Zhishuai Zhang | 20 | L3 | L3 | — |
| `z5c5g8q4ev` realization | Rgeph | 22 | L3 | L3 | — |
