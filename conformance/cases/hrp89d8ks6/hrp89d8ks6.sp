
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

.subckt CG_CE VDD VSS IN1 IN2 CLK OUT
XM1 net3 IN1 VDD VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM2 net2 IN2 net3 VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM3 OUT CLK net2 VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM4 OUT CLKB net1 VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM5 net1 IN1 net0 VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM6 net0 IN2 VSS VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
X1 CLK CLKB VDD VSS inverter td=10p vt=10m
* @RNL(author="analog-canvas") {
*   %CG_CE_SYMBOL = @DEFINE-SYMBOL(box=[-5, -5, 5, 5]) {
*     (-5, 0) @PIN(terminal="IN1", label="\textbf{\textit{IN1}}", direction="left");
*     (-5, -2) @PIN(terminal="IN2", label="\textbf{\textit{IN2}}", direction="left");
*     (5, 0) @PIN(terminal="CLK", label="\textbf{\textit{CLK}}", direction="right");
*     (0, 5) @PIN(terminal="VDD", label="\textbf{\textit{V}}_{\textbf{DD}}", direction="up");
*     (5, -2) @PIN(terminal="OUT", label="\textbf{\textit{OUT}}", direction="right");
*     (0, 0) @RECTANGLE(width=8, height=8);
*     @LINE {(-5, 0) (-4, 0)};
*     @LINE {(-5, -2) (-4, -2)};
*     @LINE {(5, 0) (4, 0)};
*     @LINE {(0, 5) (0, 4)};
*     @LINE {(5, -2) (4, -2)}
*   };
*   # @SET-SYMBOL %CG_CE_SYMBOL;
*   $CANVAS_TYPESETTING @ATTACH(subscript_italic=false) #(level);
*   $CANVAS_CELL_NAME @ATTACH(name="CG-CE") #(level);
*   #XM1 @SET-SYMBOL $PMOS => @PLACE(42, -3) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M1") #XM1(part);
*   #XM2 @SET-SYMBOL $PMOS => @PLACE(42, -7) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M2") #XM2(part);
*   #XM3 @SET-SYMBOL $PMOS => @PLACE(42, -11) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M3") #XM3(part);
*   #XM4 @SET-SYMBOL $NMOS => @PLACE(42, -15) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M4") #XM4(part);
*   #XM5 @SET-SYMBOL $NMOS => @PLACE(42, -19) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M5") #XM5(part);
*   #XM6 @SET-SYMBOL $NMOS => @PLACE(42, -23) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M6") #XM6(part);
*   $IO_PORT @ATTACH &IN1(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(31, -3) => @ORIENT("R0") => %port1;
*   $IO_PORT @ATTACH &IN2(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(31, -23) => @ORIENT("R0") => %port2;
*   $IO_PORT @ATTACH &CLK(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(39, -11) => @ORIENT("R0") => %port3;
*   $SUPPLY @ATTACH &VDD(p) => @SET-SYMBOL $SUPPLY_SYMBOL => @PLACE(42, -2) => @ORIENT("R0") => %vdd1;
*   $IO_PORT @ATTACH &OUT(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(44, -13) => @ORIENT("MY") => %port4;
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(42, -24) => @ORIENT("R0") => %gnd1;
*   $IO_PORT @ATTACH &CLK(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(32, -31) => @ORIENT("R0") => %port5;
*   #X1 @SET-SYMBOL $INVERTER => @PLACE(35, -31) => @ORIENT("R0");
*   &VDD @REMOVE-FROM $PORT_FILL_SET;
*   &VSS @REMOVE-FROM $PORT_FILL_SET;
*   %j1 = (33, -3);
*   $JUNCTION @ATTACH %j1;
*   %j2 = (35, -23);
*   $JUNCTION @ATTACH %j2;
*   %j3 = (42, -31);
*   %j4 = (36, -15);
*   &IN1 @WIRE(mode="straight") {#XM1:2 %j1};
*   &IN1 @WIRE(mode="straight") {%j1 (33, -19) #XM5:2};
*   &IN2 @WIRE(mode="straight") {#XM2:2 (35, -7) %j2};
*   &IN2 @WIRE(mode="straight") {%j2 #XM6:2};
*   &IN1 @WIRE(mode="straight") {%port1:p %j1};
*   &IN2 @WIRE(mode="straight") {%port2:p %j2};
*   &VDD @WIRE(mode="straight") {#XM1:3 %vdd1:p};
*   &OUT @WIRE(mode="straight") {%port4:p #XM3:1};
*   &VSS @WIRE(mode="straight") {%gnd1:p #XM6:3};
*   &CLKB @WIRE(mode="straight") {#X1:2 %j3} => %wire1;
*   &CLKB @WIRE(mode="straight") {#XM4:2 %j4};
*   &net0 @WIRE(mode="straight") {#XM6:1 #XM5:3};
*   &net1 @WIRE(mode="straight") {#XM5:1 #XM4:3};
*   &net2 @WIRE(mode="straight") {#XM3:3 #XM2:1};
*   &net3 @WIRE(mode="straight") {#XM2:3 #XM1:1};
*   &OUT @WIRE(mode="straight") {#XM4:1 #XM3:1};
*   $JUNCTION @ATTACH (42, -13)(p) => %dot1;
*   &CLK @WIRE(mode="straight") {%port3:p #XM3:2};
*   &CLK @WIRE(mode="straight") {%port5:p #X1:1};
*   #XM1 @TEXT("\textbf{\textit{M}}_{\textbf{1}}", key="name", dx=0.4, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM1::name(label);
*   #XM2 @TEXT("\textbf{\textit{M}}_{\textbf{2}}", key="name", dx=0.4, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM2::name(label);
*   #XM3 @TEXT("\textbf{\textit{M}}_{\textbf{3}}", key="name", dx=0.4, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM3::name(label);
*   #XM4 @TEXT("\textbf{\textit{M}}_{\textbf{4}}", key="name", dx=0.5, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM4::name(label);
*   #XM5 @TEXT("\textbf{\textit{M}}_{\textbf{5}}", key="name", dx=0.5, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM5::name(label);
*   #XM6 @TEXT("\textbf{\textit{M}}_{\textbf{6}}", key="name", dx=0.5, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM6::name(label);
*   %port1 @TEXT("\textbf{\textit{IN1}}", key="name", dx=-2, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port1::name(label);
*   %port2 @TEXT("\textbf{\textit{IN2}}", key="name", dx=-2, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port2::name(label);
*   %port3 @TEXT("\textbf{\textit{CLK}}", key="name", dx=-0.5, dy=1, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port3::name(label);
*   %vdd1 @TEXT("\textbf{\textit{V}}_{\textbf{DD}}", dx=-1.5, dy=3, size=1.5116) => %power1;
*   $CANVAS_LABEL @ATTACH(bind="port") %power1(label);
*   %port4 @TEXT("\textbf{\textit{OUT}}", key="name", dx=2, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port4::name(label);
*   %port5 @TEXT("\textbf{\textit{CLK}}", key="name", dx=-0.5, dy=1, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port5::name(label);
*   #X1 @TEXT("\textbf{\textit{X}}_{\textbf{1}}", key="name", dx=-0.5, dy=-2.9, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #X1::name(label);
*   %wire1 @TEXT("\textbf{\textit{CLKB}}", size=1.5116) => @PLACE(39.43913, -30.6) => %label1;
*   $CANVAS_LABEL @ATTACH(bind="net") %label1(label);
*   &CLKB @TEXT("\textbf{\textit{CLKB}}", size=1.5116) => @PLACE(35.5, -14.5) => %label2;
*   $CANVAS_LABEL @ATTACH(bind="net") %label2(label)
* }
.ends CG_CE

.subckt dut VDD VSS CLK CLKB D NCK I1 I2 I5 Q I3 I7 I4 I8 S3 S4 S5 S6 S7
.model ideal_switch SW(RON=1 ROFF=1e12 VT=0.5 VH=0)
XM1 I1 I4 VDD VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM10 I4 CLK net13 VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM11 I4 CLKB net5 VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM12 net5 I1 VSS VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM13 I3 I6 VDD VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM14 I3 I3b VSS VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM15 net14 I3 VDD VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM16 I3b CLK net14 VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM17 I3b CLKB net6 VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM18 net6 I4 VSS VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM19 I4 I3b VDD VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM2 I1 I1b VSS VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM20 I4 I6 VSS VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM21 net15 I4 VDD VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM22 I6 CLK net15 VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM23 I6 CLKB net7 VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM24 net7 I3 VSS VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM25 I6 I5b VDD VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM26 I6 I8 VSS VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM27 net9 I6 VDD VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM28 I8 CLK net9 VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM29 I8 CLKB net1 VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM3 net8 I1 VDD VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM30 net1 I5 VSS VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM31 I5 I8 VDD VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM32 I5 I5b VSS VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM33 net10 I5 VDD VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM34 I5b CLK net10 VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM35 I5b CLKB net2 VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM36 net2 I6 VSS VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM37 I8 I7b VDD VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM38 I8 I2a VSS VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM39 net11 I8 VDD VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM4 I1b CLK net8 VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM40 I2a CLK net11 VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM41 I2a CLKB net3 VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM42 net3 I7 VSS VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM43 I7 I2a VDD VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM44 I7 I7b VSS VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM45 net12 I7 VDD VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM46 I7b CLK net12 VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM47 I7b CLKB net4 VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM48 net4 I8 VSS VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM5 I1b CLKB net0 VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM6 net0 I2 VSS VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM7 I2 I1b VDD VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM8 I2 I4 VSS VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM9 net13 I2 VDD VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
S1 I2 I2a CLK VSS ideal_switch
S2 I1 D NCK VSS ideal_switch
S3 I2 D S3 VSS ideal_switch
S4 I5 D S4 VSS ideal_switch
S5 Q D S5 VSS ideal_switch
S6 I3 net16 S6 VSS ideal_switch
S7 I7 net16 S7 VSS ideal_switch
X1 D net16 VDD VSS inverter td=10p vt=10m
X2 VDD VSS I4 I8 CLK Q CG_CE
* @RNL(author="analog-canvas") {
*   %dut_SYMBOL = @DEFINE-SYMBOL(box=[-5, -13, 5, 13]) {
*     (0, 13) @PIN(terminal="VDD", label="\textbf{\textit{V}}_{\textbf{DD}}", direction="up");
*     (-5, 8) @PIN(terminal="CLK", label="\textbf{\textit{CLK}}", direction="left");
*     (-5, 6) @PIN(terminal="CLKB", label="\textbf{\textit{CLKB}}", direction="left");
*     (-5, -10) @PIN(terminal="D", label="\textbf{\textit{D}}", direction="left");
*     (-5, -8) @PIN(terminal="NCK", label="\textbf{\textit{NCK}}", direction="left");
*     (-5, 4) @PIN(terminal="I1", label="\textbf{\textit{I}}_{\textbf{1}}", direction="left");
*     (-5, 2) @PIN(terminal="I2", label="\textbf{\textit{I}}_{\textbf{2}}", direction="left");
*     (-5, 0) @PIN(terminal="I5", label="\textbf{\textit{I}}_{\textbf{5}}", direction="left");
*     (-5, -2) @PIN(terminal="Q", label="\textbf{\textit{Q}}", direction="left");
*     (-5, -4) @PIN(terminal="I3", label="\textbf{\textit{I}}_{\textbf{3}}", direction="left");
*     (-5, -6) @PIN(terminal="I7", label="\textbf{\textit{I}}_{\textbf{7}}", direction="left");
*     (5, 0) @PIN(terminal="I4", label="\textbf{\textit{I}}_{\textbf{4}}", direction="right");
*     (5, -2) @PIN(terminal="I8", label="\textbf{\textit{I}}_{\textbf{8}}", direction="right");
*     (0, 0) @RECTANGLE(width=8, height=24);
*     @LINE {(0, 13) (0, 12)};
*     @LINE {(-5, 8) (-4, 8)};
*     @LINE {(-5, 6) (-4, 6)};
*     @LINE {(-5, -10) (-4, -10)};
*     @LINE {(-5, -8) (-4, -8)};
*     @LINE {(-5, 4) (-4, 4)};
*     @LINE {(-5, 2) (-4, 2)};
*     @LINE {(-5, 0) (-4, 0)};
*     @LINE {(-5, -2) (-4, -2)};
*     @LINE {(-5, -4) (-4, -4)};
*     @LINE {(-5, -6) (-4, -6)};
*     @LINE {(5, 0) (4, 0)};
*     @LINE {(5, -2) (4, -2)}
*   };
*   # @SET-SYMBOL %dut_SYMBOL;
*   $CANVAS_TYPESETTING @ATTACH(subscript_italic=false) #(level);
*   #XM1 @SET-SYMBOL $PMOS => @PLACE(48, -14) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M1") #XM1(part);
*   #XM2 @SET-SYMBOL $NMOS => @PLACE(48, -26) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M2") #XM2(part);
*   #XM3 @SET-SYMBOL $PMOS => @PLACE(59, -14) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M3") #XM3(part);
*   #XM4 @SET-SYMBOL $PMOS => @PLACE(59, -18) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M4") #XM4(part);
*   #XM5 @SET-SYMBOL $NMOS => @PLACE(59, -22) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M5") #XM5(part);
*   #XM6 @SET-SYMBOL $NMOS => @PLACE(59, -26) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M6") #XM6(part);
*   #XM7 @SET-SYMBOL $PMOS => @PLACE(70, -14) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M7") #XM7(part);
*   #XM8 @SET-SYMBOL $NMOS => @PLACE(70, -26) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M8") #XM8(part);
*   #XM9 @SET-SYMBOL $PMOS => @PLACE(81, -14) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M9") #XM9(part);
*   #XM10 @SET-SYMBOL $PMOS => @PLACE(81, -18) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M10") #XM10(part);
*   #XM11 @SET-SYMBOL $NMOS => @PLACE(81, -22) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M11") #XM11(part);
*   #XM12 @SET-SYMBOL $NMOS => @PLACE(81, -26) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M12") #XM12(part);
*   $SUPPLY @ATTACH &VDD(p) => @SET-SYMBOL $SUPPLY_SYMBOL => @PLACE(48, -13) => @ORIENT("R0") => %vdd1;
*   $SUPPLY @ATTACH &VDD(p) => @SET-SYMBOL $SUPPLY_SYMBOL => @PLACE(59, -13) => @ORIENT("R0") => %vdd2;
*   $SUPPLY @ATTACH &VDD(p) => @SET-SYMBOL $SUPPLY_SYMBOL => @PLACE(70, -13) => @ORIENT("R0") => %vdd3;
*   $SUPPLY @ATTACH &VDD(p) => @SET-SYMBOL $SUPPLY_SYMBOL => @PLACE(81, -13) => @ORIENT("R0") => %vdd4;
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(48, -27) => @ORIENT("R0") => %gnd1;
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(59, -27) => @ORIENT("R0") => %gnd2;
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(70, -27) => @ORIENT("R0") => %gnd3;
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(81, -27) => @ORIENT("R0") => %gnd4;
*   $IO_PORT @ATTACH &CLK(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(56, -18) => @ORIENT("R0") => %port1;
*   $IO_PORT @ATTACH &CLKB(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(62, -22) => @ORIENT("MY") => %port2;
*   $IO_PORT @ATTACH &CLK(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(78, -18) => @ORIENT("R0") => %port3;
*   $IO_PORT @ATTACH &CLKB(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(84, -22) => @ORIENT("MY") => %port4;
*   #XM13 @SET-SYMBOL $PMOS => @PLACE(98, -14) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M13") #XM13(part);
*   #XM14 @SET-SYMBOL $NMOS => @PLACE(98, -26) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M14") #XM14(part);
*   #XM15 @SET-SYMBOL $PMOS => @PLACE(109, -14) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M15") #XM15(part);
*   #XM16 @SET-SYMBOL $PMOS => @PLACE(109, -18) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M16") #XM16(part);
*   #XM17 @SET-SYMBOL $NMOS => @PLACE(109, -22) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M17") #XM17(part);
*   #XM18 @SET-SYMBOL $NMOS => @PLACE(109, -26) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M18") #XM18(part);
*   #XM19 @SET-SYMBOL $PMOS => @PLACE(120, -14) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M19") #XM19(part);
*   #XM20 @SET-SYMBOL $NMOS => @PLACE(120, -26) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M20") #XM20(part);
*   #XM21 @SET-SYMBOL $PMOS => @PLACE(131, -14) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M21") #XM21(part);
*   #XM22 @SET-SYMBOL $PMOS => @PLACE(131, -18) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M22") #XM22(part);
*   #XM23 @SET-SYMBOL $NMOS => @PLACE(131, -22) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M23") #XM23(part);
*   #XM24 @SET-SYMBOL $NMOS => @PLACE(131, -26) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M24") #XM24(part);
*   $SUPPLY @ATTACH &VDD(p) => @SET-SYMBOL $SUPPLY_SYMBOL => @PLACE(98, -13) => @ORIENT("R0") => %vdd5;
*   $SUPPLY @ATTACH &VDD(p) => @SET-SYMBOL $SUPPLY_SYMBOL => @PLACE(109, -13) => @ORIENT("R0") => %vdd6;
*   $SUPPLY @ATTACH &VDD(p) => @SET-SYMBOL $SUPPLY_SYMBOL => @PLACE(120, -13) => @ORIENT("R0") => %vdd7;
*   $SUPPLY @ATTACH &VDD(p) => @SET-SYMBOL $SUPPLY_SYMBOL => @PLACE(131, -13) => @ORIENT("R0") => %vdd8;
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(98, -27) => @ORIENT("R0") => %gnd5;
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(109, -27) => @ORIENT("R0") => %gnd6;
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(120, -27) => @ORIENT("R0") => %gnd7;
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(131, -27) => @ORIENT("R0") => %gnd8;
*   $IO_PORT @ATTACH &CLK(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(106, -18) => @ORIENT("R0") => %port5;
*   $IO_PORT @ATTACH &CLKB(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(112, -22) => @ORIENT("MY") => %port6;
*   $IO_PORT @ATTACH &CLK(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(128, -18) => @ORIENT("R0") => %port7;
*   $IO_PORT @ATTACH &CLKB(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(134, -22) => @ORIENT("MY") => %port8;
*   #XM25 @SET-SYMBOL $PMOS => @PLACE(131, -43) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M25") #XM25(part);
*   #XM26 @SET-SYMBOL $NMOS => @PLACE(131, -55) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M26") #XM26(part);
*   #XM27 @SET-SYMBOL $PMOS => @PLACE(120, -43) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M27") #XM27(part);
*   #XM28 @SET-SYMBOL $PMOS => @PLACE(120, -47) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M28") #XM28(part);
*   #XM29 @SET-SYMBOL $NMOS => @PLACE(120, -51) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M29") #XM29(part);
*   #XM30 @SET-SYMBOL $NMOS => @PLACE(120, -55) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M30") #XM30(part);
*   #XM31 @SET-SYMBOL $PMOS => @PLACE(109, -43) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M31") #XM31(part);
*   #XM32 @SET-SYMBOL $NMOS => @PLACE(109, -55) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M32") #XM32(part);
*   #XM33 @SET-SYMBOL $PMOS => @PLACE(98, -43) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M33") #XM33(part);
*   #XM34 @SET-SYMBOL $PMOS => @PLACE(98, -47) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M34") #XM34(part);
*   #XM35 @SET-SYMBOL $NMOS => @PLACE(98, -51) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M35") #XM35(part);
*   #XM36 @SET-SYMBOL $NMOS => @PLACE(98, -55) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M36") #XM36(part);
*   $SUPPLY @ATTACH &VDD(p) => @SET-SYMBOL $SUPPLY_SYMBOL => @PLACE(131, -42) => @ORIENT("MY") => %vdd9;
*   $SUPPLY @ATTACH &VDD(p) => @SET-SYMBOL $SUPPLY_SYMBOL => @PLACE(120, -42) => @ORIENT("MY") => %vdd10;
*   $SUPPLY @ATTACH &VDD(p) => @SET-SYMBOL $SUPPLY_SYMBOL => @PLACE(109, -42) => @ORIENT("MY") => %vdd11;
*   $SUPPLY @ATTACH &VDD(p) => @SET-SYMBOL $SUPPLY_SYMBOL => @PLACE(98, -42) => @ORIENT("MY") => %vdd12;
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(131, -56) => @ORIENT("MY") => %gnd9;
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(120, -56) => @ORIENT("MY") => %gnd10;
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(109, -56) => @ORIENT("MY") => %gnd11;
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(98, -56) => @ORIENT("MY") => %gnd12;
*   $IO_PORT @ATTACH &CLK(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(123, -47) => @ORIENT("MY") => %port9;
*   $IO_PORT @ATTACH &CLKB(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(117, -51) => @ORIENT("R0") => %port10;
*   $IO_PORT @ATTACH &CLK(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(101, -47) => @ORIENT("MY") => %port11;
*   $IO_PORT @ATTACH &CLKB(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(95, -51) => @ORIENT("R0") => %port12;
*   #XM37 @SET-SYMBOL $PMOS => @PLACE(81, -43) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M37") #XM37(part);
*   #XM38 @SET-SYMBOL $NMOS => @PLACE(81, -55) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M38") #XM38(part);
*   #XM39 @SET-SYMBOL $PMOS => @PLACE(70, -43) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M39") #XM39(part);
*   #XM40 @SET-SYMBOL $PMOS => @PLACE(70, -47) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M40") #XM40(part);
*   #XM41 @SET-SYMBOL $NMOS => @PLACE(70, -51) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M41") #XM41(part);
*   #XM42 @SET-SYMBOL $NMOS => @PLACE(70, -55) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M42") #XM42(part);
*   #XM43 @SET-SYMBOL $PMOS => @PLACE(59, -43) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M43") #XM43(part);
*   #XM44 @SET-SYMBOL $NMOS => @PLACE(59, -55) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M44") #XM44(part);
*   #XM45 @SET-SYMBOL $PMOS => @PLACE(48, -43) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M45") #XM45(part);
*   #XM46 @SET-SYMBOL $PMOS => @PLACE(48, -47) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M46") #XM46(part);
*   #XM47 @SET-SYMBOL $NMOS => @PLACE(48, -51) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M47") #XM47(part);
*   #XM48 @SET-SYMBOL $NMOS => @PLACE(48, -55) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M48") #XM48(part);
*   $SUPPLY @ATTACH &VDD(p) => @SET-SYMBOL $SUPPLY_SYMBOL => @PLACE(81, -42) => @ORIENT("MY") => %vdd13;
*   $SUPPLY @ATTACH &VDD(p) => @SET-SYMBOL $SUPPLY_SYMBOL => @PLACE(70, -42) => @ORIENT("MY") => %vdd14;
*   $SUPPLY @ATTACH &VDD(p) => @SET-SYMBOL $SUPPLY_SYMBOL => @PLACE(59, -42) => @ORIENT("MY") => %vdd15;
*   $SUPPLY @ATTACH &VDD(p) => @SET-SYMBOL $SUPPLY_SYMBOL => @PLACE(48, -42) => @ORIENT("MY") => %vdd16;
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(81, -56) => @ORIENT("MY") => %gnd13;
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(70, -56) => @ORIENT("MY") => %gnd14;
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(59, -56) => @ORIENT("MY") => %gnd15;
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(48, -56) => @ORIENT("MY") => %gnd16;
*   $IO_PORT @ATTACH &CLK(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(73, -47) => @ORIENT("MY") => %port13;
*   $IO_PORT @ATTACH &CLKB(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(67, -51) => @ORIENT("R0") => %port14;
*   $IO_PORT @ATTACH &CLK(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(51, -47) => @ORIENT("MY") => %port15;
*   $IO_PORT @ATTACH &CLKB(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(45, -51) => @ORIENT("R0") => %port16;
*   #S1 @SET-SYMBOL $EXTERNALLY_CONTROLLED_SWITCH => @PLACE(62, -35) => @ORIENT("MY");
*   $IO_PORT @ATTACH &CLK(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(64, -35) => @ORIENT("MY") => %port17;
*   #S2 @SET-SYMBOL $EXTERNALLY_CONTROLLED_SWITCH => @PLACE(56, -73) => @ORIENT("R0");
*   #S3 @SET-SYMBOL $SWITCH => @PLACE(61, -73) => @ORIENT("MYR90");
*   #S4 @SET-SYMBOL $SWITCH => @PLACE(66, -73) => @ORIENT("MYR90");
*   #S5 @SET-SYMBOL $SWITCH => @PLACE(71, -73) => @ORIENT("MYR90");
*   $IO_PORT @ATTACH &D(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(54, -78) => @ORIENT("R0") => %port18;
*   $IO_PORT @ATTACH &NCK(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(54, -73) => @ORIENT("R0") => %port19;
*   $IO_PORT @ATTACH &I1(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(56, -71) => @ORIENT("R270") => %port20;
*   $IO_PORT @ATTACH &I2(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(61, -71) => @ORIENT("R270") => %port21;
*   $IO_PORT @ATTACH &I5(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(66, -71) => @ORIENT("R270") => %port22;
*   $IO_PORT @ATTACH &Q(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(71, -71) => @ORIENT("R270") => %port23;
*   #X1 @SET-SYMBOL $INVERTER => @PLACE(77, -78) => @ORIENT("R0");
*   #S6 @SET-SYMBOL $SWITCH => @PLACE(81, -73) => @ORIENT("MYR90");
*   #S7 @SET-SYMBOL $SWITCH => @PLACE(87, -73) => @ORIENT("MYR90");
*   $IO_PORT @ATTACH &I3(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(81, -71) => @ORIENT("R270") => %port24;
*   $IO_PORT @ATTACH &I7(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(87, -71) => @ORIENT("R270") => %port25;
*   #X2 @PLACE(111, -75) => @ORIENT("R0");
*   $IO_PORT @ATTACH &I4(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(106, -75) => @ORIENT("R0") => %port26;
*   $IO_PORT @ATTACH &I8(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(106, -77) => @ORIENT("R0") => %port27;
*   $SUPPLY @ATTACH &VDD(p) => @SET-SYMBOL $SUPPLY_SYMBOL => @PLACE(111, -70) => @ORIENT("MY") => %vdd17;
*   $IO_PORT @ATTACH &CLK(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(116, -75) => @ORIENT("MY") => %port28;
*   $IO_PORT @ATTACH &Q(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(116, -77) => @ORIENT("MY") => %port29;
*   &VDD @REMOVE-FROM $PORT_FILL_SET;
*   &VSS @REMOVE-FROM $PORT_FILL_SET;
*   &S3 @REMOVE-FROM $PORT_FILL_SET;
*   &S4 @REMOVE-FROM $PORT_FILL_SET;
*   &S5 @REMOVE-FROM $PORT_FILL_SET;
*   &S6 @REMOVE-FROM $PORT_FILL_SET;
*   &S7 @REMOVE-FROM $PORT_FILL_SET;
*   %j1 = (48, -20);
*   $JUNCTION @ATTACH %j1;
*   %j2 = (70, -20);
*   $JUNCTION @ATTACH %j2;
*   %j3 = (67, -14);
*   %j4 = (98, -20);
*   $JUNCTION @ATTACH %j4;
*   %j5 = (120, -20);
*   $JUNCTION @ATTACH %j5;
*   %j6 = (117, -14);
*   %j7 = (87, -20);
*   $JUNCTION @ATTACH %j7;
*   %j8 = (131, -49);
*   $JUNCTION @ATTACH %j8;
*   %j9 = (109, -49);
*   $JUNCTION @ATTACH %j9;
*   %j10 = (112, -43);
*   %j11 = (117, -55);
*   %j12 = (81, -49);
*   $JUNCTION @ATTACH %j12;
*   %j13 = (59, -49);
*   %j14 = (135, -49);
*   $JUNCTION @ATTACH %j14;
*   %j15 = (137, -20);
*   $JUNCTION @ATTACH %j15;
*   %j16 = (85, -60);
*   $JUNCTION @ATTACH %j16;
*   %j17 = (61, -78);
*   $JUNCTION @ATTACH %j17;
*   %j18 = (66, -78);
*   $JUNCTION @ATTACH %j18;
*   %j19 = (56, -78);
*   $JUNCTION @ATTACH %j19;
*   %j20 = (71, -78);
*   $JUNCTION @ATTACH %j20;
*   %j21 = (81, -78);
*   $JUNCTION @ATTACH %j21;
*   %j22 = (67, -55);
*   %j23 = (59, -49);
*   $JUNCTION @ATTACH %j23;
*   &I1 @WIRE(mode="straight") {#XM2:1 %j1};
*   &I1 @WIRE(mode="straight") {%j1 #XM1:1};
*   &I1 @WIRE(mode="straight") {%j1 (50, -20) #XM3:2} => %wire1;
*   &I1b @WIRE(mode="straight") {#XM2:2 (57, -20) #XM4:1};
*   &I1b @WIRE(mode="straight") {#XM4:1 (61, -20) %j3} => %wire2;
*   &VSS @WIRE(mode="straight") {%gnd1:p #XM2:3};
*   &VSS @WIRE(mode="straight") {%gnd2:p #XM6:3};
*   &VSS @WIRE(mode="straight") {%gnd3:p #XM8:3};
*   &VSS @WIRE(mode="straight") {%gnd4:p #XM12:3};
*   &I1 @WIRE(mode="straight") {#XM12:2 (87, -26) (87, -31) (44, -31) (44, -20) %j1};
*   &I3 @WIRE(mode="straight") {#XM14:1 %j4};
*   &I3 @WIRE(mode="straight") {%j4 #XM13:1};
*   &I3 @WIRE(mode="straight") {%j4 (100, -20) #XM15:2} => %wire3;
*   &I3b @WIRE(mode="straight") {#XM14:2 (107, -20) #XM16:1};
*   &I3b @WIRE(mode="straight") {#XM16:1 (111, -20) %j6} => %wire4;
*   &VSS @WIRE(mode="straight") {%gnd5:p #XM14:3};
*   &VSS @WIRE(mode="straight") {%gnd6:p #XM18:3};
*   &VSS @WIRE(mode="straight") {%gnd7:p #XM20:3};
*   &VSS @WIRE(mode="straight") {%gnd8:p #XM24:3};
*   &I3 @WIRE(mode="straight") {#XM24:2 (137, -26) (137, -31) (94, -31) (94, -20) %j4};
*   &I4 @WIRE(mode="straight") {#XM19:1 %j5};
*   &I4 @WIRE(mode="straight") {%j5 #XM20:1};
*   &I4 @WIRE(mode="straight") {%j5 (122, -20) #XM21:2} => %wire5;
*   &I4 @WIRE(mode="straight") {%j5 (118, -20) (112, -26) (112, -33) (91, -33) (91, -20) %j7};
*   &I4 @WIRE(mode="straight") {#XM1:2 (44, -14) (44, -9) (87, -9) %j7} => %wire6;
*   &I4 @WIRE(mode="straight") {#XM8:2 (79, -20) #XM10:1};
*   &I4 @WIRE(mode="straight") {#XM10:1 %j7};
*   &I5 @WIRE(mode="straight") {%j11 (111, -49) %j9};
*   &I5 @WIRE(mode="straight") {#XM31:1 %j9};
*   &I5 @WIRE(mode="straight") {%j9 #XM32:1};
*   &I5 @WIRE(mode="straight") {%j9 (107, -49) #XM33:2} => %wire7;
*   &VSS @WIRE(mode="straight") {%gnd9:p #XM26:3};
*   &VSS @WIRE(mode="straight") {%gnd10:p #XM30:3};
*   &VSS @WIRE(mode="straight") {%gnd11:p #XM32:3};
*   &VSS @WIRE(mode="straight") {%gnd12:p #XM36:3};
*   &I7b @WIRE(mode="straight") {#XM46:1 (50, -49) #XM44:2};
*   &VSS @WIRE(mode="straight") {%gnd13:p #XM38:3};
*   &VSS @WIRE(mode="straight") {%gnd14:p #XM42:3};
*   &VSS @WIRE(mode="straight") {%gnd15:p #XM44:3};
*   &VSS @WIRE(mode="straight") {%gnd16:p #XM48:3};
*   &I7b @WIRE(mode="straight") {#XM37:2 (85, -43) (85, -38) (42, -38) (42, -49) #XM46:1} => %wire8;
*   &I7 @WIRE(mode="straight") {#XM43:1 %j13};
*   &I7 @WIRE(mode="straight") {%j13 #XM44:1};
*   &I7 @WIRE(mode="straight") {%j13 (57, -49) #XM45:2} => %wire9;
*   &I6 @WIRE(mode="straight") {#XM20:2 (129, -20) #XM22:1};
*   &I6 @WIRE(mode="straight") {#XM27:2 (129, -49) %j8};
*   &I6 @WIRE(mode="straight") {#XM22:1 %j15};
*   &I6 @WIRE(mode="straight") {#XM25:1 %j8};
*   &I6 @WIRE(mode="straight") {%j8 #XM26:1};
*   &I6 @WIRE(mode="straight") {%j8 %j14};
*   &I6 @WIRE(mode="straight") {%j15 (141, -20) (141, -49) %j14};
*   &I6 @WIRE(mode="straight") {%j15 (137, -9) (94, -9) (94, -14) #XM13:2} => %wire10;
*   &I6 @WIRE(mode="straight") {%j14 (135, -60) (92, -60) (92, -55) #XM36:2};
*   &I5b @WIRE(mode="straight") {#XM34:1 (100, -49) #XM32:2};
*   &I5b @WIRE(mode="straight") {#XM34:1 (92, -49) (92, -38) (135, -38) (135, -43) #XM25:2} => %wire11;
*   &I8 @WIRE(mode="straight") {%j10 (118, -49) #XM28:1} => %wire12;
*   &I8 @WIRE(mode="straight") {#XM28:1 (122, -49) #XM26:2};
*   &I8 @WIRE(mode="straight") {#XM26:2 (128, -63) (85, -63) %j16};
*   &I8 @WIRE(mode="straight") {#XM48:2 (42, -55) (42, -60) %j16};
*   &I8 @WIRE(mode="straight") {#XM39:2 (79, -49) %j12} => %wire13;
*   &I8 @WIRE(mode="straight") {#XM37:1 %j12};
*   &I8 @WIRE(mode="straight") {%j12 #XM38:1};
*   &I8 @WIRE(mode="straight") {%j12 (85, -49) %j16};
*   &I2 @WIRE(mode="straight") {#S1:1 (62, -26) (68, -20) %j2};
*   &I2 @WIRE(mode="straight") {#XM7:1 %j2};
*   &I2 @WIRE(mode="straight") {%j2 #XM8:1};
*   &I2 @WIRE(mode="straight") {%j2 (72, -20) #XM9:2} => %wire14;
*   &I2a @WIRE(mode="straight") {#S1:2 (62, -43) (68, -49) #XM40:1} => %wire15;
*   &I2a @WIRE(mode="straight") {#XM40:1 (72, -49) #XM38:2};
*   &D @WIRE(mode="straight") {%port18:p %j19};
*   &D @WIRE(mode="straight") {#S2:2 %j19};
*   &D @WIRE(mode="straight") {%j19 %j17};
*   &D @WIRE(mode="straight") {#S3:2 %j17};
*   &D @WIRE(mode="straight") {%j17 %j18};
*   &D @WIRE(mode="straight") {#S4:2 %j18};
*   &D @WIRE(mode="straight") {%j18 %j20};
*   &D @WIRE(mode="straight") {#S5:2 %j20};
*   &D @WIRE(mode="straight") {%j20 #X1:1};
*   &net16 @WIRE(mode="straight") {#X1:2 %j21};
*   &net16 @WIRE(mode="straight") {%j21 #S6:2};
*   &net16 @WIRE(mode="straight") {%j21 (87, -78) #S7:2};
*   &VDD @WIRE(mode="straight") {#XM1:3 %vdd1:p};
*   &VDD @WIRE(mode="straight") {#XM19:3 %vdd7:p};
*   &VDD @WIRE(mode="straight") {#XM21:3 %vdd8:p};
*   &VDD @WIRE(mode="straight") {#XM25:3 %vdd9:p};
*   &VDD @WIRE(mode="straight") {#XM43:3 %vdd15:p};
*   &VDD @WIRE(mode="straight") {#XM45:3 %vdd16:p};
*   &VDD @WIRE(mode="straight") {#XM27:3 %vdd10:p};
*   &VDD @WIRE(mode="straight") {#XM31:3 %vdd11:p};
*   &VDD @WIRE(mode="straight") {#XM3:3 %vdd2:p};
*   &VDD @WIRE(mode="straight") {#XM33:3 %vdd12:p};
*   &VDD @WIRE(mode="straight") {#XM37:3 %vdd13:p};
*   &VDD @WIRE(mode="straight") {#XM39:3 %vdd14:p};
*   &VDD @WIRE(mode="straight") {#XM7:3 %vdd3:p};
*   &VDD @WIRE(mode="straight") {#XM9:3 %vdd4:p};
*   &VDD @WIRE(mode="straight") {#XM13:3 %vdd5:p};
*   &VDD @WIRE(mode="straight") {#XM15:3 %vdd6:p};
*   &I7 @WIRE(mode="straight") {%j22 (65, -55) %j23};
*   &I1b @WIRE(mode="straight") {#XM4:1 #XM5:1};
*   $JUNCTION @ATTACH (59, -20)(p) => %dot1;
*   &I1b @WIRE(mode="straight") {%j3 #XM7:2};
*   &I8 @WIRE(mode="straight") {%j10 #XM31:2};
*   &I8 @WIRE(mode="straight") {#XM28:1 #XM29:1};
*   $JUNCTION @ATTACH (120, -49)(p) => %dot2;
*   $JUNCTION @ATTACH (128, -55)(p) => %dot3;
*   &I5 @WIRE(mode="straight") {%j11 #XM30:2};
*   &I7 @WIRE(mode="straight") {%j23 %j13};
*   &I7 @WIRE(mode="straight") {%j22 #XM42:2};
*   $JUNCTION @ATTACH (62, -43)(p) => %dot4;
*   &I2a @WIRE(mode="straight") {#XM40:1 #XM41:1};
*   $JUNCTION @ATTACH (70, -49)(p) => %dot5;
*   &I7b @WIRE(mode="straight") {#XM46:1 #XM47:1};
*   $JUNCTION @ATTACH (48, -49)(p) => %dot6;
*   $JUNCTION @ATTACH (62, -26)(p) => %dot7;
*   &I4 @WIRE(mode="straight") {#XM10:1 #XM11:1};
*   $JUNCTION @ATTACH (81, -20)(p) => %dot8;
*   $JUNCTION @ATTACH (112, -26)(p) => %dot9;
*   &I3b @WIRE(mode="straight") {#XM16:1 #XM17:1};
*   $JUNCTION @ATTACH (109, -20)(p) => %dot10;
*   &I3b @WIRE(mode="straight") {%j6 #XM19:2};
*   &I6 @WIRE(mode="straight") {#XM22:1 #XM23:1};
*   $JUNCTION @ATTACH (131, -20)(p) => %dot11;
*   &net0 @WIRE(mode="straight") {#XM5:3 #XM6:1};
*   &net1 @WIRE(mode="straight") {#XM29:3 #XM30:1};
*   &net2 @WIRE(mode="straight") {#XM35:3 #XM36:1};
*   &net3 @WIRE(mode="straight") {#XM41:3 #XM42:1};
*   &net4 @WIRE(mode="straight") {#XM47:3 #XM48:1};
*   &net5 @WIRE(mode="straight") {#XM11:3 #XM12:1};
*   &net6 @WIRE(mode="straight") {#XM17:3 #XM18:1};
*   &net7 @WIRE(mode="straight") {#XM23:3 #XM24:1};
*   &net8 @WIRE(mode="straight") {#XM3:1 #XM4:3};
*   &net9 @WIRE(mode="straight") {#XM27:1 #XM28:3};
*   &net10 @WIRE(mode="straight") {#XM33:1 #XM34:3};
*   &net11 @WIRE(mode="straight") {#XM39:1 #XM40:3};
*   &net12 @WIRE(mode="straight") {#XM45:1 #XM46:3};
*   &net13 @WIRE(mode="straight") {#XM9:1 #XM10:3};
*   &net14 @WIRE(mode="straight") {#XM15:1 #XM16:3};
*   &net15 @WIRE(mode="straight") {#XM21:1 #XM22:3};
*   &I5b @WIRE(mode="straight") {#XM34:1 #XM35:1};
*   $JUNCTION @ATTACH (98, -49)(p) => %dot12;
*   &VDD @WIRE(mode="straight") {%vdd17:p #X2:1};
*   &CLK @WIRE(mode="straight") {#XM4:2 %port1:p};
*   &CLKB @WIRE(mode="straight") {#XM23:2 %port8:p};
*   &Q @WIRE(mode="straight") {%port29:p #X2:6};
*   &CLK @WIRE(mode="straight") {#XM28:2 %port9:p};
*   &CLKB @WIRE(mode="straight") {#XM47:2 %port16:p};
*   &CLKB @WIRE(mode="straight") {#XM29:2 %port10:p};
*   &CLK @WIRE(mode="straight") {#XM34:2 %port11:p};
*   &CLKB @WIRE(mode="straight") {#XM35:2 %port12:p};
*   &CLK @WIRE(mode="straight") {#XM40:2 %port13:p};
*   &CLKB @WIRE(mode="straight") {#XM41:2 %port14:p};
*   &CLKB @WIRE(mode="straight") {#XM5:2 %port2:p};
*   &CLK @WIRE(mode="straight") {#XM46:2 %port15:p};
*   &CLK @WIRE(mode="straight") {#XM10:2 %port3:p};
*   &CLKB @WIRE(mode="straight") {#XM11:2 %port4:p};
*   &CLK @WIRE(mode="straight") {%port17:p #S1:3};
*   &CLK @WIRE(mode="straight") {%port28:p #X2:5};
*   &CLK @WIRE(mode="straight") {#XM16:2 %port5:p};
*   &CLKB @WIRE(mode="straight") {#XM17:2 %port6:p};
*   &CLK @WIRE(mode="straight") {#XM22:2 %port7:p};
*   &NCK @WIRE(mode="straight") {%port19:p #S2:3};
*   &I1 @WIRE(mode="straight") {%port20:p #S2:1};
*   &I2 @WIRE(mode="straight") {%port21:p #S3:1};
*   &I5 @WIRE(mode="straight") {%port22:p #S4:1};
*   &I3 @WIRE(mode="straight") {%port24:p #S6:1};
*   &I7 @WIRE(mode="straight") {%port25:p #S7:1};
*   &I4 @WIRE(mode="straight") {%port26:p #X2:3};
*   &I8 @WIRE(mode="straight") {%port27:p #X2:4};
*   &Q @WIRE(mode="straight") {%port23:p #S5:1};
*   #XM1 @TEXT("\textbf{\textit{M}}_{\textbf{1}}", key="name", dx=0.4, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM1::name(label);
*   #XM2 @TEXT("\textbf{\textit{M}}_{\textbf{2}}", key="name", dx=-0.5, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM2::name(label);
*   #XM3 @TEXT("\textbf{\textit{M}}_{\textbf{3}}", key="name", dx=0.4, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM3::name(label);
*   #XM4 @TEXT("\textbf{\textit{M}}_{\textbf{4}}", key="name", dx=0.4, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM4::name(label);
*   #XM5 @TEXT("\textbf{\textit{M}}_{\textbf{5}}", key="name", dx=-0.5, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM5::name(label);
*   #XM6 @TEXT("\textbf{\textit{M}}_{\textbf{6}}", key="name", dx=-0.5, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM6::name(label);
*   #XM7 @TEXT("\textbf{\textit{M}}_{\textbf{7}}", key="name", dx=0.4, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM7::name(label);
*   #XM8 @TEXT("\textbf{\textit{M}}_{\textbf{8}}", key="name", dx=-0.5, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM8::name(label);
*   #XM9 @TEXT("\textbf{\textit{M}}_{\textbf{9}}", key="name", dx=0.4, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM9::name(label);
*   #XM10 @TEXT("\textbf{\textit{M}}_{\textbf{10}}", key="name", dx=0.4, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM10::name(label);
*   #XM11 @TEXT("\textbf{\textit{M}}_{\textbf{11}}", key="name", dx=-0.5, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM11::name(label);
*   #XM12 @TEXT("\textbf{\textit{M}}_{\textbf{12}}", key="name", dx=-0.5, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM12::name(label);
*   %vdd1 @TEXT("\textbf{\textit{V}}_{\textbf{DD}}", dx=2, dy=1, size=1.5116) => %power1;
*   $CANVAS_LABEL @ATTACH(bind="port") %power1(label);
*   %vdd2 @TEXT("\textbf{\textit{V}}_{\textbf{DD}}", dx=2, dy=1, size=1.5116) => %power2;
*   $CANVAS_LABEL @ATTACH(bind="port") %power2(label);
*   %vdd3 @TEXT("\textbf{\textit{V}}_{\textbf{DD}}", dx=2, dy=1, size=1.5116) => %power3;
*   $CANVAS_LABEL @ATTACH(bind="port") %power3(label);
*   %vdd4 @TEXT("\textbf{\textit{V}}_{\textbf{DD}}", dx=2, dy=1, size=1.5116) => %power4;
*   $CANVAS_LABEL @ATTACH(bind="port") %power4(label);
*   %wire1 @TEXT("\textbf{\textit{I1}}", size=1.5116) => @PLACE(49, -22) => %label1;
*   $CANVAS_LABEL @ATTACH(bind="net") %label1(label);
*   %port1 @TEXT("\textbf{\textit{CLK}}", key="name", dx=-1, dy=-1.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port1::name(label);
*   %wire2 @TEXT("\textbf{\textit{I1b}}", size=1.5116) => @PLACE(65, -17) => %label2;
*   $CANVAS_LABEL @ATTACH(bind="net") %label2(label);
*   %port2 @TEXT("\textbf{\textit{CLKB}}", key="name", dx=0, dy=1, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port2::name(label);
*   %wire14 @TEXT("\textbf{\textit{I2}}", size=1.5116) => @PLACE(70.5, -18.5) => %label3;
*   $CANVAS_LABEL @ATTACH(bind="net") %label3(label);
*   %port3 @TEXT("\textbf{\textit{CLK}}", key="name", dx=-1.5, dy=-2, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port3::name(label);
*   %wire6 @TEXT("\textbf{\textit{I4}}", size=1.5116) => @PLACE(87.5, -18.5) => %label4;
*   $CANVAS_LABEL @ATTACH(bind="net") %label4(label);
*   %port4 @TEXT("\textbf{\textit{CLKB}}", key="name", dx=1.5, dy=0, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port4::name(label);
*   #XM13 @TEXT("\textbf{\textit{M}}_{\textbf{13}}", key="name", dx=0.4, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM13::name(label);
*   #XM14 @TEXT("\textbf{\textit{M}}_{\textbf{14}}", key="name", dx=-0.5, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM14::name(label);
*   #XM15 @TEXT("\textbf{\textit{M}}_{\textbf{15}}", key="name", dx=0.4, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM15::name(label);
*   #XM16 @TEXT("\textbf{\textit{M}}_{\textbf{16}}", key="name", dx=0.5, dy=0, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM16::name(label);
*   #XM17 @TEXT("\textbf{\textit{M}}_{\textbf{17}}", key="name", dx=-0.5, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM17::name(label);
*   #XM18 @TEXT("\textbf{\textit{M}}_{\textbf{18}}", key="name", dx=-0.5, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM18::name(label);
*   #XM19 @TEXT("\textbf{\textit{M}}_{\textbf{19}}", key="name", dx=0.4, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM19::name(label);
*   #XM20 @TEXT("\textbf{\textit{M}}_{\textbf{20}}", key="name", dx=-0.5, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM20::name(label);
*   #XM21 @TEXT("\textbf{\textit{M}}_{\textbf{21}}", key="name", dx=0.4, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM21::name(label);
*   #XM22 @TEXT("\textbf{\textit{M}}_{\textbf{22}}", key="name", dx=0.4, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM22::name(label);
*   #XM23 @TEXT("\textbf{\textit{M}}_{\textbf{23}}", key="name", dx=-0.5, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM23::name(label);
*   #XM24 @TEXT("\textbf{\textit{M}}_{\textbf{24}}", key="name", dx=-0.5, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM24::name(label);
*   %vdd5 @TEXT("\textbf{\textit{V}}_{\textbf{DD}}", dx=2, dy=1, size=1.5116) => %power5;
*   $CANVAS_LABEL @ATTACH(bind="port") %power5(label);
*   %vdd6 @TEXT("\textbf{\textit{V}}_{\textbf{DD}}", dx=2, dy=1, size=1.5116) => %power6;
*   $CANVAS_LABEL @ATTACH(bind="port") %power6(label);
*   %vdd7 @TEXT("\textbf{\textit{V}}_{\textbf{DD}}", dx=2, dy=1, size=1.5116) => %power7;
*   $CANVAS_LABEL @ATTACH(bind="port") %power7(label);
*   %vdd8 @TEXT("\textbf{\textit{V}}_{\textbf{DD}}", dx=2, dy=1, size=1.5116) => %power8;
*   $CANVAS_LABEL @ATTACH(bind="port") %power8(label);
*   %wire3 @TEXT("\textbf{\textit{I3}}", size=1.5116) => @PLACE(99, -22) => %label5;
*   $CANVAS_LABEL @ATTACH(bind="net") %label5(label);
*   %port5 @TEXT("\textbf{\textit{CLK}}", key="name", dx=-1, dy=-1.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port5::name(label);
*   %wire4 @TEXT("\textbf{\textit{I3b}}", size=1.5116) => @PLACE(115, -17) => %label6;
*   $CANVAS_LABEL @ATTACH(bind="net") %label6(label);
*   %port6 @TEXT("\textbf{\textit{CLKB}}", key="name", dx=0, dy=1, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port6::name(label);
*   %wire5 @TEXT("\textbf{\textit{I4}}", size=1.5116) => @PLACE(120.5, -18.5) => %label7;
*   $CANVAS_LABEL @ATTACH(bind="net") %label7(label);
*   %port7 @TEXT("\textbf{\textit{CLK}}", key="name", dx=-1.5, dy=-2, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port7::name(label);
*   %wire10 @TEXT("\textbf{\textit{I6}}", size=1.5116) => @PLACE(138.5, -19.5) => %label8;
*   $CANVAS_LABEL @ATTACH(bind="net") %label8(label);
*   %port8 @TEXT("\textbf{\textit{CLKB}}", key="name", dx=1.5, dy=0, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port8::name(label);
*   #XM25 @TEXT("\textbf{\textit{M}}_{\textbf{25}}", key="name", dx=-0.4, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM25::name(label);
*   #XM26 @TEXT("\textbf{\textit{M}}_{\textbf{26}}", key="name", dx=0.5, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM26::name(label);
*   #XM27 @TEXT("\textbf{\textit{M}}_{\textbf{27}}", key="name", dx=-0.4, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM27::name(label);
*   #XM28 @TEXT("\textbf{\textit{M}}_{\textbf{28}}", key="name", dx=-0.4, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM28::name(label);
*   #XM29 @TEXT("\textbf{\textit{M}}_{\textbf{29}}", key="name", dx=0.5, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM29::name(label);
*   #XM30 @TEXT("\textbf{\textit{M}}_{\textbf{30}}", key="name", dx=0.5, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM30::name(label);
*   #XM31 @TEXT("\textbf{\textit{M}}_{\textbf{31}}", key="name", dx=-0.4, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM31::name(label);
*   #XM32 @TEXT("\textbf{\textit{M}}_{\textbf{32}}", key="name", dx=0.5, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM32::name(label);
*   #XM33 @TEXT("\textbf{\textit{M}}_{\textbf{33}}", key="name", dx=-0.4, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM33::name(label);
*   #XM34 @TEXT("\textbf{\textit{M}}_{\textbf{34}}", key="name", dx=-0.4, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM34::name(label);
*   #XM35 @TEXT("\textbf{\textit{M}}_{\textbf{35}}", key="name", dx=0.5, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM35::name(label);
*   #XM36 @TEXT("\textbf{\textit{M}}_{\textbf{36}}", key="name", dx=0.5, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM36::name(label);
*   %vdd9 @TEXT("\textbf{\textit{V}}_{\textbf{DD}}", dx=-2, dy=1, halign="end", size=1.5116) => %power9;
*   $CANVAS_LABEL @ATTACH(bind="port") %power9(label);
*   %vdd10 @TEXT("\textbf{\textit{V}}_{\textbf{DD}}", dx=-2, dy=1, halign="end", size=1.5116) => %power10;
*   $CANVAS_LABEL @ATTACH(bind="port") %power10(label);
*   %vdd11 @TEXT("\textbf{\textit{V}}_{\textbf{DD}}", dx=-2, dy=1, halign="end", size=1.5116) => %power11;
*   $CANVAS_LABEL @ATTACH(bind="port") %power11(label);
*   %vdd12 @TEXT("\textbf{\textit{V}}_{\textbf{DD}}", dx=-2, dy=1, halign="end", size=1.5116) => %power12;
*   $CANVAS_LABEL @ATTACH(bind="port") %power12(label);
*   %port9 @TEXT("\textbf{\textit{CLK}}", key="name", dx=1, dy=-1.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port9::name(label);
*   %wire12 @TEXT("\textbf{\textit{I8}}", halign="end", size=1.5116) => @PLACE(115, -44.5) => %label9;
*   $CANVAS_LABEL @ATTACH(bind="net") %label9(label);
*   %port10 @TEXT("\textbf{\textit{CLKB}}", key="name", dx=0, dy=1, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port10::name(label);
*   %wire7 @TEXT("\textbf{\textit{I5}}", halign="end", size=1.5116) => @PLACE(108.5, -47.5) => %label10;
*   $CANVAS_LABEL @ATTACH(bind="net") %label10(label);
*   %port11 @TEXT("\textbf{\textit{CLK}}", key="name", dx=1.5, dy=-2, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port11::name(label);
*   %wire11 @TEXT("\textbf{\textit{I5b}}", halign="end", size=1.5116) => @PLACE(91, -48) => %label11;
*   $CANVAS_LABEL @ATTACH(bind="net") %label11(label);
*   %port12 @TEXT("\textbf{\textit{CLKB}}", key="name", dx=-1.5, dy=0, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port12::name(label);
*   #XM37 @TEXT("\textbf{\textit{M}}_{\textbf{37}}", key="name", dx=-0.4, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM37::name(label);
*   #XM38 @TEXT("\textbf{\textit{M}}_{\textbf{38}}", key="name", dx=0.5, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM38::name(label);
*   #XM39 @TEXT("\textbf{\textit{M}}_{\textbf{39}}", key="name", dx=-0.4, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM39::name(label);
*   #XM40 @TEXT("\textbf{\textit{M}}_{\textbf{40}}", key="name", dx=-0.5, dy=0, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM40::name(label);
*   #XM41 @TEXT("\textbf{\textit{M}}_{\textbf{41}}", key="name", dx=0.5, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM41::name(label);
*   #XM42 @TEXT("\textbf{\textit{M}}_{\textbf{42}}", key="name", dx=0.5, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM42::name(label);
*   #XM43 @TEXT("\textbf{\textit{M}}_{\textbf{43}}", key="name", dx=-0.4, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM43::name(label);
*   #XM44 @TEXT("\textbf{\textit{M}}_{\textbf{44}}", key="name", dx=0.5, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM44::name(label);
*   #XM45 @TEXT("\textbf{\textit{M}}_{\textbf{45}}", key="name", dx=-0.4, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM45::name(label);
*   #XM46 @TEXT("\textbf{\textit{M}}_{\textbf{46}}", key="name", dx=-0.4, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM46::name(label);
*   #XM47 @TEXT("\textbf{\textit{M}}_{\textbf{47}}", key="name", dx=0.5, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM47::name(label);
*   #XM48 @TEXT("\textbf{\textit{M}}_{\textbf{48}}", key="name", dx=0.5, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM48::name(label);
*   %vdd13 @TEXT("\textbf{\textit{V}}_{\textbf{DD}}", dx=-2, dy=1, halign="end", size=1.5116) => %power13;
*   $CANVAS_LABEL @ATTACH(bind="port") %power13(label);
*   %vdd14 @TEXT("\textbf{\textit{V}}_{\textbf{DD}}", dx=-2, dy=1, halign="end", size=1.5116) => %power14;
*   $CANVAS_LABEL @ATTACH(bind="port") %power14(label);
*   %vdd15 @TEXT("\textbf{\textit{V}}_{\textbf{DD}}", dx=-2, dy=1, halign="end", size=1.5116) => %power15;
*   $CANVAS_LABEL @ATTACH(bind="port") %power15(label);
*   %vdd16 @TEXT("\textbf{\textit{V}}_{\textbf{DD}}", dx=-2, dy=1, halign="end", size=1.5116) => %power16;
*   $CANVAS_LABEL @ATTACH(bind="port") %power16(label);
*   %wire13 @TEXT("\textbf{\textit{I8}}", halign="end", size=1.5116) => @PLACE(80, -47) => %label12;
*   $CANVAS_LABEL @ATTACH(bind="net") %label12(label);
*   %port13 @TEXT("\textbf{\textit{CLK}}", key="name", dx=1, dy=-1.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port13::name(label);
*   %wire15 @TEXT("\textbf{\textit{I2a}}", halign="end", size=1.5116) => @PLACE(64, -47) => %label13;
*   $CANVAS_LABEL @ATTACH(bind="net") %label13(label);
*   %port14 @TEXT("\textbf{\textit{CLKB}}", key="name", dx=0, dy=1, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port14::name(label);
*   %wire9 @TEXT("\textbf{\textit{I7}}", halign="end", size=1.5116) => @PLACE(58.5, -47.5) => %label14;
*   $CANVAS_LABEL @ATTACH(bind="net") %label14(label);
*   %port15 @TEXT("\textbf{\textit{CLK}}", key="name", dx=1.5, dy=-2, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port15::name(label);
*   %wire8 @TEXT("\textbf{\textit{I7b}}", halign="end", size=1.5116) => @PLACE(41.5, -47.5) => %label15;
*   $CANVAS_LABEL @ATTACH(bind="net") %label15(label);
*   %port16 @TEXT("\textbf{\textit{CLKB}}", key="name", dx=-1.5, dy=0, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port16::name(label);
*   %port17 @TEXT("\textbf{\textit{CLK}}", key="name", dx=1.5, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port17::name(label);
*   #S2 @TEXT("\textbf{\textit{S}}_{\textbf{2}}", key="name", dx=1.5, dy=-0.5, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #S2::name(label);
*   #S3 @TEXT("\textbf{\textit{S}}_{\textbf{3}}", key="name", dx=0.7, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #S3::name(label);
*   #S4 @TEXT("\textbf{\textit{S}}_{\textbf{4}}", key="name", dx=0.7, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #S4::name(label);
*   #S5 @TEXT("\textbf{\textit{S}}_{\textbf{5}}", key="name", dx=0.7, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #S5::name(label);
*   %port18 @TEXT("\textbf{\textit{D}}", key="name", dx=-2, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port18::name(label);
*   %port19 @TEXT("\textbf{\textit{NCK}}", key="name", dx=-2, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port19::name(label);
*   %port20 @TEXT("\textbf{\textit{I}}_{\textbf{1}}", key="name", dx=0, dy=1.9, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port20::name(label);
*   %port21 @TEXT("\textbf{\textit{I}}_{\textbf{2}}", key="name", dx=0, dy=1.9, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port21::name(label);
*   %port22 @TEXT("\textbf{\textit{I}}_{\textbf{5}}", key="name", dx=0, dy=1.9, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port22::name(label);
*   %port23 @TEXT("\textbf{\textit{Q}}", key="name", dx=0, dy=1.9, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port23::name(label);
*   #X1 @TEXT("\textbf{\textit{X}}_{\textbf{1}}", key="name", dx=-0.5, dy=-2.9, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #X1::name(label);
*   #S6 @TEXT("\textbf{\textit{S}}_{\textbf{6}}", key="name", dx=0.7, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #S6::name(label);
*   #S7 @TEXT("\textbf{\textit{S}}_{\textbf{7}}", key="name", dx=0.7, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #S7::name(label);
*   %port24 @TEXT("\textbf{\textit{I}}_{\textbf{3}}", key="name", dx=0, dy=1.9, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port24::name(label);
*   %port25 @TEXT("\textbf{\textit{I}}_{\textbf{7}}", key="name", dx=0, dy=1.9, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port25::name(label);
*   #X2 @TEXT("\textbf{CG-CE}", key="value", dx=0, dy=-6.5, halign="middle", valign="baseline", size=1.5116);
*   %port26 @TEXT("\textbf{\textit{I}}_{\textbf{4}}", key="name", dx=-2, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port26::name(label);
*   %port27 @TEXT("\textbf{\textit{I}}_{\textbf{8}}", key="name", dx=-2, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port27::name(label);
*   %vdd17 @TEXT("\textbf{\textit{V}}_{\textbf{DD}}", dx=1, dy=3, halign="end", size=1.5116) => %power17;
*   $CANVAS_LABEL @ATTACH(bind="port") %power17(label);
*   %port28 @TEXT("\textbf{\textit{CLK}}", key="name", dx=2, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port28::name(label);
*   %port29 @TEXT("\textbf{\textit{Q}}", key="name", dx=2, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port29::name(label)
* }
.ends dut
