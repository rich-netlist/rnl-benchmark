
* @RNL(type="header") {
*   @VERSION("0.3");
*   @USE-PACKAGE(name="rnl-std", version="0.3");
*   @USE-PACKAGE(name="rnl-std-no-labels", version="0.3");
*   @USE-PACKAGE(name="analog-canvas-extensions", version="0.6")
* }
.subckt dut VDD VSS Vout
C1 net1 net0 1p
XM1 Vout net0 VSS VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
R1 VDD net0 1k
R2 net0 VSS 1k
RD VDD Vout 1k
V1 net1 VSS DC 1
* @RNL(author="analog-canvas") {
*   %dut_SYMBOL = @DEFINE-SYMBOL(box=[-5, -4, 5, 4]) {
*     (5, -1) @PIN(terminal="Vout", label="\textbf{\textit{V}}_{\textbf{out}}", direction="right");
*     (0, 4) @PIN(terminal="VDD", label="\textbf{\textit{V}}_{\textbf{DD}}", direction="up");
*     (0, 0) @RECTANGLE(width=8, height=6);
*     @LINE {(5, -1) (4, -1)};
*     @LINE {(0, 4) (0, 3)}
*   };
*   # @SET-SYMBOL %dut_SYMBOL;
*   $CANVAS_TYPESETTING @ATTACH(subscript_italic=false) #(level);
*   #XM1 @SET-SYMBOL $NMOS => @PLACE(31, -30) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M1") #XM1(part);
*   #RD @SET-SYMBOL $RESISTOR => @PLACE(31, -23) => @ORIENT("R0");
*   #R1 @SET-SYMBOL $RESISTOR => @PLACE(22, -23) => @ORIENT("R0");
*   #R2 @SET-SYMBOL $RESISTOR => @PLACE(22, -36) => @ORIENT("R0");
*   #C1 @SET-SYMBOL $CAPACITOR => @PLACE(17, -30) => @ORIENT("R90");
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(31, -32) => @ORIENT("R0") => %gnd1;
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(22, -38) => @ORIENT("R0") => %gnd2;
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(12, -35) => @ORIENT("R0") => %gnd3;
*   $IO_PORT @ATTACH &Vout(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(37, -26) => @ORIENT("MY") => %port1;
*   #V1 @SET-SYMBOL $CANVAS_MICROPHONE => @PLACE(12, -33) => @ORIENT("R0");
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
*   &VDD @REMOVE-FROM $PORT_FILL_SET;
*   &VSS @REMOVE-FROM $PORT_FILL_SET;
*   %j1 = (20, -19);
*   %j2 = (33, -19);
*   %j3 = (22, -19);
*   $JUNCTION @ATTACH %j3;
*   %j4 = (31, -19);
*   $JUNCTION @ATTACH %j4;
*   %j5 = (22, -30);
*   $JUNCTION @ATTACH %j5;
*   %j6 = (31, -26);
*   $JUNCTION @ATTACH %j6;
*   %j7 = (12, -31);
*   &VDD @WIRE(mode="straight", linestyle="bold") {%j1 %j3};
*   &VDD @WIRE(mode="straight", linestyle="bold") {%j3 %j4};
*   &VDD @WIRE(mode="straight", linestyle="bold") {%j4 %j2};
*   &VDD @WIRE(mode="straight") {#R1:1 %j3};
*   &VDD @WIRE(mode="straight") {#RD:1 %j4};
*   &Vout @WIRE(mode="straight") {#RD:2 %j6};
*   &Vout @WIRE(mode="straight") {%j6 #XM1:1};
*   &net0 @WIRE(mode="straight") {#R1:2 %j5};
*   &net0 @WIRE(mode="straight") {%j5 #R2:1};
*   &net0 @WIRE(mode="straight") {#XM1:2 %j5};
*   &net0 @WIRE(mode="straight") {#C1:2 %j5};
*   &net1 @WIRE(mode="straight") {%j7 (12, -30) #C1:1};
*   &Vout @WIRE(mode="straight") {%port1:p %j6};
*   &VSS @WIRE(mode="straight") {%gnd1:p #XM1:3};
*   &VSS @WIRE(mode="straight") {%gnd2:p #R2:2};
*   &VSS @WIRE(mode="straight") {%gnd3:p #V1:2};
*   &net1 @WIRE(mode="straight") {%j7 #V1:1};
*   #XM1 @TEXT("\textbf{\textit{M}}_{\textbf{1}}", key="name", dx=0.5, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM1::name(label);
*   #RD @TEXT("\textbf{\textit{R}}_{\textbf{D}}", key="name", dx=0.9, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #RD::name(label);
*   #R1 @TEXT("\textbf{\textit{R}}_{\textbf{1}}", key="name", dx=0.9, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #R1::name(label);
*   #R2 @TEXT("\textbf{\textit{R}}_{\textbf{2}}", key="name", dx=0.9, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #R2::name(label);
*   #C1 @TEXT("\textbf{\textit{C}}_{\textbf{1}}", key="name", dx=0, dy=1.7, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #C1::name(label);
*   %port1 @TEXT("\textbf{\textit{V}}_{\textbf{out}}", key="name", dx=2, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port1::name(label);
*   &VDD @TEXT("\textbf{\textit{V}}_{\textbf{DD}}", size=1.5116) => @PLACE(34, -20) => %power1;
*   $CANVAS_LABEL @ATTACH(bind="port") %power1(label);
*   #V1 @TEXT("\textbf{\textit{V}}_{\textbf{1}}", key="name", dx=2, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #V1::name(label)
* }
.ends dut
