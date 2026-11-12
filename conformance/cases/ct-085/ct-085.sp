
* @RNL(type="header") {
*   @VERSION("0.3");
*   @USE-PACKAGE(name="rnl-std", version="0.3");
*   @USE-PACKAGE(name="rnl-std-no-labels", version="0.3");
*   @USE-PACKAGE(name="analog-canvas-extensions", version="0.6")
* }
.subckt dut VDD VSS V1 V2 V3 V4
C1 VDD net0 1p
C2 VDD net2 1p
ISS net1 VSS DC 1m
XM1 V3 V1 net1 VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM2 V4 V2 net1 VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM3 V3 net0 VDD VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM4 V4 net2 VDD VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
R1 V3 net0 1k
R2 V4 net2 1k
* @RNL(author="analog-canvas") {
*   %dut_SYMBOL = @DEFINE-SYMBOL(box=[-5, -5, 5, 5]) {
*     (-5, -2) @PIN(terminal="V1", label="\textbf{\textit{V}}_{\textbf{1}}", direction="left");
*     (5, -2) @PIN(terminal="V2", label="\textbf{\textit{V}}_{\textbf{2}}", direction="right");
*     (-5, 0) @PIN(terminal="V3", label="\textbf{\textit{V}}_{\textbf{3}}", direction="left");
*     (5, 0) @PIN(terminal="V4", label="\textbf{\textit{V}}_{\textbf{4}}", direction="right");
*     (0, 5) @PIN(terminal="VDD", label="\textbf{\textit{V}}_{\textbf{DD}}", direction="up");
*     (0, 0) @RECTANGLE(width=8, height=8);
*     @LINE {(-5, -2) (-4, -2)};
*     @LINE {(5, -2) (4, -2)};
*     @LINE {(-5, 0) (-4, 0)};
*     @LINE {(5, 0) (4, 0)};
*     @LINE {(0, 5) (0, 4)}
*   };
*   # @SET-SYMBOL %dut_SYMBOL;
*   $CANVAS_TYPESETTING @ATTACH(subscript_italic=false) #(level);
*   #XM3 @SET-SYMBOL $PMOS => @PLACE(27, -15) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M3") #XM3(part);
*   #XM4 @SET-SYMBOL $PMOS => @PLACE(43, -15) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M4") #XM4(part);
*   #XM1 @SET-SYMBOL $NMOS => @PLACE(27, -27) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M1") #XM1(part);
*   #XM2 @SET-SYMBOL $NMOS => @PLACE(43, -27) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M2") #XM2(part);
*   #C1 @SET-SYMBOL $CAPACITOR => @PLACE(21, -13) => @ORIENT("R0");
*   #C2 @SET-SYMBOL $CAPACITOR => @PLACE(49, -13) => @ORIENT("R0");
*   #R1 @SET-SYMBOL $RESISTOR => @PLACE(23, -20) => @ORIENT("R270");
*   #R2 @SET-SYMBOL $RESISTOR => @PLACE(47, -20) => @ORIENT("MYR90");
*   #ISS @SET-SYMBOL $CURRENT_SOURCE => @PLACE(35, -35) => @ORIENT("R0");
*   $CANVAS_PARAMETER @ATTACH(name="amplitude", text="1m") #ISS(part);
*   $CANVAS_PARAMETER @ATTACH(name="damping", text="0") #ISS(part);
*   $CANVAS_PARAMETER @ATTACH(name="delay", text="0") #ISS(part);
*   $CANVAS_PARAMETER @ATTACH(name="fall", text="1ps") #ISS(part);
*   $CANVAS_PARAMETER @ATTACH(name="frequency", text="1k") #ISS(part);
*   $CANVAS_PARAMETER @ATTACH(name="high", text="1m") #ISS(part);
*   $CANVAS_PARAMETER @ATTACH(name="low", text="0") #ISS(part);
*   $CANVAS_PARAMETER @ATTACH(name="offset", text="0") #ISS(part);
*   $CANVAS_PARAMETER @ATTACH(name="period", text="10ns") #ISS(part);
*   $CANVAS_PARAMETER @ATTACH(name="phase", text="0") #ISS(part);
*   $CANVAS_PARAMETER @ATTACH(name="rise", text="1ps") #ISS(part);
*   $CANVAS_PARAMETER @ATTACH(name="waveform", text="dc") #ISS(part);
*   $CANVAS_PARAMETER @ATTACH(name="width", text="5ns") #ISS(part);
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(35, -37) => @ORIENT("R0") => %gnd1;
*   $IO_PORT @ATTACH &V1(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(24, -27) => @ORIENT("R0") => %port1;
*   $IO_PORT @ATTACH &V2(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(46, -27) => @ORIENT("MY") => %port2;
*   $IO_PORT @ATTACH &V3(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(30, -20) => @ORIENT("MY") => %port3;
*   $IO_PORT @ATTACH &V4(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(40, -20) => @ORIENT("R0") => %port4;
*   &VDD @REMOVE-FROM $PORT_FILL_SET;
*   &VSS @REMOVE-FROM $PORT_FILL_SET;
*   %j1 = (21, -9);
*   $JUNCTION @ATTACH %j1;
*   %j2 = (27, -9);
*   $JUNCTION @ATTACH %j2;
*   %j3 = (43, -9);
*   $JUNCTION @ATTACH %j3;
*   %j4 = (49, -9);
*   $JUNCTION @ATTACH %j4;
*   %j5 = (27, -20);
*   $JUNCTION @ATTACH %j5;
*   %j6 = (43, -20);
*   $JUNCTION @ATTACH %j6;
*   %j7 = (27, -31);
*   %j8 = (35, -31);
*   $JUNCTION @ATTACH %j8;
*   %j9 = (19, -9);
*   %j10 = (51, -9);
*   &VDD @WIRE(mode="straight") {#C1:1 %j1};
*   &VDD @WIRE(mode="straight") {#XM3:3 %j2};
*   &VDD @WIRE(mode="straight") {#XM4:3 %j3};
*   &VDD @WIRE(mode="straight") {#C2:1 %j4};
*   &V3 @WIRE(mode="straight") {#XM3:1 %j5};
*   &V3 @WIRE(mode="straight") {%j5 #XM1:1};
*   &V4 @WIRE(mode="straight") {#XM4:1 %j6};
*   &V4 @WIRE(mode="straight") {%j6 #XM2:1};
*   &net0 @WIRE(mode="straight") {#C1:2 #XM3:2};
*   &net2 @WIRE(mode="straight") {#C2:2 #XM4:2};
*   &net0 @WIRE(mode="straight") {#R1:2 #C1:2};
*   &net2 @WIRE(mode="straight") {#R2:2 #C2:2};
*   &V3 @WIRE(mode="straight") {#R1:1 %j5};
*   &V4 @WIRE(mode="straight") {#R2:1 %j6};
*   &V3 @WIRE(mode="straight") {%port3:p %j5};
*   &V4 @WIRE(mode="straight") {%port4:p %j6};
*   &net1 @WIRE(mode="straight") {#XM1:3 %j7};
*   &net1 @WIRE(mode="straight") {%j7 %j8};
*   &net1 @WIRE(mode="straight") {%j8 #ISS:1};
*   &net1 @WIRE(mode="straight") {%j8 (43, -31) #XM2:3};
*   &VDD @WIRE(mode="straight", linestyle="bold") {%j9 %j1};
*   &VDD @WIRE(mode="straight", linestyle="bold") {%j1 %j2};
*   &VDD @WIRE(mode="straight", linestyle="bold") {%j2 %j3};
*   &VDD @WIRE(mode="straight", linestyle="bold") {%j3 %j4};
*   &VDD @WIRE(mode="straight", linestyle="bold") {%j4 %j10};
*   &V2 @WIRE(mode="straight") {#XM2:2 %port2:p};
*   &V1 @WIRE(mode="straight") {%port1:p #XM1:2};
*   &VSS @WIRE(mode="straight") {%gnd1:p #ISS:2};
*   $JUNCTION @ATTACH (21, -15)(p) => %dot1;
*   $JUNCTION @ATTACH (49, -15)(p) => %dot2;
*   #XM3 @TEXT("\textbf{\textit{M}}_{\textbf{3}}", key="name", dx=0.4, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM3::name(label);
*   #XM4 @TEXT("\textbf{\textit{M}}_{\textbf{4}}", key="name", dx=-0.4, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM4::name(label);
*   #XM1 @TEXT("\textbf{\textit{M}}_{\textbf{1}}", key="name", dx=0.5, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM1::name(label);
*   #XM2 @TEXT("\textbf{\textit{M}}_{\textbf{2}}", key="name", dx=-0.5, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM2::name(label);
*   #C1 @TEXT("\textbf{\textit{C}}_{\textbf{1}}", key="name", dx=1.2, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #C1::name(label);
*   #C2 @TEXT("\textbf{\textit{C}}_{\textbf{2}}", key="name", dx=1.2, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #C2::name(label);
*   #R1 @TEXT("\textbf{\textit{R}}_{\textbf{1}}", key="name", dx=0, dy=-2, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #R1::name(label);
*   #R2 @TEXT("\textbf{\textit{R}}_{\textbf{2}}", key="name", dx=0, dy=-2, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #R2::name(label);
*   #ISS @TEXT("\textbf{\textit{I}}_{\textbf{SS}}", key="name", dx=1.5, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #ISS::name(label);
*   %port1 @TEXT("\textbf{\textit{V}}_{\textbf{1}}", key="name", dx=-2, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port1::name(label);
*   %port2 @TEXT("\textbf{\textit{V}}_{\textbf{2}}", key="name", dx=2, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port2::name(label);
*   %port3 @TEXT("\textbf{\textit{V}}_{\textbf{3}}", key="name", dx=2, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port3::name(label);
*   %port4 @TEXT("\textbf{\textit{V}}_{\textbf{4}}", key="name", dx=-2, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port4::name(label);
*   &VDD @TEXT("\textbf{\textit{V}}_{\textbf{DD}}", size=1.5116) => @PLACE(52, -10) => %power1;
*   $CANVAS_LABEL @ATTACH(bind="port") %power1(label)
* }
.ends dut
