
* @RNL(type="header") {
*   @VERSION("0.4");
*   @USE-PACKAGE(name="rnl-std-style", version="0.4");
*   @USE-PACKAGE(name="rnl-std-basic", version="0.4");
*   @USE-PACKAGE(name="rnl-std-semiconductors", version="0.4");
*   @USE-PACKAGE(name="rnl-std-no-labels", version="0.4");
*   @USE-PACKAGE(name="analog-canvas-extensions", version="0.7")
* }
.subckt dut VDD VSS Vb1 Vb2 Vin M2_S
ISS M2_S VSS DC 1m
XM1 X Vin M2_S VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM3 NC0001 Vb2 X VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM9 X Vb1 VDD VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
* @RNL(author="analog-canvas") {
*   %dut_SYMBOL = @DEFINE-SYMBOL(box=[-6, -6, 6, 6]) {
*     (0, 6) @PIN(terminal="VDD", label="\textbf{\textit{V}}_{\textbf{DD}}", direction="up");
*     (6, 1) @PIN(terminal="Vb1", label="\textbf{\textit{V}}_{\textbf{b1}}", direction="right");
*     (6, -1) @PIN(terminal="Vb2", label="\textbf{\textit{V}}_{\textbf{b2}}", direction="right");
*     (-6, -1) @PIN(terminal="Vin", label="\textbf{\textit{V}}_{\textbf{in}}", direction="left");
*     (6, -3) @PIN(terminal="M2_S", label="\textbf{\textit{M2}}_{\textbf{\textit{S}}}", direction="right");
*     (0, 0) @RECTANGLE(width=10, height=10);
*     @LINE {(0, 6) (0, 5)};
*     @LINE {(6, 1) (5, 1)};
*     @LINE {(6, -1) (5, -1)};
*     @LINE {(-6, -1) (-5, -1)};
*     @LINE {(6, -3) (5, -3)}
*   };
*   # @SET-SYMBOL %dut_SYMBOL;
*   $CANVAS_TYPESETTING @ATTACH(subscript_italic=false) #(level);
*   #XM9 @SET-SYMBOL(terminals=[[1, "d"], [2, "g"], [3, "s"]]) $PMOS => @PLACE(34, -8) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M9") #XM9(part);
*   #XM3 @SET-SYMBOL(terminals=[[1, "d"], [2, "g"], [3, "s"]]) $PMOS => @PLACE(34, -17) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M3") #XM3(part);
*   #XM1 @SET-SYMBOL(terminals=[[1, "d"], [2, "g"], [3, "s"]]) $NMOS => @PLACE(20, -22) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M1") #XM1(part);
*   #ISS @SET-SYMBOL $CURRENT_SOURCE => @PLACE(24, -30) => @ORIENT("R0");
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
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(24, -32) => @ORIENT("R0") => %gnd1;
*   $SUPPLY @ATTACH &VDD(p) => @SET-SYMBOL $SUPPLY_SYMBOL => @PLACE(34, -6) => @ORIENT("R0") => %vdd1;
*   $IO_PORT @ATTACH &Vb1(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(39, -8) => @ORIENT("R180") => %port1;
*   $IO_PORT @ATTACH &Vb2(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(29, -17) => @ORIENT("R0") => %port2;
*   $IO_PORT @ATTACH &Vin(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(15, -22) => @ORIENT("R0") => %port3;
*   $IO_PORT @ATTACH &M2_S(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(28, -24) => @ORIENT("R270") => %port4;
*   $NO_CONNECT @ATTACH #XM3:1(t) => @PLACE(34, -19);
*   %j1 = (34, -12);
*   %j2 = (20, -26);
*   %j3 = (24, -26);
*   &Vb1 @WIRE(mode="straight") {#XM9:2 %port1::pin};
*   &X @WIRE(mode="straight") {#XM9:1 %j1};
*   &X @WIRE(mode="straight") {%j1 #XM3:3};
*   &Vb2 @WIRE(mode="straight") {#XM3:2 %port2::pin};
*   &X @WIRE(mode="straight") {#XM1:1 (20, -12) %j1} => %wire1;
*   &Vin @WIRE(mode="straight") {#XM1:2 %port3::pin};
*   &M2_S @WIRE(mode="straight") {#XM1:3 %j2};
*   &M2_S @WIRE(mode="straight") {%j2 %j3};
*   &M2_S @WIRE(mode="straight") {%j3 #ISS:1};
*   &M2_S @WIRE(mode="straight") {%j3 (28, -26) %port4::pin};
*   &VDD @WIRE(mode="straight") {#XM9:3 %vdd1::pin};
*   $JUNCTION @ATTACH %j3(p) => @PLACE(24, -26) => %dot1;
*   &VSS @WIRE(mode="straight") {%gnd1::pin #ISS:2};
*   $JUNCTION @ATTACH %j1(p) => @PLACE(34, -12) => %dot2;
*   #XM9
*       @TEXT("\textbf{\textit{M}}_{\textbf{9}}", key="name", dx=-0.4, dy=-0.5, halign="end", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM9::name(label);
*   #XM3
*       @TEXT("\textbf{\textit{M}}_{\textbf{3}}", key="name", dx=0.4, dy=-0.5, halign="start", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM3::name(label);
*   #XM1
*       @TEXT("\textbf{\textit{M}}_{\textbf{1}}", key="name", dx=0.5, dy=-0.5, halign="start", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM1::name(label);
*   #ISS
*       @TEXT("\textbf{\textit{I}}_{\textbf{SS}}", key="name", dx=1.5, dy=-0.5, halign="start", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #ISS::name(label);
*   %vdd1 @TEXT("\textbf{\textit{V}}_{\textbf{DD}}", dx=2, dy=1, size=1.5116, bold=false) => %power1;
*   $CANVAS_LABEL @ATTACH(bind="port") %power1(label);
*   %port1
*       @TEXT("\textbf{\textit{V}}_{\textbf{b1}}", key="netname", dx=2, dy=-0.5, halign="start", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="port") %port1::netname(label);
*   %port2
*       @TEXT("\textbf{\textit{V}}_{\textbf{b2}}", key="netname", dx=-2, dy=-0.5, halign="end", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="port") %port2::netname(label);
*   %port3
*       @TEXT("\textbf{\textit{V}}_{\textbf{in}}", key="netname", dx=-2, dy=-0.5, halign="end", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="port") %port3::netname(label);
*   %port4
*       @TEXT("\textbf{\textit{M2}}_{\textbf{S}}", key="netname", dx=2.6, dy=0.4, halign="middle", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="port") %port4::netname(label);
*   %wire1 @TEXT("\textbf{\textit{X}}", halign="middle", size=1.5116, bold=false) => @PLACE(31.8, -11.6) => %label1;
*   $CANVAS_LABEL @ATTACH(bind="net") %label1(label);
*   %vdd1 @TEXT("${p}", key="netname", textvisible=false)
* }
.ends dut
