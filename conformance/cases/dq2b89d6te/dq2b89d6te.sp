
* @RNL(type="header") {
*   @VERSION("0.3");
*   @USE-PACKAGE(name="rnl-std", version="0.3");
*   @USE-PACKAGE(name="rnl-std-no-labels", version="0.3");
*   @USE-PACKAGE(name="analog-canvas-extensions", version="0.6");
*   @USE-PACKAGE(name="rnl-std-logic", version="0.3")
* }
* Ideal inverter: switches at V(VDD,VSS)/2; vt sets the step width, td the delay
.subckt inverter A Y VDD VSS params: vt=10m td=10p
BhA hA 0 V={0.5*(1+tanh((V(A,VSS)-0.5*V(VDD,VSS))/vt))}
Bf nfn VSS V={V(VDD,VSS)*(1-V(hA))}
Rd nfn ndl 1k
Cd ndl VSS {td/1000}
BY Y VSS V={V(ndl,VSS)}
.ends inverter

.subckt dut VDD VSS RST RST1 RST2 D CLKa CLKn CLK Q
XM1 net27 RST VDD VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM10 net24 D net0 VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM11 net0 RST1 VSS VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM12 net8 D VDD VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM13 net8 D net1 VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM14 net1 RST2 VSS VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM15 net24 CLKa net12 VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM16 net24 CLKn net12 VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM17 net12 RST1 VDD VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM18 net10 net12 VDD VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM19 net13 RST2 VDD VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM2 net22 net29 net27 VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM20 net6 net13 VDD VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM21 net8 CLKa net13 VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM22 net8 CLKn net13 VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM23 net10 net13 VSS VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM24 net6 net12 VSS VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM25 net30 net10 VDD VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM26 net12 CLKn net30 VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM27 net12 CLKa net2 VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM28 net2 net10 net16 VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM29 net16 RST2 VSS VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM3 net22 net29 net20 VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM30 net31 net6 VDD VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM31 net13 CLKn net31 VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM32 net13 CLKa net3 VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM33 net3 net6 net17 VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM34 net17 RST1 VSS VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM35 net25 net10 VDD VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM36 net25 net6 VSS VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM37 net26 net6 VDD VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM38 net26 net10 VSS VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM39 net25 CLKn net14 VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM4 net20 RST VSS VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM40 net25 CLK net14 VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM41 net26 CLKn net9 VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM42 net26 CLK net9 VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM43 net11 net14 VDD VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM44 net7 net9 VDD VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM45 net11 net9 VSS VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM46 net7 net14 VSS VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM47 net32 net11 VDD VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM48 net14 CLK net32 VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM49 net14 CLKn net4 VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM5 net28 RST VDD VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM50 net4 net11 net18 VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM51 net18 RST2 VSS VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM52 net33 net7 VDD VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM53 net9 CLK net33 VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM54 net9 CLKn net5 VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM55 net5 net7 net19 VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM56 net19 RST1 VSS VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM57 net32 RST1 VDD VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM58 net33 RST1 VDD VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM59 Q net14 VDD VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM6 net23 net29 net28 VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM60 Q net9 VSS VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM7 net23 net29 net21 VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM8 net21 RST VSS VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM9 net24 D VDD VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
X1 RST net15 VDD VSS inverter td=10p vt=10m
X2 net15 net29 VDD VSS inverter td=10p vt=10m
X3 net22 RST1 VDD VSS inverter td=10p vt=10m
X4 net23 RST2 VDD VSS inverter td=10p vt=10m
X5 CLK CLKn VDD VSS inverter td=10p vt=10m
X6 CLKn CLKa VDD VSS inverter td=10p vt=10m
* @RNL(author="analog-canvas") {
*   %dut_SYMBOL = @DEFINE-SYMBOL(box=[-6, -9, 6, 9]) {
*     (0, 9) @PIN(terminal="VDD", label="\textbf{\textit{V}}_{\textbf{DD}}", direction="up");
*     (-6, -2) @PIN(terminal="RST", label="\textbf{\textit{RST}}", direction="left");
*     (-6, 2) @PIN(terminal="RST1", label="\textbf{\textit{RST1}}", direction="left");
*     (-6, -6) @PIN(terminal="RST2", label="\textbf{\textit{RST2}}", direction="left");
*     (-6, -4) @PIN(terminal="D", label="\textbf{\textit{D}}", direction="left");
*     (-6, 4) @PIN(terminal="CLKa", label="\textbf{\textit{CLKa}}", direction="left");
*     (-6, 0) @PIN(terminal="CLKn", label="\textbf{\textit{CLKn}}", direction="left");
*     (6, 0) @PIN(terminal="CLK", label="\textbf{\textit{CLK}}", direction="right");
*     (6, -2) @PIN(terminal="Q", label="\textbf{\textit{Q}}", direction="right");
*     (0, 0) @RECTANGLE(width=10, height=16);
*     @LINE {(0, 9) (0, 8)};
*     @LINE {(-6, -2) (-5, -2)};
*     @LINE {(-6, 2) (-5, 2)};
*     @LINE {(-6, -6) (-5, -6)};
*     @LINE {(-6, -4) (-5, -4)};
*     @LINE {(-6, 4) (-5, 4)};
*     @LINE {(-6, 0) (-5, 0)};
*     @LINE {(6, 0) (5, 0)};
*     @LINE {(6, -2) (5, -2)}
*   };
*   # @SET-SYMBOL %dut_SYMBOL;
*   $CANVAS_TYPESETTING @ATTACH(subscript_italic=false) #(level);
*   #XM1 @SET-SYMBOL $PMOS => @PLACE(47, -15) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M1") #XM1(part);
*   #XM2 @SET-SYMBOL $PMOS => @PLACE(47, -19) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M2") #XM2(part);
*   #XM3 @SET-SYMBOL $NMOS => @PLACE(47, -23) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M3") #XM3(part);
*   #XM4 @SET-SYMBOL $NMOS => @PLACE(47, -27) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M4") #XM4(part);
*   $SUPPLY @ATTACH &VDD(p) => @SET-SYMBOL $SUPPLY_SYMBOL => @PLACE(47, -14) => @ORIENT("R0") => %vdd1;
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(47, -29) => @ORIENT("R0") => %gnd1;
*   #XM5 @SET-SYMBOL $PMOS => @PLACE(47, -38) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M5") #XM5(part);
*   #XM6 @SET-SYMBOL $PMOS => @PLACE(47, -42) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M6") #XM6(part);
*   #XM7 @SET-SYMBOL $NMOS => @PLACE(47, -46) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M7") #XM7(part);
*   #XM8 @SET-SYMBOL $NMOS => @PLACE(47, -50) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M8") #XM8(part);
*   $SUPPLY @ATTACH &VDD(p) => @SET-SYMBOL $SUPPLY_SYMBOL => @PLACE(47, -37) => @ORIENT("R0") => %vdd2;
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(47, -52) => @ORIENT("R0") => %gnd2;
*   #X1 @SET-SYMBOL $INVERTER => @PLACE(30, -44) => @ORIENT("R0");
*   #X2 @SET-SYMBOL $INVERTER => @PLACE(35, -44) => @ORIENT("R0");
*   $IO_PORT @ATTACH &RST(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(24, -34) => @ORIENT("R0") => %port1;
*   #X3 @SET-SYMBOL $INVERTER => @PLACE(52, -21) => @ORIENT("R0");
*   $IO_PORT @ATTACH &RST1(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(54, -21) => @ORIENT("MY") => %port2;
*   #XM9 @SET-SYMBOL $PMOS => @PLACE(66, -14) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M9") #XM9(part);
*   #XM10 @SET-SYMBOL $NMOS => @PLACE(66, -20) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M10") #XM10(part);
*   #XM11 @SET-SYMBOL $NMOS => @PLACE(66, -24) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M11") #XM11(part);
*   $SUPPLY @ATTACH &VDD(p) => @SET-SYMBOL $SUPPLY_SYMBOL => @PLACE(66, -13) => @ORIENT("R0") => %vdd3;
*   $IO_PORT @ATTACH &RST1(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(63, -24) => @ORIENT("R0") => %port3;
*   #XM12 @SET-SYMBOL $PMOS => @PLACE(66, -43) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M12") #XM12(part);
*   #XM13 @SET-SYMBOL $NMOS => @PLACE(66, -49) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M13") #XM13(part);
*   #XM14 @SET-SYMBOL $NMOS => @PLACE(66, -53) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M14") #XM14(part);
*   $SUPPLY @ATTACH &VDD(p) => @SET-SYMBOL $SUPPLY_SYMBOL => @PLACE(66, -42) => @ORIENT("R0") => %vdd4;
*   $IO_PORT @ATTACH &RST2(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(63, -53) => @ORIENT("R0") => %port4;
*   #X4 @SET-SYMBOL $INVERTER => @PLACE(52, -44) => @ORIENT("R0");
*   $IO_PORT @ATTACH &RST2(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(54, -44) => @ORIENT("MY") => %port5;
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(66, -26) => @ORIENT("R0") => %gnd3;
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(66, -55) => @ORIENT("R0") => %gnd4;
*   $IO_PORT @ATTACH &D(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(58, -36) => @ORIENT("R0") => %port6;
*   #XM15 @SET-SYMBOL $PMOS => @PLACE(74, -16) => @ORIENT("R270");
*   $CANVAS_NAME @ATTACH(name="M15") #XM15(part);
*   #XM16 @SET-SYMBOL $NMOS => @PLACE(74, -18) => @ORIENT("R90");
*   $CANVAS_NAME @ATTACH(name="M16") #XM16(part);
*   $IO_PORT @ATTACH &CLKa(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(74, -13) => @ORIENT("MYR90") => %port7;
*   $IO_PORT @ATTACH &CLKn(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(74, -21) => @ORIENT("MXR90") => %port8;
*   #XM17 @SET-SYMBOL $PMOS => @PLACE(83, -15) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M17") #XM17(part);
*   $IO_PORT @ATTACH &RST1(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(80, -15) => @ORIENT("R0") => %port9;
*   $SUPPLY @ATTACH &VDD(p) => @SET-SYMBOL $SUPPLY_SYMBOL => @PLACE(83, -14) => @ORIENT("R0") => %vdd5;
*   #XM18 @SET-SYMBOL $PMOS => @PLACE(93, -14) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M18") #XM18(part);
*   $SUPPLY @ATTACH &VDD(p) => @SET-SYMBOL $SUPPLY_SYMBOL => @PLACE(93, -13) => @ORIENT("R0") => %vdd6;
*   #XM19 @SET-SYMBOL $PMOS => @PLACE(83, -44) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M19") #XM19(part);
*   $IO_PORT @ATTACH &RST2(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(80, -44) => @ORIENT("R0") => %port10;
*   $SUPPLY @ATTACH &VDD(p) => @SET-SYMBOL $SUPPLY_SYMBOL => @PLACE(83, -43) => @ORIENT("R0") => %vdd7;
*   #XM20 @SET-SYMBOL $PMOS => @PLACE(93, -43) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M20") #XM20(part);
*   $SUPPLY @ATTACH &VDD(p) => @SET-SYMBOL $SUPPLY_SYMBOL => @PLACE(93, -42) => @ORIENT("R0") => %vdd8;
*   #XM21 @SET-SYMBOL $PMOS => @PLACE(74, -45) => @ORIENT("R270");
*   $CANVAS_NAME @ATTACH(name="M21") #XM21(part);
*   #XM22 @SET-SYMBOL $NMOS => @PLACE(74, -47) => @ORIENT("R90");
*   $CANVAS_NAME @ATTACH(name="M22") #XM22(part);
*   $IO_PORT @ATTACH &CLKa(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(74, -42) => @ORIENT("MYR90") => %port11;
*   $IO_PORT @ATTACH &CLKn(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(74, -50) => @ORIENT("MXR90") => %port12;
*   #XM23 @SET-SYMBOL $NMOS => @PLACE(93, -20) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M23") #XM23(part);
*   #XM24 @SET-SYMBOL $NMOS => @PLACE(93, -49) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M24") #XM24(part);
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(93, -21) => @ORIENT("R0") => %gnd5;
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(93, -50) => @ORIENT("R0") => %gnd6;
*   #XM25 @SET-SYMBOL $PMOS => @PLACE(100, -9) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M25") #XM25(part);
*   #XM26 @SET-SYMBOL $PMOS => @PLACE(100, -13) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M26") #XM26(part);
*   #XM27 @SET-SYMBOL $NMOS => @PLACE(100, -21) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M27") #XM27(part);
*   #XM28 @SET-SYMBOL $NMOS => @PLACE(100, -25) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M28") #XM28(part);
*   $SUPPLY @ATTACH &VDD(p) => @SET-SYMBOL $SUPPLY_SYMBOL => @PLACE(100, -8) => @ORIENT("R0") => %vdd9;
*   $IO_PORT @ATTACH &CLKn(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(103, -13) => @ORIENT("MY") => %port13;
*   $IO_PORT @ATTACH &CLKa(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(103, -21) => @ORIENT("MY") => %port14;
*   #XM29 @SET-SYMBOL $NMOS => @PLACE(100, -29) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M29") #XM29(part);
*   $IO_PORT @ATTACH &RST2(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(103, -29) => @ORIENT("MY") => %port15;
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(100, -30) => @ORIENT("R0") => %gnd7;
*   #XM30 @SET-SYMBOL $PMOS => @PLACE(100, -40) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M30") #XM30(part);
*   #XM31 @SET-SYMBOL $PMOS => @PLACE(100, -44) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M31") #XM31(part);
*   #XM32 @SET-SYMBOL $NMOS => @PLACE(100, -52) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M32") #XM32(part);
*   #XM33 @SET-SYMBOL $NMOS => @PLACE(100, -56) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M33") #XM33(part);
*   $SUPPLY @ATTACH &VDD(p) => @SET-SYMBOL $SUPPLY_SYMBOL => @PLACE(100, -39) => @ORIENT("R0") => %vdd10;
*   $IO_PORT @ATTACH &CLKn(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(103, -44) => @ORIENT("MY") => %port16;
*   $IO_PORT @ATTACH &CLKa(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(103, -52) => @ORIENT("MY") => %port17;
*   #XM34 @SET-SYMBOL $NMOS => @PLACE(100, -60) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M34") #XM34(part);
*   $IO_PORT @ATTACH &RST1(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(103, -60) => @ORIENT("MY") => %port18;
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(100, -61) => @ORIENT("R0") => %gnd8;
*   #XM35 @SET-SYMBOL $PMOS => @PLACE(117, -13) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M35") #XM35(part);
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(117, -19) => @ORIENT("R0") => %gnd9;
*   #XM37 @SET-SYMBOL $PMOS => @PLACE(117, -44) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M37") #XM37(part);
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(117, -50) => @ORIENT("R0") => %gnd10;
*   $SUPPLY @ATTACH &VDD(p) => @SET-SYMBOL $SUPPLY_SYMBOL => @PLACE(117, -11) => @ORIENT("R0") => %vdd11;
*   $SUPPLY @ATTACH &VDD(p) => @SET-SYMBOL $SUPPLY_SYMBOL => @PLACE(117, -42) => @ORIENT("R0") => %vdd12;
*   #XM39 @SET-SYMBOL $PMOS => @PLACE(128, -14) => @ORIENT("R270");
*   $CANVAS_NAME @ATTACH(name="M39") #XM39(part);
*   #XM40 @SET-SYMBOL $NMOS => @PLACE(128, -16) => @ORIENT("R90");
*   $CANVAS_NAME @ATTACH(name="M40") #XM40(part);
*   $IO_PORT @ATTACH &CLKn(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(128, -11) => @ORIENT("MYR90") => %port19;
*   $IO_PORT @ATTACH &CLK(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(128, -19) => @ORIENT("MXR90") => %port20;
*   #XM41 @SET-SYMBOL $PMOS => @PLACE(127, -45) => @ORIENT("R270");
*   $CANVAS_NAME @ATTACH(name="M41") #XM41(part);
*   #XM42 @SET-SYMBOL $NMOS => @PLACE(127, -47) => @ORIENT("R90");
*   $CANVAS_NAME @ATTACH(name="M42") #XM42(part);
*   $IO_PORT @ATTACH &CLKn(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(127, -42) => @ORIENT("MYR90") => %port21;
*   $IO_PORT @ATTACH &CLK(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(127, -50) => @ORIENT("MXR90") => %port22;
*   #XM43 @SET-SYMBOL $PMOS => @PLACE(143, -12) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M43") #XM43(part);
*   $SUPPLY @ATTACH &VDD(p) => @SET-SYMBOL $SUPPLY_SYMBOL => @PLACE(143, -11) => @ORIENT("R0") => %vdd13;
*   #XM44 @SET-SYMBOL $PMOS => @PLACE(143, -43) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M44") #XM44(part);
*   $SUPPLY @ATTACH &VDD(p) => @SET-SYMBOL $SUPPLY_SYMBOL => @PLACE(143, -42) => @ORIENT("R0") => %vdd14;
*   #XM45 @SET-SYMBOL $NMOS => @PLACE(143, -18) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M45") #XM45(part);
*   #XM46 @SET-SYMBOL $NMOS => @PLACE(143, -49) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M46") #XM46(part);
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(143, -19) => @ORIENT("R0") => %gnd11;
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(143, -50) => @ORIENT("R0") => %gnd12;
*   #XM47 @SET-SYMBOL $PMOS => @PLACE(150, -7) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M47") #XM47(part);
*   #XM48 @SET-SYMBOL $PMOS => @PLACE(150, -11) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M48") #XM48(part);
*   #XM49 @SET-SYMBOL $NMOS => @PLACE(150, -19) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M49") #XM49(part);
*   #XM50 @SET-SYMBOL $NMOS => @PLACE(150, -23) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M50") #XM50(part);
*   $SUPPLY @ATTACH &VDD(p) => @SET-SYMBOL $SUPPLY_SYMBOL => @PLACE(150, -6) => @ORIENT("R0") => %vdd15;
*   $IO_PORT @ATTACH &CLK(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(153, -11) => @ORIENT("MY") => %port23;
*   $IO_PORT @ATTACH &CLKn(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(153, -19) => @ORIENT("MY") => %port24;
*   #XM51 @SET-SYMBOL $NMOS => @PLACE(150, -27) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M51") #XM51(part);
*   $IO_PORT @ATTACH &RST2(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(153, -27) => @ORIENT("MY") => %port25;
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(150, -28) => @ORIENT("R0") => %gnd13;
*   #XM52 @SET-SYMBOL $PMOS => @PLACE(150, -40) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M52") #XM52(part);
*   #XM53 @SET-SYMBOL $PMOS => @PLACE(150, -44) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M53") #XM53(part);
*   #XM54 @SET-SYMBOL $NMOS => @PLACE(150, -52) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M54") #XM54(part);
*   #XM55 @SET-SYMBOL $NMOS => @PLACE(150, -56) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M55") #XM55(part);
*   $SUPPLY @ATTACH &VDD(p) => @SET-SYMBOL $SUPPLY_SYMBOL => @PLACE(150, -39) => @ORIENT("R0") => %vdd16;
*   $IO_PORT @ATTACH &CLK(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(153, -44) => @ORIENT("MY") => %port26;
*   $IO_PORT @ATTACH &CLKn(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(153, -52) => @ORIENT("MY") => %port27;
*   #XM56 @SET-SYMBOL $NMOS => @PLACE(150, -60) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M56") #XM56(part);
*   $IO_PORT @ATTACH &RST1(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(153, -60) => @ORIENT("MY") => %port28;
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(150, -61) => @ORIENT("R0") => %gnd14;
*   #XM57 @SET-SYMBOL $PMOS => @PLACE(165, -7) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M57") #XM57(part);
*   $SUPPLY @ATTACH &VDD(p) => @SET-SYMBOL $SUPPLY_SYMBOL => @PLACE(165, -6) => @ORIENT("R0") => %vdd17;
*   $IO_PORT @ATTACH &RST1(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(168, -7) => @ORIENT("MY") => %port29;
*   #XM58 @SET-SYMBOL $PMOS => @PLACE(164, -40) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M58") #XM58(part);
*   $SUPPLY @ATTACH &VDD(p) => @SET-SYMBOL $SUPPLY_SYMBOL => @PLACE(164, -39) => @ORIENT("R0") => %vdd18;
*   $IO_PORT @ATTACH &RST1(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(167, -40) => @ORIENT("MY") => %port30;
*   #XM59 @SET-SYMBOL $PMOS => @PLACE(178, -23) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M59") #XM59(part);
*   #XM60 @SET-SYMBOL $NMOS => @PLACE(178, -34) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M60") #XM60(part);
*   $SUPPLY @ATTACH &VDD(p) => @SET-SYMBOL $SUPPLY_SYMBOL => @PLACE(178, -22) => @ORIENT("R0") => %vdd19;
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(178, -36) => @ORIENT("R0") => %gnd15;
*   $IO_PORT @ATTACH &Q(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(179, -29) => @ORIENT("MY") => %port31;
*   #XM36 @SET-SYMBOL $NMOS => @PLACE(117, -17) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M36") #XM36(part);
*   #XM38 @SET-SYMBOL $NMOS => @PLACE(117, -48) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M38") #XM38(part);
*   #X5 @SET-SYMBOL $INVERTER => @PLACE(80, -6) => @ORIENT("R0");
*   #X6 @SET-SYMBOL $INVERTER => @PLACE(87, -6) => @ORIENT("R0");
*   $IO_PORT @ATTACH &CLK(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(77, -6) => @ORIENT("R0") => %port32;
*   $IO_PORT @ATTACH &CLKa(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(89, -6) => @ORIENT("MY") => %port33;
*   &VDD @REMOVE-FROM $PORT_FILL_SET;
*   &VSS @REMOVE-FROM $PORT_FILL_SET;
*   %j1 = (41, -23);
*   $JUNCTION @ATTACH %j1;
*   %j2 = (41, -42);
*   $JUNCTION @ATTACH %j2;
*   %j3 = (38, -23);
*   $JUNCTION @ATTACH %j3;
*   %j4 = (41, -44);
*   $JUNCTION @ATTACH %j4;
*   %j5 = (26, -34);
*   $JUNCTION @ATTACH %j5;
*   %j6 = (38, -27);
*   $JUNCTION @ATTACH %j6;
*   %j7 = (38, -38);
*   $JUNCTION @ATTACH %j7;
*   %j8 = (59, -20);
*   $JUNCTION @ATTACH %j8;
*   %j9 = (59, -43);
*   $JUNCTION @ATTACH %j9;
*   %j10 = (59, -36);
*   $JUNCTION @ATTACH %j10;
*   %j11 = (66, -17);
*   $JUNCTION @ATTACH %j11;
*   %j12 = (72, -17);
*   $JUNCTION @ATTACH %j12;
*   %j13 = (76, -17);
*   $JUNCTION @ATTACH %j13;
*   %j14 = (72, -46);
*   $JUNCTION @ATTACH %j14;
*   %j15 = (76, -46);
*   $JUNCTION @ATTACH %j15;
*   %j16 = (66, -46);
*   $JUNCTION @ATTACH %j16;
*   %j17 = (88, -43);
*   $JUNCTION @ATTACH %j17;
*   %j18 = (86, -17);
*   $JUNCTION @ATTACH %j18;
*   %j19 = (86, -17);
*   %j20 = (100, -17);
*   $JUNCTION @ATTACH %j20;
*   %j21 = (109, -18);
*   $JUNCTION @ATTACH %j21;
*   %j22 = (109, -47);
*   $JUNCTION @ATTACH %j22;
*   %j23 = (88, -46);
*   $JUNCTION @ATTACH %j23;
*   %j24 = (109, -25);
*   $JUNCTION @ATTACH %j24;
*   %j25 = (109, -40);
*   $JUNCTION @ATTACH %j25;
*   %j26 = (126, -15);
*   $JUNCTION @ATTACH %j26;
*   %j27 = (130, -15);
*   $JUNCTION @ATTACH %j27;
*   %j28 = (125, -46);
*   $JUNCTION @ATTACH %j28;
*   %j29 = (136, -15);
*   $JUNCTION @ATTACH %j29;
*   %j30 = (136, -15);
*   %j31 = (150, -15);
*   $JUNCTION @ATTACH %j31;
*   %j32 = (159, -16);
*   $JUNCTION @ATTACH %j32;
*   %j33 = (159, -47);
*   $JUNCTION @ATTACH %j33;
*   %j34 = (178, -29);
*   $JUNCTION @ATTACH %j34;
*   %j35 = (113, -40);
*   $JUNCTION @ATTACH %j35;
*   %j36 = (129, -46);
*   $JUNCTION @ATTACH %j36;
*   %j37 = (138, -43);
*   $JUNCTION @ATTACH %j37;
*   %j38 = (138, -46);
*   $JUNCTION @ATTACH %j38;
*   %j39 = (111, -24);
*   %j40 = (111, -25);
*   $JUNCTION @ATTACH %j40;
*   &VDD @WIRE(mode="straight") {#XM1:3 %vdd1:p};
*   &VDD @WIRE(mode="straight") {#XM5:3 %vdd2:p};
*   &net29 @WIRE(mode="straight") {#XM2:2 (41, -19) %j1};
*   &net29 @WIRE(mode="straight") {%j1 #XM3:2};
*   &net29 @WIRE(mode="straight") {%j1 %j2};
*   &net29 @WIRE(mode="straight") {%j2 #XM6:2};
*   &net29 @WIRE(mode="straight") {%j2 %j4};
*   &net29 @WIRE(mode="straight") {%j4 (41, -46) #XM7:2};
*   &net29 @WIRE(mode="straight") {#X2:2 %j4};
*   &RST @WIRE(mode="straight") {%port1:p %j5};
*   &RST @WIRE(mode="straight") {%j5 (26, -44) #X1:1};
*   &RST @WIRE(mode="straight") {%j5 (26, -23) %j3};
*   &RST @WIRE(mode="straight") {%j3 %j6};
*   &RST @WIRE(mode="straight") {%j3 (38, -15) #XM1:2};
*   &RST @WIRE(mode="straight") {%j6 %j7};
*   &RST @WIRE(mode="straight") {%j6 #XM4:2};
*   &RST @WIRE(mode="straight") {%j7 #XM5:2};
*   &RST @WIRE(mode="straight") {%j7 (38, -50) #XM8:2};
*   &net22 @WIRE(mode="straight") {#X3:1 #XM2:1};
*   &net24 @WIRE(mode="straight") {#XM9:1 %j11};
*   &net24 @WIRE(mode="straight") {%j11 #XM10:1};
*   &VDD @WIRE(mode="straight") {#XM9:3 %vdd3:p};
*   &VDD @WIRE(mode="straight") {#XM12:3 %vdd4:p};
*   &net23 @WIRE(mode="straight") {#X4:1 #XM6:1};
*   &D @WIRE(mode="straight") {%j8 %j10};
*   &D @WIRE(mode="straight") {%j10 %j9};
*   &D @WIRE(mode="straight") {%j8 (59, -14) #XM9:2};
*   &D @WIRE(mode="straight") {%j8 #XM10:2};
*   &D @WIRE(mode="straight") {%j9 #XM12:2};
*   &D @WIRE(mode="straight") {%j9 (59, -49) #XM13:2};
*   &D @WIRE(mode="straight") {%port6:p %j10};
*   &net24 @WIRE(mode="straight") {%j11 %j12};
*   &net24 @WIRE(mode="straight") {#XM15:1 %j12};
*   &net24 @WIRE(mode="straight") {%j12 #XM16:1};
*   &VDD @WIRE(mode="straight") {#XM17:3 %vdd5:p};
*   &VDD @WIRE(mode="straight") {#XM18:3 %vdd6:p};
*   &VDD @WIRE(mode="straight") {#XM19:3 %vdd7:p};
*   &VDD @WIRE(mode="straight") {#XM20:3 %vdd8:p};
*   &net8 @WIRE(mode="straight") {#XM12:1 %j16};
*   &net8 @WIRE(mode="straight") {%j16 #XM13:1};
*   &net8 @WIRE(mode="straight") {#XM21:1 %j14};
*   &net8 @WIRE(mode="straight") {%j14 #XM22:1};
*   &net8 @WIRE(mode="straight") {%j14 %j16};
*   &VSS @WIRE(mode="straight") {%gnd5:p #XM23:3};
*   &VSS @WIRE(mode="straight") {%gnd6:p #XM24:3};
*   &VDD @WIRE(mode="straight") {#XM25:3 %vdd9:p};
*   &net12 @WIRE(mode="straight") {#XM26:1 %j20};
*   &net12 @WIRE(mode="straight") {%j20 #XM27:1};
*   &net12 @WIRE(mode="straight") {%j20 %j19};
*   &net12 @WIRE(mode="straight") {#XM15:3 %j13};
*   &net12 @WIRE(mode="straight") {%j13 #XM16:3};
*   &net12 @WIRE(mode="straight") {%j13 #XM17:1};
*   &net12 @WIRE(mode="straight") {#XM17:1 %j18};
*   &net12 @WIRE(mode="straight") {%j18 (86, -49) #XM24:2};
*   &net12 @WIRE(mode="straight") {%j19 (86, -14) #XM18:2};
*   &VSS @WIRE(mode="straight") {%gnd7:p #XM29:3};
*   &VDD @WIRE(mode="straight") {#XM30:3 %vdd10:p};
*   &VSS @WIRE(mode="straight") {%gnd8:p #XM34:3};
*   &net13 @WIRE(mode="straight") {#XM31:1 #XM32:1};
*   &net13 @WIRE(mode="straight") {#XM31:1 %j23};
*   &net13 @WIRE(mode="straight") {#XM21:3 %j15};
*   &net13 @WIRE(mode="straight") {%j15 #XM22:3};
*   &net13 @WIRE(mode="straight") {%j15 #XM19:1};
*   &net13 @WIRE(mode="straight") {#XM19:1 %j23};
*   &net13 @WIRE(mode="straight") {%j17 %j23};
*   &net13 @WIRE(mode="straight") {%j17 (88, -20) #XM23:2};
*   &net13 @WIRE(mode="straight") {%j17 #XM20:2};
*   &net25 @WIRE(mode="straight") {#XM39:1 %j26};
*   &net25 @WIRE(mode="straight") {%j26 #XM40:1};
*   &net14 @WIRE(mode="straight") {#XM39:3 %j27};
*   &net14 @WIRE(mode="straight") {%j27 #XM40:3};
*   &net25 @WIRE(mode="straight") {%j26 #XM35:1};
*   &net26 @WIRE(mode="straight") {#XM41:1 %j28};
*   &net26 @WIRE(mode="straight") {%j28 #XM42:1};
*   &net26 @WIRE(mode="straight") {%j28 #XM37:1};
*   &VDD @WIRE(mode="straight") {#XM43:3 %vdd13:p};
*   &VDD @WIRE(mode="straight") {#XM44:3 %vdd14:p};
*   &VSS @WIRE(mode="straight") {%gnd11:p #XM45:3};
*   &VSS @WIRE(mode="straight") {%gnd12:p #XM46:3};
*   &VDD @WIRE(mode="straight") {#XM47:3 %vdd15:p};
*   &net14 @WIRE(mode="straight") {#XM48:1 %j31};
*   &net14 @WIRE(mode="straight") {%j31 #XM49:1};
*   &net14 @WIRE(mode="straight") {%j31 %j30};
*   &net14 @WIRE(mode="straight") {%j29 (136, -49) #XM46:2};
*   &net14 @WIRE(mode="straight") {%j30 (136, -12) #XM43:2};
*   &VSS @WIRE(mode="straight") {%gnd13:p #XM51:3};
*   &VDD @WIRE(mode="straight") {#XM52:3 %vdd16:p};
*   &VSS @WIRE(mode="straight") {%gnd14:p #XM56:3};
*   &net7 @WIRE(mode="straight") {#XM44:1 #XM46:1};
*   &net7 @WIRE(mode="straight") {#XM46:1 %j33};
*   &net7 @WIRE(mode="straight") {#XM52:2 (159, -40) %j33};
*   &net7 @WIRE(mode="straight") {#XM55:2 (159, -56) %j33};
*   &net11 @WIRE(mode="straight") {#XM43:1 #XM45:1};
*   &net11 @WIRE(mode="straight") {#XM45:1 %j32};
*   &net11 @WIRE(mode="straight") {#XM50:2 (159, -23) %j32};
*   &net11 @WIRE(mode="straight") {#XM47:2 (159, -7) %j32};
*   &net14 @WIRE(mode="straight") {%j29 %j27};
*   &VDD @WIRE(mode="straight") {#XM57:3 %vdd17:p};
*   &net32 @WIRE(mode="straight") {#XM47:1 #XM57:1};
*   &VDD @WIRE(mode="straight") {#XM58:3 %vdd18:p};
*   &net33 @WIRE(mode="straight") {#XM58:1 #XM52:1};
*   &net14 @WIRE(mode="straight") {%j31 (171, -15) (171, -23) #XM59:2};
*   &Q @WIRE(mode="straight") {#XM59:1 %j34};
*   &Q @WIRE(mode="straight") {%j34 #XM60:1};
*   &VDD @WIRE(mode="straight") {#XM59:3 %vdd19:p};
*   &Q @WIRE(mode="straight") {%port31:p %j34};
*   &net9 @WIRE(mode="straight") {#XM41:3 %j36};
*   &net9 @WIRE(mode="straight") {%j36 #XM42:3};
*   &net9 @WIRE(mode="straight") {%j36 %j38};
*   &net9 @WIRE(mode="straight") {%j37 %j38};
*   &net9 @WIRE(mode="straight") {%j37 (138, -18) #XM45:2};
*   &net9 @WIRE(mode="straight") {%j37 #XM44:2};
*   &net9 @WIRE(mode="straight") {%j38 #XM53:1};
*   &net9 @WIRE(mode="straight") {#XM53:1 #XM54:1};
*   &net9 @WIRE(mode="straight") {#XM53:1 (171, -46) (171, -34) #XM60:2};
*   &net6 @WIRE(mode="straight") {#XM30:2 %j25};
*   &net6 @WIRE(mode="straight") {#XM33:2 (109, -56) %j22};
*   &net6 @WIRE(mode="straight") {%j25 %j22};
*   &net6 @WIRE(mode="straight") {%j25 %j35};
*   &net6 @WIRE(mode="straight") {%j22 #XM24:1};
*   &net6 @WIRE(mode="straight") {%j35 (113, -17) #XM36:2};
*   &net6 @WIRE(mode="straight") {%j35 (113, -44) #XM37:2};
*   &net6 @WIRE(mode="straight") {#XM20:1 #XM24:1};
*   &net10 @WIRE(mode="straight") {#XM28:2 %j24};
*   &net10 @WIRE(mode="straight") {#XM25:2 (109, -9) %j21};
*   &net10 @WIRE(mode="straight") {%j21 %j24};
*   &net10 @WIRE(mode="straight") {%j21 #XM23:1};
*   &net10 @WIRE(mode="straight") {%j24 %j40};
*   &net10 @WIRE(mode="straight") {%j39 %j40};
*   &net10 @WIRE(mode="straight") {%j39 (111, -13) #XM35:2};
*   &net10 @WIRE(mode="straight") {%j40 (111, -48) #XM38:2};
*   &net10 @WIRE(mode="straight") {#XM18:1 #XM23:1};
*   &CLKn @WIRE(mode="straight") {#X6:1 #X5:2};
*   &net0 @WIRE(mode="straight") {#XM10:3 #XM11:1};
*   &net1 @WIRE(mode="straight") {#XM13:3 #XM14:1};
*   &net2 @WIRE(mode="straight") {#XM27:3 #XM28:1};
*   &net3 @WIRE(mode="straight") {#XM32:3 #XM33:1};
*   &net4 @WIRE(mode="straight") {#XM49:3 #XM50:1};
*   &net5 @WIRE(mode="straight") {#XM54:3 #XM55:1};
*   $JUNCTION @ATTACH (93, -47)(p) => %dot1;
*   $JUNCTION @ATTACH (143, -47)(p) => %dot2;
*   $JUNCTION @ATTACH (150, -46)(p) => %dot3;
*   $JUNCTION @ATTACH (93, -18)(p) => %dot4;
*   $JUNCTION @ATTACH (143, -16)(p) => %dot5;
*   $JUNCTION @ATTACH (83, -17)(p) => %dot6;
*   &net12 @WIRE(mode="straight") {%j18 %j19};
*   $JUNCTION @ATTACH (83, -46)(p) => %dot7;
*   $JUNCTION @ATTACH (100, -46)(p) => %dot8;
*   &RST2 @WIRE(mode="straight") {#XM19:2 %port10:p};
*   &CLKa @WIRE(mode="straight") {#XM21:2 %port11:p};
*   &CLKn @WIRE(mode="straight") {#XM22:2 %port12:p};
*   &CLKn @WIRE(mode="straight") {#XM26:2 %port13:p};
*   &CLKa @WIRE(mode="straight") {#XM27:2 %port14:p};
*   &RST2 @WIRE(mode="straight") {#XM29:2 %port15:p};
*   &RST1 @WIRE(mode="straight") {%port2:p #X3:2};
*   &CLKn @WIRE(mode="straight") {#XM31:2 %port16:p};
*   &CLKa @WIRE(mode="straight") {#XM32:2 %port17:p};
*   &RST1 @WIRE(mode="straight") {#XM34:2 %port18:p};
*   &net14 @WIRE(mode="straight") {%j29 %j30};
*   &CLKn @WIRE(mode="straight") {#XM39:2 %port19:p};
*   &CLK @WIRE(mode="straight") {#XM40:2 %port20:p};
*   &CLKn @WIRE(mode="straight") {#XM41:2 %port21:p};
*   &CLK @WIRE(mode="straight") {#XM42:2 %port22:p};
*   &RST1 @WIRE(mode="straight") {#XM11:2 %port3:p};
*   &CLK @WIRE(mode="straight") {#XM48:2 %port23:p};
*   &CLKn @WIRE(mode="straight") {#XM49:2 %port24:p};
*   &RST2 @WIRE(mode="straight") {#XM51:2 %port25:p};
*   &CLK @WIRE(mode="straight") {#XM53:2 %port26:p};
*   &CLKn @WIRE(mode="straight") {#XM54:2 %port27:p};
*   &RST1 @WIRE(mode="straight") {#XM56:2 %port28:p};
*   &RST1 @WIRE(mode="straight") {#XM57:2 %port29:p};
*   &RST1 @WIRE(mode="straight") {#XM58:2 %port30:p};
*   &RST2 @WIRE(mode="straight") {%port5:p #X4:2};
*   &RST2 @WIRE(mode="straight") {#XM14:2 %port4:p};
*   &CLKa @WIRE(mode="straight") {#XM15:2 %port7:p};
*   &CLKn @WIRE(mode="straight") {#XM16:2 %port8:p};
*   &RST1 @WIRE(mode="straight") {#XM17:2 %port9:p};
*   &VSS @WIRE(mode="straight") {%gnd1:p #XM4:3};
*   &VSS @WIRE(mode="straight") {%gnd2:p #XM8:3};
*   &VSS @WIRE(mode="straight") {%gnd3:p #XM11:3};
*   &VSS @WIRE(mode="straight") {%gnd10:p #XM38:3};
*   &VSS @WIRE(mode="straight") {%gnd9:p #XM36:3};
*   &VSS @WIRE(mode="straight") {%gnd15:p #XM60:3};
*   &VSS @WIRE(mode="straight") {%gnd4:p #XM14:3};
*   &CLK @WIRE(mode="straight") {%port32:p #X5:1};
*   &CLKa @WIRE(mode="straight") {%port33:p #X6:2};
*   &VDD @WIRE(mode="straight") {#XM35:3 %vdd11:p};
*   &VDD @WIRE(mode="straight") {#XM37:3 %vdd12:p};
*   &net15 @WIRE(mode="straight") {#X1:2 #X2:1};
*   &net16 @WIRE(mode="straight") {#XM28:3 #XM29:1};
*   &net17 @WIRE(mode="straight") {#XM33:3 #XM34:1};
*   &net18 @WIRE(mode="straight") {#XM50:3 #XM51:1};
*   &net19 @WIRE(mode="straight") {#XM55:3 #XM56:1};
*   &net20 @WIRE(mode="straight") {#XM3:3 #XM4:1};
*   &net21 @WIRE(mode="straight") {#XM7:3 #XM8:1};
*   &net22 @WIRE(mode="straight") {#XM2:1 #XM3:1};
*   $JUNCTION @ATTACH (47, -21)(p) => %dot9;
*   &net23 @WIRE(mode="straight") {#XM6:1 #XM7:1};
*   $JUNCTION @ATTACH (47, -44)(p) => %dot10;
*   &net25 @WIRE(mode="straight") {#XM35:1 #XM36:1};
*   $JUNCTION @ATTACH (117, -15)(p) => %dot11;
*   &net26 @WIRE(mode="straight") {#XM37:1 #XM38:1};
*   $JUNCTION @ATTACH (117, -46)(p) => %dot12;
*   &net27 @WIRE(mode="straight") {#XM1:1 #XM2:3};
*   &net28 @WIRE(mode="straight") {#XM5:1 #XM6:3};
*   &net30 @WIRE(mode="straight") {#XM25:1 #XM26:3};
*   &net31 @WIRE(mode="straight") {#XM30:1 #XM31:3};
*   &net32 @WIRE(mode="straight") {#XM47:1 #XM48:3};
*   $JUNCTION @ATTACH (150, -9)(p) => %dot13;
*   &net33 @WIRE(mode="straight") {#XM52:1 #XM53:3};
*   $JUNCTION @ATTACH (150, -42)(p) => %dot14;
*   #XM1 @TEXT("\textbf{\textit{M}}_{\textbf{1}}", key="name", dx=0.4, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM1::name(label);
*   #XM2 @TEXT("\textbf{\textit{M}}_{\textbf{2}}", key="name", dx=0.4, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM2::name(label);
*   #XM3 @TEXT("\textbf{\textit{M}}_{\textbf{3}}", key="name", dx=0.5, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM3::name(label);
*   #XM4 @TEXT("\textbf{\textit{M}}_{\textbf{4}}", key="name", dx=0.5, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM4::name(label);
*   %vdd1 @TEXT("\textbf{\textit{V}}_{\textbf{DD}}", dx=-1.5, dy=3, size=1.5116) => %power1;
*   $CANVAS_LABEL @ATTACH(bind="port") %power1(label);
*   #XM5 @TEXT("\textbf{\textit{M}}_{\textbf{5}}", key="name", dx=0.4, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM5::name(label);
*   #XM6 @TEXT("\textbf{\textit{M}}_{\textbf{6}}", key="name", dx=0.4, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM6::name(label);
*   #XM7 @TEXT("\textbf{\textit{M}}_{\textbf{7}}", key="name", dx=0.5, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM7::name(label);
*   #XM8 @TEXT("\textbf{\textit{M}}_{\textbf{8}}", key="name", dx=0.5, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM8::name(label);
*   %vdd2 @TEXT("\textbf{\textit{V}}_{\textbf{DD}}", dx=-1.5, dy=3, size=1.5116) => %power2;
*   $CANVAS_LABEL @ATTACH(bind="port") %power2(label);
*   #X1 @TEXT("\textbf{\textit{X}}_{\textbf{1}}", key="name", dx=-0.5, dy=-2.9, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #X1::name(label);
*   #X2 @TEXT("\textbf{\textit{X}}_{\textbf{2}}", key="name", dx=-0.5, dy=-2.9, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #X2::name(label);
*   %port1 @TEXT("\textbf{\textit{RST}}", key="name", dx=-2, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port1::name(label);
*   #X3 @TEXT("\textbf{\textit{X}}_{\textbf{3}}", key="name", dx=-0.5, dy=-2.9, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #X3::name(label);
*   %port2 @TEXT("\textbf{\textit{RST1}}", key="name", dx=0, dy=1.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port2::name(label);
*   #XM9 @TEXT("\textbf{\textit{M}}_{\textbf{9}}", key="name", dx=0.4, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM9::name(label);
*   #XM10 @TEXT("\textbf{\textit{M}}_{\textbf{10}}", key="name", dx=0.5, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM10::name(label);
*   #XM11 @TEXT("\textbf{\textit{M}}_{\textbf{11}}", key="name", dx=0.5, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM11::name(label);
*   %vdd3 @TEXT("\textbf{\textit{V}}_{\textbf{DD}}", dx=-1.5, dy=3, size=1.5116) => %power3;
*   $CANVAS_LABEL @ATTACH(bind="port") %power3(label);
*   %port3 @TEXT("\textbf{\textit{RST1}}", key="name", dx=0.5, dy=1, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port3::name(label);
*   #XM12 @TEXT("\textbf{\textit{M}}_{\textbf{12}}", key="name", dx=0.4, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM12::name(label);
*   #XM13 @TEXT("\textbf{\textit{M}}_{\textbf{13}}", key="name", dx=0.5, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM13::name(label);
*   #XM14 @TEXT("\textbf{\textit{M}}_{\textbf{14}}", key="name", dx=0.5, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM14::name(label);
*   %vdd4 @TEXT("\textbf{\textit{V}}_{\textbf{DD}}", dx=-1.5, dy=3, size=1.5116) => %power4;
*   $CANVAS_LABEL @ATTACH(bind="port") %power4(label);
*   %port4 @TEXT("\textbf{\textit{RST2}}", key="name", dx=0.5, dy=1, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port4::name(label);
*   #X4 @TEXT("\textbf{\textit{X}}_{\textbf{4}}", key="name", dx=-0.5, dy=-2.9, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #X4::name(label);
*   %port5 @TEXT("\textbf{\textit{RST2}}", key="name", dx=0.5, dy=-2, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port5::name(label);
*   %port6 @TEXT("\textbf{\textit{D}}", key="name", dx=-2, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port6::name(label);
*   #XM15 @TEXT("\textbf{\textit{M}}_{\textbf{15}}", key="name", dx=-3, dy=1, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM15::name(label);
*   #XM16 @TEXT("\textbf{\textit{M}}_{\textbf{16}}", key="name", dx=-2.5, dy=-2, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM16::name(label);
*   %port7 @TEXT("\textbf{\textit{CLKa}}", key="name", dx=0, dy=1.9, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port7::name(label);
*   %port8 @TEXT("\textbf{\textit{CLKn}}", key="name", dx=0, dy=-2.8, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port8::name(label);
*   #XM17 @TEXT("\textbf{\textit{M}}_{\textbf{17}}", key="name", dx=1.5, dy=-0.5, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM17::name(label);
*   %port9 @TEXT("\textbf{\textit{RST1}}", key="name", dx=0, dy=0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port9::name(label);
*   %vdd5 @TEXT("\textbf{\textit{V}}_{\textbf{DD}}", dx=-1.5, dy=3, size=1.5116) => %power5;
*   $CANVAS_LABEL @ATTACH(bind="port") %power5(label);
*   #XM18 @TEXT("\textbf{\textit{M}}_{\textbf{18}}", key="name", dx=2, dy=0, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM18::name(label);
*   %vdd6 @TEXT("\textbf{\textit{V}}_{\textbf{DD}}", dx=-1.5, dy=3, size=1.5116) => %power6;
*   $CANVAS_LABEL @ATTACH(bind="port") %power6(label);
*   #XM19 @TEXT("\textbf{\textit{M}}_{\textbf{19}}", key="name", dx=1.5, dy=-1, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM19::name(label);
*   %port10 @TEXT("\textbf{\textit{RST2}}", key="name", dx=0, dy=0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port10::name(label);
*   %vdd7 @TEXT("\textbf{\textit{V}}_{\textbf{DD}}", dx=-1.5, dy=3, size=1.5116) => %power7;
*   $CANVAS_LABEL @ATTACH(bind="port") %power7(label);
*   #XM20 @TEXT("\textbf{\textit{M}}_{\textbf{20}}", key="name", dx=2, dy=0, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM20::name(label);
*   %vdd8 @TEXT("\textbf{\textit{V}}_{\textbf{DD}}", dx=-1.5, dy=3, size=1.5116) => %power8;
*   $CANVAS_LABEL @ATTACH(bind="port") %power8(label);
*   #XM21 @TEXT("\textbf{\textit{M}}_{\textbf{21}}", key="name", dx=-3, dy=1, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM21::name(label);
*   #XM22 @TEXT("\textbf{\textit{M}}_{\textbf{22}}", key="name", dx=-2.5, dy=-2, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM22::name(label);
*   %port11 @TEXT("\textbf{\textit{CLKa}}", key="name", dx=0, dy=1.9, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port11::name(label);
*   %port12 @TEXT("\textbf{\textit{CLKn}}", key="name", dx=0, dy=-2.8, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port12::name(label);
*   #XM23 @TEXT("\textbf{\textit{M}}_{\textbf{23}}", key="name", dx=2, dy=0, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM23::name(label);
*   #XM24 @TEXT("\textbf{\textit{M}}_{\textbf{24}}", key="name", dx=2, dy=0, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM24::name(label);
*   #XM25 @TEXT("\textbf{\textit{M}}_{\textbf{25}}", key="name", dx=-2, dy=0, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM25::name(label);
*   #XM26 @TEXT("\textbf{\textit{M}}_{\textbf{26}}", key="name", dx=-1.5, dy=-0.5, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM26::name(label);
*   #XM27 @TEXT("\textbf{\textit{M}}_{\textbf{27}}", key="name", dx=-0.5, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM27::name(label);
*   #XM28 @TEXT("\textbf{\textit{M}}_{\textbf{28}}", key="name", dx=-0.5, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM28::name(label);
*   %vdd9 @TEXT("\textbf{\textit{V}}_{\textbf{DD}}", dx=-1.5, dy=3, size=1.5116) => %power9;
*   $CANVAS_LABEL @ATTACH(bind="port") %power9(label);
*   %port13 @TEXT("\textbf{\textit{CLKn}}", key="name", dx=1.5, dy=-1, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port13::name(label);
*   %port14 @TEXT("\textbf{\textit{CLKa}}", key="name", dx=1.5, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port14::name(label);
*   #XM29 @TEXT("\textbf{\textit{M}}_{\textbf{29}}", key="name", dx=-0.5, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM29::name(label);
*   %port15 @TEXT("\textbf{\textit{RST2}}", key="name", dx=1.5, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port15::name(label);
*   #XM30 @TEXT("\textbf{\textit{M}}_{\textbf{30}}", key="name", dx=-2, dy=0, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM30::name(label);
*   #XM31 @TEXT("\textbf{\textit{M}}_{\textbf{31}}", key="name", dx=-1.5, dy=-0.5, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM31::name(label);
*   #XM32 @TEXT("\textbf{\textit{M}}_{\textbf{32}}", key="name", dx=-0.5, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM32::name(label);
*   #XM33 @TEXT("\textbf{\textit{M}}_{\textbf{33}}", key="name", dx=-0.5, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM33::name(label);
*   %vdd10 @TEXT("\textbf{\textit{V}}_{\textbf{DD}}", dx=-1.5, dy=3, size=1.5116) => %power10;
*   $CANVAS_LABEL @ATTACH(bind="port") %power10(label);
*   %port16 @TEXT("\textbf{\textit{CLKn}}", key="name", dx=1.5, dy=-1, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port16::name(label);
*   %port17 @TEXT("\textbf{\textit{CLKa}}", key="name", dx=1.5, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port17::name(label);
*   #XM34 @TEXT("\textbf{\textit{M}}_{\textbf{34}}", key="name", dx=-0.5, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM34::name(label);
*   %port18 @TEXT("\textbf{\textit{RST1}}", key="name", dx=1.5, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port18::name(label);
*   #XM35 @TEXT("\textbf{\textit{M}}_{\textbf{35}}", key="name", dx=2, dy=0, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM35::name(label);
*   #XM37 @TEXT("\textbf{\textit{M}}_{\textbf{37}}", key="name", dx=2, dy=0, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM37::name(label);
*   %vdd11 @TEXT("\textbf{\textit{V}}_{\textbf{DD}}", dx=-1.5, dy=3, size=1.5116) => %power11;
*   $CANVAS_LABEL @ATTACH(bind="port") %power11(label);
*   %vdd12 @TEXT("\textbf{\textit{V}}_{\textbf{DD}}", dx=-1.5, dy=3, size=1.5116) => %power12;
*   $CANVAS_LABEL @ATTACH(bind="port") %power12(label);
*   #XM39 @TEXT("\textbf{\textit{M}}_{\textbf{39}}", key="name", dx=-3, dy=1, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM39::name(label);
*   #XM40 @TEXT("\textbf{\textit{M}}_{\textbf{40}}", key="name", dx=-2.5, dy=-2, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM40::name(label);
*   %port19 @TEXT("\textbf{\textit{CLKn}}", key="name", dx=0, dy=1.9, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port19::name(label);
*   %port20 @TEXT("\textbf{\textit{CLK}}", key="name", dx=0, dy=-2.8, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port20::name(label);
*   #XM41 @TEXT("\textbf{\textit{M}}_{\textbf{41}}", key="name", dx=-3, dy=1, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM41::name(label);
*   #XM42 @TEXT("\textbf{\textit{M}}_{\textbf{42}}", key="name", dx=-2.5, dy=-2, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM42::name(label);
*   %port21 @TEXT("\textbf{\textit{CLKn}}", key="name", dx=0, dy=1.9, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port21::name(label);
*   %port22 @TEXT("\textbf{\textit{CLK}}", key="name", dx=0, dy=-2.8, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port22::name(label);
*   #XM43 @TEXT("\textbf{\textit{M}}_{\textbf{43}}", key="name", dx=2, dy=0, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM43::name(label);
*   %vdd13 @TEXT("\textbf{\textit{V}}_{\textbf{DD}}", dx=-1.5, dy=3, size=1.5116) => %power13;
*   $CANVAS_LABEL @ATTACH(bind="port") %power13(label);
*   #XM44 @TEXT("\textbf{\textit{M}}_{\textbf{44}}", key="name", dx=1.5, dy=-0.5, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM44::name(label);
*   %vdd14 @TEXT("\textbf{\textit{V}}_{\textbf{DD}}", dx=-1.5, dy=3, size=1.5116) => %power14;
*   $CANVAS_LABEL @ATTACH(bind="port") %power14(label);
*   #XM45 @TEXT("\textbf{\textit{M}}_{\textbf{45}}", key="name", dx=2, dy=0, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM45::name(label);
*   #XM46 @TEXT("\textbf{\textit{M}}_{\textbf{46}}", key="name", dx=2, dy=0, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM46::name(label);
*   #XM47 @TEXT("\textbf{\textit{M}}_{\textbf{47}}", key="name", dx=-2, dy=0, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM47::name(label);
*   #XM48 @TEXT("\textbf{\textit{M}}_{\textbf{48}}", key="name", dx=-1.5, dy=-0.5, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM48::name(label);
*   #XM49 @TEXT("\textbf{\textit{M}}_{\textbf{49}}", key="name", dx=-0.5, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM49::name(label);
*   #XM50 @TEXT("\textbf{\textit{M}}_{\textbf{50}}", key="name", dx=-0.5, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM50::name(label);
*   %vdd15 @TEXT("\textbf{\textit{V}}_{\textbf{DD}}", dx=-1.5, dy=3, size=1.5116) => %power15;
*   $CANVAS_LABEL @ATTACH(bind="port") %power15(label);
*   %port23 @TEXT("\textbf{\textit{CLK}}", key="name", dx=1.5, dy=-1, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port23::name(label);
*   %port24 @TEXT("\textbf{\textit{CLKn}}", key="name", dx=1.5, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port24::name(label);
*   #XM51 @TEXT("\textbf{\textit{M}}_{\textbf{51}}", key="name", dx=-0.5, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM51::name(label);
*   %port25 @TEXT("\textbf{\textit{RST2}}", key="name", dx=1.5, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port25::name(label);
*   #XM52 @TEXT("\textbf{\textit{M}}_{\textbf{52}}", key="name", dx=-2, dy=0, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM52::name(label);
*   #XM53 @TEXT("\textbf{\textit{M}}_{\textbf{53}}", key="name", dx=-2, dy=0, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM53::name(label);
*   #XM54 @TEXT("\textbf{\textit{M}}_{\textbf{54}}", key="name", dx=-0.5, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM54::name(label);
*   #XM55 @TEXT("\textbf{\textit{M}}_{\textbf{55}}", key="name", dx=-0.5, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM55::name(label);
*   %vdd16 @TEXT("\textbf{\textit{V}}_{\textbf{DD}}", dx=-1.5, dy=3, size=1.5116) => %power16;
*   $CANVAS_LABEL @ATTACH(bind="port") %power16(label);
*   %port26 @TEXT("\textbf{\textit{CLK}}", key="name", dx=1.5, dy=-1, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port26::name(label);
*   %port27 @TEXT("\textbf{\textit{CLKn}}", key="name", dx=1.5, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port27::name(label);
*   #XM56 @TEXT("\textbf{\textit{M}}_{\textbf{56}}", key="name", dx=-0.5, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM56::name(label);
*   %port28 @TEXT("\textbf{\textit{RST1}}", key="name", dx=1.5, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port28::name(label);
*   #XM57 @TEXT("\textbf{\textit{M}}_{\textbf{57}}", key="name", dx=-2, dy=0, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM57::name(label);
*   %vdd17 @TEXT("\textbf{\textit{V}}_{\textbf{DD}}", dx=-1.5, dy=3, size=1.5116) => %power17;
*   $CANVAS_LABEL @ATTACH(bind="port") %power17(label);
*   %port29 @TEXT("\textbf{\textit{RST1}}", key="name", dx=2, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port29::name(label);
*   #XM58 @TEXT("\textbf{\textit{M}}_{\textbf{58}}", key="name", dx=-2, dy=0, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM58::name(label);
*   %vdd18 @TEXT("\textbf{\textit{V}}_{\textbf{DD}}", dx=-1.5, dy=3, size=1.5116) => %power18;
*   $CANVAS_LABEL @ATTACH(bind="port") %power18(label);
*   %port30 @TEXT("\textbf{\textit{RST1}}", key="name", dx=-1, dy=1.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port30::name(label);
*   #XM59 @TEXT("\textbf{\textit{M}}_{\textbf{59}}", key="name", dx=1.5, dy=-0.5, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM59::name(label);
*   #XM60 @TEXT("\textbf{\textit{M}}_{\textbf{60}}", key="name", dx=0.5, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM60::name(label);
*   %vdd19 @TEXT("\textbf{\textit{V}}_{\textbf{DD}}", dx=-1.5, dy=3, size=1.5116) => %power19;
*   $CANVAS_LABEL @ATTACH(bind="port") %power19(label);
*   %port31 @TEXT("\textbf{\textit{Q}}", key="name", dx=2, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port31::name(label);
*   #XM36 @TEXT("\textbf{\textit{M}}_{\textbf{36}}", key="name", dx=2, dy=0, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM36::name(label);
*   #XM38 @TEXT("\textbf{\textit{M}}_{\textbf{38}}", key="name", dx=2, dy=0, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM38::name(label);
*   #X5 @TEXT("\textbf{\textit{X}}_{\textbf{5}}", key="name", dx=-0.5, dy=-2.9, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #X5::name(label);
*   #X6 @TEXT("\textbf{\textit{X}}_{\textbf{6}}", key="name", dx=-0.5, dy=-2.9, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #X6::name(label);
*   %port32 @TEXT("\textbf{\textit{CLK}}", key="name", dx=-2, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port32::name(label);
*   %port33 @TEXT("\textbf{\textit{CLKa}}", key="name", dx=2, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port33::name(label);
*   &CLKn @TEXT("\textbf{\textit{CLKn}}", size=1.5116) => @PLACE(80.5, -5) => %label1;
*   $CANVAS_LABEL @ATTACH(bind="net") %label1(label)
* }
.ends dut
