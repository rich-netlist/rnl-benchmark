
* @RNL(type="header") {
*   @VERSION("0.3");
*   @USE-PACKAGE(name="rnl-std", version="0.3");
*   @USE-PACKAGE(name="rnl-std-no-labels", version="0.3");
*   @USE-PACKAGE(name="analog-canvas-extensions", version="0.6")
* }
.subckt dut VDD VSS Vin_p Vin_n Vout_p Vout_n Vcont_p Vcont_n
I1 net0 VSS DC 1m
ISS net1 VSS DC 1m
XM1 Vout_p Vin_p net3 VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM2 Vout_n Vin_n net3 VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM3 Vout_p E net2 VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM4 Vout_n F net2 VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM5 E Vin_n net0 VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM6 F Vin_p net0 VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM7 net3 Vcont_n net1 VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM8 net2 Vcont_p net1 VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
R1 VDD Vout_p 1k
R2 VDD Vout_n 1k
R3 VDD E 1k
R4 VDD F 1k
* @RNL(author="analog-canvas") {
*   $style1 = @DEFINE-STYLE(linewidth=0.128) {};
*   %dut_SYMBOL = @DEFINE-SYMBOL(box=[-8, -7, 8, 7]) {
*     (-8, 0) @PIN(terminal="Vin_p", label="\textbf{\textit{V}}_{\textbf{in}}", direction="left");
*     (-8, -2) @PIN(terminal="Vin_n", label="\textbf{\textit{Vin}}_{\textbf{\textit{n}}}", direction="left");
*     (8, 2) @PIN(terminal="Vout_p", label="\textbf{\textit{V}}_{\textbf{out}}", direction="right");
*     (8, 0) @PIN(terminal="Vout_n", label="\textbf{\textit{Vout}}_{\textbf{\textit{n}}}", direction="right");
*     (8, -2) @PIN(terminal="Vcont_p", label="\textbf{\textit{V}}_{\textbf{cont}}", direction="right");
*     (8, -4) @PIN(terminal="Vcont_n", label="\textbf{\textit{Vcont}}_{\textbf{\textit{n}}}", direction="right");
*     (0, 7) @PIN(terminal="VDD", label="\textbf{\textit{V}}_{\textbf{DD}}", direction="up");
*     (0, 0) @RECTANGLE(width=14, height=12);
*     @LINE {(-8, 0) (-7, 0)};
*     @LINE {(-8, -2) (-7, -2)};
*     @LINE {(8, 2) (7, 2)};
*     @LINE {(8, 0) (7, 0)};
*     @LINE {(8, -2) (7, -2)};
*     @LINE {(8, -4) (7, -4)};
*     @LINE {(0, 7) (0, 6)}
*   };
*   # @SET-SYMBOL %dut_SYMBOL;
*   $CANVAS_TYPESETTING @ATTACH #(level);
*   #XM1 @SET-SYMBOL $NMOS => @SET-STYLE $style1 => @PLACE(15, -9) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M1") #XM1(part);
*   #XM2 @SET-SYMBOL $NMOS => @SET-STYLE $style1 => @PLACE(21, -9) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M2") #XM2(part);
*   #XM3 @SET-SYMBOL $NMOS => @SET-STYLE $style1 => @PLACE(27, -19) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M3") #XM3(part);
*   #XM4 @SET-SYMBOL $NMOS => @SET-STYLE $style1 => @PLACE(33, -19) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M4") #XM4(part);
*   #XM5 @SET-SYMBOL $NMOS => @SET-STYLE $style1 => @PLACE(8, -24) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M5") #XM5(part);
*   #XM6 @SET-SYMBOL $NMOS => @SET-STYLE $style1 => @PLACE(14, -24) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M6") #XM6(part);
*   #XM7 @SET-SYMBOL $NMOS => @SET-STYLE $style1 => @PLACE(21, -24) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M7") #XM7(part);
*   #XM8 @SET-SYMBOL $NMOS => @SET-STYLE $style1 => @PLACE(27, -24) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M8") #XM8(part);
*   #R1 @SET-SYMBOL $RESISTOR => @SET-STYLE $style1 => @PLACE(27, -3) => @ORIENT("R0");
*   #R2 @SET-SYMBOL $RESISTOR => @SET-STYLE $style1 => @PLACE(33, -3) => @ORIENT("R0");
*   #R3 @SET-SYMBOL $RESISTOR => @SET-STYLE $style1 => @PLACE(8, -17) => @ORIENT("R0");
*   #R4 @SET-SYMBOL $RESISTOR => @SET-STYLE $style1 => @PLACE(14, -17) => @ORIENT("R0");
*   #I1 @SET-SYMBOL $CURRENT_SOURCE => @SET-STYLE $style1 => @PLACE(11, -29.5) => @ORIENT("R0");
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
*   #ISS @SET-SYMBOL $CURRENT_SOURCE => @SET-STYLE $style1 => @PLACE(24, -29.5) => @ORIENT("R0");
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
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @SET-STYLE $style1 => @PLACE(11, -31) => @ORIENT("R0") => %gnd1;
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @SET-STYLE $style1 => @PLACE(24, -31) => @ORIENT("R0") => %gnd2;
*   $IO_PORT @ATTACH &Vin_p(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @SET-STYLE $style1 => @PLACE(0.6, -9) => @ORIENT("R0") => %port1;
*   $IO_PORT @ATTACH &Vin_n(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @SET-STYLE $style1 => @PLACE(0.6, -12) => @ORIENT("R0") => %port2;
*   $IO_PORT @ATTACH &Vout_p(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @SET-STYLE $style1 => @PLACE(36.1, -5) => @ORIENT("MY") => %port3;
*   $IO_PORT @ATTACH &Vout_n(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @SET-STYLE $style1 => @PLACE(36.1, -7) => @ORIENT("MY") => %port4;
*   $IO_PORT @ATTACH &Vcont_p(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @SET-STYLE $style1 => @PLACE(30.2, -24) => @ORIENT("MY") =>
*       %port5;
*   $IO_PORT @ATTACH &Vcont_n(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @SET-STYLE $style1 => @PLACE(30.2, -27) => @ORIENT("MY") =>
*       %port6;
*   &VDD @REMOVE-FROM $PORT_FILL_SET;
*   &VSS @REMOVE-FROM $PORT_FILL_SET;
*   %j1 = (26, 0);
*   %j2 = (34, 0);
*   %j3 = (7, -14);
*   %j4 = (15, -14);
*   %j5 = (2, -9);
*   $JUNCTION @ATTACH %j5;
*   %j6 = (3, -12);
*   $JUNCTION @ATTACH %j6;
*   %j7 = (33, -7);
*   $JUNCTION @ATTACH %j7;
*   %j8 = (11, -26);
*   $JUNCTION @ATTACH %j8;
*   %j9 = (24, -26);
*   $JUNCTION @ATTACH %j9;
*   %j10 = (27, 0);
*   $JUNCTION @ATTACH %j10;
*   %j11 = (33, 0);
*   $JUNCTION @ATTACH %j11;
*   %j12 = (8, -14);
*   $JUNCTION @ATTACH %j12;
*   %j13 = (14, -14);
*   $JUNCTION @ATTACH %j13;
*   &VDD @WIRE(mode="straight", linestyle="bold") {%j1 %j10};
*   &VDD @WIRE(mode="straight", linestyle="bold") {%j10 %j11};
*   &VDD @WIRE(mode="straight", linestyle="bold") {%j11 %j2};
*   &VDD @WIRE(mode="straight", linestyle="bold") {%j3 %j12};
*   &VDD @WIRE(mode="straight", linestyle="bold") {%j12 %j13};
*   &VDD @WIRE(mode="straight", linestyle="bold") {%j13 %j4};
*   &Vin_p @WIRE(mode="straight", linewidth=0.12) {%port1:p %j5};
*   &Vin_p @WIRE(mode="straight", linewidth=0.12) {%j5 #XM1:2};
*   &Vin_p @WIRE(mode="straight", linewidth=0.12) {#XM6:2 (17, -27) (2, -27) %j5};
*   &Vin_n @WIRE(mode="straight", linewidth=0.12) {%port2:p %j6};
*   &Vin_n @WIRE(mode="straight", linewidth=0.12) {%j6 (24, -12) #XM2:2};
*   &Vin_n @WIRE(mode="straight", linewidth=0.12) {#XM5:2 (3, -24) %j6};
*   &Vout_n @WIRE(mode="straight", linewidth=0.12) {#XM2:1 %j7};
*   &Vout_n @WIRE(mode="straight", linewidth=0.12) {#XM4:1 %j7};
*   &Vout_n @WIRE(mode="straight", linewidth=0.12) {#R2:2 %j7};
*   &Vout_n @WIRE(mode="straight", linewidth=0.12) {%j7 %port4:p};
*   &net3 @WIRE(mode="straight", linewidth=0.12) {#XM1:3 #XM2:3};
*   &net3 @WIRE(mode="straight", linewidth=0.12) {#XM7:1 #XM2:3};
*   &E @WIRE(mode="straight", linewidth=0.12) {#R3:2 #XM5:1} => %wire1;
*   &E @WIRE(mode="straight", linewidth=0.12) {#R3:2 #XM3:2};
*   &F @WIRE(mode="straight", linewidth=0.12) {#R4:2 #XM6:1};
*   &F @WIRE(mode="straight", linewidth=0.12) {#XM6:1 (36, -22) #XM4:2};
*   &net2 @WIRE(mode="straight", linewidth=0.12) {#XM3:3 #XM4:3};
*   &net2 @WIRE(mode="straight", linewidth=0.12) {#XM8:1 #XM3:3};
*   &VSS @WIRE(mode="straight", linewidth=0.12) {#I1:2 %gnd1:p};
*   &VSS @WIRE(mode="straight", linewidth=0.12) {#ISS:2 %gnd2:p};
*   &net0 @WIRE(mode="straight", linewidth=0.12) {#XM5:3 %j8};
*   &net0 @WIRE(mode="straight", linewidth=0.12) {%j8 #XM6:3};
*   &net0 @WIRE(mode="straight", linewidth=0.12) {#I1:1 %j8};
*   &net1 @WIRE(mode="straight", linewidth=0.12) {#XM7:3 %j9};
*   &net1 @WIRE(mode="straight", linewidth=0.12) {%j9 #XM8:3};
*   &net1 @WIRE(mode="straight", linewidth=0.12) {#ISS:1 %j9};
*   &Vcont_p @WIRE(mode="straight", linewidth=0.12) {%port5:p #XM8:2};
*   &Vcont_n @WIRE(mode="straight", linewidth=0.12) {%port6:p (18, -27) #XM7:2};
*   &VDD @WIRE(mode="straight", linewidth=0.12) {#R1:1 %j10};
*   &VDD @WIRE(mode="straight", linewidth=0.12) {#R2:1 %j11};
*   &VDD @WIRE(mode="straight", linewidth=0.12) {#R3:1 %j12};
*   &VDD @WIRE(mode="straight", linewidth=0.12) {#R4:1 %j13};
*   &Vout_p @WIRE(mode="straight", linewidth=0.12) {#XM1:1 (15, -5) #R1:2};
*   &Vout_p @WIRE(mode="straight", linewidth=0.12) {#XM3:1 #R1:2};
*   &Vout_p @WIRE(mode="straight", linewidth=0.12) {#R1:2 %port3:p};
*   $JUNCTION @ATTACH (27, -5)(p) => %dot1;
*   $JUNCTION @ATTACH (27, -21)(p) => %dot2;
*   $JUNCTION @ATTACH (21, -11)(p) => %dot3;
*   $JUNCTION @ATTACH (14, -22)(p) => %dot4;
*   $JUNCTION @ATTACH (8, -19)(p) => %dot5;
*   #XM1 @TEXT("\textbf{\textit{M}}_{\textbf{1}}", key="name", dx=0.2, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM1::name(label);
*   #XM2 @TEXT("\textbf{\textit{M}}_{\textbf{2}}", key="name", dx=-0.5, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM2::name(label);
*   #XM3 @TEXT("\textbf{\textit{M}}_{\textbf{3}}", key="name", dx=0.2, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM3::name(label);
*   #XM4 @TEXT("\textbf{\textit{M}}_{\textbf{4}}", key="name", dx=-0.5, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM4::name(label);
*   #XM5 @TEXT("\textbf{\textit{M}}_{\textbf{5}}", key="name", dx=0.5, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM5::name(label);
*   #XM6 @TEXT("\textbf{\textit{M}}_{\textbf{6}}", key="name", dx=-0.4, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM6::name(label);
*   #XM7 @TEXT("\textbf{\textit{M}}_{\textbf{7}}", key="name", dx=0.3, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM7::name(label);
*   #XM8 @TEXT("\textbf{\textit{M}}_{\textbf{8}}", key="name", dx=-0.5, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM8::name(label);
*   #R1 @TEXT("\textbf{\textit{R}}_{\textbf{1}}", key="name", dx=-1, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #R1::name(label);
*   #R2 @TEXT("\textbf{\textit{R}}_{\textbf{2}}", key="name", dx=1.1, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #R2::name(label);
*   #ISS @TEXT("\textbf{\textit{I}}_{\textbf{SS}}", key="name", dx=1.5, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #ISS::name(label);
*   %port1 @TEXT("\textbf{\textit{V}}_{\textbf{in}}", key="name", dx=-0.7, dy=-1.7, halign="end", valign="baseline", size=1.5116);
*   %port3 @TEXT("\textbf{\textit{V}}_{\textbf{out}}", key="name", dx=1.4, dy=-1.5, halign="start", valign="baseline", size=1.5116);
*   %port5 @TEXT("\textbf{\textit{V}}_{\textbf{cont}}", key="name", dx=0.6, dy=-2, halign="start", valign="baseline", size=1.5116);
*   &VDD @TEXT("\textbf{\textit{V}}_{\textbf{DD}}", size=1.5116) => @PLACE(34.3, -0.3) => %power1;
*   $CANVAS_LABEL @ATTACH(bind="port") %power1(label);
*   &VDD @TEXT("\textbf{\textit{V}}_{\textbf{DD}}", halign="end", size=1.5116) => @PLACE(6.7, -14.3) => %power2;
*   $CANVAS_LABEL @ATTACH(bind="port") %power2(label);
*   %wire1 @TEXT("\textbf{\textit{E}}", size=1.5116) => @PLACE(8.4, -20.5) => %label1;
*   $CANVAS_LABEL @ATTACH(bind="net") %label1(label);
*   &F @TEXT("\textbf{\textit{F}}", halign="end", size=1.5116) => @PLACE(13.2, -22.5) => %label2;
*   $CANVAS_LABEL @ATTACH(bind="net") %label2(label);
*   (33, -24.2) @TEXT("+", halign="middle", size=1.5116, bold=true) => %text1;
*   $CANVAS_TYPOGRAPHY @ATTACH(token="label") %text1(text);
*   (33, -27.7) @TEXT("−", halign="middle", size=1.5116, bold=true) => %text2;
*   $CANVAS_TYPOGRAPHY @ATTACH(token="label") %text2(text);
*   (0, -35.3) @TEXT("\textbf{Figure 15.50}  Interpolating delay stage with current steering.", size=1.442) => %text3;
*   $CANVAS_TYPOGRAPHY @ATTACH(token="caption") %text3(text)
* }
.ends dut
