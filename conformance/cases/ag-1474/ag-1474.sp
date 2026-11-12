
* @RNL(type="header") {
*   @VERSION("0.3");
*   @USE-PACKAGE(name="rnl-std", version="0.3");
*   @USE-PACKAGE(name="rnl-std-no-labels", version="0.3");
*   @USE-PACKAGE(name="analog-canvas-extensions", version="0.6")
* }
.subckt opamp VDD VSS VB4 VB2 VB1 INP INN OUT
XM1 net7 VB2 VDD VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM10 net8 VB4 net6 VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM11 OUT VB4 net3 VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM12 net0 net5 VSS VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM13 net2 net5 VSS VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM14 net6 net8 VSS VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM15 net3 net8 VSS VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM2 net5 INP net7 net9 sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM3 net8 INN net7 net9 sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM4 net4 VP VDD VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM5 net1 VP VDD VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM6 VP VB1 net4 VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM7 OUT VB1 net1 VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM8 VP VB4 net0 VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM9 net5 VB4 net2 VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
* @RNL(author="analog-canvas") {
*   %opamp_SYMBOL = @DEFINE-SYMBOL(box=[-6, -7, 6, 7]) {
*     (0, 7) @PIN(terminal="VDD", label="\textbf{\textit{V}}_{\textbf{DD}}", direction="up");
*     (3, -7) @PIN(terminal="VB4", label="\textbf{\textit{V}}_{\textbf{B4}}", direction="down");
*     (0, -7) @PIN(terminal="VB2", label="\textbf{\textit{V}}_{\textbf{B2}}", direction="down");
*     (-3, -7) @PIN(terminal="VB1", label="\textbf{\textit{V}}_{\textbf{B1}}", direction="down");
*     (-6, -2) @PIN(terminal="INP", label="\textbf{\textit{INP}}", direction="left");
*     (-6, 2) @PIN(terminal="INN", label="\textbf{\textit{INN}}", direction="left");
*     (6, 0) @PIN(terminal="OUT", label="\textbf{\textit{OUT}}", direction="right");
*     (0, 0) @RECTANGLE(width=10, height=12);
*     @LINE {(0, 7) (0, 6)};
*     @LINE {(3, -7) (3, -6)};
*     @LINE {(0, -7) (0, -6)};
*     @LINE {(-3, -7) (-3, -6)};
*     @LINE {(-6, -2) (-5, -2)};
*     @LINE {(-6, 2) (-5, 2)};
*     @LINE {(6, 0) (5, 0)}
*   };
*   # @SET-SYMBOL %opamp_SYMBOL;
*   $CANVAS_TYPESETTING @ATTACH(subscript_italic=false) #(level);
*   #XM1 @SET-SYMBOL $PMOS => @PLACE(29, -4) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M1") #XM1(part);
*   #XM2 @SET-SYMBOL $PMOS_4TERM => @PLACE(23, -12) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M2") #XM2(part);
*   #XM3 @SET-SYMBOL $PMOS_4TERM => @PLACE(39, -12) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M3") #XM3(part);
*   #XM4 @SET-SYMBOL $PMOS => @PLACE(11, -4) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M4") #XM4(part);
*   #XM6 @SET-SYMBOL $PMOS => @PLACE(11, -10) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M6") #XM6(part);
*   #XM5 @SET-SYMBOL $PMOS => @PLACE(51, -4) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M5") #XM5(part);
*   #XM7 @SET-SYMBOL $PMOS => @PLACE(51, -10) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M7") #XM7(part);
*   #XM8 @SET-SYMBOL $NMOS => @PLACE(11, -20) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M8") #XM8(part);
*   #XM12 @SET-SYMBOL $NMOS => @PLACE(11, -26) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M12") #XM12(part);
*   #XM9 @SET-SYMBOL $NMOS => @PLACE(23, -20) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M9") #XM9(part);
*   #XM13 @SET-SYMBOL $NMOS => @PLACE(23, -26) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M13") #XM13(part);
*   #XM10 @SET-SYMBOL $NMOS => @PLACE(39, -20) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M10") #XM10(part);
*   #XM14 @SET-SYMBOL $NMOS => @PLACE(39, -26) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M14") #XM14(part);
*   #XM11 @SET-SYMBOL $NMOS => @PLACE(51, -20) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M11") #XM11(part);
*   #XM15 @SET-SYMBOL $NMOS => @PLACE(51, -26) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M15") #XM15(part);
*   $SUPPLY @ATTACH &VDD(p) => @SET-SYMBOL $SUPPLY_SYMBOL => @PLACE(25, 0) => @ORIENT("R0") => %vdd1;
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(11, -30) => @ORIENT("R0") => %gnd1;
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(23, -30) => @ORIENT("R0") => %gnd2;
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(39, -30) => @ORIENT("R0") => %gnd3;
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(51, -30) => @ORIENT("R0") => %gnd4;
*   $IO_PORT @ATTACH &VB4(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(5, -20) => @ORIENT("R0") => %port1;
*   $IO_PORT @ATTACH &VB2(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(23, -4) => @ORIENT("R0") => %port2;
*   $IO_PORT @ATTACH &VB1(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(57, -10) => @ORIENT("MY") => %port3;
*   $IO_PORT @ATTACH &INP(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(17, -12) => @ORIENT("R0") => %port4;
*   $IO_PORT @ATTACH &INN(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(44, -12) => @ORIENT("MY") => %port5;
*   $IO_PORT @ATTACH &OUT(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(58, -15) => @ORIENT("MY") => %port6;
*   &VDD @REMOVE-FROM $PORT_FILL_SET;
*   &VSS @REMOVE-FROM $PORT_FILL_SET;
*   %j1 = (29, 0);
*   $JUNCTION @ATTACH %j1;
*   %j2 = (11, -15);
*   $JUNCTION @ATTACH %j2;
*   %j3 = (29, -10);
*   $JUNCTION @ATTACH %j3;
*   %j4 = (23, -16);
*   $JUNCTION @ATTACH %j4;
*   %j5 = (17, -26);
*   $JUNCTION @ATTACH %j5;
*   %j6 = (39, -16);
*   $JUNCTION @ATTACH %j6;
*   %j7 = (45, -26);
*   $JUNCTION @ATTACH %j7;
*   %j8 = (56, -20);
*   %j9 = (16, -10);
*   %j10 = (56, -4);
*   %j11 = (51, -15);
*   $JUNCTION @ATTACH %j11;
*   &VDD @WIRE(mode="straight") {%vdd1:p (11, 0) #XM4:3};
*   &VDD @WIRE(mode="straight") {%vdd1:p %j1};
*   &VDD @WIRE(mode="straight") {%j1 (51, 0) #XM5:3};
*   &VDD @WIRE(mode="straight") {#XM1:3 %j1};
*   &net4 @WIRE(mode="straight") {#XM4:1 #XM6:3};
*   &VP @WIRE(mode="straight") {#XM6:1 %j2};
*   &VP @WIRE(mode="straight") {%j2 #XM8:1};
*   &VP @WIRE(mode="straight") {#XM4:2 (7, -4) (7, -15) %j2} => %wire1;
*   &net0 @WIRE(mode="straight") {#XM8:3 #XM12:1};
*   &VSS @WIRE(mode="straight") {#XM12:3 %gnd1:p};
*   &net1 @WIRE(mode="straight") {#XM5:1 #XM7:3};
*   &OUT @WIRE(mode="straight") {#XM7:1 %j11};
*   &OUT @WIRE(mode="straight") {%j11 #XM11:1};
*   &net3 @WIRE(mode="straight") {#XM11:3 #XM15:1};
*   &VSS @WIRE(mode="straight") {#XM15:3 %gnd4:p};
*   &net7 @WIRE(mode="straight") {#XM2:3 %j3};
*   &net7 @WIRE(mode="straight") {%j3 #XM3:3};
*   &net7 @WIRE(mode="straight") {#XM1:1 %j3};
*   &net9 @WIRE(mode="straight", linestyle="dashed") {#XM2:4 #XM3:4};
*   &net5 @WIRE(mode="straight") {#XM2:1 %j4};
*   &net5 @WIRE(mode="straight") {%j4 #XM9:1};
*   &net8 @WIRE(mode="straight") {#XM3:1 %j6};
*   &net8 @WIRE(mode="straight") {%j6 #XM10:1};
*   &net2 @WIRE(mode="straight") {#XM9:3 #XM13:1};
*   &VSS @WIRE(mode="straight") {#XM13:3 %gnd2:p};
*   &net6 @WIRE(mode="straight") {#XM10:3 #XM14:1};
*   &VSS @WIRE(mode="straight") {#XM14:3 %gnd3:p};
*   &net5 @WIRE(mode="straight") {#XM12:2 %j5};
*   &net5 @WIRE(mode="straight") {%j5 #XM13:2};
*   &net5 @WIRE(mode="straight") {%j4 (17, -16) %j5};
*   &net8 @WIRE(mode="straight") {#XM14:2 %j7};
*   &net8 @WIRE(mode="straight") {%j7 #XM15:2};
*   &net8 @WIRE(mode="straight") {%j6 (45, -16) %j7};
*   &VB4 @WIRE(mode="straight") {#XM9:2 #XM10:2} => %wire2;
*   &VB4 @WIRE(mode="straight") {%port1:p #XM8:2};
*   &VB4 @WIRE(mode="straight") {#XM11:2 %j8} => %wire3;
*   &VB1 @WIRE(mode="straight") {#XM6:2 %j9} => %wire4;
*   &VP @WIRE(mode="straight") {#XM5:2 %j10} => %wire5;
*   &VB1 @WIRE(mode="straight") {%port3:p #XM7:2};
*   &VB2 @WIRE(mode="straight") {%port2:p #XM1:2};
*   &INP @WIRE(mode="straight") {%port4:p #XM2:2};
*   &INN @WIRE(mode="straight") {%port5:p #XM3:2};
*   &OUT @WIRE(mode="straight") {%j11 %port6:p};
*   $JUNCTION @ATTACH (25, 0)(p) => %dot1;
*   #XM1 @TEXT("\textbf{\textit{M}}_{\textbf{1}}", key="name", dx=0.4, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM1::name(label);
*   #XM2 @TEXT("\textbf{\textit{M}}_{\textbf{2}}", key="name", dx=0.4, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM2::name(label);
*   #XM3 @TEXT("\textbf{\textit{M}}_{\textbf{3}}", key="name", dx=-0.4, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM3::name(label);
*   #XM4 @TEXT("\textbf{\textit{M}}_{\textbf{4}}", key="name", dx=0.4, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM4::name(label);
*   #XM6 @TEXT("\textbf{\textit{M}}_{\textbf{6}}", key="name", dx=-0.4, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM6::name(label);
*   #XM5 @TEXT("\textbf{\textit{M}}_{\textbf{5}}", key="name", dx=-0.4, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM5::name(label);
*   #XM7 @TEXT("\textbf{\textit{M}}_{\textbf{7}}", key="name", dx=-0.4, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM7::name(label);
*   #XM8 @TEXT("\textbf{\textit{M}}_{\textbf{8}}", key="name", dx=0.5, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM8::name(label);
*   #XM12 @TEXT("\textbf{\textit{M}}_{\textbf{12}}", key="name", dx=-0.5, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM12::name(label);
*   #XM9 @TEXT("\textbf{\textit{M}}_{\textbf{9}}", key="name", dx=-0.5, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM9::name(label);
*   #XM13 @TEXT("\textbf{\textit{M}}_{\textbf{13}}", key="name", dx=0.5, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM13::name(label);
*   #XM10 @TEXT("\textbf{\textit{M}}_{\textbf{10}}", key="name", dx=0.5, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM10::name(label);
*   #XM14 @TEXT("\textbf{\textit{M}}_{\textbf{14}}", key="name", dx=-0.5, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM14::name(label);
*   #XM11 @TEXT("\textbf{\textit{M}}_{\textbf{11}}", key="name", dx=-0.5, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM11::name(label);
*   #XM15 @TEXT("\textbf{\textit{M}}_{\textbf{15}}", key="name", dx=0.5, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM15::name(label);
*   %vdd1 @TEXT("\textbf{\textit{V}}_{\textbf{DD}}", dx=2, dy=1, size=1.5116) => %power1;
*   $CANVAS_LABEL @ATTACH(bind="port") %power1(label);
*   %port1 @TEXT("\textbf{\textit{V}}_{\textbf{B4}}", key="name", dx=-2, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port1::name(label);
*   %port2 @TEXT("\textbf{\textit{V}}_{\textbf{B2}}", key="name", dx=-2, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port2::name(label);
*   %port3 @TEXT("\textbf{\textit{V}}_{\textbf{B1}}", key="name", dx=2, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port3::name(label);
*   %port4 @TEXT("\textbf{\textit{INP}}", key="name", dx=-0.5, dy=1.2, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port4::name(label);
*   %port5 @TEXT("\textbf{\textit{INN}}", key="name", dx=2, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port5::name(label);
*   %port6 @TEXT("\textbf{\textit{OUT}}", key="name", dx=2, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port6::name(label);
*   %wire2 @TEXT("\textbf{\textit{V}}_{\textbf{B4}}", halign="middle", size=1.5116) => @PLACE(31, -19) => %label1;
*   $CANVAS_LABEL @ATTACH(bind="net") %label1(label);
*   %wire3 @TEXT("\textbf{\textit{V}}_{\textbf{B4}}", halign="middle", size=1.5116) => @PLACE(56, -19) => %label2;
*   $CANVAS_LABEL @ATTACH(bind="net") %label2(label);
*   %wire4 @TEXT("\textbf{\textit{V}}_{\textbf{B1}}", halign="middle", size=1.5116) => @PLACE(16, -9) => %label3;
*   $CANVAS_LABEL @ATTACH(bind="net") %label3(label);
*   %wire5 @TEXT("\textbf{\textit{V}}_{\textbf{P}}", halign="middle", size=1.5116) => @PLACE(56, -3) => %label4;
*   $CANVAS_LABEL @ATTACH(bind="net") %label4(label);
*   %wire1 @TEXT("\textbf{\textit{V}}_{\textbf{P}}", size=1.5116) => @PLACE(7.8, -8) => %label5;
*   $CANVAS_LABEL @ATTACH(bind="net") %label5(label)
* }
.ends opamp

.subckt dut VDD VSS Vout VB3 VB1 VB2
XM16 VB4 net1 VDD VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM17 VB4 VB4 VZ VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM18 VZ VB4 VSS VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM19 net1 net1 VDD VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM20 net1 net0 VB3 VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM21 net0 net1 VDD VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM22 net0 VB3 VSS VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XQ1 X X VSS VSS sky130_fd_pr__npn_05v5_W1p00L1p00 m=1
XQ2 VZ VZ VSS VSS sky130_fd_pr__npn_05v5_W1p00L1p00 m=1
R1 Vout X 1k
R2 Vout Y 1k
R3 Y VZ 1k
R4 VB3 VSS 1k
X1 VDD VSS VB4 VB2 VB1 X Y Vout opamp
* @RNL(author="analog-canvas") {
*   %dut_SYMBOL = @DEFINE-SYMBOL(box=[-6, -5, 6, 5]) {
*     (0, 5) @PIN(terminal="VDD", label="\textbf{\textit{V}}_{\textbf{DD}}", direction="up");
*     (6, 0) @PIN(terminal="Vout", label="\textbf{\textit{V}}_{\textbf{out}}", direction="right");
*     (6, -2) @PIN(terminal="VB3", label="\textbf{\textit{V}}_{\textbf{B3}}", direction="right");
*     (-6, 0) @PIN(terminal="VB1", label="\textbf{\textit{V}}_{\textbf{B1}}", direction="left");
*     (-6, -2) @PIN(terminal="VB2", label="\textbf{\textit{V}}_{\textbf{B2}}", direction="left");
*     (0, 0) @RECTANGLE(width=10, height=8);
*     @LINE {(0, 5) (0, 4)};
*     @LINE {(6, 0) (5, 0)};
*     @LINE {(6, -2) (5, -2)};
*     @LINE {(-6, 0) (-5, 0)};
*     @LINE {(-6, -2) (-5, -2)}
*   };
*   # @SET-SYMBOL %dut_SYMBOL;
*   $CANVAS_TYPESETTING @ATTACH(subscript_italic=false) #(level);
*   #X1 @PLACE(44, -17) => @ORIENT("R0");
*   #R1 @SET-SYMBOL $RESISTOR => @PLACE(10, -10) => @ORIENT("R0");
*   #R2 @SET-SYMBOL $RESISTOR => @PLACE(26, -10) => @ORIENT("R0");
*   #R3 @SET-SYMBOL $RESISTOR => @PLACE(26, -23) => @ORIENT("R0");
*   #XQ1 @SET-SYMBOL $NPN => @PLACE(10, -33) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="Q1") #XQ1(part);
*   #XQ2 @SET-SYMBOL $NPN => @PLACE(26, -33) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="Q2") #XQ2(part);
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(10, -36) => @ORIENT("R0") => %gnd1;
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(26, -36) => @ORIENT("R0") => %gnd2;
*   $SUPPLY @ATTACH &VDD(p) => @SET-SYMBOL $SUPPLY_SYMBOL => @PLACE(44, -8) => @ORIENT("R0") => %vdd1;
*   $IO_PORT @ATTACH &Vout(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(64, -17) => @ORIENT("MY") => %port1;
*   #XM16 @SET-SYMBOL $PMOS => @PLACE(71, -32) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M16") #XM16(part);
*   #XM19 @SET-SYMBOL $PMOS => @PLACE(81, -32) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M19") #XM19(part);
*   #XM21 @SET-SYMBOL $PMOS => @PLACE(91, -32) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M21") #XM21(part);
*   #XM17 @SET-SYMBOL $NMOS => @PLACE(71, -40) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M17") #XM17(part);
*   #XM18 @SET-SYMBOL $NMOS => @PLACE(71, -48) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M18") #XM18(part);
*   #XM20 @SET-SYMBOL $NMOS => @PLACE(81, -40) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M20") #XM20(part);
*   #XM22 @SET-SYMBOL $NMOS => @PLACE(91, -40) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M22") #XM22(part);
*   #R4 @SET-SYMBOL $RESISTOR => @PLACE(81, -46) => @ORIENT("R0");
*   $SUPPLY @ATTACH &VDD(p) => @SET-SYMBOL $SUPPLY_SYMBOL => @PLACE(76, -28) => @ORIENT("R0") => %vdd2;
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(81, -49) => @ORIENT("R0") => %gnd3;
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(91, -44) => @ORIENT("R0") => %gnd4;
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(71, -52) => @ORIENT("R0") => %gnd5;
*   $IO_PORT @ATTACH &VB3(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(97, -40) => @ORIENT("MY") => %port2;
*   $IO_PORT @ATTACH &VB1(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(37, -29) => @ORIENT("R0") => %port3;
*   $IO_PORT @ATTACH &VB2(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(37, -32) => @ORIENT("R0") => %port4;
*   &VDD @REMOVE-FROM $PORT_FILL_SET;
*   &VSS @REMOVE-FROM $PORT_FILL_SET;
*   %j1 = (56, -17);
*   $JUNCTION @ATTACH %j1;
*   %j2 = (26, -2);
*   $JUNCTION @ATTACH %j2;
*   %j3 = (26, -15);
*   $JUNCTION @ATTACH %j3;
*   %j4 = (10, -19);
*   $JUNCTION @ATTACH %j4;
*   %j5 = (10, -29);
*   $JUNCTION @ATTACH %j5;
*   %j6 = (26, -29);
*   $JUNCTION @ATTACH %j6;
*   %j7 = (47, -27);
*   %j8 = (81, -28);
*   $JUNCTION @ATTACH %j8;
*   %j9 = (76, -32);
*   $JUNCTION @ATTACH %j9;
*   %j10 = (81, -35);
*   $JUNCTION @ATTACH %j10;
*   %j11 = (81, -36);
*   $JUNCTION @ATTACH %j11;
*   %j12 = (91, -37);
*   $JUNCTION @ATTACH %j12;
*   %j13 = (71, -37);
*   $JUNCTION @ATTACH %j13;
*   %j14 = (75, -39);
*   %j15 = (75, -40);
*   $JUNCTION @ATTACH %j15;
*   &Vout @WIRE(mode="straight") {#X1:8 %j1};
*   &Vout @WIRE(mode="straight") {%j1 %port1:p};
*   &Vout @WIRE(mode="straight") {#R1:1 (10, -2) %j2};
*   &Vout @WIRE(mode="straight") {%j2 (56, -2) %j1};
*   &Vout @WIRE(mode="straight") {#R2:1 %j2};
*   &X @WIRE(mode="straight") {#R1:2 %j4} => %wire1;
*   &X @WIRE(mode="straight") {%j4 %j5};
*   &X @WIRE(mode="straight") {%j5 #XQ1:1};
*   &Y @WIRE(mode="straight") {#R2:2 %j3} => %wire2;
*   &Y @WIRE(mode="straight") {%j3 #R3:1};
*   &Y @WIRE(mode="straight") {%j3 #X1:7};
*   &X @WIRE(mode="straight") {%j4 #X1:6};
*   &VZ @WIRE(mode="straight") {#R3:2 %j6};
*   &VZ @WIRE(mode="straight") {%j6 #XQ2:1} => %wire3;
*   &X @WIRE(mode="straight") {#XQ1:2 (6, -33) (6, -29) %j5};
*   &VZ @WIRE(mode="straight") {#XQ2:2 (22, -33) (22, -29) %j6};
*   &VSS @WIRE(mode="straight") {#XQ1:3 %gnd1:p};
*   &VSS @WIRE(mode="straight") {#XQ2:3 %gnd2:p};
*   &VB4 @WIRE(mode="straight") {#X1:3 %j7} => %wire4;
*   &VDD @WIRE(mode="straight") {#X1:1 %vdd1:p};
*   &VDD @WIRE(mode="straight") {%vdd2:p (71, -28) #XM16:3};
*   &VDD @WIRE(mode="straight") {%vdd2:p %j8};
*   &VDD @WIRE(mode="straight") {%j8 (91, -28) #XM21:3};
*   &VDD @WIRE(mode="straight") {#XM19:3 %j8};
*   &net1 @WIRE(mode="straight") {#XM16:2 %j9};
*   &net1 @WIRE(mode="straight") {%j9 #XM19:2};
*   &net1 @WIRE(mode="straight") {#XM19:1 %j10};
*   &net1 @WIRE(mode="straight") {%j10 %j11};
*   &net1 @WIRE(mode="straight") {%j11 #XM20:1};
*   &net1 @WIRE(mode="straight") {%j9 (76, -35) %j10};
*   &net1 @WIRE(mode="straight") {#XM21:2 (86, -32) (86, -36) %j11};
*   &net0 @WIRE(mode="straight") {#XM21:1 %j12};
*   &net0 @WIRE(mode="straight") {%j12 #XM22:1};
*   &net0 @WIRE(mode="straight") {#XM20:2 (88, -40) (88, -37) %j12};
*   &VB3 @WIRE(mode="straight") {#XM20:3 #R4:1} => %wire5;
*   &VSS @WIRE(mode="straight") {#R4:2 %gnd3:p};
*   &VSS @WIRE(mode="straight") {#XM22:3 %gnd4:p};
*   &VB3 @WIRE(mode="straight") {%port2:p #XM22:2};
*   &VZ @WIRE(mode="straight") {#XM17:3 #XM18:1} => %wire6;
*   &VSS @WIRE(mode="straight") {#XM18:3 %gnd5:p};
*   &VB4 @WIRE(mode="straight") {#XM16:1 %j13} => %wire7;
*   &VB4 @WIRE(mode="straight") {%j13 #XM17:1};
*   &VB4 @WIRE(mode="straight") {%j13 (75, -37) %j14};
*   &VB4 @WIRE(mode="straight") {#XM17:2 %j15};
*   &VB4 @WIRE(mode="straight") {#XM18:2 (75, -48) %j15};
*   &VB4 @WIRE(mode="straight") {%j14 %j15};
*   &VB1 @WIRE(mode="straight") {%port3:p (41, -29) #X1:5};
*   &VB2 @WIRE(mode="straight") {%port4:p (44, -32) #X1:4};
*   $JUNCTION @ATTACH (76, -28)(p) => %dot1;
*   #R1 @TEXT("\textbf{\textit{R}}_{\textbf{1}}", key="name", dx=0.9, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #R1::name(label);
*   #R2 @TEXT("\textbf{\textit{R}}_{\textbf{2}}", key="name", dx=0.9, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #R2::name(label);
*   #R3 @TEXT("\textbf{\textit{R}}_{\textbf{3}}", key="name", dx=0.9, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #R3::name(label);
*   #XQ1 @TEXT("\textbf{\textit{Q}}_{\textbf{1}}", key="name", dx=0.4, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XQ1::name(label);
*   #XQ2 @TEXT("\textbf{\textit{Q}}_{\textbf{2}}", key="name", dx=0.4, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XQ2::name(label);
*   %vdd1 @TEXT("\textbf{\textit{V}}_{\textbf{DD}}", dx=2, dy=1, size=1.5116) => %power1;
*   $CANVAS_LABEL @ATTACH(bind="port") %power1(label);
*   %port1 @TEXT("\textbf{\textit{V}}_{\textbf{out}}", key="name", dx=2, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port1::name(label);
*   #XM16 @TEXT("\textbf{\textit{M}}_{\textbf{16}}", key="name", dx=-0.4, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM16::name(label);
*   #XM19 @TEXT("\textbf{\textit{M}}_{\textbf{19}}", key="name", dx=0.4, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM19::name(label);
*   #XM21 @TEXT("\textbf{\textit{M}}_{\textbf{21}}", key="name", dx=0.4, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM21::name(label);
*   #XM17 @TEXT("\textbf{\textit{M}}_{\textbf{17}}", key="name", dx=-0.5, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM17::name(label);
*   #XM18 @TEXT("\textbf{\textit{M}}_{\textbf{18}}", key="name", dx=-0.5, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM18::name(label);
*   #XM20 @TEXT("\textbf{\textit{M}}_{\textbf{20}}", key="name", dx=-0.5, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM20::name(label);
*   #XM22 @TEXT("\textbf{\textit{M}}_{\textbf{22}}", key="name", dx=-0.5, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM22::name(label);
*   #R4 @TEXT("\textbf{\textit{R}}_{\textbf{4}}", key="name", dx=0.9, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #R4::name(label);
*   %vdd2 @TEXT("\textbf{\textit{V}}_{\textbf{DD}}", dx=2, dy=1, size=1.5116) => %power2;
*   $CANVAS_LABEL @ATTACH(bind="port") %power2(label);
*   %port2 @TEXT("\textbf{\textit{V}}_{\textbf{B3}}", key="name", dx=2, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port2::name(label);
*   %wire3 @TEXT("\textbf{\textit{V}}_{\textbf{Z}}", size=1.5116) => @PLACE(26.8, -30) => %label1;
*   $CANVAS_LABEL @ATTACH(bind="net") %label1(label);
*   %wire6 @TEXT("\textbf{\textit{V}}_{\textbf{Z}}", size=1.5116) => @PLACE(71.8, -44) => %label2;
*   $CANVAS_LABEL @ATTACH(bind="net") %label2(label);
*   %wire7 @TEXT("\textbf{\textit{V}}_{\textbf{B4}}", size=1.5116) => @PLACE(71.8, -35.5) => %label3;
*   $CANVAS_LABEL @ATTACH(bind="net") %label3(label);
*   %wire4 @TEXT("\textbf{\textit{V}}_{\textbf{B4}}", size=1.5116) => @PLACE(47.8, -27) => %label4;
*   $CANVAS_LABEL @ATTACH(bind="net") %label4(label);
*   %wire5 @TEXT("\textbf{\textit{V}}_{\textbf{B3}}", size=1.5116) => @PLACE(81.8, -43) => %label5;
*   $CANVAS_LABEL @ATTACH(bind="net") %label5(label);
*   %wire1 @TEXT("\textbf{\textit{X}}", size=1.5116) => @PLACE(10.8, -19) => %label6;
*   $CANVAS_LABEL @ATTACH(bind="net") %label6(label);
*   %wire2 @TEXT("\textbf{\textit{Y}}", size=1.5116) => @PLACE(26.8, -15) => %label7;
*   $CANVAS_LABEL @ATTACH(bind="net") %label7(label);
*   #X1 @TEXT("\textbf{\textit{A}}_{\textbf{1}}", key="name", dx=-1, dy=-0.2, halign="middle", valign="baseline", size=1.5116);
*   %port3 @TEXT("\textbf{\textit{V}}_{\textbf{B1}}", key="name", dx=-2, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port3::name(label);
*   %port4 @TEXT("\textbf{\textit{V}}_{\textbf{B2}}", key="name", dx=-2, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port4::name(label);
*   (33.2, -23.2) @TEXT("V\_T \textbackslash{}ln n", halign="middle", size=1.5116, bold=true) => %text1;
*   $CANVAS_TYPOGRAPHY @ATTACH(token="label") %text1(text);
*   (13.2, -33.5) @TEXT("A", halign="middle", size=1.5116, bold=true) => %text2;
*   $CANVAS_TYPOGRAPHY @ATTACH(token="label") %text2(text);
*   (29.5, -33.5) @TEXT("nA", halign="middle", size=1.5116, bold=true) => %text3;
*   $CANVAS_TYPOGRAPHY @ATTACH(token="label") %text3(text)
* }
.ends dut
