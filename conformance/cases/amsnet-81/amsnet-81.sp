
* @RNL(type="header") {
*   @VERSION("0.3");
*   @USE-PACKAGE(name="rnl-std", version="0.3");
*   @USE-PACKAGE(name="rnl-std-no-labels", version="0.3");
*   @USE-PACKAGE(name="analog-canvas-extensions", version="0.6")
* }
.subckt dut VDD VSS Vb Vin Vout
XM1 Vout Vin VSS VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM2 Vout Vb VDD VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
* @RNL(author="analog-canvas") {
*   %dut_SYMBOL = @DEFINE-SYMBOL(box=[-6, -5, 6, 5]) {
*     (0, 5) @PIN(terminal="VDD", label="\textbf{\textit{V}}_{\textbf{DD}}", direction="up");
*     (-6, 0) @PIN(terminal="Vb", label="\textbf{\textit{V}}_{\textbf{b}}", direction="left");
*     (-6, -2) @PIN(terminal="Vin", label="\textbf{\textit{V}}_{\textbf{in}}", direction="left");
*     (6, -1) @PIN(terminal="Vout", label="\textbf{\textit{V}}_{\textbf{out}}", direction="right");
*     (0, 0) @RECTANGLE(width=10, height=8);
*     @LINE {(0, 5) (0, 4)};
*     @LINE {(-6, 0) (-5, 0)};
*     @LINE {(-6, -2) (-5, -2)};
*     @LINE {(6, -1) (5, -1)}
*   };
*   # @SET-SYMBOL %dut_SYMBOL;
*   $CANVAS_TYPESETTING @ATTACH(subscript_italic=false) #(level);
*   #XM2 @SET-SYMBOL $PMOS => @PLACE(21, -10) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M2") #XM2(part);
*   #XM1 @SET-SYMBOL $NMOS => @PLACE(21, -20) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M1") #XM1(part);
*   $SUPPLY @ATTACH &VDD(p) => @SET-SYMBOL $SUPPLY_SYMBOL => @PLACE(21, -8) => @ORIENT("R0") => %vdd1;
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(21, -22) => @ORIENT("R0") => %gnd1;
*   $IO_PORT @ATTACH &Vb(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(18, -10) => @ORIENT("R0") => %port1;
*   $IO_PORT @ATTACH &Vin(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(18, -20) => @ORIENT("R0") => %port2;
*   $IO_PORT @ATTACH &Vout(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(26, -15) => @ORIENT("R180") => %port3;
*   &VDD @REMOVE-FROM $PORT_FILL_SET;
*   &VSS @REMOVE-FROM $PORT_FILL_SET;
*   %j1 = (21, -15);
*   $JUNCTION @ATTACH %j1;
*   &Vout @WIRE(mode="straight") {#XM2:1 %j1};
*   &Vout @WIRE(mode="straight") {%j1 #XM1:1};
*   &Vout @WIRE(mode="straight") {%port3:p %j1};
*   &Vin @WIRE(mode="straight") {#XM1:2 %port2:p};
*   &VDD @WIRE(mode="straight") {#XM2:3 %vdd1:p};
*   &Vb @WIRE(mode="straight") {%port1:p #XM2:2};
*   &VSS @WIRE(mode="straight") {%gnd1:p #XM1:3};
*   #XM2 @TEXT("\textbf{\textit{M}}_{\textbf{2}}", key="name", dx=0.4, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM2::name(label);
*   #XM1 @TEXT("\textbf{\textit{M}}_{\textbf{1}}", key="name", dx=0.5, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM1::name(label);
*   %vdd1 @TEXT("\textbf{\textit{V}}_{\textbf{DD}}", dx=-1.5, dy=3.6, size=1.5116) => %power1;
*   $CANVAS_LABEL @ATTACH(bind="port") %power1(label);
*   %port1 @TEXT("\textbf{\textit{V}}_{\textbf{b}}", key="name", dx=-2, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port1::name(label);
*   %port2 @TEXT("\textbf{\textit{V}}_{\textbf{in}}", key="name", dx=-2, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port2::name(label);
*   %port3 @TEXT("\textbf{\textit{V}}_{\textbf{out}}", key="name", dx=2, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port3::name(label)
* }
.ends dut
