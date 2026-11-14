
* @RNL(type="header") {
*   @VERSION("0.4");
*   @USE-PACKAGE(name="rnl-std-style", version="0.4");
*   @USE-PACKAGE(name="rnl-std-basic", version="0.4");
*   @USE-PACKAGE(name="rnl-std-semiconductors", version="0.4");
*   @USE-PACKAGE(name="rnl-std-no-labels", version="0.4");
*   @USE-PACKAGE(name="analog-canvas-extensions", version="0.7");
*   @USE-PACKAGE(name="rnl-std-logic", version="0.4")
* }
* Ideal inverter: switches at V(VDD,VSS)/2; vt sets the step width, td the delay
.subckt inverter A Y VDD VSS params: vt=10m td=10p
BhA hA 0 V={0.5*(1+tanh((V(A,VSS)-0.5*V(VDD,VSS))/vt))}
Bf nfn VSS V={V(VDD,VSS)*(1-V(hA))}
Rd nfn ndl 1k
Cd ndl VSS {td/1000}
BY Y VSS V={V(ndl,VSS)}
.ends inverter

.subckt dut VDD VSS A B CIN COUT CIN_bar SUM A_bar
XM1 A B XOR VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM10 X A XNOR VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM11 A X XNOR VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM12 VDD B X VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM13 CIN XOR COUT VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM14 CIN XNOR COUT VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM15 CIN_bar XNOR SUM VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM16 CIN_bar XOR SUM VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM17 CIN XNOR SUM VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM18 CIN XOR SUM VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM19 A B XOR VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM2 B A XOR VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM20 B A XOR VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM21 XOR A X VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM22 XOR X A VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM23 X B VSS VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM24 A_bar XOR net0 VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM25 A_bar XNOR net0 VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM26 XNOR B A VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM27 B A XNOR VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM28 X A XNOR VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM29 A X XNOR VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM3 XOR A X VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM30 CIN_bar XOR net0 VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM31 CIN_bar XNOR net0 VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM32 CIN XOR net1 VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM33 CIN XNOR net1 VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM34 CIN_bar XOR net1 VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM35 CIN_bar XOR net1 VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM36 VDD B X VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM37 A B XOR VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM38 B A XOR VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM39 XOR A X VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM4 XOR X A VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM40 XOR X A VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM41 X B VSS VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM42 SUM XOR CIN VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM43 SUM XNOR CIN VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM44 XNOR B A VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM45 B A XNOR VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM46 X A XNOR VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM47 A X XNOR VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM48 COUT XNOR CIN VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM49 COUT XOR CIN VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM5 X B VSS VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM50 net3 XNOR VDD VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM51 SUM CIN net3 VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM52 SUM CIN net4 VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM53 net4 XOR VSS VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM54 VDD B X VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM55 COUT XOR A VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM56 COUT XNOR B VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM6 A CIN COUT VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM7 B XNOR COUT VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM8 XNOR B A VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM9 B A XNOR VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
X1 net0 COUT VDD VSS inverter td=10p vt=10m
X2 net1 SUM VDD VSS inverter td=10p vt=10m
* @RNL(author="analog-canvas") {
*   %dut_SYMBOL = @DEFINE-SYMBOL(box=[-8, -9, 8, 9]) {
*     (-8, 2) @PIN(terminal="A", label="\textbf{\textit{A}}", direction="left");
*     (-8, 0) @PIN(terminal="B", label="\textbf{\textit{B}}", direction="left");
*     (-8, 4) @PIN(terminal="CIN", label="\textbf{\textit{CIN}}", direction="left");
*     (-8, -2) @PIN(terminal="COUT", label="\textbf{\textit{C}}_{\textbf{OUT}}", direction="left");
*     (-8, -4) @PIN(terminal="CIN_bar", label="\overline{\textbf{\textit{CIN}}}", direction="left");
*     (-8, -6) @PIN(terminal="SUM", label="\textbf{\textit{SUM}}", direction="left");
*     (0, 9) @PIN(terminal="VDD", label="\textbf{\textit{V}}_{\textbf{DD}}", direction="up");
*     (8, -1) @PIN(terminal="A_bar", label="\overline{\textbf{\textit{A}}}", direction="right");
*     (0, 0) @RECTANGLE(width=14, height=16);
*     @LINE {(-8, 2) (-7, 2)};
*     @LINE {(-8, 0) (-7, 0)};
*     @LINE {(-8, 4) (-7, 4)};
*     @LINE {(-8, -2) (-7, -2)};
*     @LINE {(-8, -4) (-7, -4)};
*     @LINE {(-8, -6) (-7, -6)};
*     @LINE {(0, 9) (0, 8)};
*     @LINE {(8, -1) (7, -1)}
*   };
*   # @SET-SYMBOL %dut_SYMBOL;
*   $CANVAS_TYPESETTING @ATTACH(subscript_italic=false) #(level);
*   #XM1 @SET-SYMBOL(terminals=[[1, "d"], [2, "g"], [3, "s"]]) $PMOS => @PLACE(24, -10) => @ORIENT("R270");
*   $CANVAS_NAME @ATTACH(name="M1") #XM1(part);
*   #XM2 @SET-SYMBOL(terminals=[[1, "d"], [2, "g"], [3, "s"]]) $PMOS => @PLACE(24, -12) => @ORIENT("MXR90");
*   $CANVAS_NAME @ATTACH(name="M2") #XM2(part);
*   $IO_PORT @ATTACH &A(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(17, -10) => @ORIENT("R0") => %port1;
*   $IO_PORT @ATTACH &B(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(17, -12) => @ORIENT("R0") => %port2;
*   $IO_PORT @ATTACH &B(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(24, -7) => @ORIENT("R270") => %port3;
*   $IO_PORT @ATTACH &A(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(24, -15) => @ORIENT("R90") => %port4;
*   #XM3 @SET-SYMBOL(terminals=[[1, "d"], [2, "g"], [3, "s"]]) $NMOS => @PLACE(32, -14) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M3") #XM3(part);
*   #XM4 @SET-SYMBOL(terminals=[[1, "d"], [2, "g"], [3, "s"]]) $NMOS => @PLACE(35, -14) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M4") #XM4(part);
*   $IO_PORT @ATTACH &A(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(29, -14) => @ORIENT("R0") => %port5;
*   $IO_PORT @ATTACH &A(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(35, -17) => @ORIENT("R90") => %port6;
*   #XM5 @SET-SYMBOL(terminals=[[1, "d"], [2, "g"], [3, "s"]]) $NMOS => @PLACE(32, -22) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M5") #XM5(part);
*   $IO_PORT @ATTACH &B(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(29, -22) => @ORIENT("R0") => %port7;
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(32, -24) => @ORIENT("R0") => %gnd1;
*   #XM6 @SET-SYMBOL(terminals=[[1, "d"], [2, "g"], [3, "s"]]) $PMOS => @PLACE(52, -8) => @ORIENT("R270");
*   $CANVAS_NAME @ATTACH(name="M6") #XM6(part);
*   #XM7 @SET-SYMBOL(terminals=[[1, "d"], [2, "g"], [3, "s"]]) $NMOS => @PLACE(52, -10) => @ORIENT("R90");
*   $CANVAS_NAME @ATTACH(name="M7") #XM7(part);
*   $IO_PORT @ATTACH &A(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(48, -8) => @ORIENT("R0") => %port8;
*   $IO_PORT @ATTACH &B(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(48, -10) => @ORIENT("R0") => %port9;
*   $IO_PORT @ATTACH &CIN(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(52, -5) => @ORIENT("R270") => %port10;
*   $IO_PORT @ATTACH &A(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(17, -33) => @ORIENT("R0") => %port11;
*   $IO_PORT @ATTACH &B(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(17, -35) => @ORIENT("R0") => %port12;
*   $IO_PORT @ATTACH &B(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(24, -30) => @ORIENT("R270") => %port13;
*   $IO_PORT @ATTACH &A(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(24, -38) => @ORIENT("R90") => %port14;
*   $IO_PORT @ATTACH &A(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(29, -37) => @ORIENT("R0") => %port15;
*   $IO_PORT @ATTACH &A(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(35, -40) => @ORIENT("R90") => %port16;
*   $IO_PORT @ATTACH &B(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(29, -45) => @ORIENT("R0") => %port17;
*   #XM8 @SET-SYMBOL(terminals=[[1, "d"], [2, "g"], [3, "s"]]) $NMOS => @PLACE(24, -33) => @ORIENT("R270");
*   $CANVAS_NAME @ATTACH(name="M8") #XM8(part);
*   #XM9 @SET-SYMBOL(terminals=[[1, "d"], [2, "g"], [3, "s"]]) $NMOS => @PLACE(24, -35) => @ORIENT("R90");
*   $CANVAS_NAME @ATTACH(name="M9") #XM9(part);
*   #XM10 @SET-SYMBOL(terminals=[[1, "d"], [2, "g"], [3, "s"]]) $PMOS => @PLACE(32, -37) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M10") #XM10(part);
*   #XM11 @SET-SYMBOL(terminals=[[1, "d"], [2, "g"], [3, "s"]]) $PMOS => @PLACE(35, -37) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M11") #XM11(part);
*   #XM13 @SET-SYMBOL(terminals=[[1, "d"], [2, "g"], [3, "s"]]) $PMOS => @PLACE(52, -19) => @ORIENT("R270");
*   $CANVAS_NAME @ATTACH(name="M13") #XM13(part);
*   #XM14 @SET-SYMBOL(terminals=[[1, "d"], [2, "g"], [3, "s"]]) $NMOS => @PLACE(52, -21) => @ORIENT("R90");
*   $CANVAS_NAME @ATTACH(name="M14") #XM14(part);
*   $IO_PORT @ATTACH &CIN(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(48, -20) => @ORIENT("R0") => %port18;
*   $IO_PORT @ATTACH &COUT(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(59, -14) => @ORIENT("MY") => %port19;
*   #XM15 @SET-SYMBOL(terminals=[[1, "d"], [2, "g"], [3, "s"]]) $PMOS => @PLACE(52, -29) => @ORIENT("R270");
*   $CANVAS_NAME @ATTACH(name="M15") #XM15(part);
*   #XM16 @SET-SYMBOL(terminals=[[1, "d"], [2, "g"], [3, "s"]]) $NMOS => @PLACE(52, -31) => @ORIENT("R90");
*   $CANVAS_NAME @ATTACH(name="M16") #XM16(part);
*   $IO_PORT @ATTACH &CIN_bar(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(48, -30) => @ORIENT("R0") => %port20;
*   #XM17 @SET-SYMBOL(terminals=[[1, "d"], [2, "g"], [3, "s"]]) $PMOS => @PLACE(52, -40) => @ORIENT("R270");
*   $CANVAS_NAME @ATTACH(name="M17") #XM17(part);
*   #XM18 @SET-SYMBOL(terminals=[[1, "d"], [2, "g"], [3, "s"]]) $NMOS => @PLACE(52, -42) => @ORIENT("R90");
*   $CANVAS_NAME @ATTACH(name="M18") #XM18(part);
*   $IO_PORT @ATTACH &CIN(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(48, -41) => @ORIENT("R0") => %port21;
*   $IO_PORT @ATTACH &SUM(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(60, -36) => @ORIENT("MY") => %port22;
*   #XM12 @SET-SYMBOL(terminals=[[1, "d"], [2, "g"], [3, "s"]]) $PMOS => @PLACE(32, -45) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M12") #XM12(part);
*   $SUPPLY @ATTACH &VDD(p) => @SET-SYMBOL $SUPPLY_SYMBOL => @PLACE(32, -47) => @ORIENT("R180") => %vdd1;
*   #XM19 @SET-SYMBOL(terminals=[[1, "d"], [2, "g"], [3, "s"]]) $PMOS => @PLACE(81, -12) => @ORIENT("R270");
*   $CANVAS_NAME @ATTACH(name="M19") #XM19(part);
*   #XM20 @SET-SYMBOL(terminals=[[1, "d"], [2, "g"], [3, "s"]]) $PMOS => @PLACE(81, -14) => @ORIENT("MXR90");
*   $CANVAS_NAME @ATTACH(name="M20") #XM20(part);
*   $IO_PORT @ATTACH &A(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(74, -12) => @ORIENT("R0") => %port23;
*   $IO_PORT @ATTACH &B(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(74, -14) => @ORIENT("R0") => %port24;
*   $IO_PORT @ATTACH &B(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(81, -9) => @ORIENT("R270") => %port25;
*   $IO_PORT @ATTACH &A(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(81, -17) => @ORIENT("R90") => %port26;
*   #XM21 @SET-SYMBOL(terminals=[[1, "d"], [2, "g"], [3, "s"]]) $NMOS => @PLACE(89, -16) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M21") #XM21(part);
*   #XM22 @SET-SYMBOL(terminals=[[1, "d"], [2, "g"], [3, "s"]]) $NMOS => @PLACE(92, -16) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M22") #XM22(part);
*   $IO_PORT @ATTACH &A(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(86, -16) => @ORIENT("R0") => %port27;
*   $IO_PORT @ATTACH &A(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(92, -19) => @ORIENT("R90") => %port28;
*   #XM23 @SET-SYMBOL(terminals=[[1, "d"], [2, "g"], [3, "s"]]) $NMOS => @PLACE(89, -24) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M23") #XM23(part);
*   $IO_PORT @ATTACH &B(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(86, -24) => @ORIENT("R0") => %port29;
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(89, -26) => @ORIENT("R0") => %gnd2;
*   #XM24 @SET-SYMBOL(terminals=[[1, "d"], [2, "g"], [3, "s"]]) $PMOS => @PLACE(109, -10) => @ORIENT("R270");
*   $CANVAS_NAME @ATTACH(name="M24") #XM24(part);
*   #XM25 @SET-SYMBOL(terminals=[[1, "d"], [2, "g"], [3, "s"]]) $NMOS => @PLACE(109, -12) => @ORIENT("R90");
*   $CANVAS_NAME @ATTACH(name="M25") #XM25(part);
*   $IO_PORT @ATTACH &A(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(74, -35) => @ORIENT("R0") => %port30;
*   $IO_PORT @ATTACH &B(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(74, -37) => @ORIENT("R0") => %port31;
*   $IO_PORT @ATTACH &B(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(81, -32) => @ORIENT("R270") => %port32;
*   $IO_PORT @ATTACH &A(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(81, -40) => @ORIENT("R90") => %port33;
*   $IO_PORT @ATTACH &A(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(86, -39) => @ORIENT("R0") => %port34;
*   $IO_PORT @ATTACH &A(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(92, -42) => @ORIENT("R90") => %port35;
*   $IO_PORT @ATTACH &B(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(86, -47) => @ORIENT("R0") => %port36;
*   #XM26 @SET-SYMBOL(terminals=[[1, "d"], [2, "g"], [3, "s"]]) $NMOS => @PLACE(81, -35) => @ORIENT("R270");
*   $CANVAS_NAME @ATTACH(name="M26") #XM26(part);
*   #XM27 @SET-SYMBOL(terminals=[[1, "d"], [2, "g"], [3, "s"]]) $NMOS => @PLACE(81, -37) => @ORIENT("R90");
*   $CANVAS_NAME @ATTACH(name="M27") #XM27(part);
*   #XM28 @SET-SYMBOL(terminals=[[1, "d"], [2, "g"], [3, "s"]]) $PMOS => @PLACE(89, -39) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M28") #XM28(part);
*   #XM29 @SET-SYMBOL(terminals=[[1, "d"], [2, "g"], [3, "s"]]) $PMOS => @PLACE(92, -39) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M29") #XM29(part);
*   #XM30 @SET-SYMBOL(terminals=[[1, "d"], [2, "g"], [3, "s"]]) $PMOS => @PLACE(109, -21) => @ORIENT("R270");
*   $CANVAS_NAME @ATTACH(name="M30") #XM30(part);
*   #XM31 @SET-SYMBOL(terminals=[[1, "d"], [2, "g"], [3, "s"]]) $NMOS => @PLACE(109, -23) => @ORIENT("R90");
*   $CANVAS_NAME @ATTACH(name="M31") #XM31(part);
*   $IO_PORT @ATTACH &CIN_bar(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(105, -22) => @ORIENT("R0") => %port37;
*   $IO_PORT @ATTACH &COUT(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(121, -16) => @ORIENT("MY") => %port38;
*   #XM32 @SET-SYMBOL(terminals=[[1, "d"], [2, "g"], [3, "s"]]) $PMOS => @PLACE(109, -31) => @ORIENT("R270");
*   $CANVAS_NAME @ATTACH(name="M32") #XM32(part);
*   #XM33 @SET-SYMBOL(terminals=[[1, "d"], [2, "g"], [3, "s"]]) $NMOS => @PLACE(109, -33) => @ORIENT("R90");
*   $CANVAS_NAME @ATTACH(name="M33") #XM33(part);
*   $IO_PORT @ATTACH &CIN(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(105, -32) => @ORIENT("R0") => %port39;
*   #XM34 @SET-SYMBOL(terminals=[[1, "d"], [2, "g"], [3, "s"]]) $PMOS => @PLACE(109, -42) => @ORIENT("R270");
*   $CANVAS_NAME @ATTACH(name="M34") #XM34(part);
*   #XM35 @SET-SYMBOL(terminals=[[1, "d"], [2, "g"], [3, "s"]]) $NMOS => @PLACE(109, -44) => @ORIENT("R90");
*   $CANVAS_NAME @ATTACH(name="M35") #XM35(part);
*   $IO_PORT @ATTACH &CIN_bar(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(105, -43) => @ORIENT("R0") => %port40;
*   $IO_PORT @ATTACH &SUM(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(122, -37) => @ORIENT("MY") => %port41;
*   #XM36 @SET-SYMBOL(terminals=[[1, "d"], [2, "g"], [3, "s"]]) $PMOS => @PLACE(89, -47) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M36") #XM36(part);
*   $SUPPLY @ATTACH &VDD(p) => @SET-SYMBOL $SUPPLY_SYMBOL => @PLACE(89, -49) => @ORIENT("R180") => %vdd2;
*   $IO_PORT @ATTACH &A_bar(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(105, -11) => @ORIENT("R0") => %port42;
*   #X1 @SET-SYMBOL(terminals=[[1, "a"], [2, "y"]]) $INVERTER => @PLACE(118, -16) => @ORIENT("R0");
*   #X2 @SET-SYMBOL(terminals=[[1, "a"], [2, "y"]]) $INVERTER => @PLACE(119, -37) => @ORIENT("R0");
*   #XM37 @SET-SYMBOL(terminals=[[1, "d"], [2, "g"], [3, "s"]]) $PMOS => @PLACE(140, -12) => @ORIENT("R270");
*   $CANVAS_NAME @ATTACH(name="M37") #XM37(part);
*   #XM38 @SET-SYMBOL(terminals=[[1, "d"], [2, "g"], [3, "s"]]) $PMOS => @PLACE(140, -14) => @ORIENT("MXR90");
*   $CANVAS_NAME @ATTACH(name="M38") #XM38(part);
*   $IO_PORT @ATTACH &A(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(133, -12) => @ORIENT("R0") => %port43;
*   $IO_PORT @ATTACH &B(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(133, -14) => @ORIENT("R0") => %port44;
*   $IO_PORT @ATTACH &B(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(140, -9) => @ORIENT("R270") => %port45;
*   $IO_PORT @ATTACH &A(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(140, -17) => @ORIENT("R90") => %port46;
*   #XM39 @SET-SYMBOL(terminals=[[1, "d"], [2, "g"], [3, "s"]]) $NMOS => @PLACE(148, -16) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M39") #XM39(part);
*   #XM40 @SET-SYMBOL(terminals=[[1, "d"], [2, "g"], [3, "s"]]) $NMOS => @PLACE(151, -16) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M40") #XM40(part);
*   $IO_PORT @ATTACH &A(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(145, -16) => @ORIENT("R0") => %port47;
*   $IO_PORT @ATTACH &A(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(151, -19) => @ORIENT("R90") => %port48;
*   #XM41 @SET-SYMBOL(terminals=[[1, "d"], [2, "g"], [3, "s"]]) $NMOS => @PLACE(148, -24) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M41") #XM41(part);
*   $IO_PORT @ATTACH &B(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(145, -24) => @ORIENT("R0") => %port49;
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(148, -26) => @ORIENT("R0") => %gnd3;
*   $IO_PORT @ATTACH &A(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(133, -35) => @ORIENT("R0") => %port50;
*   $IO_PORT @ATTACH &B(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(133, -37) => @ORIENT("R0") => %port51;
*   $IO_PORT @ATTACH &B(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(140, -32) => @ORIENT("R270") => %port52;
*   $IO_PORT @ATTACH &A(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(140, -40) => @ORIENT("R90") => %port53;
*   $IO_PORT @ATTACH &A(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(145, -39) => @ORIENT("R0") => %port54;
*   $IO_PORT @ATTACH &A(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(151, -42) => @ORIENT("R90") => %port55;
*   $IO_PORT @ATTACH &B(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(145, -47) => @ORIENT("R0") => %port56;
*   #XM44 @SET-SYMBOL(terminals=[[1, "d"], [2, "g"], [3, "s"]]) $NMOS => @PLACE(140, -35) => @ORIENT("R270");
*   $CANVAS_NAME @ATTACH(name="M44") #XM44(part);
*   #XM45 @SET-SYMBOL(terminals=[[1, "d"], [2, "g"], [3, "s"]]) $NMOS => @PLACE(140, -37) => @ORIENT("R90");
*   $CANVAS_NAME @ATTACH(name="M45") #XM45(part);
*   #XM46 @SET-SYMBOL(terminals=[[1, "d"], [2, "g"], [3, "s"]]) $PMOS => @PLACE(148, -39) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M46") #XM46(part);
*   #XM47 @SET-SYMBOL(terminals=[[1, "d"], [2, "g"], [3, "s"]]) $PMOS => @PLACE(151, -39) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M47") #XM47(part);
*   #XM54 @SET-SYMBOL(terminals=[[1, "d"], [2, "g"], [3, "s"]]) $PMOS => @PLACE(148, -47) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M54") #XM54(part);
*   $SUPPLY @ATTACH &VDD(p) => @SET-SYMBOL $SUPPLY_SYMBOL => @PLACE(148, -49) => @ORIENT("R180") => %vdd3;
*   #XM42 @SET-SYMBOL(terminals=[[1, "d"], [2, "g"], [3, "s"]]) $PMOS => @PLACE(163, -16) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M42") #XM42(part);
*   #XM43 @SET-SYMBOL(terminals=[[1, "d"], [2, "g"], [3, "s"]]) $NMOS => @PLACE(163, -22) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M43") #XM43(part);
*   $IO_PORT @ATTACH &CIN(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(163, -14) => @ORIENT("R270") => %port57;
*   $IO_PORT @ATTACH &CIN(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(163, -24) => @ORIENT("R90") => %port58;
*   #XM48 @SET-SYMBOL(terminals=[[1, "d"], [2, "g"], [3, "s"]]) $PMOS => @PLACE(163, -39) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M48") #XM48(part);
*   #XM49 @SET-SYMBOL(terminals=[[1, "d"], [2, "g"], [3, "s"]]) $NMOS => @PLACE(163, -45) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M49") #XM49(part);
*   $IO_PORT @ATTACH &CIN(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(163, -37) => @ORIENT("R270") => %port59;
*   $IO_PORT @ATTACH &CIN(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(163, -47) => @ORIENT("R90") => %port60;
*   #XM50 @SET-SYMBOL(terminals=[[1, "d"], [2, "g"], [3, "s"]]) $PMOS => @PLACE(171, -11) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M50") #XM50(part);
*   #XM51 @SET-SYMBOL(terminals=[[1, "d"], [2, "g"], [3, "s"]]) $PMOS => @PLACE(171, -16) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M51") #XM51(part);
*   #XM52 @SET-SYMBOL(terminals=[[1, "d"], [2, "g"], [3, "s"]]) $NMOS => @PLACE(171, -22) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M52") #XM52(part);
*   #XM53 @SET-SYMBOL(terminals=[[1, "d"], [2, "g"], [3, "s"]]) $NMOS => @PLACE(171, -28) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M53") #XM53(part);
*   $SUPPLY @ATTACH &VDD(p) => @SET-SYMBOL $SUPPLY_SYMBOL => @PLACE(171, -9) => @ORIENT("R0") => %vdd4;
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(171, -30) => @ORIENT("R0") => %gnd4;
*   #XM55 @SET-SYMBOL(terminals=[[1, "d"], [2, "g"], [3, "s"]]) $PMOS => @PLACE(171, -39) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M55") #XM55(part);
*   #XM56 @SET-SYMBOL(terminals=[[1, "d"], [2, "g"], [3, "s"]]) $NMOS => @PLACE(171, -45) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M56") #XM56(part);
*   $IO_PORT @ATTACH &A(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(171, -37) => @ORIENT("R270") => %port61;
*   $IO_PORT @ATTACH &B(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(171, -47) => @ORIENT("R90") => %port62;
*   $IO_PORT @ATTACH &CIN(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(174, -22) => @ORIENT("R180") => %port63;
*   $IO_PORT @ATTACH &CIN(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(174, -16) => @ORIENT("R180") => %port64;
*   %j1 = (26, -11);
*   %j2 = (35, -11);
*   %j3 = (32, -11);
*   %j4 = (32, -19);
*   %j5 = (22, -33);
*   %j6 = (22, -35);
*   %j7 = (26, -34);
*   %j8 = (32, -34);
*   %j9 = (35, -39);
*   %j10 = (38, -37);
*   %j11 = (41, -15);
*   %j12 = (49, -20);
*   %j13 = (55, -9);
*   %j14 = (55, -20);
*   %j15 = (57, -14);
*   %j16 = (49, -30);
*   %j17 = (52, -25);
*   %j18 = (49, -41);
*   %j19 = (35, -34);
*   %j20 = (44, -25);
*   %j21 = (41, -35);
*   %j22 = (44, -34);
*   %j23 = (55, -30);
*   %j24 = (55, -41);
*   %j25 = (58, -36);
*   %j26 = (32, -42);
*   %j27 = (83, -13);
*   %j28 = (89, -13);
*   %j29 = (89, -21);
*   %j30 = (79, -35);
*   %j31 = (79, -37);
*   %j32 = (83, -36);
*   %j33 = (89, -36);
*   %j34 = (92, -41);
*   %j35 = (95, -39);
*   %j36 = (106, -22);
*   %j37 = (112, -11);
*   %j38 = (112, -22);
*   %j39 = (106, -32);
*   %j40 = (106, -43);
*   %j41 = (112, -32);
*   %j42 = (112, -43);
*   %j43 = (89, -44);
*   %j44 = (106, -11);
*   %j45 = (92, -13);
*   %j46 = (98, -13);
*   %j47 = (98, -17);
*   %j48 = (98, -27);
*   %j49 = (101, -26);
*   %j50 = (98, -38);
*   %j51 = (98, -38);
*   %j52 = (101, -36);
*   %j53 = (92, -36);
*   %j54 = (114, -16);
*   %j55 = (115, -37);
*   %j56 = (142, -13);
*   %j57 = (148, -13);
*   %j58 = (148, -21);
*   %j59 = (138, -35);
*   %j60 = (138, -37);
*   %j61 = (142, -36);
*   %j62 = (148, -36);
*   %j63 = (151, -41);
*   %j64 = (154, -39);
*   %j65 = (148, -44);
*   %j66 = (151, -13);
*   %j67 = (151, -36);
*   %j68 = (163, -19);
*   %j69 = (161, -59);
*   %j70 = (163, -42);
*   %j71 = (160, -36);
*   %j72 = (157, -16);
*   %j73 = (171, -19);
*   %j74 = (160, -34);
*   %j75 = (171, -42);
*   %j76 = (179, -34);
*   %j77 = (157, -33);
*   %j78 = (176, -33);
*   &A @WIRE(mode="straight") {%port1::pin #XM1:1};
*   &B @WIRE(mode="straight") {%port2::pin #XM2:1};
*   &A @WIRE(mode="straight") {%port6::pin #XM4:3};
*   &X @WIRE(mode="straight") {#XM4:2 (39, -14) (39, -19) %j4} => %wire1;
*   &X @WIRE(mode="straight") {%j4 #XM3:3};
*   &X @WIRE(mode="straight") {#XM5:1 %j4};
*   &A @WIRE(mode="straight") {%port8::pin #XM6:1};
*   &B @WIRE(mode="straight") {%port9::pin #XM7:1};
*   &COUT @WIRE(mode="straight") {#XM6:3 (55, -8) %j13};
*   &COUT @WIRE(mode="straight") {%j13 (55, -10) #XM7:3};
*   &A @WIRE(mode="straight") {%port11::pin %j5};
*   &B @WIRE(mode="straight") {%port12::pin %j6};
*   &A @WIRE(mode="straight") {%port16::pin %j9};
*   &COUT @WIRE(mode="straight") {#XM13:3 (55, -19) %j14};
*   &COUT @WIRE(mode="straight") {%j14 (55, -21) #XM14:3};
*   &CIN @WIRE(mode="straight") {%port18::pin %j12};
*   &CIN @WIRE(mode="straight") {%j12 (49, -19) #XM13:1};
*   &CIN @WIRE(mode="straight") {%j12 (49, -21) #XM14:1};
*   &COUT @WIRE(mode="straight") {%j13 (57, -9) %j15};
*   &COUT @WIRE(mode="straight") {%j15 (57, -20) %j14};
*   &COUT @WIRE(mode="straight") {%port19::pin %j15};
*   &CIN_bar @WIRE(mode="straight") {%port20::pin %j16};
*   &CIN_bar @WIRE(mode="straight") {%j16 (49, -29) #XM15:1};
*   &CIN_bar @WIRE(mode="straight") {%j16 (49, -31) #XM16:1};
*   &SUM @WIRE(mode="straight") {#XM15:3 (55, -29) %j23};
*   &SUM @WIRE(mode="straight") {%j23 (55, -31) #XM16:3};
*   &XNOR @WIRE(mode="straight") {#XM7:2 (52, -14) (44, -14) %j20};
*   &XNOR @WIRE(mode="straight") {%j20 %j17};
*   &XNOR @WIRE(mode="straight") {#XM14:2 %j17};
*   &XNOR @WIRE(mode="straight") {%j17 #XM15:2};
*   &CIN @WIRE(mode="straight") {%port21::pin %j18};
*   &CIN @WIRE(mode="straight") {%j18 (49, -40) #XM17:1};
*   &CIN @WIRE(mode="straight") {%j18 (49, -42) #XM18:1};
*   &SUM @WIRE(mode="straight") {#XM17:3 (55, -40) %j24};
*   &SUM @WIRE(mode="straight") {%j24 (55, -42) #XM18:3};
*   &XNOR @WIRE(mode="straight") {#XM8:1 %j7};
*   &XNOR @WIRE(mode="straight") {%j7 #XM9:3};
*   &XNOR @WIRE(mode="straight") {%j7 %j8};
*   &XNOR @WIRE(mode="straight") {%j8 #XM10:3};
*   &XNOR @WIRE(mode="straight") {%j8 %j19};
*   &XNOR @WIRE(mode="straight") {%j19 #XM11:3};
*   &XNOR @WIRE(mode="straight") {%j19 %j22};
*   &XNOR @WIRE(mode="straight") {%j22 %j20};
*   &XOR @WIRE(mode="straight") {#XM1:3 %j1};
*   &XOR @WIRE(mode="straight") {%j1 #XM2:3};
*   &XOR @WIRE(mode="straight") {%j1 %j3};
*   &XOR @WIRE(mode="straight") {%j3 #XM3:1};
*   &XOR @WIRE(mode="straight") {%j3 %j2};
*   &XOR @WIRE(mode="straight") {%j2 #XM4:1};
*   &XOR @WIRE(mode="straight") {%j2 (41, -11) %j11};
*   &XOR @WIRE(mode="straight") {%j11 (52, -15) #XM13:2};
*   &XOR @WIRE(mode="straight") {%j11 %j21};
*   &XOR @WIRE(mode="straight") {%j21 (41, -45) #XM18:2};
*   &XOR @WIRE(mode="straight") {#XM16:2 (52, -35) %j21};
*   &XNOR @WIRE(mode="straight") {#XM17:2 (44, -37) %j22};
*   &SUM @WIRE(mode="straight") {%j23 (58, -30) %j25};
*   &SUM @WIRE(mode="straight") {%j25 (58, -41) %j24};
*   &SUM @WIRE(mode="straight") {%port22::pin %j25};
*   &X @WIRE(mode="straight") {#XM10:1 %j26};
*   &X @WIRE(mode="straight") {%j26 (39, -42) (39, -37) %j10} => %wire2;
*   &X @WIRE(mode="straight") {#XM12:3 %j26};
*   &A @WIRE(mode="straight") {%port23::pin #XM19:1};
*   &B @WIRE(mode="straight") {%port24::pin #XM20:1};
*   &A @WIRE(mode="straight") {%port28::pin #XM22:3};
*   &X @WIRE(mode="straight") {#XM22:2 (96, -16) (96, -21) %j29} => %wire3;
*   &X @WIRE(mode="straight") {%j29 #XM21:3};
*   &X @WIRE(mode="straight") {#XM23:1 %j29};
*   &A @WIRE(mode="straight") {%port30::pin %j30};
*   &B @WIRE(mode="straight") {%port31::pin %j31};
*   &A @WIRE(mode="straight") {%port35::pin %j34};
*   &CIN_bar @WIRE(mode="straight") {%port37::pin %j36};
*   &CIN_bar @WIRE(mode="straight") {%j36 (106, -21) #XM30:1};
*   &CIN_bar @WIRE(mode="straight") {%j36 (106, -23) #XM31:1};
*   &CIN @WIRE(mode="straight") {%port39::pin %j39};
*   &CIN @WIRE(mode="straight") {%j39 (106, -31) #XM32:1};
*   &CIN @WIRE(mode="straight") {%j39 (106, -33) #XM33:1};
*   &CIN_bar @WIRE(mode="straight") {%port40::pin %j40};
*   &CIN_bar @WIRE(mode="straight") {%j40 (106, -42) #XM34:1};
*   &CIN_bar @WIRE(mode="straight") {%j40 (106, -44) #XM35:1};
*   &X @WIRE(mode="straight") {#XM28:1 %j43};
*   &X @WIRE(mode="straight") {%j43 (96, -44) (96, -39) %j35} => %wire4;
*   &X @WIRE(mode="straight") {#XM36:3 %j43};
*   &A_bar @WIRE(mode="straight") {#XM24:1 (106, -10) %j44};
*   &A_bar @WIRE(mode="straight") {%j44 (106, -12) #XM25:1};
*   &A_bar @WIRE(mode="straight") {%port42::pin %j44};
*   &XOR @WIRE(mode="straight") {%j45 #XM22:1};
*   &XOR @WIRE(mode="straight") {%j45 %j46};
*   &XOR @WIRE(mode="straight") {%j45 %j28};
*   &XOR @WIRE(mode="straight") {%j46 %j47};
*   &XOR @WIRE(mode="straight") {%j46 (98, -6) (109, -6) #XM24:2};
*   &XOR @WIRE(mode="straight") {%j47 %j48};
*   &XOR @WIRE(mode="straight") {%j47 (109, -17) #XM30:2};
*   &XOR @WIRE(mode="straight") {%j48 %j50};
*   &XOR @WIRE(mode="straight") {%j48 (109, -27) #XM32:2};
*   &XOR @WIRE(mode="straight") {%j51 (109, -38) #XM34:2};
*   &XOR @WIRE(mode="straight") {%j51 (98, -47) #XM35:2};
*   &XOR @WIRE(mode="straight") {#XM19:3 %j27};
*   &XOR @WIRE(mode="straight") {%j27 #XM20:3};
*   &XOR @WIRE(mode="straight") {%j27 %j28};
*   &XOR @WIRE(mode="straight") {%j28 #XM21:1};
*   &XNOR @WIRE(mode="straight") {%j53 #XM29:3};
*   &XNOR @WIRE(mode="straight") {%j53 %j52};
*   &XNOR @WIRE(mode="straight") {%j53 %j33};
*   &XNOR @WIRE(mode="straight") {%j49 %j52};
*   &XNOR @WIRE(mode="straight") {%j49 (101, -16) (109, -16) #XM25:2};
*   &XNOR @WIRE(mode="straight") {%j49 #XM31:2};
*   &XNOR @WIRE(mode="straight") {%j52 #XM33:2};
*   &XNOR @WIRE(mode="straight") {#XM26:1 %j32};
*   &XNOR @WIRE(mode="straight") {%j32 #XM27:3};
*   &XNOR @WIRE(mode="straight") {%j32 %j33};
*   &XNOR @WIRE(mode="straight") {%j33 #XM28:3};
*   &net0 @WIRE(mode="straight") {#XM24:3 (112, -10) %j37};
*   &net0 @WIRE(mode="straight") {#XM25:3 (112, -12) %j37};
*   &net0 @WIRE(mode="straight") {#XM30:3 (112, -21) %j38};
*   &net0 @WIRE(mode="straight") {#XM31:3 (112, -23) %j38};
*   &net0 @WIRE(mode="straight") {%j37 (114, -11) %j54};
*   &net0 @WIRE(mode="straight") {%j38 (114, -22) %j54};
*   &net0 @WIRE(mode="straight") {%j54 #X1:1};
*   &COUT @WIRE(mode="straight") {#X1:2 %port38::pin};
*   &net1 @WIRE(mode="straight") {#XM32:3 (112, -31) %j41};
*   &net1 @WIRE(mode="straight") {#XM33:3 (112, -33) %j41};
*   &net1 @WIRE(mode="straight") {#XM34:3 (112, -42) %j42};
*   &net1 @WIRE(mode="straight") {#XM35:3 (112, -44) %j42};
*   &net1 @WIRE(mode="straight") {%j41 (115, -32) %j55};
*   &net1 @WIRE(mode="straight") {%j55 (115, -43) %j42};
*   &net1 @WIRE(mode="straight") {#X2:1 %j55};
*   &SUM @WIRE(mode="straight") {#X2:2 %port41::pin};
*   &A @WIRE(mode="straight") {%port43::pin #XM37:1};
*   &B @WIRE(mode="straight") {%port44::pin #XM38:1};
*   &A @WIRE(mode="straight") {%port48::pin #XM40:3};
*   &X @WIRE(mode="straight") {#XM40:2 (155, -16) (155, -21) %j58} => %wire5;
*   &X @WIRE(mode="straight") {%j58 #XM39:3};
*   &X @WIRE(mode="straight") {#XM41:1 %j58};
*   &A @WIRE(mode="straight") {%port50::pin %j59};
*   &B @WIRE(mode="straight") {%port51::pin %j60};
*   &A @WIRE(mode="straight") {%port55::pin %j63};
*   &X @WIRE(mode="straight") {#XM46:1 %j65};
*   &X @WIRE(mode="straight") {%j65 (155, -44) (155, -39) %j64} => %wire6;
*   &X @WIRE(mode="straight") {#XM54:3 %j65};
*   &XOR @WIRE(mode="straight") {#XM37:3 %j56};
*   &XOR @WIRE(mode="straight") {%j56 #XM38:3};
*   &XOR @WIRE(mode="straight") {%j56 %j57};
*   &XOR @WIRE(mode="straight") {%j57 #XM39:1};
*   &XOR @WIRE(mode="straight") {%j57 %j66};
*   &XOR @WIRE(mode="straight") {%j66 #XM40:1};
*   &XOR @WIRE(mode="straight") {%j66 (157, -13) %j72};
*   &XOR @WIRE(mode="straight") {%j72 #XM42:2};
*   &XNOR @WIRE(mode="straight") {#XM44:1 %j61};
*   &XNOR @WIRE(mode="straight") {%j61 #XM45:3};
*   &XNOR @WIRE(mode="straight") {%j61 %j62};
*   &XNOR @WIRE(mode="straight") {%j62 #XM46:3};
*   &XNOR @WIRE(mode="straight") {%j62 %j67};
*   &XNOR @WIRE(mode="straight") {%j67 #XM47:3};
*   &XNOR @WIRE(mode="straight") {%j67 %j71};
*   &XNOR @WIRE(mode="straight") {%j71 %j74};
*   &XNOR @WIRE(mode="straight") {%j74 #XM43:2};
*   &XNOR @WIRE(mode="straight") {%j71 #XM48:2};
*   &XOR @WIRE(mode="straight") {%j72 %j77};
*   &XOR @WIRE(mode="straight") {%j77 (157, -45) #XM49:2};
*   &net3 @WIRE(mode="straight") {#XM50:1 #XM51:3};
*   &net4 @WIRE(mode="straight") {#XM52:3 #XM53:1};
*   &SUM @WIRE(mode="straight") {#XM42:1 %j68};
*   &SUM @WIRE(mode="straight") {%j68 #XM43:1};
*   &SUM @WIRE(mode="straight") {%j68 %j73} => %wire7;
*   &SUM @WIRE(mode="straight") {#XM51:1 %j73};
*   &SUM @WIRE(mode="straight") {%j73 #XM52:1};
*   &XNOR @WIRE(mode="straight") {#XM50:2 (179, -11) %j76};
*   &XNOR @WIRE(mode="straight") {%j76 %j74};
*   &COUT @WIRE(mode="straight") {#XM48:1 %j70};
*   &COUT @WIRE(mode="straight") {%j70 #XM49:1};
*   &COUT @WIRE(mode="straight") {%j70 %j75} => %wire8;
*   &COUT @WIRE(mode="straight") {#XM55:1 %j75};
*   &COUT @WIRE(mode="straight") {%j75 #XM56:1};
*   &XOR @WIRE(mode="straight") {#XM53:2 (176, -28) %j78};
*   &XOR @WIRE(mode="straight") {%j78 (176, -39) #XM55:2};
*   &XNOR @WIRE(mode="straight") {#XM56:2 (179, -45) %j76};
*   &XOR @WIRE(mode="straight") {%j77 %j78};
*   $JUNCTION @ATTACH %j37(p) => @PLACE(112, -11) => %dot1;
*   $JUNCTION @ATTACH %j38(p) => @PLACE(112, -22) => %dot2;
*   $JUNCTION @ATTACH %j54(p) => @PLACE(114, -16) => %dot3;
*   &CIN @WIRE(mode="straight") {#XM6:2 %port10::pin};
*   &A @WIRE(mode="straight") {%j5 #XM8:3};
*   &B @WIRE(mode="straight") {%j6 #XM9:1};
*   &B @WIRE(mode="straight") {#XM8:2 %port13::pin};
*   &A @WIRE(mode="straight") {#XM9:2 %port14::pin};
*   &A @WIRE(mode="straight") {#XM10:2 %port15::pin};
*   &A @WIRE(mode="straight") {%j9 #XM11:1};
*   &B @WIRE(mode="straight") {#XM12:2 %port17::pin};
*   $JUNCTION @ATTACH %j12(p) => @PLACE(49, -20) => %dot4;
*   $JUNCTION @ATTACH %j13(p) => @PLACE(55, -9) => %dot5;
*   $JUNCTION @ATTACH %j14(p) => @PLACE(55, -20) => %dot6;
*   $JUNCTION @ATTACH %j15(p) => @PLACE(57, -14) => %dot7;
*   $JUNCTION @ATTACH %j16(p) => @PLACE(49, -30) => %dot8;
*   $JUNCTION @ATTACH %j44(p) => @PLACE(106, -11) => %dot9;
*   $JUNCTION @ATTACH %j18(p) => @PLACE(49, -41) => %dot10;
*   $JUNCTION @ATTACH %j23(p) => @PLACE(55, -30) => %dot11;
*   $JUNCTION @ATTACH %j24(p) => @PLACE(55, -41) => %dot12;
*   $JUNCTION @ATTACH %j25(p) => @PLACE(58, -36) => %dot13;
*   &CIN @WIRE(mode="straight") {#XM42:3 %port57::pin};
*   &A @WIRE(mode="straight") {%j30 #XM26:3};
*   &B @WIRE(mode="straight") {%j31 #XM27:1};
*   &B @WIRE(mode="straight") {#XM26:2 %port32::pin};
*   &A @WIRE(mode="straight") {#XM27:2 %port33::pin};
*   &B @WIRE(mode="straight") {#XM1:2 %port3::pin};
*   &A @WIRE(mode="straight") {#XM28:2 %port34::pin};
*   &A @WIRE(mode="straight") {%j34 #XM29:1};
*   &B @WIRE(mode="straight") {#XM36:2 %port36::pin};
*   $JUNCTION @ATTACH %j36(p) => @PLACE(106, -22) => %dot14;
*   $JUNCTION @ATTACH %j39(p) => @PLACE(106, -32) => %dot15;
*   $JUNCTION @ATTACH %j40(p) => @PLACE(106, -43) => %dot16;
*   $JUNCTION @ATTACH %j41(p) => @PLACE(112, -32) => %dot17;
*   $JUNCTION @ATTACH %j42(p) => @PLACE(112, -43) => %dot18;
*   $JUNCTION @ATTACH %j55(p) => @PLACE(115, -37) => %dot19;
*   &B @WIRE(mode="straight") {#XM19:2 %port25::pin};
*   &A @WIRE(mode="straight") {#XM2:2 %port4::pin};
*   &A @WIRE(mode="straight") {#XM20:2 %port26::pin};
*   &A @WIRE(mode="straight") {#XM21:2 %port27::pin};
*   &B @WIRE(mode="straight") {#XM23:2 %port29::pin};
*   &CIN @WIRE(mode="straight") {#XM43:3 %port58::pin};
*   &A @WIRE(mode="straight") {%j59 #XM44:3};
*   &B @WIRE(mode="straight") {%j60 #XM45:1};
*   &B @WIRE(mode="straight") {#XM44:2 %port52::pin};
*   &A @WIRE(mode="straight") {#XM45:2 %port53::pin};
*   &A @WIRE(mode="straight") {#XM3:2 %port5::pin};
*   &A @WIRE(mode="straight") {#XM46:2 %port54::pin};
*   &A @WIRE(mode="straight") {%j63 #XM47:1};
*   &B @WIRE(mode="straight") {#XM54:2 %port56::pin};
*   &CIN @WIRE(mode="straight") {#XM48:3 %port59::pin};
*   &CIN @WIRE(mode="straight") {#XM49:3 %port60::pin};
*   &A @WIRE(mode="straight") {#XM55:3 %port61::pin};
*   &B @WIRE(mode="straight") {#XM56:3 %port62::pin};
*   &CIN @WIRE(mode="straight") {#XM52:2 %port63::pin};
*   &B @WIRE(mode="straight") {#XM37:2 %port45::pin};
*   &A @WIRE(mode="straight") {#XM38:2 %port46::pin};
*   &A @WIRE(mode="straight") {#XM39:2 %port47::pin};
*   &B @WIRE(mode="straight") {#XM41:2 %port49::pin};
*   &CIN @WIRE(mode="straight") {#XM51:2 %port64::pin};
*   &B @WIRE(mode="straight") {#XM5:2 %port7::pin};
*   &VSS @WIRE(mode="straight") {%gnd1::pin #XM5:3};
*   &VDD @WIRE(mode="straight") {#XM12:1 %vdd1::pin};
*   &VSS @WIRE(mode="straight") {%gnd2::pin #XM23:3};
*   &VDD @WIRE(mode="straight") {#XM36:1 %vdd2::pin};
*   &VSS @WIRE(mode="straight") {%gnd3::pin #XM41:3};
*   &VDD @WIRE(mode="straight") {#XM54:1 %vdd3::pin};
*   &VSS @WIRE(mode="straight") {%gnd4::pin #XM53:3};
*   &VDD @WIRE(mode="straight") {#XM50:3 %vdd4::pin};
*   $JUNCTION @ATTACH %j70(p) => @PLACE(163, -42) => %dot20;
*   $JUNCTION @ATTACH %j75(p) => @PLACE(171, -42) => %dot21;
*   $JUNCTION @ATTACH %j56(p) => @PLACE(142, -13) => %dot22;
*   $JUNCTION @ATTACH %j57(p) => @PLACE(148, -13) => %dot23;
*   $JUNCTION @ATTACH %j66(p) => @PLACE(151, -13) => %dot24;
*   $JUNCTION @ATTACH %j72(p) => @PLACE(157, -16) => %dot25;
*   $JUNCTION @ATTACH %j77(p) => @PLACE(157, -33) => %dot26;
*   $JUNCTION @ATTACH %j78(p) => @PLACE(176, -33) => %dot27;
*   $JUNCTION @ATTACH %j4(p) => @PLACE(32, -19) => %dot28;
*   $JUNCTION @ATTACH %j26(p) => @PLACE(32, -42) => %dot29;
*   &X @WIRE(mode="straight") {%j10 #XM11:2};
*   $JUNCTION @ATTACH %j29(p) => @PLACE(89, -21) => %dot30;
*   $JUNCTION @ATTACH %j43(p) => @PLACE(89, -44) => %dot31;
*   &X @WIRE(mode="straight") {%j35 #XM29:2};
*   $JUNCTION @ATTACH %j58(p) => @PLACE(148, -21) => %dot32;
*   $JUNCTION @ATTACH %j65(p) => @PLACE(148, -44) => %dot33;
*   &X @WIRE(mode="straight") {%j64 #XM47:2};
*   $JUNCTION @ATTACH %j1(p) => @PLACE(26, -11) => %dot34;
*   $JUNCTION @ATTACH %j3(p) => @PLACE(32, -11) => %dot35;
*   $JUNCTION @ATTACH %j2(p) => @PLACE(35, -11) => %dot36;
*   $JUNCTION @ATTACH %j11(p) => @PLACE(41, -15) => %dot37;
*   $JUNCTION @ATTACH %j21(p) => @PLACE(41, -35) => %dot38;
*   $JUNCTION @ATTACH %j7(p) => @PLACE(26, -34) => %dot39;
*   $JUNCTION @ATTACH %j8(p) => @PLACE(32, -34) => %dot40;
*   $JUNCTION @ATTACH %j19(p) => @PLACE(35, -34) => %dot41;
*   $JUNCTION @ATTACH %j20(p) => @PLACE(44, -25) => %dot42;
*   $JUNCTION @ATTACH %j22(p) => @PLACE(44, -34) => %dot43;
*   $JUNCTION @ATTACH %j17(p) => @PLACE(52, -25) => %dot44;
*   $JUNCTION @ATTACH %j27(p) => @PLACE(83, -13) => %dot45;
*   $JUNCTION @ATTACH %j28(p) => @PLACE(89, -13) => %dot46;
*   $JUNCTION @ATTACH %j45(p) => @PLACE(92, -13) => %dot47;
*   $JUNCTION @ATTACH %j46(p) => @PLACE(98, -13) => %dot48;
*   $JUNCTION @ATTACH %j47(p) => @PLACE(98, -17) => %dot49;
*   $JUNCTION @ATTACH %j48(p) => @PLACE(98, -27) => %dot50;
*   &XOR @WIRE(mode="straight") {%j51 %j50};
*   $JUNCTION @ATTACH %j51(p) => @PLACE(98, -38) => %dot51;
*   $JUNCTION @ATTACH %j32(p) => @PLACE(83, -36) => %dot52;
*   $JUNCTION @ATTACH %j33(p) => @PLACE(89, -36) => %dot53;
*   $JUNCTION @ATTACH %j53(p) => @PLACE(92, -36) => %dot54;
*   $JUNCTION @ATTACH %j49(p) => @PLACE(101, -26) => %dot55;
*   $JUNCTION @ATTACH %j52(p) => @PLACE(101, -36) => %dot56;
*   $JUNCTION @ATTACH %j61(p) => @PLACE(142, -36) => %dot57;
*   $JUNCTION @ATTACH %j62(p) => @PLACE(148, -36) => %dot58;
*   $JUNCTION @ATTACH %j67(p) => @PLACE(151, -36) => %dot59;
*   $JUNCTION @ATTACH %j74(p) => @PLACE(160, -34) => %dot60;
*   $JUNCTION @ATTACH %j71(p) => @PLACE(160, -36) => %dot61;
*   $JUNCTION @ATTACH %j76(p) => @PLACE(179, -34) => %dot62;
*   $JUNCTION @ATTACH %j68(p) => @PLACE(163, -19) => %dot63;
*   $JUNCTION @ATTACH %j73(p) => @PLACE(171, -19) => %dot64;
*   #XM1
*       @TEXT("\textbf{\textit{M}}_{\textbf{1}}", key="name", dx=-3, dy=1, halign="middle", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM1::name(label);
*   #XM2
*       @TEXT("\textbf{\textit{M}}_{\textbf{2}}", key="name", dx=-2.5, dy=-2, halign="middle", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM2::name(label);
*   %port1
*       @TEXT("\textbf{\textit{A}}", key="netname", dx=-2, dy=0.5, halign="end", valign="baseline", size=1.5116, bold=false,
*       textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="port") %port1::netname(label);
*   %port2
*       @TEXT("\textbf{\textit{B}}", key="netname", dx=-2, dy=-0.5, halign="end", valign="baseline", size=1.5116, bold=false,
*       textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="port") %port2::netname(label);
*   %port3
*       @TEXT("\textbf{\textit{B}}", key="netname", dx=0, dy=1.9, halign="middle", valign="baseline", size=1.5116, bold=false,
*       textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="port") %port3::netname(label);
*   %port4
*       @TEXT("\textbf{\textit{A}}", key="netname", dx=-0.5, dy=-2, halign="end", valign="baseline", size=1.5116, bold=false,
*       textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="port") %port4::netname(label);
*   #XM3
*       @TEXT("\textbf{\textit{M}}_{\textbf{3}}", key="name", dx=-4, dy=-2.5, halign="start", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM3::name(label);
*   #XM4
*       @TEXT("\textbf{\textit{M}}_{\textbf{4}}", key="name", dx=3, dy=-3, halign="end", valign="baseline", size=1.5116, bold=false,
*       textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM4::name(label);
*   &XOR @TEXT("\textbf{\textit{XOR}}", size=1.5116, bold=false) => @PLACE(32.5, -10) => %label1;
*   $CANVAS_LABEL @ATTACH(bind="net") %label1(label);
*   %port5
*       @TEXT("\textbf{\textit{A}}", key="netname", dx=0, dy=0.5, halign="end", valign="baseline", size=1.5116, bold=false,
*       textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="port") %port5::netname(label);
*   %port6
*       @TEXT("\textbf{\textit{A}}", key="netname", dx=-0.5, dy=0, halign="end", valign="baseline", size=1.5116, bold=false,
*       textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="port") %port6::netname(label);
*   %wire1 @TEXT("\textbf{\textit{X}}", size=1.5116, bold=false) => @PLACE(32.5, -21) => %label2;
*   $CANVAS_LABEL @ATTACH(bind="net") %label2(label);
*   #XM5
*       @TEXT("\textbf{\textit{M}}_{\textbf{5}}", key="name", dx=0.5, dy=-1, halign="start", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM5::name(label);
*   %port7
*       @TEXT("\textbf{\textit{B}}", key="netname", dx=-2, dy=0, halign="end", valign="baseline", size=1.5116, bold=false,
*       textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="port") %port7::netname(label);
*   #XM6
*       @TEXT("\textbf{\textit{M}}_{\textbf{6}}", key="name", dx=-3, dy=1, halign="middle", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM6::name(label);
*   #XM7
*       @TEXT("\textbf{\textit{M}}_{\textbf{7}}", key="name", dx=2.5, dy=-2.5, halign="middle", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM7::name(label);
*   %port8
*       @TEXT("\textbf{\textit{A}}", key="netname", dx=-2, dy=0.5, halign="end", valign="baseline", size=1.5116, bold=false,
*       textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="port") %port8::netname(label);
*   %port9
*       @TEXT("\textbf{\textit{B}}", key="netname", dx=-2, dy=-0.5, halign="end", valign="baseline", size=1.5116, bold=false,
*       textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="port") %port9::netname(label);
*   %port10
*       @TEXT("\textbf{\textit{CIN}}", key="netname", dx=0, dy=1.9, halign="middle", valign="baseline", size=1.5116, bold=false,
*       textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="port") %port10::netname(label);
*   %port11
*       @TEXT("\textbf{\textit{A}}", key="netname", dx=-2, dy=0.5, halign="end", valign="baseline", size=1.5116, bold=false,
*       textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="port") %port11::netname(label);
*   %port12
*       @TEXT("\textbf{\textit{B}}", key="netname", dx=-2, dy=-0.5, halign="end", valign="baseline", size=1.5116, bold=false,
*       textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="port") %port12::netname(label);
*   %port13
*       @TEXT("\textbf{\textit{B}}", key="netname", dx=0, dy=1.9, halign="middle", valign="baseline", size=1.5116, bold=false,
*       textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="port") %port13::netname(label);
*   %port14
*       @TEXT("\textbf{\textit{A}}", key="netname", dx=-0.5, dy=-2, halign="end", valign="baseline", size=1.5116, bold=false,
*       textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="port") %port14::netname(label);
*   &XNOR @TEXT("\textbf{\textit{XNOR}}", size=1.5116, bold=false) => @PLACE(32.5, -33) => %label3;
*   $CANVAS_LABEL @ATTACH(bind="net") %label3(label);
*   %port15
*       @TEXT("\textbf{\textit{A}}", key="netname", dx=0, dy=0.5, halign="end", valign="baseline", size=1.5116, bold=false,
*       textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="port") %port15::netname(label);
*   %port16
*       @TEXT("\textbf{\textit{A}}", key="netname", dx=2, dy=-1, halign="end", valign="baseline", size=1.5116, bold=false,
*       textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="port") %port16::netname(label);
*   %wire2 @TEXT("\textbf{\textit{X}}", size=1.5116, bold=false) => @PLACE(32.5, -44) => %label4;
*   $CANVAS_LABEL @ATTACH(bind="net") %label4(label);
*   %port17
*       @TEXT("\textbf{\textit{B}}", key="netname", dx=-2, dy=0, halign="end", valign="baseline", size=1.5116, bold=false,
*       textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="port") %port17::netname(label);
*   #XM8
*       @TEXT("\textbf{\textit{M}}_{\textbf{8}}", key="name", dx=-3.5, dy=1.5, halign="start", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM8::name(label);
*   #XM9
*       @TEXT("\textbf{\textit{M}}_{\textbf{9}}", key="name", dx=-4, dy=-2.5, halign="start", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM9::name(label);
*   #XM10
*       @TEXT("\textbf{\textit{M}}_{\textbf{10}}", key="name", dx=-2.5, dy=-3, halign="middle", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM10::name(label);
*   #XM11
*       @TEXT("\textbf{\textit{M}}_{\textbf{11}}", key="name", dx=-1.5, dy=-0.5, halign="middle", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM11::name(label);
*   #XM13
*       @TEXT("\textbf{\textit{M}}_{\textbf{13}}", key="name", dx=-3, dy=1, halign="middle", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM13::name(label);
*   #XM14
*       @TEXT("\textbf{\textit{M}}_{\textbf{14}}", key="name", dx=2.5, dy=-2.5, halign="middle", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM14::name(label);
*   %port18
*       @TEXT("\textbf{\textit{CIN}}", key="netname", dx=1, dy=-2.5, halign="end", valign="baseline", size=1.5116, bold=false,
*       textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="port") %port18::netname(label);
*   %port19
*       @TEXT("\textbf{\textit{C}}_{\textbf{OUT}}", key="netname", dx=-0.5, dy=1.5, halign="start", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="port") %port19::netname(label);
*   #XM15
*       @TEXT("\textbf{\textit{M}}_{\textbf{15}}", key="name", dx=-3, dy=1, halign="middle", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM15::name(label);
*   #XM16
*       @TEXT("\textbf{\textit{M}}_{\textbf{16}}", key="name", dx=2.5, dy=-2.5, halign="middle", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM16::name(label);
*   %port20
*       @TEXT("\overline{\textbf{\textit{CIN}}}", key="netname", dx=0.5, dy=-3, halign="end", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="port") %port20::netname(label);
*   #XM17
*       @TEXT("\textbf{\textit{M}}_{\textbf{17}}", key="name", dx=-3, dy=1, halign="middle", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM17::name(label);
*   #XM18
*       @TEXT("\textbf{\textit{M}}_{\textbf{18}}", key="name", dx=2.5, dy=-2.5, halign="middle", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM18::name(label);
*   %port21
*       @TEXT("\textbf{\textit{CIN}}", key="netname", dx=0.5, dy=-2.5, halign="end", valign="baseline", size=1.5116, bold=false,
*       textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="port") %port21::netname(label);
*   %port22
*       @TEXT("\textbf{\textit{SUM}}", key="netname", dx=-0.5, dy=1.5, halign="start", valign="baseline", size=1.5116, bold=false,
*       textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="port") %port22::netname(label);
*   #XM12
*       @TEXT("\textbf{\textit{M}}_{\textbf{12}}", key="name", dx=-3, dy=-3, halign="middle", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM12::name(label);
*   %vdd1 @TEXT("\textbf{\textit{V}}_{\textbf{DD}}", dx=1.5, dy=-2.5, size=1.5116, bold=false) => %power1;
*   $CANVAS_LABEL @ATTACH(bind="port") %power1(label);
*   #XM19
*       @TEXT("\textbf{\textit{M}}_{\textbf{19}}", key="name", dx=-3, dy=1, halign="middle", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM19::name(label);
*   #XM20
*       @TEXT("\textbf{\textit{M}}_{\textbf{20}}", key="name", dx=-2.5, dy=-2, halign="middle", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM20::name(label);
*   %port23
*       @TEXT("\textbf{\textit{A}}", key="netname", dx=-2, dy=0.5, halign="end", valign="baseline", size=1.5116, bold=false,
*       textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="port") %port23::netname(label);
*   %port24
*       @TEXT("\textbf{\textit{B}}", key="netname", dx=-2, dy=-0.5, halign="end", valign="baseline", size=1.5116, bold=false,
*       textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="port") %port24::netname(label);
*   %port25
*       @TEXT("\textbf{\textit{B}}", key="netname", dx=0, dy=1.9, halign="middle", valign="baseline", size=1.5116, bold=false,
*       textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="port") %port25::netname(label);
*   %port26
*       @TEXT("\textbf{\textit{A}}", key="netname", dx=-0.5, dy=-2, halign="end", valign="baseline", size=1.5116, bold=false,
*       textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="port") %port26::netname(label);
*   #XM21
*       @TEXT("\textbf{\textit{M}}_{\textbf{21}}", key="name", dx=-4, dy=-2.5, halign="start", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM21::name(label);
*   #XM22
*       @TEXT("\textbf{\textit{M}}_{\textbf{22}}", key="name", dx=3, dy=-3, halign="end", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM22::name(label);
*   &XOR @TEXT("\textbf{\textit{XOR}}", size=1.5116, bold=false) => @PLACE(89.5, -12) => %label5;
*   $CANVAS_LABEL @ATTACH(bind="net") %label5(label);
*   %port27
*       @TEXT("\textbf{\textit{A}}", key="netname", dx=0, dy=0.5, halign="end", valign="baseline", size=1.5116, bold=false,
*       textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="port") %port27::netname(label);
*   %port28
*       @TEXT("\textbf{\textit{A}}", key="netname", dx=-0.5, dy=0, halign="end", valign="baseline", size=1.5116, bold=false,
*       textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="port") %port28::netname(label);
*   %wire3 @TEXT("\textbf{\textit{X}}", size=1.5116, bold=false) => @PLACE(89.5, -23) => %label6;
*   $CANVAS_LABEL @ATTACH(bind="net") %label6(label);
*   #XM23
*       @TEXT("\textbf{\textit{M}}_{\textbf{23}}", key="name", dx=0.5, dy=-1, halign="start", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM23::name(label);
*   %port29
*       @TEXT("\textbf{\textit{B}}", key="netname", dx=-2, dy=0, halign="end", valign="baseline", size=1.5116, bold=false,
*       textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="port") %port29::netname(label);
*   #XM24
*       @TEXT("\textbf{\textit{M}}_{\textbf{24}}", key="name", dx=-3, dy=1, halign="middle", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM24::name(label);
*   #XM25
*       @TEXT("\textbf{\textit{M}}_{\textbf{25}}", key="name", dx=2.5, dy=-2.5, halign="middle", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM25::name(label);
*   %port30
*       @TEXT("\textbf{\textit{A}}", key="netname", dx=-2, dy=0.5, halign="end", valign="baseline", size=1.5116, bold=false,
*       textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="port") %port30::netname(label);
*   %port31
*       @TEXT("\textbf{\textit{B}}", key="netname", dx=-2, dy=-0.5, halign="end", valign="baseline", size=1.5116, bold=false,
*       textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="port") %port31::netname(label);
*   %port32
*       @TEXT("\textbf{\textit{B}}", key="netname", dx=0, dy=1.9, halign="middle", valign="baseline", size=1.5116, bold=false,
*       textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="port") %port32::netname(label);
*   %port33
*       @TEXT("\textbf{\textit{A}}", key="netname", dx=-0.5, dy=-2, halign="end", valign="baseline", size=1.5116, bold=false,
*       textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="port") %port33::netname(label);
*   &XNOR @TEXT("\textbf{\textit{XNOR}}", size=1.5116, bold=false) => @PLACE(89.5, -35) => %label7;
*   $CANVAS_LABEL @ATTACH(bind="net") %label7(label);
*   %port34
*       @TEXT("\textbf{\textit{A}}", key="netname", dx=0, dy=0.5, halign="end", valign="baseline", size=1.5116, bold=false,
*       textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="port") %port34::netname(label);
*   %port35
*       @TEXT("\textbf{\textit{A}}", key="netname", dx=2, dy=-1, halign="end", valign="baseline", size=1.5116, bold=false,
*       textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="port") %port35::netname(label);
*   %wire4 @TEXT("\textbf{\textit{X}}", size=1.5116, bold=false) => @PLACE(89.5, -46) => %label8;
*   $CANVAS_LABEL @ATTACH(bind="net") %label8(label);
*   %port36
*       @TEXT("\textbf{\textit{B}}", key="netname", dx=-2, dy=0, halign="end", valign="baseline", size=1.5116, bold=false,
*       textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="port") %port36::netname(label);
*   #XM26
*       @TEXT("\textbf{\textit{M}}_{\textbf{26}}", key="name", dx=-5, dy=1.5, halign="start", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM26::name(label);
*   #XM27
*       @TEXT("\textbf{\textit{M}}_{\textbf{27}}", key="name", dx=-4, dy=-2.5, halign="start", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM27::name(label);
*   #XM28
*       @TEXT("\textbf{\textit{M}}_{\textbf{28}}", key="name", dx=-2.5, dy=-3, halign="middle", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM28::name(label);
*   #XM29
*       @TEXT("\textbf{\textit{M}}_{\textbf{29}}", key="name", dx=-1.5, dy=-0.5, halign="middle", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM29::name(label);
*   #XM30
*       @TEXT("\textbf{\textit{M}}_{\textbf{30}}", key="name", dx=-3, dy=1, halign="middle", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM30::name(label);
*   #XM31
*       @TEXT("\textbf{\textit{M}}_{\textbf{31}}", key="name", dx=2.5, dy=-2.5, halign="middle", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM31::name(label);
*   %port37
*       @TEXT("\overline{\textbf{\textit{CIN}}}", key="netname", dx=0.5, dy=-2.5, halign="end", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="port") %port37::netname(label);
*   %port38
*       @TEXT("\textbf{\textit{C}}_{\textbf{OUT}}", key="netname", dx=-0.5, dy=1.5, halign="start", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="port") %port38::netname(label);
*   #XM32
*       @TEXT("\textbf{\textit{M}}_{\textbf{32}}", key="name", dx=-3, dy=1, halign="middle", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM32::name(label);
*   #XM33
*       @TEXT("\textbf{\textit{M}}_{\textbf{33}}", key="name", dx=2.5, dy=-2.5, halign="middle", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM33::name(label);
*   %port39
*       @TEXT("\textbf{\textit{CIN}}", key="netname", dx=0.5, dy=-3, halign="end", valign="baseline", size=1.5116, bold=false,
*       textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="port") %port39::netname(label);
*   #XM34
*       @TEXT("\textbf{\textit{M}}_{\textbf{34}}", key="name", dx=-3, dy=1, halign="middle", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM34::name(label);
*   #XM35
*       @TEXT("\textbf{\textit{M}}_{\textbf{35}}", key="name", dx=2.5, dy=-2.5, halign="middle", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM35::name(label);
*   %port40
*       @TEXT("\overline{\textbf{\textit{CIN}}}", key="netname", dx=0.5, dy=-2.5, halign="end", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="port") %port40::netname(label);
*   %port41
*       @TEXT("\textbf{\textit{SUM}}", key="netname", dx=-0.5, dy=1.5, halign="start", valign="baseline", size=1.5116, bold=false,
*       textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="port") %port41::netname(label);
*   #XM36
*       @TEXT("\textbf{\textit{M}}_{\textbf{36}}", key="name", dx=-3, dy=-3, halign="middle", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM36::name(label);
*   %vdd2 @TEXT("\textbf{\textit{V}}_{\textbf{DD}}", dx=1.5, dy=-2.5, size=1.5116, bold=false) => %power2;
*   $CANVAS_LABEL @ATTACH(bind="port") %power2(label);
*   %port42
*       @TEXT("\overline{\textbf{\textit{A}}}", key="netname", dx=-2, dy=0.5, halign="end", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="port") %port42::netname(label);
*   #X1
*       @TEXT("\textbf{\textit{X}}_{\textbf{1}}", key="name", dx=-0.5, dy=-2.9, halign="middle", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #X1::name(label);
*   #X2
*       @TEXT("\textbf{\textit{X}}_{\textbf{2}}", key="name", dx=-0.5, dy=-2.9, halign="middle", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #X2::name(label);
*   #XM37
*       @TEXT("\textbf{\textit{M}}_{\textbf{37}}", key="name", dx=-3, dy=1, halign="middle", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM37::name(label);
*   #XM38
*       @TEXT("\textbf{\textit{M}}_{\textbf{38}}", key="name", dx=-2.5, dy=-2, halign="middle", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM38::name(label);
*   %port43
*       @TEXT("\textbf{\textit{A}}", key="netname", dx=-2, dy=0.5, halign="end", valign="baseline", size=1.5116, bold=false,
*       textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="port") %port43::netname(label);
*   %port44
*       @TEXT("\textbf{\textit{B}}", key="netname", dx=-2, dy=-0.5, halign="end", valign="baseline", size=1.5116, bold=false,
*       textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="port") %port44::netname(label);
*   %port45
*       @TEXT("\textbf{\textit{B}}", key="netname", dx=0, dy=1.9, halign="middle", valign="baseline", size=1.5116, bold=false,
*       textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="port") %port45::netname(label);
*   %port46
*       @TEXT("\textbf{\textit{A}}", key="netname", dx=-0.5, dy=-2, halign="end", valign="baseline", size=1.5116, bold=false,
*       textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="port") %port46::netname(label);
*   #XM39
*       @TEXT("\textbf{\textit{M}}_{\textbf{39}}", key="name", dx=-4, dy=-2.5, halign="start", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM39::name(label);
*   #XM40
*       @TEXT("\textbf{\textit{M}}_{\textbf{40}}", key="name", dx=3.5, dy=-3, halign="end", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM40::name(label);
*   &XOR @TEXT("\textbf{\textit{XOR}}", size=1.5116, bold=false) => @PLACE(148.5, -12) => %label9;
*   $CANVAS_LABEL @ATTACH(bind="net") %label9(label);
*   %port47
*       @TEXT("\textbf{\textit{A}}", key="netname", dx=0, dy=0.5, halign="end", valign="baseline", size=1.5116, bold=false,
*       textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="port") %port47::netname(label);
*   %port48
*       @TEXT("\textbf{\textit{A}}", key="netname", dx=-0.5, dy=0, halign="end", valign="baseline", size=1.5116, bold=false,
*       textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="port") %port48::netname(label);
*   %wire5 @TEXT("\textbf{\textit{X}}", size=1.5116, bold=false) => @PLACE(148.5, -23) => %label10;
*   $CANVAS_LABEL @ATTACH(bind="net") %label10(label);
*   #XM41
*       @TEXT("\textbf{\textit{M}}_{\textbf{41}}", key="name", dx=0.5, dy=-1, halign="start", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM41::name(label);
*   %port49
*       @TEXT("\textbf{\textit{B}}", key="netname", dx=-2, dy=0, halign="end", valign="baseline", size=1.5116, bold=false,
*       textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="port") %port49::netname(label);
*   %port50
*       @TEXT("\textbf{\textit{A}}", key="netname", dx=-2, dy=0.5, halign="end", valign="baseline", size=1.5116, bold=false,
*       textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="port") %port50::netname(label);
*   %port51
*       @TEXT("\textbf{\textit{B}}", key="netname", dx=-2, dy=-0.5, halign="end", valign="baseline", size=1.5116, bold=false,
*       textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="port") %port51::netname(label);
*   %port52
*       @TEXT("\textbf{\textit{B}}", key="netname", dx=0, dy=1.9, halign="middle", valign="baseline", size=1.5116, bold=false,
*       textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="port") %port52::netname(label);
*   %port53
*       @TEXT("\textbf{\textit{A}}", key="netname", dx=-0.5, dy=-2, halign="end", valign="baseline", size=1.5116, bold=false,
*       textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="port") %port53::netname(label);
*   &XNOR @TEXT("\textbf{\textit{XNOR}}", size=1.5116, bold=false) => @PLACE(148.5, -35) => %label11;
*   $CANVAS_LABEL @ATTACH(bind="net") %label11(label);
*   %port54
*       @TEXT("\textbf{\textit{A}}", key="netname", dx=0, dy=0.5, halign="end", valign="baseline", size=1.5116, bold=false,
*       textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="port") %port54::netname(label);
*   %port55
*       @TEXT("\textbf{\textit{A}}", key="netname", dx=2, dy=-1, halign="end", valign="baseline", size=1.5116, bold=false,
*       textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="port") %port55::netname(label);
*   %wire6 @TEXT("\textbf{\textit{X}}", size=1.5116, bold=false) => @PLACE(148.5, -46) => %label12;
*   $CANVAS_LABEL @ATTACH(bind="net") %label12(label);
*   %port56
*       @TEXT("\textbf{\textit{B}}", key="netname", dx=-2, dy=0, halign="end", valign="baseline", size=1.5116, bold=false,
*       textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="port") %port56::netname(label);
*   #XM44
*       @TEXT("\textbf{\textit{M}}_{\textbf{44}}", key="name", dx=-4.5, dy=1.5, halign="start", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM44::name(label);
*   #XM45
*       @TEXT("\textbf{\textit{M}}_{\textbf{45}}", key="name", dx=-4, dy=-2.5, halign="start", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM45::name(label);
*   #XM46
*       @TEXT("\textbf{\textit{M}}_{\textbf{46}}", key="name", dx=-2.5, dy=-3, halign="middle", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM46::name(label);
*   #XM47
*       @TEXT("\textbf{\textit{M}}_{\textbf{47}}", key="name", dx=-1.5, dy=-0.5, halign="middle", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM47::name(label);
*   #XM54
*       @TEXT("\textbf{\textit{M}}_{\textbf{54}}", key="name", dx=-3, dy=-3, halign="middle", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM54::name(label);
*   %vdd3 @TEXT("\textbf{\textit{V}}_{\textbf{DD}}", dx=1.5, dy=-2.5, size=1.5116, bold=false) => %power3;
*   $CANVAS_LABEL @ATTACH(bind="port") %power3(label);
*   #XM42
*       @TEXT("\textbf{\textit{M}}_{\textbf{42}}", key="name", dx=0.5, dy=0, halign="start", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM42::name(label);
*   #XM43
*       @TEXT("\textbf{\textit{M}}_{\textbf{43}}", key="name", dx=0.5, dy=-0.5, halign="start", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM43::name(label);
*   %port57
*       @TEXT("\textbf{\textit{CIN}}", key="netname", dx=1.5, dy=3, halign="end", valign="baseline", size=1.5116, bold=false,
*       textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="port") %port57::netname(label);
*   %port58
*       @TEXT("\textbf{\textit{CIN}}", key="netname", dx=1.5, dy=-3, halign="end", valign="baseline", size=1.5116, bold=false,
*       textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="port") %port58::netname(label);
*   #XM48
*       @TEXT("\textbf{\textit{M}}_{\textbf{48}}", key="name", dx=0.4, dy=-0.5, halign="start", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM48::name(label);
*   #XM49
*       @TEXT("\textbf{\textit{M}}_{\textbf{49}}", key="name", dx=1, dy=-1.5, halign="start", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM49::name(label);
*   %port59
*       @TEXT("\textbf{\textit{CIN}}", key="netname", dx=4, dy=0, halign="end", valign="baseline", size=1.5116, bold=false,
*       textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="port") %port59::netname(label);
*   %port60
*       @TEXT("\textbf{\textit{CIN}}", key="netname", dx=1.5, dy=-3, halign="end", valign="baseline", size=1.5116, bold=false,
*       textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="port") %port60::netname(label);
*   #XM50
*       @TEXT("\textbf{\textit{M}}_{\textbf{50}}", key="name", dx=-0.4, dy=-0.5, halign="end", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM50::name(label);
*   #XM51
*       @TEXT("\textbf{\textit{M}}_{\textbf{51}}", key="name", dx=-0.5, dy=0, halign="end", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM51::name(label);
*   #XM52
*       @TEXT("\textbf{\textit{M}}_{\textbf{52}}", key="name", dx=-0.5, dy=-0.5, halign="end", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM52::name(label);
*   #XM53
*       @TEXT("\textbf{\textit{M}}_{\textbf{53}}", key="name", dx=-0.5, dy=-0.5, halign="end", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM53::name(label);
*   %vdd4 @TEXT("\textbf{\textit{V}}_{\textbf{DD}}", dx=2, dy=1, size=1.5116, bold=false) => %power4;
*   $CANVAS_LABEL @ATTACH(bind="port") %power4(label);
*   #XM55
*       @TEXT("\textbf{\textit{M}}_{\textbf{55}}", key="name", dx=-0.4, dy=-0.5, halign="end", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM55::name(label);
*   #XM56
*       @TEXT("\textbf{\textit{M}}_{\textbf{56}}", key="name", dx=-0.5, dy=-1.5, halign="end", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM56::name(label);
*   %port61
*       @TEXT("\textbf{\textit{A}}", key="netname", dx=2.5, dy=1, halign="end", valign="baseline", size=1.5116, bold=false,
*       textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="port") %port61::netname(label);
*   %wire8 @TEXT("\textbf{\textit{Cout}}", size=1.5116, bold=false) => @PLACE(165, -43.5) => %label13;
*   $CANVAS_LABEL @ATTACH(bind="net") %label13(label);
*   %port62
*       @TEXT("\textbf{\textit{B}}", key="netname", dx=1.5, dy=-2.5, halign="end", valign="baseline", size=1.5116, bold=false,
*       textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="port") %port62::netname(label);
*   %port63
*       @TEXT("\textbf{\textit{CIN}}", key="netname", dx=4.5, dy=-0.5, halign="end", valign="baseline", size=1.5116, bold=false,
*       textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="port") %port63::netname(label);
*   %port64
*       @TEXT("\textbf{\textit{CIN}}", key="netname", dx=4.5, dy=-0.5, halign="end", valign="baseline", size=1.5116, bold=false,
*       textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="port") %port64::netname(label);
*   %wire7 @TEXT("\textbf{\textit{SUM}}", size=1.5116, bold=false) => @PLACE(165.5, -18.5) => %label14;
*   $CANVAS_LABEL @ATTACH(bind="net") %label14(label);
*   (43.5, -54.5) @TEXT("\textbf{(a)}", halign="middle", size=1.5116, bold=true) => %text1;
*   $CANVAS_TYPOGRAPHY @ATTACH(token="label") %text1(text);
*   (100.5, -56.5) @TEXT("\textbf{(b)}", halign="middle", size=1.5116, bold=false) => %text2;
*   $CANVAS_TYPOGRAPHY @ATTACH(token="label") %text2(text);
*   (159.5, -56.5) @TEXT("\textbf{(d)}", halign="middle", size=1.5116, bold=false) => %text3;
*   $CANVAS_TYPOGRAPHY @ATTACH(token="label") %text3(text);
*   %vdd1 @TEXT("${p}", key="netname", textvisible=false);
*   %vdd2 @TEXT("${p}", key="netname", textvisible=false);
*   %vdd3 @TEXT("${p}", key="netname", textvisible=false);
*   %vdd4 @TEXT("${p}", key="netname", textvisible=false)
* }
.ends dut
