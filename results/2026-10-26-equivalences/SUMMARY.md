# Results: 2026-10-26-equivalences (analog-canvas a7eb32743, runtime 0.5.2)

100 circuits, each round-tripped as SPICE+RNL and Spectre+RNL.

| | L1 imports cleanly | L2 same circuit | L3 same drawing |
|---|---|---|---|
| SPICE+RNL | 92 | 68 | 21 |
| Spectre+RNL | 91 | 64 | 21 |

Counts are circuits reaching at least that level.

## Counted as drawing the same

Differences the harness's equivalences count as none (hidden-absent, hidden-extra, text-styles, arrow-ends, style-defaults, unused-anchor, orphan-junction; `RNL_BENCH_STRICT=all` or a list of them turns them off), listed in each report as `equivalentDifferences`:

| Format | Circuits | Differences |
|---|---|---|
| spice | 57 | 208 |
| spectre | 58 | 213 |

## Problems, by circuits affected

| Problem | Tracked in | SPICE+RNL | Spectre+RNL | e.g. |
|---|---|---|---|---|
| export blocked |  | 1 | 5 | secn3fpsvj |
| import reports errors |  | 7 | 4 | 3h96hmvpyv, 3yb6zz6j2y, 58t3fmnnmj |
| electrically different | #1783 | 22 | 22 | 23v5t7erxh, 4vdb4hbfe3, 66yyhzeg2b |
| netlist text changed | #1785 | 9 | 13 | 23v5t7erxh, 4vdb4hbfe3, 6arzwp68jh |
| extra or missing pins/glyphs | #1783 | 14 | 14 | 3dryra4xaq, 6arzwp68jh, a5tz83j7hp |
| instance symbol/placement/parameters changed | #1785 #1786 | 31 | 34 | 23v5t7erxh, 35nyqjtrkh, 3dryra4xaq |
| wires lost or added | #1784 | 5 | 5 | 57xa4r682t, c8y9j9djzt, dhfnzqqagg |
| junctions moved/lost | #1784 | 5 | 5 | 3dryra4xaq, 57xa4r682t, dhfnzqqagg |
| annotations changed | #1785 | 13 | 13 | 6arzwp68jh, a5tz83j7hp, af6prxthxw |
| drafting objects changed | #1787 | 29 | 29 | 23v5t7erxh, 35nyqjtrkh, 3dryra4xaq |
| labels changed/shown/hidden | #1785 #1787 | 43 | 42 | 23v5t7erxh, 3dryra4xaq, 4vdb4hbfe3 |
| Cells lost or renamed |  | 5 | 5 | 23v5t7erxh, 4vdb4hbfe3, 924v8n26es |

## Failures, by message

| Format | Failure | Message | Circuits |
|---|---|---|---|
| spectre | export-blocked | MODEL_SOURCE_DIALECT: Netlist exceeds the 512 KiB conversion limit. | 5: 3h96hmvpyv 3yb6zz6j2y jkazvdj5zv secn3fpsvj zj2kxb229f |
| spice | import-failed | SPICE_IMPORT_UNSUPPORTED_SYMBOL | 4: 3h96hmvpyv 3yb6zz6j2y jkazvdj5zv zj2kxb229f |
| spectre | import-errors | RNL_IMPORT_CHANGES_NETLIST | 3: 58t3fmnnmj cs5yz8ppc5 xdpwyfdj7q |
| spice | import-errors | RNL_IMPORT_CHANGES_NETLIST | 3: 58t3fmnnmj cs5yz8ppc5 xdpwyfdj7q |
| spectre | import-errors | RNL_IMPORT_INVALID_DRAWING | 1: xrbakw3dn5 |
| spice | export-blocked | error RNL_NO_SYMBOL | 1: secn3fpsvj |

## Per circuit

| Circuit | Author | Parts | SPICE | Spectre | Problems (SPICE) |
|---|---|---|---|---|---|
| `3h96hmvpyv` Bipolar Op-Amp Architecture with Local E | boboIC | 25 | L0 | L0 | import reports errors |
| `3yb6zz6j2y` Floating Current Source with a Bipolar E | boboIC | 19 | L0 | L0 | import reports errors |
| `58t3fmnnmj` Differential bottom-plate sampler with b | Zhishuai Zhang | 28 | L0 | L0 | import reports errors |
| `cs5yz8ppc5` Static CMOS divide-by-2 with D flip-flop | Zhishuai Zhang | 8 | L0 | L0 | import reports errors |
| `jkazvdj5zv` Feedback Current Source for Reduced Impa | boboIC | 8 | L0 | L0 | import reports errors |
| `secn3fpsvj` Low-Headroom Class AB Output Stage with  | boboIC | 23 | L0 | L0 | export blocked |
| `xdpwyfdj7q` Differential bootstrap gate driver for t | Zhishuai Zhang | 2 | L0 | L0 | import reports errors |
| `zj2kxb229f` Complementary-Input Amplifier with Class | boboIC | 39 | L0 | L0 | import reports errors |
| `23v5t7erxh` CG CIS | Zhishuai Zhang | 32 | L1 | L1 | electrically different, netlist text changed, instance symbol/placement/parameters changed, drafting objects changed, labels changed/shown/hidden, Cells lost or renamed |
| `4vdb4hbfe3` Gain Stage with series pealing and T-coi | YILIN XU | 6 | L1 | L1 | electrically different, netlist text changed, instance symbol/placement/parameters changed, labels changed/shown/hidden, Cells lost or renamed |
| `66yyhzeg2b` CVR | Magic Li | 59 | L1 | L1 | electrically different, drafting objects changed, labels changed/shown/hidden |
| `6arzwp68jh` 4-bit flash ADC with XOR encoder | Zhishuai Zhang | 135 | L1 | L1 | electrically different, netlist text changed, extra or missing pins/glyphs, annotations changed, labels changed/shown/hidden |
| `8aswrx2vta` Two-phase interleaved switched-capacitor | Zhishuai Zhang | 56 | L1 | L1 | electrically different |
| `af6prxthxw` CMBGR | y529259298-ux | 34 | L1 | L1 | electrically different, extra or missing pins/glyphs, instance symbol/placement/parameters changed, annotations changed, drafting objects changed, labels changed/shown/hidden |
| `c8y9j9djzt` 3-bit flash ADC with NAND encoder | shixuan wang | 41 | L1 | L1 | netlist text changed, extra or missing pins/glyphs, wires lost or added, annotations changed, labels changed/shown/hidden |
| `dyggxk29c4` Transformer-coupled class-AB PA | Claude Opus 5.5 | 17 | L1 | L1 | electrically different, netlist text changed, instance symbol/placement/parameters changed, labels changed/shown/hidden, Cells lost or renamed |
| `dz689bvy2n` 6-bit asynchronous SAR ADC | Zhishuai Zhang | 5 | L1 | L1 | electrically different, netlist text changed, extra or missing pins/glyphs, wires lost or added, junctions moved/lost, annotations changed, drafting objects changed, labels changed/shown/hidden |
| `egf2yfcdth` Differential Switched-Capacitor Gain Sta | Litie Lin | 17 | L1 | L1 | electrically different, extra or missing pins/glyphs, annotations changed, drafting objects changed, labels changed/shown/hidden |
| `g3cdgsa8jp` Three-stage switched-capacitor ring ampl | Zhishuai Zhang | 48 | L1 | L1 | electrically different |
| `ggzkc58xpq` Fully Differential CMOS Amplifier with R | Chen Zengchun | 14 | L1 | L1 | electrically different |
| `gwer4fr5c3` Half-bridge class-D amplifier with dead- | zhuang | 5 | L1 | L1 | netlist text changed, extra or missing pins/glyphs, annotations changed, labels changed/shown/hidden |
| `hm22f22b56` fully differential switched-capacitor in | ziyuanW-coder | 15 | L1 | L1 | electrically different, netlist text changed, extra or missing pins/glyphs, annotations changed, drafting objects changed, labels changed/shown/hidden |
| `jecdz8zk6n` New Circuit | 吳中瑜 | 20 | L1 | L1 | electrically different |
| `mh8wdf6h3t` Bandgap_with_sourceR | 温雪岱 | 16 | L1 | L1 | electrically different, drafting objects changed |
| `nx3bc6w68r` PFD, charge pump and loop filter | Claude Opus 5.5 | 13 | L1 | L1 | electrically different, instance symbol/placement/parameters changed, labels changed/shown/hidden |
| `pbp5aw5waq` 4-bit flash ADC with XOR encoder | Kezhuo Liu | 112 | L1 | L1 | electrically different, netlist text changed, extra or missing pins/glyphs, wires lost or added, junctions moved/lost, annotations changed, labels changed/shown/hidden, Cells lost or renamed |
| `ptf9v5dbak` low-voltage, low-noise operational ampli | Magic Li | 55 | L1 | L1 | electrically different, instance symbol/placement/parameters changed, drafting objects changed, labels changed/shown/hidden |
| `sfwnhg6ckd` Two-stage BJT amplifier | royal0421 | 11 | L1 | L1 | electrically different, drafting objects changed, labels changed/shown/hidden |
| `v2xe2c79gy` Two-phase interleaved switched-capacitor | 2331843037 | 56 | L1 | L1 | electrically different, labels changed/shown/hidden |
| `xmkspetv6a` BPA with feedback pseudo-resistors | Magic Li | 26 | L1 | L1 | electrically different, instance symbol/placement/parameters changed, labels changed/shown/hidden |
| `xrbakw3dn5` Calibratable Strongarm Comparator | zhuang | 16 | L2 | L0 | labels changed/shown/hidden |
| `ycg43babwa` LTC3452 | 林琼宇 | 19 | L1 | L1 | electrically different, drafting objects changed |
| `zkgtc257w2` Overall digitizer frontend with AC coupl | Magic Li | 18 | L1 | L1 | electrically different, instance symbol/placement/parameters changed, labels changed/shown/hidden |
| `c27cw7zxn7` zero current detector circuit diagram | Magic Li | 46 | L2 | L1 | drafting objects changed |
| `dhfnzqqagg` 6-bit SAR ADC | Zengchun Chen | 103 | L2 | L1 | extra or missing pins/glyphs, wires lost or added, junctions moved/lost, annotations changed, labels changed/shown/hidden |
| `qmcsgaepwd` 3-bit Johnson counter | Claude Opus 5.5 | 3 | L2 | L1 | extra or missing pins/glyphs, annotations changed, labels changed/shown/hidden |
| `35nyqjtrkh` Simplified implementation of Gm2. | Magic Li | 42 | L2 | L2 | instance symbol/placement/parameters changed, drafting objects changed |
| `3dryra4xaq` Cross-Coupled Interpolating Delay Cell | Zengchun Chen | 21 | L2 | L2 | extra or missing pins/glyphs, instance symbol/placement/parameters changed, junctions moved/lost, drafting objects changed, labels changed/shown/hidden |
| `3ndjfc3ys7` PMOS input continuous time comparator | 黃子玄 | 13 | L2 | L2 | drafting objects changed |
| `435zm6qgpa` Two stage amplifier with an auxiliary of | Magic Li | 32 | L2 | L2 | instance symbol/placement/parameters changed |
| `55va4g6rjt` capacitor-less LDO | Magic Li | 44 | L2 | L2 | instance symbol/placement/parameters changed, labels changed/shown/hidden |
| `57xa4r682t` Fully differential Gm-C Butterworth biqu | Zhishuai Zhang | 15 | L2 | L2 | wires lost or added, junctions moved/lost, labels changed/shown/hidden |
| `7jb4jzcmah` CMOS asynchronous-reset phase-frequency  | GPT-6.1 Sol | 55 | L2 | L2 | labels changed/shown/hidden |
| `7q6a6v9ank` hysteresis comparator | sugar paradox | 23 | L2 | L2 | instance symbol/placement/parameters changed, drafting objects changed |
| `924v8n26es` LCVCO | Tzyer | 11 | L2 | L2 | Cells lost or renamed |
| `a3mjtfmdhx` pn latch lc vco | hopeful | 12 | L2 | L2 | instance symbol/placement/parameters changed, labels changed/shown/hidden |
| `a5tz83j7hp` Transimpedance Amplifier with PD | 岩孙 | 3 | L2 | L2 | extra or missing pins/glyphs, instance symbol/placement/parameters changed, annotations changed |
| `aw5m493vtr` Figure 16.60 | Rgeph | 2 | L2 | L2 | drafting objects changed |
| `ax88crfm22` precision rectifier | bug-sprout | 3 | L2 | L2 | extra or missing pins/glyphs, instance symbol/placement/parameters changed, annotations changed |
| `b5dqwtrbn3` pixel | zsxin_2011 | 7 | L2 | L2 | instance symbol/placement/parameters changed |
| `bfzpwrhc4s` Fully differential, self-resetting, bias | Magic Li | 78 | L2 | L2 | drafting objects changed, labels changed/shown/hidden |
| `bvy25zrhzz` CMOS tri-state driver with bus keeper | GPT-6.1 Sol | 13 | L2 | L2 | labels changed/shown/hidden |
| `c5vhrjv95h` BJT bias core with trimmed outputs | Claude Opus 5.5 | 51 | L2 | L2 | instance symbol/placement/parameters changed |
| `ckxxp76d57` CMOS two-stage scan register | GPT-6.1 Sol | 46 | L2 | L2 | labels changed/shown/hidden |
| `cmbb75na5q` czy_lowNS_comp | 陈志禹 | 13 | L2 | L2 | labels changed/shown/hidden |
| `crpphvtva6` Two Stage OTA with Flying Cap CMFB (Star | Zengchun Chen | 52 | L2 | L2 | instance symbol/placement/parameters changed, drafting objects changed, labels changed/shown/hidden |
| `cwmesegne8` Two Stage OTA with Flying Cap CMFB | Zengchun Chen | 48 | L2 | L2 | instance symbol/placement/parameters changed, labels changed/shown/hidden |
| `d3tfb8q693` CMOS three-bit Fibonacci LFSR | GPT-6.1 Sol | 57 | L2 | L2 | labels changed/shown/hidden |
| `ez4m9ggesf` Dynamic Switch | He Yuan | 11 | L2 | L2 | labels changed/shown/hidden |
| `f64bvmxv5e` Common Gate LNA | Ethan Zhong | 14 | L2 | L2 | drafting objects changed, labels changed/shown/hidden |
| `fx52v6fzbg` IDAC | zhouzhou | 44 | L2 | L2 | instance symbol/placement/parameters changed, labels changed/shown/hidden |
| `gebpb6er9t` Fig. 5.17 (b) | Nicolas Herrera | 6 | L2 | L2 | instance symbol/placement/parameters changed |
| `gw6naca4r6` RC-coupled BJT voltage amplifier | GPT-6 Astra | 16 | L2 | L2 | labels changed/shown/hidden |
| `hxakhrwq8b` Rectifier_CCP | dkhoatrang | 16 | L2 | L2 | instance symbol/placement/parameters changed |
| `k6bybqnz4b` Two-Stage Opamp | s1ham | 10 | L2 | L2 | instance symbol/placement/parameters changed |
| `kdzrh2z7w4` PMOS Dynamic Comparator | dongyang liu | 12 | L2 | L2 | drafting objects changed |
| `krp97s8npd` CMOS 2-bit flash ADC | GPT-6.1 Sol | 41 | L2 | L2 | labels changed/shown/hidden |
| `m7n7k5jn7b` novel charge pump. | Magic Li | 67 | L2 | L2 | instance symbol/placement/parameters changed, drafting objects changed |
| `nxt979sfnb` RC network | Purusa | 11 | L2 | L2 | drafting objects changed |
| `nznez6ma4p` bandgap | Magic Li | 13 | L2 | L2 | drafting objects changed |
| `p3af2sg23j` Small Signal Model of CS AMP | Zengchun Chen | 8 | L2 | L2 | instance symbol/placement/parameters changed |
| `pngpj38rva` Positive CMFB of Even Cascode Flying Cap | Zengchun Chen | 33 | L2 | L2 | instance symbol/placement/parameters changed, drafting objects changed, labels changed/shown/hidden |
| `qjpfesczpd` Wien-Bridge Osc | s1ham | 13 | L2 | L2 | instance symbol/placement/parameters changed, drafting objects changed |
| `sf6e58mmjb` CTLE | THDCH | 10 | L2 | L2 | instance symbol/placement/parameters changed, drafting objects changed |
| `tc5v5zbja4` Folded Opamp | s1ham | 18 | L2 | L2 | instance symbol/placement/parameters changed |
| `v4dfj332kp` Three-stage switched-capacitor ring ampl | Kezhuo Liu | 43 | L2 | L2 | labels changed/shown/hidden |
| `yb27wfgqkz` Small Signal Model of NMOS CG AMP | Zengchun Chen | 7 | L2 | L2 | instance symbol/placement/parameters changed, drafting objects changed, labels changed/shown/hidden |
| `zbq2cgqygw` D-latch | 陈宗良 | 5 | L2 | L2 | extra or missing pins/glyphs, annotations changed, drafting objects changed, labels changed/shown/hidden |
| `zxja47h4yb` LV oscillation loop | 陳恩宇 | 22 | L2 | L2 | drafting objects changed, labels changed/shown/hidden |
| `2hxyaemr8h` ClassB nmos LC-VCO | Qingyu Zheng | 5 | L3 | L3 | — |
| `3575r7k3gg` Regulated cross-coupled charge pump | Zhishuai Zhang | 16 | L3 | L3 | — |
| `7r4qr4j9pa` 4:1 Series-Parallel | Switched-Capacitor | charonwow | 16 | L3 | L3 | — |
| `atrwhd4c55` Cascode Amp | Zengchun Chen | 2 | L3 | L3 | — |
| `bxf9mf7gd2` First-order bandgap reference with NPN Δ | yuki15532233 | 30 | L3 | L3 | — |
| `csbw6k9aby` Mixer-first receiver front end | KIBA | 13 | L3 | L3 | — |
| `d9a2snyhxz` 3-stage amplifier | Oscar Toomey | 16 | L3 | L3 | — |
| `dzxbj9k5as` 2 stage miller amplifier | curry_yun | 13 | L3 | L3 | — |
| `f3anf69kk6` two-core complementary DCO | David | 10 | L3 | L3 | — |
| `g37crxfgf7` sense amplifier 1 | 18867155892 | 9 | L3 | L3 | — |
| `j9cfz6mfs7` ADSL | Magic Li | 21 | L3 | L3 | — |
| `nkj35a4ndr` Rail-to-rail folded-cascode op amp with  | Zhishuai Zhang | 59 | L3 | L3 | — |
| `q53pvffgpx` Operational amplifier with class AB outp | g1286012685 | 29 | L3 | L3 | — |
| `s7ngrw8566` tri-swich | 羅俊能 | 6 | L3 | L3 | — |
| `stayz7tm4a` Figure 16.6 | Rgeph | 10 | L3 | L3 | — |
| `tqy9f3gztf` LNA with Degeneration | Kerollos Ashraf | 12 | L3 | L3 | — |
| `tzndtf98tg` single side VGA | LiNlIn4968 | 4 | L3 | L3 | — |
| `v73tvd92wz` Double-tail dynamic comparator | Zha Liyuan | 15 | L3 | L3 | — |
| `x7nesskg5g` Four-stage delay-line TDC with TSPC flip | Zhishuai Zhang | 52 | L3 | L3 | — |
| `znhrweves6` NOR | 陳昱蓁 | 4 | L3 | L3 | — |
| `ztv7v8zh2k` 2 stage miller amplifier | Alex He | 19 | L3 | L3 | — |
