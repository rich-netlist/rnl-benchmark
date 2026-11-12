
* @RNL(type="header") {
*   @VERSION("0.3");
*   @USE-PACKAGE(name="rnl-std", version="0.3");
*   @USE-PACKAGE(name="rnl-std-no-labels", version="0.3");
*   @USE-PACKAGE(name="analog-canvas-extensions", version="0.6")
* }
.subckt dut VDD VSS
C1 net0 X 1p
C2 net2 net1 1p
XM1 net2 X VSS VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
R1 VDD X 1k
R2 X VSS 1k
R3 net1 VSS 8
RD VDD net2 1kΩ
V1 net0 VSS DC 1
* @RNL(author="analog-canvas") {
*   %dut_SYMBOL = @DEFINE-SYMBOL(box=[-5, -3, 5, 3]) {
*     (0, 3) @PIN(terminal="VDD", label="\textbf{\textit{V}}_{\textbf{DD}}", direction="up");
*     (0, 0) @RECTANGLE(width=8, height=4);
*     @LINE {(0, 3) (0, 2)}
*   };
*   # @SET-SYMBOL %dut_SYMBOL;
*   $CANVAS_TYPESETTING @ATTACH(subscript_italic=false) #(level);
*   #R1 @SET-SYMBOL $RESISTOR => @PLACE(12, -6) => @ORIENT("R0");
*   #RD @SET-SYMBOL $RESISTOR => @PLACE(21, -6) => @ORIENT("R0");
*   #XM1 @SET-SYMBOL $NMOS => @PLACE(21, -12) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M1") #XM1(part);
*   #R2 @SET-SYMBOL $RESISTOR => @PLACE(12, -15) => @ORIENT("R0");
*   #C1 @SET-SYMBOL $CAPACITOR => @PLACE(6, -12) => @ORIENT("R90");
*   #C2 @SET-SYMBOL $CAPACITOR => @PLACE(27, -9) => @ORIENT("R90");
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(21, -14) => @ORIENT("R0") => %gnd1;
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(12, -17) => @ORIENT("R0") => %gnd2;
*   #V1 @SET-SYMBOL $CANVAS_MICROPHONE => @PLACE(2, -15) => @ORIENT("R0");
*   $CANVAS_PARAMETER @ATTACH(name="amplitude", text="1") #V1(part);
*   $CANVAS_PARAMETER @ATTACH(name="damping", text="0") #V1(part);
*   $CANVAS_PARAMETER @ATTACH(name="delay", text="0") #V1(part);
*   $CANVAS_PARAMETER @ATTACH(name="fall", text="1ps") #V1(part);
*   $CANVAS_PARAMETER @ATTACH(name="frequency", text="1k") #V1(part);
*   $CANVAS_PARAMETER @ATTACH(name="high", text="1") #V1(part);
*   $CANVAS_PARAMETER @ATTACH(name="low", text="0") #V1(part);
*   $CANVAS_PARAMETER @ATTACH(name="offset", text="0") #V1(part);
*   $CANVAS_PARAMETER @ATTACH(name="period", text="10ns") #V1(part);
*   $CANVAS_PARAMETER @ATTACH(name="phase", text="0") #V1(part);
*   $CANVAS_PARAMETER @ATTACH(name="rise", text="1ps") #V1(part);
*   $CANVAS_PARAMETER @ATTACH(name="waveform", text="dc") #V1(part);
*   $CANVAS_PARAMETER @ATTACH(name="width", text="5ns") #V1(part);
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(2, -17) => @ORIENT("R0") => %gnd3;
*   #R3 @SET-SYMBOL $CANVAS_SPEAKER => @PLACE(33, -13) => @ORIENT("R0");
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(33, -15) => @ORIENT("R0") => %gnd4;
*   &VDD @REMOVE-FROM $PORT_FILL_SET;
*   &VSS @REMOVE-FROM $PORT_FILL_SET;
*   %j1 = (10, -2);
*   %j2 = (23, -2);
*   %j3 = (12, -2);
*   $JUNCTION @ATTACH %j3;
*   %j4 = (21, -2);
*   $JUNCTION @ATTACH %j4;
*   %j5 = (12, -12);
*   $JUNCTION @ATTACH %j5;
*   %j6 = (21, -9);
*   $JUNCTION @ATTACH %j6;
*   &VDD @WIRE(mode="straight", linestyle="bold") {%j1 %j3};
*   &VDD @WIRE(mode="straight", linestyle="bold") {%j3 %j4};
*   &VDD @WIRE(mode="straight", linestyle="bold") {%j4 %j2};
*   &VDD @WIRE(mode="straight") {#R1:1 %j3};
*   &VDD @WIRE(mode="straight") {#RD:1 %j4};
*   &net2 @WIRE(mode="straight") {#RD:2 %j6};
*   &net2 @WIRE(mode="straight") {%j6 #XM1:1};
*   &X @WIRE(mode="straight") {#R1:2 %j5};
*   &X @WIRE(mode="straight") {%j5 #R2:1};
*   &X @WIRE(mode="straight") {#XM1:2 %j5} => %wire1;
*   &X @WIRE(mode="straight") {#C1:2 %j5};
*   &net2 @WIRE(mode="straight") {#C2:1 %j6};
*   &net1 @WIRE(mode="straight") {#C2:2 (33, -9) #R3:1};
*   &net0 @WIRE(mode="straight") {#V1:1 (2, -12) #C1:1};
*   &VSS @WIRE(mode="straight") {%gnd1:p #XM1:3};
*   &VSS @WIRE(mode="straight") {%gnd2:p #R2:2};
*   &VSS @WIRE(mode="straight") {%gnd3:p #V1:2};
*   &VSS @WIRE(mode="straight") {%gnd4:p #R3:2};
*   #R1 @TEXT("\textbf{\textit{R}}_{\textbf{1}}", key="name", dx=0.9, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #R1::name(label);
*   #RD @TEXT("\textbf{\textit{R}}_{\textbf{D}}", key="name", dx=-0.9, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #RD::name(label);
*   #RD @TEXT("\textbf{1kΩ}", key="value", dx=-0.9, dy=-2.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="value") #RD::value(label);
*   #XM1 @TEXT("\textbf{\textit{M}}_{\textbf{1}}", key="name", dx=0.5, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM1::name(label);
*   #R2 @TEXT("\textbf{\textit{R}}_{\textbf{2}}", key="name", dx=0.9, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #R2::name(label);
*   #C1 @TEXT("\textbf{\textit{C}}_{\textbf{1}}", key="name", dx=0, dy=1.7, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #C1::name(label);
*   #C2 @TEXT("\textbf{\textit{C}}_{\textbf{2}}", key="name", dx=0, dy=1.7, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #C2::name(label);
*   &VDD @TEXT("\textbf{\textit{V}}_{\textbf{DD}}", size=1.5116) => @PLACE(24, -3) => %power1;
*   $CANVAS_LABEL @ATTACH(bind="port") %power1(label);
*   %wire1 @TEXT("\textbf{\textit{X}}", halign="middle", size=1.5116) => @PLACE(15, -11.6) => %label1;
*   $CANVAS_LABEL @ATTACH(bind="net") %label1(label);
*   #V1 @TEXT("\textbf{\textit{V}}_{\textbf{1}}", key="name", dx=2, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #V1::name(label);
*   #R3 @TEXT("\textbf{\textit{R}}_{\textbf{3}}", key="name", dx=1.5, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #R3::name(label);
*   (27.2, -2.4) @TEXT("= 1.8 V", size=1.5116, bold=true) => %text1;
*   $CANVAS_TYPOGRAPHY @ATTACH(token="label") %text1(text)
* }
.ends dut
