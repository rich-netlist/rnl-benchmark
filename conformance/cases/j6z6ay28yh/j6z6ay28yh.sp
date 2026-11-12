
* @RNL(type="header") {
*   @VERSION("0.3");
*   @USE-PACKAGE(name="rnl-std", version="0.3");
*   @USE-PACKAGE(name="rnl-std-no-labels", version="0.3");
*   @USE-PACKAGE(name="analog-canvas-extensions", version="0.6")
* }
.subckt fig9_93 VDD VSS Vin_p Vin_n Vout1 Vout2 Vb
I1 VDD net1 DC 1m
I2 VDD net0 DC 1m
XM1 net2 Vin_p net1 VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM10 Vout1 Vin_n net0 VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM2 net3 Vin_n net1 VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM3 net2 Vb VSS VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM4 net3 Vb VSS VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM5 Vout1 net2 VSS VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM6 Vout2 net3 VSS VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM7 Vout1 Vb VDD VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM8 Vout2 Vb VDD VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM9 Vout2 Vin_p net0 VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
* @RNL(author="analog-canvas") {
*   $style1 = @DEFINE-STYLE(linewidth=0.128) {};
*   %fig9_93_SYMBOL = @DEFINE-SYMBOL(box=[-7, -7, 7, 7]) {
*     (0, 7) @PIN(terminal="VDD", label="\textbf{\textit{V}}_{\textbf{DD}}", direction="up");
*     (-7, 2) @PIN(terminal="Vin_p", label="\textbf{\textit{V}}_{\textbf{in}}", direction="left");
*     (-7, -2) @PIN(terminal="Vin_n", label="\textbf{\textit{Vin}}_{\textbf{\textit{n}}}", direction="left");
*     (-7, 0) @PIN(terminal="Vout1", label="\textbf{\textit{V}}_{\textbf{out1}}", direction="left");
*     (7, -1) @PIN(terminal="Vout2", label="\textbf{\textit{V}}_{\textbf{out2}}", direction="right");
*     (-7, -4) @PIN(terminal="Vb", label="\textbf{\textit{V}}_{\textbf{b}}", direction="left");
*     (0, 0) @RECTANGLE(width=12, height=12);
*     @LINE {(0, 7) (0, 6)};
*     @LINE {(-7, 2) (-6, 2)};
*     @LINE {(-7, -2) (-6, -2)};
*     @LINE {(-7, 0) (-6, 0)};
*     @LINE {(7, -1) (6, -1)};
*     @LINE {(-7, -4) (-6, -4)}
*   };
*   # @SET-SYMBOL %fig9_93_SYMBOL;
*   $CANVAS_TYPESETTING @ATTACH(subscript_italic=false) #(level);
*   #XM1 @SET-SYMBOL $PMOS => @SET-STYLE $style1 => @PLACE(16, -8) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M1") #XM1(part);
*   #XM2 @SET-SYMBOL $PMOS => @SET-STYLE $style1 => @PLACE(22, -8) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M2") #XM2(part);
*   #XM3 @SET-SYMBOL $NMOS => @SET-STYLE $style1 => @PLACE(16, -16) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M3") #XM3(part);
*   #XM4 @SET-SYMBOL $NMOS => @SET-STYLE $style1 => @PLACE(22, -16) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M4") #XM4(part);
*   #XM5 @SET-SYMBOL $NMOS => @SET-STYLE $style1 => @PLACE(3, -14) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M5") #XM5(part);
*   #XM6 @SET-SYMBOL $NMOS => @SET-STYLE $style1 => @PLACE(34, -14) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M6") #XM6(part);
*   #XM7 @SET-SYMBOL $PMOS => @SET-STYLE $style1 => @PLACE(3, -4) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M7") #XM7(part);
*   #XM8 @SET-SYMBOL $PMOS => @SET-STYLE $style1 => @PLACE(34, -4) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M8") #XM8(part);
*   #XM9 @SET-SYMBOL $PMOS => @SET-STYLE $style1 => @PLACE(13, -8) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M9") #XM9(part);
*   #XM10 @SET-SYMBOL $PMOS => @SET-STYLE $style1 => @PLACE(25, -8) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M10") #XM10(part);
*   #I1 @SET-SYMBOL $CURRENT_SOURCE => @SET-STYLE $style1 => @PLACE(21, -2.8) => @ORIENT("R0");
*   $CANVAS_PARAMETER @ATTACH(name="amplitude", text="1m") #I1(part);
*   $CANVAS_PARAMETER @ATTACH(name="damping", text="0") #I1(part);
*   $CANVAS_PARAMETER @ATTACH(name="delay", text="0") #I1(part);
*   $CANVAS_PARAMETER @ATTACH(name="fall", text="1ps") #I1(part);
*   $CANVAS_PARAMETER @ATTACH(name="frequency", text="1k") #I1(part);
*   $CANVAS_PARAMETER @ATTACH(name="high", text="1m") #I1(part);
*   $CANVAS_PARAMETER @ATTACH(name="low", text="0") #I1(part);
*   $CANVAS_PARAMETER @ATTACH(name="offset", text="0") #I1(part);
*   $CANVAS_PARAMETER @ATTACH(name="period", text="10ns") #I1(part);
*   $CANVAS_PARAMETER @ATTACH(name="phase", text="0") #I1(part);
*   $CANVAS_PARAMETER @ATTACH(name="rise", text="1ps") #I1(part);
*   $CANVAS_PARAMETER @ATTACH(name="waveform", text="dc") #I1(part);
*   $CANVAS_PARAMETER @ATTACH(name="width", text="5ns") #I1(part);
*   #I2 @SET-SYMBOL $CURRENT_SOURCE => @SET-STYLE $style1 => @PLACE(17, -2.8) => @ORIENT("R0");
*   $CANVAS_PARAMETER @ATTACH(name="amplitude", text="1m") #I2(part);
*   $CANVAS_PARAMETER @ATTACH(name="damping", text="0") #I2(part);
*   $CANVAS_PARAMETER @ATTACH(name="delay", text="0") #I2(part);
*   $CANVAS_PARAMETER @ATTACH(name="fall", text="1ps") #I2(part);
*   $CANVAS_PARAMETER @ATTACH(name="frequency", text="1k") #I2(part);
*   $CANVAS_PARAMETER @ATTACH(name="high", text="1m") #I2(part);
*   $CANVAS_PARAMETER @ATTACH(name="low", text="0") #I2(part);
*   $CANVAS_PARAMETER @ATTACH(name="offset", text="0") #I2(part);
*   $CANVAS_PARAMETER @ATTACH(name="period", text="10ns") #I2(part);
*   $CANVAS_PARAMETER @ATTACH(name="phase", text="0") #I2(part);
*   $CANVAS_PARAMETER @ATTACH(name="rise", text="1ps") #I2(part);
*   $CANVAS_PARAMETER @ATTACH(name="waveform", text="dc") #I2(part);
*   $CANVAS_PARAMETER @ATTACH(name="width", text="5ns") #I2(part);
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @SET-STYLE $style1 => @PLACE(16, -17.4) => @ORIENT("R0") => %gnd1;
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @SET-STYLE $style1 => @PLACE(22, -17.4) => @ORIENT("R0") => %gnd2;
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @SET-STYLE $style1 => @PLACE(3, -15.4) => @ORIENT("R0") => %gnd3;
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @SET-STYLE $style1 => @PLACE(34, -15.4) => @ORIENT("R0") => %gnd4;
*   $IO_PORT @ATTACH &Vin_p(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @SET-STYLE $style1 => @PLACE(9.7, -8) => @ORIENT("R0") => %port1;
*   $IO_PORT @ATTACH &Vin_n(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @SET-STYLE $style1 => @PLACE(9.7, -10) => @ORIENT("R0") => %port2;
*   $IO_PORT @ATTACH &Vout1(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @SET-STYLE $style1 => @PLACE(0.7, -9) => @ORIENT("R0") => %port3;
*   $IO_PORT @ATTACH &Vout2(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @SET-STYLE $style1 => @PLACE(36.3, -9) => @ORIENT("MY") => %port4;
*   $IO_PORT @ATTACH &Vb(p) => @SET-SYMBOL $CANVAS_PORT_FILLED => @SET-STYLE $style1 => @PLACE(12.7, -16) => @ORIENT("R0") =>
*       %port5;
*   $IO_PORT @ATTACH &Vb(p) => @SET-SYMBOL $CANVAS_PORT_FILLED => @SET-STYLE $style1 => @PLACE(6.3, -4) => @ORIENT("MY") => %port6;
*   $IO_PORT @ATTACH &Vb(p) => @SET-SYMBOL $CANVAS_PORT_FILLED => @SET-STYLE $style1 => @PLACE(30.7, -4) => @ORIENT("R0") => %port7;
*   &VDD @REMOVE-FROM $PORT_FILL_SET;
*   &VSS @REMOVE-FROM $PORT_FILL_SET;
*   %j1 = (2, 0);
*   %j2 = (35, 0);
*   %j3 = (3, 0);
*   $JUNCTION @ATTACH %j3;
*   %j4 = (34, 0);
*   $JUNCTION @ATTACH %j4;
*   %j5 = (21, 0);
*   $JUNCTION @ATTACH %j5;
*   %j6 = (17, 0);
*   $JUNCTION @ATTACH %j6;
*   %j7 = (3, -9);
*   $JUNCTION @ATTACH %j7;
*   %j8 = (34, -9);
*   $JUNCTION @ATTACH %j8;
*   %j9 = (21, -6);
*   $JUNCTION @ATTACH %j9;
*   %j10 = (17, -5);
*   $JUNCTION @ATTACH %j10;
*   &VDD @WIRE(mode="straight", linestyle="bold") {%j1 %j3};
*   &VDD @WIRE(mode="straight", linestyle="bold") {%j3 %j6};
*   &VDD @WIRE(mode="straight", linestyle="bold") {%j6 %j5};
*   &VDD @WIRE(mode="straight", linestyle="bold") {%j5 %j4};
*   &VDD @WIRE(mode="straight", linestyle="bold") {%j4 %j2};
*   &VDD @WIRE(mode="straight", linewidth=0.12) {#XM7:3 %j3};
*   &VDD @WIRE(mode="straight", linewidth=0.12) {#XM8:3 %j4};
*   &VDD @WIRE(mode="straight", linewidth=0.12) {#I1:1 %j5};
*   &VDD @WIRE(mode="straight", linewidth=0.12) {#I2:1 %j6};
*   &Vin_p @WIRE(mode="straight", linewidth=0.12) {%port1:p #XM9:2};
*   &Vin_p @WIRE(mode="straight", linewidth=0.12) {#XM9:2 #XM1:2};
*   &Vin_n @WIRE(mode="straight", linewidth=0.12) {%port2:p (28, -10) #XM10:2};
*   &Vin_n @WIRE(mode="straight", linewidth=0.12) {#XM10:2 #XM2:2};
*   &Vb @WIRE(mode="straight", linewidth=0.12) {%port5:p #XM3:2};
*   &Vb @WIRE(mode="straight", linewidth=0.12) {#XM3:2 #XM4:2};
*   &Vb @WIRE(mode="straight", linewidth=0.12) {%port6:p #XM7:2};
*   &Vb @WIRE(mode="straight", linewidth=0.12) {%port7:p #XM8:2};
*   &net1 @WIRE(mode="straight", linewidth=0.12) {#XM1:3 %j9};
*   &net1 @WIRE(mode="straight", linewidth=0.12) {#XM2:3 %j9};
*   &net1 @WIRE(mode="straight", linewidth=0.12) {#I1:2 %j9};
*   &net0 @WIRE(mode="straight", linewidth=0.12) {#XM9:3 (13, -5) %j10};
*   &net0 @WIRE(mode="straight", linewidth=0.12) {#XM10:3 (25, -5) %j10};
*   &net0 @WIRE(mode="straight", linewidth=0.12) {#I2:2 %j10};
*   &net2 @WIRE(mode="straight", linewidth=0.12) {#XM1:1 (16, -14) #XM5:2};
*   &net3 @WIRE(mode="straight", linewidth=0.12) {#XM2:1 (22, -14) #XM6:2};
*   &Vout2 @WIRE(mode="straight", linewidth=0.12) {#XM9:1 (13, -11) (18, -11) (20, -12) (34, -12) %j8};
*   &Vout2 @WIRE(mode="straight", linewidth=0.12) {#XM8:1 %j8};
*   &Vout2 @WIRE(mode="straight", linewidth=0.12) {%j8 %port4:p};
*   &Vout1 @WIRE(mode="straight", linewidth=0.12) {#XM10:1 (25, -11) (20, -11) (17, -12) (3, -12) %j7};
*   &Vout1 @WIRE(mode="straight", linewidth=0.12) {#XM7:1 %j7};
*   &Vout1 @WIRE(mode="straight", linewidth=0.12) {%j7 %port3:p};
*   &VSS @WIRE(mode="straight", linewidth=0.12) {#XM3:3 %gnd1:p};
*   &VSS @WIRE(mode="straight", linewidth=0.12) {#XM4:3 %gnd2:p};
*   &VSS @WIRE(mode="straight", linewidth=0.12) {#XM5:3 %gnd3:p};
*   &VSS @WIRE(mode="straight", linewidth=0.12) {#XM6:3 %gnd4:p};
*   $JUNCTION @ATTACH (16, -14)(p) => %dot1;
*   $JUNCTION @ATTACH (22, -14)(p) => %dot2;
*   $JUNCTION @ATTACH (34, -12)(p) => %dot3;
*   $JUNCTION @ATTACH (3, -12)(p) => %dot4;
*   &VDD @TEXT("\textbf{\textit{V}}_{\textbf{DD}}", size=1.5116) => @PLACE(35.6, -0.3) => %power1;
*   $CANVAS_LABEL @ATTACH(bind="port") %power1(label);
*   #XM1 @TEXT("\textbf{\textit{M}}_{\textbf{1}}", key="name", dx=0.5, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM1::name(label);
*   #XM2 @TEXT("\textbf{\textit{M}}_{\textbf{2}}", key="name", dx=-0.5, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM2::name(label);
*   #XM3 @TEXT("\textbf{\textit{M}}_{\textbf{3}}", key="name", dx=-3.3, dy=-2.3, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM3::name(label);
*   #XM4 @TEXT("\textbf{\textit{M}}_{\textbf{4}}", key="name", dx=-3.3, dy=-2.3, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM4::name(label);
*   #XM5 @TEXT("\textbf{\textit{M}}_{\textbf{5}}", key="name", dx=-0.5, dy=-0.2, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM5::name(label);
*   #XM6 @TEXT("\textbf{\textit{M}}_{\textbf{6}}", key="name", dx=0.5, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM6::name(label);
*   #XM7 @TEXT("\textbf{\textit{M}}_{\textbf{7}}", key="name", dx=-0.5, dy=-0.3, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM7::name(label);
*   #XM8 @TEXT("\textbf{\textit{M}}_{\textbf{8}}", key="name", dx=0.5, dy=-0.3, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM8::name(label);
*   #XM9
*       @TEXT("\textbf{\textit{M}}_{\textbf{1}}^{\textbf{′}}", key="name", dx=-2.7, dy=1.7, halign="start", valign="baseline",
*       size=1.5116);
*   #XM10
*       @TEXT("\textbf{\textit{M}}_{\textbf{2}}^{\textbf{′}}", key="name", dx=0.5, dy=1.7, halign="start", valign="baseline",
*       size=1.5116);
*   %port1 @TEXT("\textbf{\textit{V}}_{\textbf{in}}", key="name", dx=-1.1, dy=-1, halign="end", valign="baseline", size=1.5116);
*   %port3 @TEXT("\textbf{\textit{V}}_{\textbf{out1}}", key="name", dx=-1.4, dy=-0.3, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port3::name(label);
*   %port4
*       @TEXT("\textbf{\textit{V}}_{\textbf{out2}}", key="name", dx=1.3, dy=-0.3, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port4::name(label);
*   %port5 @TEXT("\textbf{\textit{V}}_{\textbf{b}}", key="name", dx=-1.1, dy=-0.3, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port5::name(label);
*   %port6 @TEXT("\textbf{\textit{V}}_{\textbf{b}}", key="name", dx=1.3, dy=-0.3, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port6::name(label);
*   %port7 @TEXT("\textbf{\textit{V}}_{\textbf{b}}", key="name", dx=-1.2, dy=-0.3, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port7::name(label);
*   (20.5, -21.5) @TEXT("Figure 9.93", halign="middle", size=1.4, bold=true) => %text1;
*   $CANVAS_TYPOGRAPHY @ATTACH(token="caption") %text1(text);
*   (20.5, -23.9) @TEXT("Two-Stage Op Amp with a Parallel Fast Path", halign="middle", size=1.19, bold=true) => %text2;
*   $CANVAS_TYPOGRAPHY @ATTACH(token="caption") %text2(text);
*   (20.5, -25.7) @TEXT("AI reconstruction · Razavi, 2nd ed., p. 409 · Problem 9.24", halign="middle", size=1.0884) => %text3;
*   $CANVAS_TYPOGRAPHY @ATTACH(token="body") %text3(text)
* }
.ends fig9_93
