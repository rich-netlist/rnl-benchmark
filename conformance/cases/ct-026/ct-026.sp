
* @RNL(type="header") {
*   @VERSION("0.3");
*   @USE-PACKAGE(name="rnl-std", version="0.3");
*   @USE-PACKAGE(name="rnl-std-no-labels", version="0.3");
*   @USE-PACKAGE(name="analog-canvas-extensions", version="0.6")
* }
.subckt dut VDD VSS Vout Vb
C2 Vout net0 1p
CP VDD Vout 1p
Ib net0 VSS DC 1m
LP VDD Vout 1n
XM1 Vout Vb net0 VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
RP VDD Vout 1k
* @RNL(author="analog-canvas") {
*   %dut_SYMBOL = @DEFINE-SYMBOL(box=[-5, -4, 5, 4]) {
*     (0, 4) @PIN(terminal="VDD", label="\textbf{\textit{V}}_{\textbf{DD}}", direction="up");
*     (5, -1) @PIN(terminal="Vout", label="\textbf{\textit{V}}_{\textbf{out}}", direction="right");
*     (-5, -1) @PIN(terminal="Vb", label="\textbf{\textit{V}}_{\textbf{b}}", direction="left");
*     (0, 0) @RECTANGLE(width=8, height=6);
*     @LINE {(0, 4) (0, 3)};
*     @LINE {(5, -1) (4, -1)};
*     @LINE {(-5, -1) (-4, -1)}
*   };
*   # @SET-SYMBOL %dut_SYMBOL;
*   $CANVAS_TYPESETTING @ATTACH(subscript_italic=false) #(level);
*   #LP @SET-SYMBOL $CANVAS_INDUCTOR_LARGE => @PLACE(12, -10) => @ORIENT("R0");
*   #RP @SET-SYMBOL $RESISTOR => @PLACE(18, -10) => @ORIENT("R0");
*   #CP @SET-SYMBOL $CAPACITOR => @PLACE(24, -10) => @ORIENT("R0");
*   #XM1 @SET-SYMBOL $NMOS => @PLACE(18, -18) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M1") #XM1(part);
*   #C2 @SET-SYMBOL $CAPACITOR => @PLACE(24, -19) => @ORIENT("R0");
*   #Ib @SET-SYMBOL $CURRENT_SOURCE => @PLACE(18, -26) => @ORIENT("R0");
*   $CANVAS_PARAMETER @ATTACH(name="amplitude", text="1m") #Ib(part);
*   $CANVAS_PARAMETER @ATTACH(name="damping", text="0") #Ib(part);
*   $CANVAS_PARAMETER @ATTACH(name="delay", text="0") #Ib(part);
*   $CANVAS_PARAMETER @ATTACH(name="fall", text="1ps") #Ib(part);
*   $CANVAS_PARAMETER @ATTACH(name="frequency", text="1k") #Ib(part);
*   $CANVAS_PARAMETER @ATTACH(name="high", text="1m") #Ib(part);
*   $CANVAS_PARAMETER @ATTACH(name="low", text="0") #Ib(part);
*   $CANVAS_PARAMETER @ATTACH(name="offset", text="0") #Ib(part);
*   $CANVAS_PARAMETER @ATTACH(name="period", text="10ns") #Ib(part);
*   $CANVAS_PARAMETER @ATTACH(name="phase", text="0") #Ib(part);
*   $CANVAS_PARAMETER @ATTACH(name="rise", text="1ps") #Ib(part);
*   $CANVAS_PARAMETER @ATTACH(name="waveform", text="dc") #Ib(part);
*   $CANVAS_PARAMETER @ATTACH(name="width", text="5ns") #Ib(part);
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(18, -28) => @ORIENT("R0") => %gnd1;
*   $SUPPLY @ATTACH &VDD(p) => @SET-SYMBOL $SUPPLY_SYMBOL => @PLACE(18, -4) => @ORIENT("R0") => %vdd1;
*   $IO_PORT @ATTACH &Vout(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(28, -14) => @ORIENT("MY") => %port1;
*   $IO_PORT @ATTACH &Vb(p) => @SET-SYMBOL $CANVAS_PORT_FILLED => @PLACE(15, -18) => @ORIENT("R0") => %port2;
*   &VDD @REMOVE-FROM $PORT_FILL_SET;
*   &VSS @REMOVE-FROM $PORT_FILL_SET;
*   %j1 = (18, -6);
*   $JUNCTION @ATTACH %j1;
*   %j2 = (18, -14);
*   $JUNCTION @ATTACH %j2;
*   %j3 = (24, -14);
*   $JUNCTION @ATTACH %j3;
*   %j4 = (18, -22);
*   $JUNCTION @ATTACH %j4;
*   &VDD @WIRE(mode="straight") {%vdd1:p %j1};
*   &VDD @WIRE(mode="straight") {%j1 #RP:1};
*   &VDD @WIRE(mode="straight") {#LP:1 (12, -6) %j1};
*   &VDD @WIRE(mode="straight") {#CP:1 (24, -6) %j1};
*   &net0 @WIRE(mode="straight") {#XM1:3 %j4};
*   &net0 @WIRE(mode="straight") {%j4 #Ib:1};
*   &net0 @WIRE(mode="straight") {#C2:2 (24, -22) %j4};
*   &Vout @WIRE(mode="straight") {#LP:2 (12, -14) %j2};
*   &Vout @WIRE(mode="straight") {#RP:2 %j2};
*   &Vout @WIRE(mode="straight") {%j2 #XM1:1};
*   &Vout @WIRE(mode="straight") {%j2 %j3};
*   &Vout @WIRE(mode="straight") {#CP:2 %j3};
*   &Vout @WIRE(mode="straight") {%j3 #C2:1};
*   &Vout @WIRE(mode="straight") {%port1:p %j3};
*   &Vb @WIRE(mode="straight") {#XM1:2 %port2:p};
*   &VSS @WIRE(mode="straight") {%gnd1:p #Ib:2};
*   #LP @TEXT("\textbf{\textit{L}}_{\textbf{P}}", key="name", dx=1.5, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #LP::name(label);
*   #RP @TEXT("\textbf{\textit{R}}_{\textbf{P}}", key="name", dx=0.9, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #RP::name(label);
*   #CP @TEXT("\textbf{\textit{C}}_{\textbf{P}}", key="name", dx=1.2, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #CP::name(label);
*   #XM1 @TEXT("\textbf{\textit{M}}_{\textbf{1}}", key="name", dx=0.5, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM1::name(label);
*   #C2 @TEXT("\textbf{\textit{C}}_{\textbf{2}}", key="name", dx=1.2, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #C2::name(label);
*   #Ib @TEXT("\textbf{\textit{I}}_{\textbf{b}}", key="name", dx=1.5, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #Ib::name(label);
*   %vdd1 @TEXT("\textbf{\textit{V}}_{\textbf{DD}}", dx=-1.5, dy=3.6, size=1.5116) => %power1;
*   $CANVAS_LABEL @ATTACH(bind="port") %power1(label);
*   %port1 @TEXT("\textbf{\textit{V}}_{\textbf{out}}", key="name", dx=2, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port1::name(label);
*   %port2 @TEXT("\textbf{\textit{V}}_{\textbf{b}}", key="name", dx=-2, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port2::name(label)
* }
.ends dut
