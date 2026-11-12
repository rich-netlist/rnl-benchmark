# RNL conformance: Analog Canvas 357eb4815 (cascode-ai/analog-canvas#2278), runtime 0.5.5

101 entries in 52 cases.

| R1 reads | R2 same circuit | R3 same drawing |
|---|---|---|
| 101 | 101 | 99 |

| Case | Entry | Level | First difference |
|---|---|---|---|
| ext-pll | top.scs | R2 | file:top.scs items: -13 +1 instance:$PLL_TOP_SYM@24,20/R0 usage:$IO_PORT_SYMBOL@4,16/R0 → instance:%pll_capture_rt4_r48_recenter109_v14_pdk110_0_SYMBOL@24,20/R0 |
| ext-risca | top.scs | R2 | subckt:v1_decap items: -3 +3 instance:%symbol_0@-16,14/R0 usage:$IO_PORT_SYMBOL@-30,14/R0 → instance:$cfmom_2t_SYMBOL@8,-22/R0 usage:$IO_PORT_SYMBOL@8,-36/R90 |
