# Results: n2-rend-main

100 circuits, each round-tripped as SPICE+RNL and Spectre+RNL.

| | L1 imports cleanly | L2 same circuit | L3 same drawing |
|---|---|---|---|
| SPICE+RNL | 99 | 83 | 60 |
| Spectre+RNL | 95 | 83 | 60 |

Counts are circuits reaching at least that level.

## Counted as drawing the same

Differences the harness's equivalences count as none (hidden-absent, hidden-extra, text-styles, arrow-ends, style-defaults, unused-anchor, orphan-junction, default-ac-phase; `RNL_BENCH_STRICT=all` or a list of them turns them off), listed in each report as `equivalentDifferences`:

| Format | Circuits | Differences |
|---|---|---|
| spice | 63 | 325 |
| spectre | 59 | 207 |

## Normalized before comparing

External definitions the original declared no formal parameters for, compared as declaring the reviewed interface's (harness `withReviewedFormals`; `RNL_BENCH_KEEP_ORIGINAL_FORMALS=1` turns it off):

| Format | Circuits | Circuit: definitions |
|---|---|---|
| spice | 6 | af6prxthxw: sky130_fd_pr__pnp_05v5_W0p68L0p68, sky130_fd_pr__npn_05v5_W1p00L1p00; ggzkc58xpq: sky130_fd_pr__pfet_01v8; mh8wdf6h3t: sky130_fd_pr__pnp_05v5_W0p68L0p68; ptf9v5dbak: sky130_fd_pr__pnp_05v5_W0p68L0p68; sfwnhg6ckd: sky130_fd_pr__npn_05v5_W1p00L1p00; ycg43babwa: sky130_fd_pr__npn_05v5_W1p00L1p00 |
| spectre | 6 | af6prxthxw: sky130_fd_pr__pnp_05v5_W0p68L0p68, sky130_fd_pr__npn_05v5_W1p00L1p00; ggzkc58xpq: sky130_fd_pr__pfet_01v8; mh8wdf6h3t: sky130_fd_pr__pnp_05v5_W0p68L0p68; ptf9v5dbak: sky130_fd_pr__pnp_05v5_W0p68L0p68; sfwnhg6ckd: sky130_fd_pr__npn_05v5_W1p00L1p00; ycg43babwa: sky130_fd_pr__npn_05v5_W1p00L1p00 |

## Problems, by circuits affected

| Problem | Tracked in | SPICE+RNL | Spectre+RNL | e.g. |
|---|---|---|---|---|
| export blocked |  | 1 | 5 | secn3fpsvj |
| electrically different | #1783 | 16 | 12 | 23v5t7erxh, 3h96hmvpyv, 3yb6zz6j2y |
| netlist text changed | #1785 | 7 | 7 | 23v5t7erxh, 4vdb4hbfe3, 6arzwp68jh |
| extra or missing pins/glyphs | #1783 | 10 | 6 | 3dryra4xaq, 3h96hmvpyv, 3yb6zz6j2y |
| reference renamed (M1 -> XM1) | #1785 | 3 | 0 | 3h96hmvpyv, jkazvdj5zv, zj2kxb229f |
| instance symbol/placement/parameters changed | #1785 #1786 | 8 | 4 | 23v5t7erxh, 3dryra4xaq, 3h96hmvpyv |
| wires lost or added | #1784 | 3 | 0 | 3yb6zz6j2y, jkazvdj5zv, zj2kxb229f |
| junctions moved/lost | #1784 | 5 | 1 | 3dryra4xaq, 3h96hmvpyv, 3yb6zz6j2y |
| annotations changed | #1785 | 9 | 6 | 3yb6zz6j2y, 6arzwp68jh, 924v8n26es |
| drafting objects changed | #1787 | 10 | 8 | 23v5t7erxh, 3dryra4xaq, 3yb6zz6j2y |
| labels changed/shown/hidden | #1785 #1787 | 22 | 18 | 23v5t7erxh, 3dryra4xaq, 3h96hmvpyv |
| drawn differently (rendered) |  | 35 | 31 | 23v5t7erxh, 3dryra4xaq, 3h96hmvpyv |
| Cells lost or renamed |  | 1 | 4 | 924v8n26es |

## Failures, by message

| Format | Failure | Message | Circuits |
|---|---|---|---|
| spectre | export-blocked | MODEL_SOURCE_DIALECT: Netlist exceeds the 512 KiB conversion limit. | 5: 3h96hmvpyv 3yb6zz6j2y jkazvdj5zv secn3fpsvj zj2kxb229f |
| spice | export-blocked | error RNL_NO_SYMBOL | 1: secn3fpsvj |

## Per circuit

| Circuit | Author | Parts | SPICE | Spectre | Problems (SPICE) |
|---|---|---|---|---|---|
| `secn3fpsvj` Low-Headroom Class AB Output Stage with  | boboIC | 23 | L0 | L0 | export blocked |
| `3h96hmvpyv` Bipolar Op-Amp Architecture with Local E | boboIC | 25 | L1 | L0 | electrically different, extra or missing pins/glyphs, reference renamed (M1 -> XM1), instance symbol/placement/parameters changed, junctions moved/lost, labels changed/shown/hidden, drawn differently (rendered) |
| `3yb6zz6j2y` Floating Current Source with a Bipolar E | boboIC | 19 | L1 | L0 | electrically different, extra or missing pins/glyphs, instance symbol/placement/parameters changed, wires lost or added, junctions moved/lost, annotations changed, drafting objects changed, labels changed/shown/hidden, drawn differently (rendered) |
| `jkazvdj5zv` Feedback Current Source for Reduced Impa | boboIC | 8 | L1 | L0 | electrically different, extra or missing pins/glyphs, reference renamed (M1 -> XM1), instance symbol/placement/parameters changed, wires lost or added, junctions moved/lost, annotations changed, drafting objects changed, labels changed/shown/hidden, drawn differently (rendered) |
| `zj2kxb229f` Complementary-Input Amplifier with Class | boboIC | 39 | L1 | L0 | electrically different, extra or missing pins/glyphs, reference renamed (M1 -> XM1), instance symbol/placement/parameters changed, wires lost or added, junctions moved/lost, annotations changed, labels changed/shown/hidden, drawn differently (rendered) |
| `23v5t7erxh` CG CIS | Zhishuai Zhang | 32 | L1 | L1 | electrically different, netlist text changed, instance symbol/placement/parameters changed, drafting objects changed, labels changed/shown/hidden, drawn differently (rendered) |
| `4vdb4hbfe3` Gain Stage with series pealing and T-coi | YILIN XU | 6 | L1 | L1 | electrically different, netlist text changed, instance symbol/placement/parameters changed, labels changed/shown/hidden, drawn differently (rendered) |
| `6arzwp68jh` 4-bit flash ADC with XOR encoder | Zhishuai Zhang | 135 | L1 | L1 | electrically different, netlist text changed, extra or missing pins/glyphs, annotations changed, labels changed/shown/hidden, drawn differently (rendered) |
| `dyggxk29c4` Transformer-coupled class-AB PA | Claude Opus 5.5 | 17 | L1 | L1 | electrically different, netlist text changed, instance symbol/placement/parameters changed, labels changed/shown/hidden, drawn differently (rendered) |
| `dz689bvy2n` 6-bit asynchronous SAR ADC | Zhishuai Zhang | 5 | L1 | L1 | electrically different, netlist text changed, extra or missing pins/glyphs, annotations changed, labels changed/shown/hidden, drawn differently (rendered) |
| `egf2yfcdth` Differential Switched-Capacitor Gain Sta | Litie Lin | 17 | L1 | L1 | electrically different |
| `hm22f22b56` fully differential switched-capacitor in | ziyuanW-coder | 15 | L1 | L1 | electrically different, netlist text changed, extra or missing pins/glyphs, annotations changed, drafting objects changed, labels changed/shown/hidden, drawn differently (rendered) |
| `jecdz8zk6n` New Circuit | 吳中瑜 | 20 | L1 | L1 | electrically different, drawn differently (rendered) |
| `nx3bc6w68r` PFD, charge pump and loop filter | Claude Opus 5.5 | 13 | L1 | L1 | electrically different |
| `pbp5aw5waq` 4-bit flash ADC with XOR encoder | Kezhuo Liu | 112 | L1 | L1 | electrically different, netlist text changed, extra or missing pins/glyphs, annotations changed, labels changed/shown/hidden, drawn differently (rendered) |
| `xmkspetv6a` BPA with feedback pseudo-resistors | Magic Li | 26 | L1 | L1 | electrically different, drawn differently (rendered) |
| `zkgtc257w2` Overall digitizer frontend with AC coupl | Magic Li | 18 | L1 | L1 | electrically different |
| `3dryra4xaq` Cross-Coupled Interpolating Delay Cell | Zengchun Chen | 21 | L2 | L2 | extra or missing pins/glyphs, instance symbol/placement/parameters changed, junctions moved/lost, drafting objects changed, labels changed/shown/hidden, drawn differently (rendered) |
| `435zm6qgpa` Two stage amplifier with an auxiliary of | Magic Li | 32 | L2 | L2 | drawn differently (rendered) |
| `7q6a6v9ank` hysteresis comparator | sugar paradox | 23 | L2 | L2 | drafting objects changed, drawn differently (rendered) |
| `924v8n26es` LCVCO | Tzyer | 11 | L2 | L2 | extra or missing pins/glyphs, annotations changed, labels changed/shown/hidden, drawn differently (rendered), Cells lost or renamed |
| `a3mjtfmdhx` pn latch lc vco | hopeful | 12 | L2 | L2 | labels changed/shown/hidden, drawn differently (rendered) |
| `a5tz83j7hp` Transimpedance Amplifier with PD | 岩孙 | 3 | L2 | L2 | drawn differently (rendered) |
| `af6prxthxw` CMBGR | y529259298-ux | 34 | L2 | L2 | annotations changed, drafting objects changed, labels changed/shown/hidden, drawn differently (rendered) |
| `aw5m493vtr` Figure 16.60 | Rgeph | 2 | L2 | L2 | drafting objects changed, drawn differently (rendered) |
| `ax88crfm22` precision rectifier | bug-sprout | 3 | L2 | L2 | drawn differently (rendered) |
| `b5dqwtrbn3` pixel | zsxin_2011 | 7 | L2 | L2 | drawn differently (rendered) |
| `c8y9j9djzt` 3-bit flash ADC with NAND encoder | shixuan wang | 41 | L2 | L2 | drawn differently (rendered) |
| `dhfnzqqagg` 6-bit SAR ADC | Zengchun Chen | 103 | L2 | L2 | labels changed/shown/hidden, drawn differently (rendered) |
| `ez4m9ggesf` Dynamic Switch | He Yuan | 11 | L2 | L2 | labels changed/shown/hidden, drawn differently (rendered) |
| `f64bvmxv5e` Common Gate LNA | Ethan Zhong | 14 | L2 | L2 | drafting objects changed, labels changed/shown/hidden, drawn differently (rendered) |
| `fx52v6fzbg` IDAC | zhouzhou | 44 | L2 | L2 | labels changed/shown/hidden, drawn differently (rendered) |
| `hxakhrwq8b` Rectifier_CCP | dkhoatrang | 16 | L2 | L2 | drawn differently (rendered) |
| `nkj35a4ndr` Rail-to-rail folded-cascode op amp with  | Zhishuai Zhang | 59 | L2 | L2 | drawn differently (rendered) |
| `nxt979sfnb` RC network | Purusa | 11 | L2 | L2 | drawn differently (rendered) |
| `ptf9v5dbak` low-voltage, low-noise operational ampli | Magic Li | 55 | L2 | L2 | drafting objects changed, labels changed/shown/hidden, drawn differently (rendered) |
| `q53pvffgpx` Operational amplifier with class AB outp | g1286012685 | 29 | L2 | L2 | drawn differently (rendered) |
| `v4dfj332kp` Three-stage switched-capacitor ring ampl | Kezhuo Liu | 43 | L2 | L2 | labels changed/shown/hidden |
| `zbq2cgqygw` D-latch | 陈宗良 | 5 | L2 | L2 | drawn differently (rendered) |
| `zxja47h4yb` LV oscillation loop | 陳恩宇 | 22 | L2 | L2 | labels changed/shown/hidden, drawn differently (rendered) |
| `2hxyaemr8h` ClassB nmos LC-VCO | Qingyu Zheng | 5 | L3 | L3 | — |
| `3575r7k3gg` Regulated cross-coupled charge pump | Zhishuai Zhang | 16 | L3 | L3 | — |
| `35nyqjtrkh` Simplified implementation of Gm2. | Magic Li | 42 | L3 | L3 | — |
| `3ndjfc3ys7` PMOS input continuous time comparator | 黃子玄 | 13 | L3 | L3 | — |
| `55va4g6rjt` capacitor-less LDO | Magic Li | 44 | L3 | L3 | — |
| `57xa4r682t` Fully differential Gm-C Butterworth biqu | Zhishuai Zhang | 15 | L3 | L3 | — |
| `58t3fmnnmj` Differential bottom-plate sampler with b | Zhishuai Zhang | 28 | L3 | L3 | — |
| `66yyhzeg2b` CVR | Magic Li | 59 | L3 | L3 | — |
| `7jb4jzcmah` CMOS asynchronous-reset phase-frequency  | GPT-6.1 Sol | 55 | L3 | L3 | — |
| `7r4qr4j9pa` 4:1 Series-Parallel | Switched-Capacitor | charonwow | 16 | L3 | L3 | — |
| `8aswrx2vta` Two-phase interleaved switched-capacitor | Zhishuai Zhang | 56 | L3 | L3 | — |
| `atrwhd4c55` Cascode Amp | Zengchun Chen | 2 | L3 | L3 | — |
| `bfzpwrhc4s` Fully differential, self-resetting, bias | Magic Li | 78 | L3 | L3 | — |
| `bvy25zrhzz` CMOS tri-state driver with bus keeper | GPT-6.1 Sol | 13 | L3 | L3 | — |
| `bxf9mf7gd2` First-order bandgap reference with NPN Δ | yuki15532233 | 30 | L3 | L3 | — |
| `c27cw7zxn7` zero current detector circuit diagram | Magic Li | 46 | L3 | L3 | — |
| `c5vhrjv95h` BJT bias core with trimmed outputs | Claude Opus 5.5 | 51 | L3 | L3 | — |
| `ckxxp76d57` CMOS two-stage scan register | GPT-6.1 Sol | 46 | L3 | L3 | — |
| `cmbb75na5q` czy_lowNS_comp | 陈志禹 | 13 | L3 | L3 | — |
| `crpphvtva6` Two Stage OTA with Flying Cap CMFB (Star | Zengchun Chen | 52 | L3 | L3 | — |
| `cs5yz8ppc5` Static CMOS divide-by-2 with D flip-flop | Zhishuai Zhang | 8 | L3 | L3 | — |
| `csbw6k9aby` Mixer-first receiver front end | KIBA | 13 | L3 | L3 | — |
| `cwmesegne8` Two Stage OTA with Flying Cap CMFB | Zengchun Chen | 48 | L3 | L3 | — |
| `d3tfb8q693` CMOS three-bit Fibonacci LFSR | GPT-6.1 Sol | 57 | L3 | L3 | — |
| `d9a2snyhxz` 3-stage amplifier | Oscar Toomey | 16 | L3 | L3 | — |
| `dzxbj9k5as` 2 stage miller amplifier | curry_yun | 13 | L3 | L3 | — |
| `f3anf69kk6` two-core complementary DCO | David | 10 | L3 | L3 | — |
| `g37crxfgf7` sense amplifier 1 | 18867155892 | 9 | L3 | L3 | — |
| `g3cdgsa8jp` Three-stage switched-capacitor ring ampl | Zhishuai Zhang | 48 | L3 | L3 | — |
| `gebpb6er9t` Fig. 5.17 (b) | Nicolas Herrera | 6 | L3 | L3 | — |
| `ggzkc58xpq` Fully Differential CMOS Amplifier with R | Chen Zengchun | 14 | L3 | L3 | — |
| `gw6naca4r6` RC-coupled BJT voltage amplifier | GPT-6 Astra | 16 | L3 | L3 | — |
| `gwer4fr5c3` Half-bridge class-D amplifier with dead- | zhuang | 5 | L3 | L3 | — |
| `j9cfz6mfs7` ADSL | Magic Li | 21 | L3 | L3 | — |
| `k6bybqnz4b` Two-Stage Opamp | s1ham | 10 | L3 | L3 | — |
| `kdzrh2z7w4` PMOS Dynamic Comparator | dongyang liu | 12 | L3 | L3 | — |
| `krp97s8npd` CMOS 2-bit flash ADC | GPT-6.1 Sol | 41 | L3 | L3 | — |
| `m7n7k5jn7b` novel charge pump. | Magic Li | 67 | L3 | L3 | — |
| `mh8wdf6h3t` Bandgap_with_sourceR | 温雪岱 | 16 | L3 | L3 | — |
| `nznez6ma4p` bandgap | Magic Li | 13 | L3 | L3 | — |
| `p3af2sg23j` Small Signal Model of CS AMP | Zengchun Chen | 8 | L3 | L3 | — |
| `pngpj38rva` Positive CMFB of Even Cascode Flying Cap | Zengchun Chen | 33 | L3 | L3 | — |
| `qjpfesczpd` Wien-Bridge Osc | s1ham | 13 | L3 | L3 | — |
| `qmcsgaepwd` 3-bit Johnson counter | Claude Opus 5.5 | 3 | L3 | L3 | — |
| `s7ngrw8566` tri-swich | 羅俊能 | 6 | L3 | L3 | — |
| `sf6e58mmjb` CTLE | THDCH | 10 | L3 | L3 | — |
| `sfwnhg6ckd` Two-stage BJT amplifier | royal0421 | 11 | L3 | L3 | — |
| `stayz7tm4a` Figure 16.6 | Rgeph | 10 | L3 | L3 | — |
| `tc5v5zbja4` Folded Opamp | s1ham | 18 | L3 | L3 | — |
| `tqy9f3gztf` LNA with Degeneration | Kerollos Ashraf | 12 | L3 | L3 | — |
| `tzndtf98tg` single side VGA | LiNlIn4968 | 4 | L3 | L3 | — |
| `v2xe2c79gy` Two-phase interleaved switched-capacitor | 2331843037 | 56 | L3 | L3 | — |
| `v73tvd92wz` Double-tail dynamic comparator | Zha Liyuan | 15 | L3 | L3 | — |
| `x7nesskg5g` Four-stage delay-line TDC with TSPC flip | Zhishuai Zhang | 52 | L3 | L3 | — |
| `xdpwyfdj7q` Differential bootstrap gate driver for t | Zhishuai Zhang | 2 | L3 | L3 | — |
| `xrbakw3dn5` Calibratable Strongarm Comparator | zhuang | 16 | L3 | L3 | — |
| `yb27wfgqkz` Small Signal Model of NMOS CG AMP | Zengchun Chen | 7 | L3 | L3 | — |
| `ycg43babwa` LTC3452 | 林琼宇 | 19 | L3 | L3 | — |
| `znhrweves6` NOR | 陳昱蓁 | 4 | L3 | L3 | — |
| `ztv7v8zh2k` 2 stage miller amplifier | Alex He | 19 | L3 | L3 | — |
