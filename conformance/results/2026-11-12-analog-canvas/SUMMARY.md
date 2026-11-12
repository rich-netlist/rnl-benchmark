# RNL conformance: Analog Canvas 6bcce5731 (cascode-ai/analog-canvas#2273), runtime 0.5.5

101 entries in 52 cases.

| R1 reads | R2 same circuit | R3 same drawing |
|---|---|---|
| 99 | 99 | 91 |

| Case | Entry | Level | First difference |
|---|---|---|---|
| 6rsaaj948d | 6rsaaj948d.scs | R2 | subckt:sw_mux items: -8 +8 instance:$NMOS@0,-1/MYR90 instance:$PMOS@0,-5/R90 → instance:$NMOS_4TERM@27,-22/R0 instance:$PMOS_4TERM@45,-22/R0 |
| ag-1103 | ag-1103.scs | R2 | subckt:pa items: -31 +21 instance:$CAPACITOR@-4,-9/R0 instance:$CAPACITOR@18,-9/R0 → instance:$CAPACITOR@26,-22/R0 instance:$CAPACITOR@44,-22/R0 |
| ag-1103 | ag-1103.sp | R2 | subckt:pa items: -35 +21 instance:$CAPACITOR@-4,-9/R0 instance:$CAPACITOR@18,-9/R0 → instance:$CAPACITOR@26,-22/R0 instance:$CAPACITOR@44,-22/R0 |
| ar-4796 | ar-4796.sp | R2 | subckt:dut items: -12 +7 instance:$CANVAS_LED@20,-15/R270 instance:$PNP@20,-10/R0 → instance:$DIODE@26,-8/R0 instance:$DIODE@8,-8/R0 |
| ext-pll | top.scs | R0 | not-written |
| ext-risca | top.scs | R0 | not-written |
| pjx4ww285z | pjx4ww285z.scs | R2 | subckt:geometry_compensated_all_mos_current_reference items: -1 +1 usage:$JUNCTION_SYMBOL@29,-11/R0 → usage:$JUNCTION_SYMBOL@28,-11/R0 |
| pjx4ww285z | pjx4ww285z.sp | R2 | subckt:geometry_compensated_all_mos_current_reference items: -1 +1 usage:$JUNCTION_SYMBOL@29,-11/R0 → usage:$JUNCTION_SYMBOL@28,-11/R0 |
| s4g4r8tpdq | s4g4r8tpdq.scs | R2 | subckt:nd2d1a items: -20 +15 instance:$NMOS@6,-7/R0 instance:$NMOS@6,0/R0 → instance:$NMOS_4TERM@27,-22/R0 instance:$NMOS_4TERM@45,-22/R0 |
| s4g4r8tpdq | s4g4r8tpdq.sp | R2 | subckt:nd2d1a items: -24 +15 instance:$NMOS@6,-7/R0 instance:$NMOS@6,0/R0 → instance:$NMOS_4TERM@27,-22/R0 instance:$NMOS_4TERM@45,-22/R0 |
