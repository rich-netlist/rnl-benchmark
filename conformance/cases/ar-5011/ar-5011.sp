
* @RNL(type="header") {
*   @VERSION("0.3");
*   @USE-PACKAGE(name="rnl-std", version="0.3");
*   @USE-PACKAGE(name="rnl-std-no-labels", version="0.3");
*   @USE-PACKAGE(name="analog-canvas-extensions", version="0.6")
* }
.subckt shockley a k params: vbo=10
.model qn NPN(IS=1e-16 BF=100 VAF=100)
.model qp PNP(IS=1e-16 BF=50 VAF=50)
.model dj D(IS=1e-14 N=1)
Q1 p2 n1 a qp
Q2 n1 p2 k qn
VBO n1 nz DC {vbo-1.9}
DBO nz p2 dj
RGK p2 k 1k
CGK p2 k 10p
.ends shockley

.subckt dut VCC VSS vout
C1 vout VSS 0.1uF
R1 VCC net0 50kΩ
R2 net0 vout 1kΩ
X1 vout VSS shockley vbo=10
* @RNL(author="analog-canvas") {
*   %dut_SYMBOL = @DEFINE-SYMBOL(box=[-5, -4, 5, 4]) {
*     (0, 4) @PIN(terminal="VCC", label="\textbf{\textit{V}}_{\textbf{CC}}", direction="up");
*     (5, -1) @PIN(terminal="vout", label="\textbf{\textit{v}}_{\textbf{out}}", direction="right");
*     (0, 0) @RECTANGLE(width=8, height=6);
*     @LINE {(0, 4) (0, 3)};
*     @LINE {(5, -1) (4, -1)}
*   };
*   # @SET-SYMBOL %dut_SYMBOL;
*   $CANVAS_TYPESETTING @ATTACH(subscript_italic=false) #(level);
*   $SUPPLY @ATTACH &VCC(p) => @SET-SYMBOL $SUPPLY_SYMBOL => @PLACE(10, 1) => @ORIENT("R0") => %vdd1;
*   #R1 @SET-SYMBOL $VARIABLE_RESISTOR => @PLACE(10, -3) => @ORIENT("R0");
*   #R2 @SET-SYMBOL $RESISTOR => @PLACE(10, -9) => @ORIENT("R0");
*   #C1 @SET-SYMBOL $CAPACITOR => @PLACE(10, -16) => @ORIENT("R0");
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(10, -18) => @ORIENT("R0") => %gnd1;
*   #X1 @SET-SYMBOL $CANVAS_SHOCKLEY_DIODE => @PLACE(18, -16) => @ORIENT("R270");
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(18, -18) => @ORIENT("R0") => %gnd2;
*   $IO_PORT @ATTACH &vout(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(24, -13) => @ORIENT("MY") => %port1;
*   &VCC @REMOVE-FROM $PORT_FILL_SET;
*   &VSS @REMOVE-FROM $PORT_FILL_SET;
*   %j1 = (10, -13);
*   $JUNCTION @ATTACH %j1;
*   %j2 = (18, -13);
*   $JUNCTION @ATTACH %j2;
*   &VCC @WIRE(mode="straight") {%vdd1:p #R1:1};
*   &net0 @WIRE(mode="straight") {#R1:2 #R2:1};
*   &vout @WIRE(mode="straight") {#R2:2 %j1};
*   &vout @WIRE(mode="straight") {%j1 #C1:1};
*   &vout @WIRE(mode="straight") {%port1:p %j2};
*   &vout @WIRE(mode="straight") {%j2 %j1};
*   &vout @WIRE(mode="straight") {#X1:1 %j2};
*   &VSS @WIRE(mode="straight") {%gnd1:p #C1:2};
*   &VSS @WIRE(mode="straight") {%gnd2:p #X1:2};
*   %vdd1 @TEXT("\textbf{\textit{V}}_{\textbf{CC}}", dx=0, dy=3.2, halign="middle", size=1.5116) => %power1;
*   $CANVAS_LABEL @ATTACH(bind="port") %power1(label);
*   #R1 @TEXT("\textbf{\textit{R}}_{\textbf{1}}", key="name", dx=1.6, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #R1::name(label);
*   #R1 @TEXT("\textbf{50kΩ}", key="value", dx=1.6, dy=-2.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="value") #R1::value(label);
*   #R2 @TEXT("\textbf{\textit{R}}_{\textbf{2}}", key="name", dx=0.9, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #R2::name(label);
*   #R2 @TEXT("\textbf{1kΩ}", key="value", dx=0.9, dy=-2.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="value") #R2::value(label);
*   #C1 @TEXT("\textbf{\textit{C}}_{\textbf{1}}", key="name", dx=1.2, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #C1::name(label);
*   #C1 @TEXT("\textbf{0.1uF}", key="value", dx=1.2, dy=-2.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="value") #C1::value(label);
*   #X1 @TEXT("\textbf{\textit{D}}_{\textbf{1}}", key="name", dx=1.2, dy=0, halign="start", valign="baseline", size=1.5116);
*   %port1 @TEXT("\textbf{\textit{v}}_{\textbf{out}}", key="name", dx=2, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port1::name(label);
*   (19.2, -17.8) @TEXT("V_{B} = 10 V", size=1.5116, bold=true) => %text1;
*   $CANVAS_TYPOGRAPHY @ATTACH(token="label") %text1(text)
* }
.ends dut
