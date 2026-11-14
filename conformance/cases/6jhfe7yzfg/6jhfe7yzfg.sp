
* @RNL(type="header") {
*   @VERSION("0.4");
*   @USE-PACKAGE(name="rnl-std-style", version="0.4");
*   @USE-PACKAGE(name="rnl-std-basic", version="0.4");
*   @USE-PACKAGE(name="rnl-std-semiconductors", version="0.4");
*   @USE-PACKAGE(name="rnl-std-no-labels", version="0.4");
*   @USE-PACKAGE(name="analog-canvas-extensions", version="0.7")
* }
.subckt fig9_92 VDD VSS Vin_p Vin_n Vout1 Vout2 Vb
I1 VDD net2 DC 1m
XM1 X Vin_p net2 VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM10 net1 X VSS VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM11 net0 net0 VDD VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM12 net1 net1 VDD VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM2 Y Vin_n net2 VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM3 X Vb VSS VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM4 Y Vb VSS VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM5 Vout1 X VSS VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM6 Vout2 Y VSS VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM7 Vout1 net0 VDD VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM8 Vout2 net1 VDD VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM9 net0 Y VSS VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
* @RNL(author="analog-canvas") {
*   $style1 = @DEFINE-STYLE(linewidth=0.128) {};
*   %fig9_92_SYMBOL = @DEFINE-SYMBOL(box=[-7, -7, 7, 7]) {
*     (-7, 2) @PIN(terminal="Vin_p", label="\textbf{\textit{V}}_{\textbf{in}}", direction="left");
*     (-7, -2) @PIN(terminal="Vin_n", label="\textbf{\textit{Vin}}_{\textbf{\textit{n}}}", direction="left");
*     (-7, 0) @PIN(terminal="Vout1", label="\textbf{\textit{V}}_{\textbf{out1}}", direction="left");
*     (7, -1) @PIN(terminal="Vout2", label="\textbf{\textit{V}}_{\textbf{out2}}", direction="right");
*     (-7, -4) @PIN(terminal="Vb", label="\textbf{\textit{V}}_{\textbf{b}}", direction="left");
*     (0, 7) @PIN(terminal="VDD", label="\textbf{\textit{V}}_{\textbf{DD}}", direction="up");
*     (0, 0) @RECTANGLE(width=12, height=12);
*     @LINE {(-7, 2) (-6, 2)};
*     @LINE {(-7, -2) (-6, -2)};
*     @LINE {(-7, 0) (-6, 0)};
*     @LINE {(7, -1) (6, -1)};
*     @LINE {(-7, -4) (-6, -4)};
*     @LINE {(0, 7) (0, 6)}
*   };
*   # @SET-SYMBOL %fig9_92_SYMBOL;
*   $CANVAS_TYPESETTING @ATTACH(subscript_italic=false) #(level);
*   #XM1 @SET-SYMBOL(terminals=[[1, "d"], [2, "g"], [3, "s"]]) $PMOS => @SET-STYLE $style1 => @PLACE(18, -7) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M1") #XM1(part);
*   #XM2 @SET-SYMBOL(terminals=[[1, "d"], [2, "g"], [3, "s"]]) $PMOS => @SET-STYLE $style1 => @PLACE(23, -7) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M2") #XM2(part);
*   #XM3 @SET-SYMBOL(terminals=[[1, "d"], [2, "g"], [3, "s"]]) $NMOS => @SET-STYLE $style1 => @PLACE(18, -16) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M3") #XM3(part);
*   #XM4 @SET-SYMBOL(terminals=[[1, "d"], [2, "g"], [3, "s"]]) $NMOS => @SET-STYLE $style1 => @PLACE(23, -16) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M4") #XM4(part);
*   #XM5 @SET-SYMBOL(terminals=[[1, "d"], [2, "g"], [3, "s"]]) $NMOS => @SET-STYLE $style1 => @PLACE(3, -14) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M5") #XM5(part);
*   #XM6 @SET-SYMBOL(terminals=[[1, "d"], [2, "g"], [3, "s"]]) $NMOS => @SET-STYLE $style1 => @PLACE(38, -14) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M6") #XM6(part);
*   #XM7 @SET-SYMBOL(terminals=[[1, "d"], [2, "g"], [3, "s"]]) $PMOS => @SET-STYLE $style1 => @PLACE(3, -4) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M7") #XM7(part);
*   #XM8 @SET-SYMBOL(terminals=[[1, "d"], [2, "g"], [3, "s"]]) $PMOS => @SET-STYLE $style1 => @PLACE(38, -4) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M8") #XM8(part);
*   #XM9 @SET-SYMBOL(terminals=[[1, "d"], [2, "g"], [3, "s"]]) $NMOS => @SET-STYLE $style1 => @PLACE(9, -10) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M9") #XM9(part);
*   #XM10 @SET-SYMBOL(terminals=[[1, "d"], [2, "g"], [3, "s"]]) $NMOS => @SET-STYLE $style1 => @PLACE(32, -10) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M10") #XM10(part);
*   #XM11 @SET-SYMBOL(terminals=[[1, "d"], [2, "g"], [3, "s"]]) $PMOS => @SET-STYLE $style1 => @PLACE(9, -4) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M11") #XM11(part);
*   #XM12 @SET-SYMBOL(terminals=[[1, "d"], [2, "g"], [3, "s"]]) $PMOS => @SET-STYLE $style1 => @PLACE(32, -4) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M12") #XM12(part);
*   #I1 @SET-SYMBOL $CURRENT_SOURCE => @SET-STYLE $style1 => @PLACE(20.5, -2.8) => @ORIENT("R0");
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
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @SET-STYLE $style1 => @PLACE(18, -17.4) => @ORIENT("R0") => %gnd1;
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @SET-STYLE $style1 => @PLACE(23, -17.4) => @ORIENT("R0") => %gnd2;
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @SET-STYLE $style1 => @PLACE(3, -15.4) => @ORIENT("R0") => %gnd3;
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @SET-STYLE $style1 => @PLACE(38, -15.4) => @ORIENT("R0") => %gnd4;
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @SET-STYLE $style1 => @PLACE(9, -11.4) => @ORIENT("R0") => %gnd5;
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @SET-STYLE $style1 => @PLACE(32, -11.4) => @ORIENT("R0") => %gnd6;
*   $IO_PORT @ATTACH &Vin_p(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @SET-STYLE $style1 => @PLACE(14.6, -7) => @ORIENT("R0") => %port1;
*   $IO_PORT @ATTACH &Vin_n(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @SET-STYLE $style1 => @PLACE(14.6, -9) => @ORIENT("R0") => %port2;
*   $IO_PORT @ATTACH &Vout1(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @SET-STYLE $style1 => @PLACE(0.7, -9) => @ORIENT("R0") => %port3;
*   $IO_PORT @ATTACH &Vout2(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @SET-STYLE $style1 => @PLACE(40.3, -9) => @ORIENT("MY") => %port4;
*   $IO_PORT @ATTACH &Vb(p) => @SET-SYMBOL $CANVAS_PORT_FILLED => @SET-STYLE $style1 => @PLACE(14.6, -16) => @ORIENT("R0") =>
*       %port5;
*   %j1 = (2, 0);
*   %j2 = (39, 0);
*   %j3 = (3, -9);
*   %j4 = (38, -9);
*   %j5 = (18, -12);
*   %j6 = (23, -12);
*   %j7 = (6, -4);
*   %j8 = (35, -4);
*   %j9 = (20.5, -5);
*   %j10 = (3, 0);
*   %j11 = (9, 0);
*   %j12 = (32, 0);
*   %j13 = (38, 0);
*   %j14 = (20.5, 0);
*   &VDD @WIRE(mode="straight", linestyle="bold") {%j1 %j10};
*   &VDD @WIRE(mode="straight", linestyle="bold") {%j10 %j11};
*   &VDD @WIRE(mode="straight", linestyle="bold") {%j11 %j14};
*   &VDD @WIRE(mode="straight", linestyle="bold") {%j14 %j12};
*   &VDD @WIRE(mode="straight", linestyle="bold") {%j12 %j13};
*   &VDD @WIRE(mode="straight", linestyle="bold") {%j13 %j2};
*   &Vin_p @WIRE(mode="straight", linewidth=0.12) {%port1::pin #XM1:2};
*   &Vin_n @WIRE(mode="straight", linewidth=0.12) {%port2::pin (26, -9) #XM2:2};
*   &Vb @WIRE(mode="straight", linewidth=0.12) {%port5::pin #XM3:2};
*   &Vb @WIRE(mode="straight", linewidth=0.12) {#XM3:2 #XM4:2};
*   &Vout1 @WIRE(mode="straight", linewidth=0.12) {%port3::pin %j3};
*   &Vout1 @WIRE(mode="straight", linewidth=0.12) {%j3 #XM7:1};
*   &Vout1 @WIRE(mode="straight", linewidth=0.12) {%j3 #XM5:1};
*   &Vout2 @WIRE(mode="straight", linewidth=0.12) {%port4::pin %j4};
*   &Vout2 @WIRE(mode="straight", linewidth=0.12) {%j4 #XM8:1};
*   &Vout2 @WIRE(mode="straight", linewidth=0.12) {%j4 #XM6:1};
*   &net2 @WIRE(mode="straight", linewidth=0.12) {#XM1:3 %j9};
*   &net2 @WIRE(mode="straight", linewidth=0.12) {#XM2:3 %j9};
*   &net2 @WIRE(mode="straight", linewidth=0.12) {#I1:2 %j9};
*   &net0 @WIRE(mode="straight", linewidth=0.12) {#XM7:2 (6, -6) (9, -6) #XM9:1};
*   &net1 @WIRE(mode="straight", linewidth=0.12) {#XM10:1 (32, -6) (35, -6) #XM8:2};
*   &X @WIRE(mode="straight", linewidth=0.12) {%j5 #XM1:1};
*   &X @WIRE(mode="straight", linewidth=0.12) {%j5 (24, -10) #XM10:2};
*   &X @WIRE(mode="straight", linewidth=0.12) {%j5 (18, -14) #XM5:2} => %wire1;
*   &Y @WIRE(mode="straight", linewidth=0.12) {#XM9:2 (17, -10) %j6};
*   &Y @WIRE(mode="straight", linewidth=0.12) {%j6 #XM2:1};
*   &Y @WIRE(mode="straight", linewidth=0.12) {%j6 (23, -14) #XM6:2} => %wire2;
*   &VSS @WIRE(mode="straight", linewidth=0.12) {#XM3:3 %gnd1::pin};
*   &VSS @WIRE(mode="straight", linewidth=0.12) {#XM4:3 %gnd2::pin};
*   &VSS @WIRE(mode="straight", linewidth=0.12) {#XM5:3 %gnd3::pin};
*   &VSS @WIRE(mode="straight", linewidth=0.12) {#XM6:3 %gnd4::pin};
*   &VSS @WIRE(mode="straight", linewidth=0.12) {#XM9:3 %gnd5::pin};
*   &VSS @WIRE(mode="straight", linewidth=0.12) {#XM10:3 %gnd6::pin};
*   &VDD @WIRE(mode="straight", linewidth=0.12) {#XM7:3 %j10};
*   &VDD @WIRE(mode="straight", linewidth=0.12) {#XM11:3 %j11};
*   &VDD @WIRE(mode="straight", linewidth=0.12) {#XM12:3 %j12};
*   &VDD @WIRE(mode="straight", linewidth=0.12) {#XM8:3 %j13};
*   &VDD @WIRE(mode="straight", linewidth=0.12) {#I1:1 %j14};
*   &net0 @WIRE(mode="straight") {%j7 #XM11:2 #XM7:2};
*   $JUNCTION @ATTACH %j7(p) => @PLACE(6, -4) => %dot1;
*   $JUNCTION @ATTACH (9, -6)(p) => @PLACE(9, -6) => %dot2;
*   $JUNCTION @ATTACH (32, -6)(p) => @PLACE(32, -6) => %dot3;
*   &net1 @WIRE(mode="straight") {%j8 #XM12:2 #XM8:2};
*   $JUNCTION @ATTACH %j8(p) => @PLACE(35, -4) => %dot4;
*   $JUNCTION @ATTACH %j9(p) => @PLACE(20.5, -5) => %dot5;
*   $JUNCTION @ATTACH %j5(p) => @PLACE(18, -12) => %dot6;
*   $JUNCTION @ATTACH (18, -14)(p) => @PLACE(18, -14) => %dot7;
*   $JUNCTION @ATTACH %j6(p) => @PLACE(23, -12) => %dot8;
*   $JUNCTION @ATTACH (23, -14)(p) => @PLACE(23, -14) => %dot9;
*   $JUNCTION @ATTACH %j4(p) => @PLACE(38, -9) => %dot10;
*   $JUNCTION @ATTACH %j3(p) => @PLACE(3, -9) => %dot11;
*   $JUNCTION @ATTACH %j10(p) => @PLACE(3, 0) => %dot12;
*   $JUNCTION @ATTACH %j11(p) => @PLACE(9, 0) => %dot13;
*   $JUNCTION @ATTACH %j14(p) => @PLACE(20.5, 0) => %dot14;
*   $JUNCTION @ATTACH %j12(p) => @PLACE(32, 0) => %dot15;
*   $JUNCTION @ATTACH %j13(p) => @PLACE(38, 0) => %dot16;
*   #XM1
*       @TEXT("\textbf{\textit{M}}_{\textbf{1}}", key="name", dx=-2.7, dy=1.7, halign="start", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM1::name(label);
*   #XM2
*       @TEXT("\textbf{\textit{M}}_{\textbf{2}}", key="name", dx=0.5, dy=1.7, halign="start", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM2::name(label);
*   #XM3
*       @TEXT("\textbf{\textit{M}}_{\textbf{3}}", key="name", dx=-3.3, dy=-2.3, halign="start", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM3::name(label);
*   #XM4
*       @TEXT("\textbf{\textit{M}}_{\textbf{4}}", key="name", dx=-3.3, dy=-2.3, halign="start", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM4::name(label);
*   #XM5
*       @TEXT("\textbf{\textit{M}}_{\textbf{5}}", key="name", dx=-0.6, dy=-0.4, halign="end", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM5::name(label);
*   #XM6
*       @TEXT("\textbf{\textit{M}}_{\textbf{6}}", key="name", dx=0.5, dy=-0.5, halign="start", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM6::name(label);
*   #XM7
*       @TEXT("\textbf{\textit{M}}_{\textbf{7}}", key="name", dx=-0.5, dy=-0.5, halign="end", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM7::name(label);
*   #XM8
*       @TEXT("\textbf{\textit{M}}_{\textbf{8}}", key="name", dx=0.5, dy=-0.5, halign="start", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM8::name(label);
*   #XM9
*       @TEXT("\textbf{\textit{M}}_{\textbf{9}}", key="name", dx=-0.5, dy=-0.5, halign="end", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM9::name(label);
*   #XM10
*       @TEXT("\textbf{\textit{M}}_{\textbf{10}}", key="name", dx=0.5, dy=-0.5, halign="start", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM10::name(label);
*   #XM11
*       @TEXT("\textbf{\textit{M}}_{\textbf{11}}", key="name", dx=0.5, dy=-0.5, halign="start", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM11::name(label);
*   #XM12
*       @TEXT("\textbf{\textit{M}}_{\textbf{12}}", key="name", dx=-0.5, dy=-0.5, halign="end", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM12::name(label);
*   %port1
*       @TEXT("\textbf{\textit{V}}_{\textbf{in}}", key="netname", dx=-1.2, dy=-1, halign="end", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   %port3
*       @TEXT("\textbf{\textit{V}}_{\textbf{out1}}", key="netname", dx=-1.4, dy=-0.3, halign="end", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="port") %port3::netname(label);
*   %port4
*       @TEXT("\textbf{\textit{V}}_{\textbf{out2}}", key="netname", dx=1.3, dy=-0.3, halign="start", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="port") %port4::netname(label);
*   %port5
*       @TEXT("\textbf{\textit{V}}_{\textbf{b}}", key="netname", dx=-1.2, dy=-0.4, halign="end", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="port") %port5::netname(label);
*   &VDD @TEXT("\textbf{\textit{V}}_{\textbf{DD}}", size=1.5116, bold=false) => @PLACE(39.6, -0.3) => %power1;
*   $CANVAS_LABEL @ATTACH(bind="port") %power1(label);
*   %wire1 @TEXT("\textbf{\textit{X}}", halign="end", size=1.5116, bold=false) => @PLACE(17.4, -12.2) => %label1;
*   $CANVAS_LABEL @ATTACH(bind="net") %label1(label);
*   %wire2 @TEXT("\textbf{\textit{Y}}", size=1.5116, bold=false) => @PLACE(23.5, -12.2) => %label2;
*   $CANVAS_LABEL @ATTACH(bind="net") %label2(label);
*   (20.5, -21.5) @TEXT("Figure 9.92", halign="middle", size=1.4, bold=true) => %text1;
*   $CANVAS_TYPOGRAPHY @ATTACH(token="caption") %text1(text);
*   (20.5, -23.9) @TEXT("Two-Stage Op Amp with Active Current-Mirror Output Loads", halign="middle", size=1.19, bold=true) =>
*       %text2;
*   $CANVAS_TYPOGRAPHY @ATTACH(token="caption") %text2(text);
*   (20.5, -25.7) @TEXT("AI reconstruction · Razavi, 2nd ed., p. 409 · Problem 9.23", halign="middle", size=1.0884, bold=false) =>
*       %text3;
*   $CANVAS_TYPOGRAPHY @ATTACH(token="body") %text3(text);
*   %port2 @TEXT("${p}", key="netname", textvisible=false)
* }
.ends fig9_92
