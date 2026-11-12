
* @RNL(type="header") {
*   @VERSION("0.3");
*   @USE-PACKAGE(name="rnl-std", version="0.3");
*   @USE-PACKAGE(name="rnl-std-no-labels", version="0.3");
*   @USE-PACKAGE(name="analog-canvas-extensions", version="0.6")
* }
* Crystal: Butterworth-Van Dyke model, fs = 1/(2*pi*sqrt(lm*cm))
.subckt crystal n1 n2 params: rm=25 lm=12.7m cm=20f c0=5p
Rm n1 nr {rm}
Lm nr nl {lm}
Cm nl n2 {cm}
C0 n1 n2 {c0}
.ends crystal

.subckt dut +3.3V VSS
C1 net2 VSS 10pF
C2 net1 VSS 10pF
XM1 net0 net2 +3.3V +3.3V sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM2 net0 net2 VSS VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
R1 net2 net1 1Meg
R2 net0 net1 10kΩ
X1 net2 net1 crystal c0=5p cm=20f lm=12.7m rm=25
* @RNL(author="analog-canvas") {
*   %dut_SYMBOL = @DEFINE-SYMBOL(box=[-5, -3, 5, 3]) {
*     (0, 3) @PIN(terminal="+3.3V", label="\textbf{\textit{+3.3V}}", direction="up");
*     (0, 0) @RECTANGLE(width=8, height=4);
*     @LINE {(0, 3) (0, 2)}
*   };
*   # @SET-SYMBOL %dut_SYMBOL;
*   $CANVAS_TYPESETTING @ATTACH(subscript_italic=false) #(level);
*   #XM1 @SET-SYMBOL $PMOS => @PLACE(9, 0) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M1") #XM1(part);
*   #XM2 @SET-SYMBOL $NMOS => @PLACE(9, -7) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M2") #XM2(part);
*   #R2 @SET-SYMBOL $RESISTOR => @PLACE(14, -8) => @ORIENT("R0");
*   #R1 @SET-SYMBOL $RESISTOR => @PLACE(7, -13) => @ORIENT("R90");
*   #X1 @SET-SYMBOL $CANVAS_CRYSTAL => @PLACE(7, -18) => @ORIENT("R90");
*   #C1 @SET-SYMBOL $CAPACITOR => @PLACE(0, -22) => @ORIENT("R0");
*   #C2 @SET-SYMBOL $CAPACITOR => @PLACE(14, -22) => @ORIENT("R0");
*   $SUPPLY @ATTACH &"+3.3V"(p) => @SET-SYMBOL $SUPPLY_SYMBOL => @PLACE(9, 2) => @ORIENT("R0") => %vdd1;
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(9, -9) => @ORIENT("R0") => %gnd1;
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(0, -24) => @ORIENT("R0") => %gnd2;
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(14, -24) => @ORIENT("R0") => %gnd3;
*   &"+3.3V" @REMOVE-FROM $PORT_FILL_SET;
*   &VSS @REMOVE-FROM $PORT_FILL_SET;
*   %j1 = (4, -3);
*   $JUNCTION @ATTACH %j1;
*   %j2 = (9, -3);
*   $JUNCTION @ATTACH %j2;
*   %j3 = (0, -18);
*   $JUNCTION @ATTACH %j3;
*   %j4 = (14, -18);
*   $JUNCTION @ATTACH %j4;
*   %j5 = (14, -13);
*   $JUNCTION @ATTACH %j5;
*   %j6 = (0, -13);
*   $JUNCTION @ATTACH %j6;
*   &net0 @WIRE(mode="straight") {#XM1:1 %j2};
*   &net0 @WIRE(mode="straight") {%j2 #XM2:1};
*   &net0 @WIRE(mode="straight") {%j2 (14, -3) #R2:1};
*   &net1 @WIRE(mode="straight") {#R2:2 %j5};
*   &net1 @WIRE(mode="straight") {%j5 %j4};
*   &net1 @WIRE(mode="straight") {%j5 #R1:2};
*   &net1 @WIRE(mode="straight") {%j4 #C2:1};
*   &net1 @WIRE(mode="straight") {%j4 #X1:2};
*   &net2 @WIRE(mode="straight") {%j6 %j3};
*   &net2 @WIRE(mode="straight") {%j6 (0, -3) %j1};
*   &net2 @WIRE(mode="straight") {%j6 #R1:1};
*   &net2 @WIRE(mode="straight") {%j3 #C1:1};
*   &net2 @WIRE(mode="straight") {%j3 #X1:1};
*   &net2 @WIRE(mode="straight") {%j1 (4, 0) #XM1:2};
*   &net2 @WIRE(mode="straight") {%j1 (4, -7) #XM2:2};
*   &"+3.3V" @WIRE(mode="straight") {#XM1:3 %vdd1:p};
*   &VSS @WIRE(mode="straight") {%gnd1:p #XM2:3};
*   &VSS @WIRE(mode="straight") {%gnd2:p #C1:2};
*   &VSS @WIRE(mode="straight") {%gnd3:p #C2:2};
*   #XM1 @TEXT("\textbf{\textit{M}}_{\textbf{1}}", key="name", dx=0.4, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM1::name(label);
*   #XM2 @TEXT("\textbf{\textit{M}}_{\textbf{2}}", key="name", dx=0.5, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM2::name(label);
*   #R2 @TEXT("\textbf{\textit{R}}_{\textbf{2}}", key="name", dx=0.9, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #R2::name(label);
*   #R2 @TEXT("\textbf{10kΩ}", key="value", dx=0.9, dy=-2.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="value") #R2::value(label);
*   #R1 @TEXT("\textbf{\textit{R}}_{\textbf{1}}", key="name", dx=-1, dy=-2.6, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #R1::name(label);
*   #R1 @TEXT("\textbf{1Meg}", key="value", dx=-0.4, dy=-2.6, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="value") #R1::value(label);
*   #X1 @TEXT("\textbf{\textit{Crystal}}", key="name", dx=0, dy=-2.4, halign="middle", valign="baseline", size=1.5116);
*   #C1 @TEXT("\textbf{\textit{C}}_{\textbf{1}}", key="name", dx=1.2, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #C1::name(label);
*   #C1 @TEXT("\textbf{10pF}", key="value", dx=1.2, dy=-2.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="value") #C1::value(label);
*   #C2 @TEXT("\textbf{\textit{C}}_{\textbf{2}}", key="name", dx=1.2, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #C2::name(label);
*   #C2 @TEXT("\textbf{10pF}", key="value", dx=1.2, dy=-2.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="value") #C2::value(label);
*   %vdd1 @TEXT("\textbf{\textit{+3.3V}}", dx=2, dy=1, size=1.5116) => %power1;
*   $CANVAS_LABEL @ATTACH(bind="port") %power1(label)
* }
.ends dut
