
* @RNL(type="header") {
*   @VERSION("0.3");
*   @USE-PACKAGE(name="rnl-std", version="0.3");
*   @USE-PACKAGE(name="rnl-std-no-labels", version="0.3");
*   @USE-PACKAGE(name="analog-canvas-extensions", version="0.6")
* }
.subckt dut VDD VSS Vb2 Vin Vout
C1 Vout net0 1p
XM1 Vout Vb2 VDD VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM2 Vout Vb2 net0 VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM3 net0 Vin VSS VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
* @RNL(author="analog-canvas") {
*   $CANVAS_TYPESETTING @ATTACH(subscript_italic=false) #(level);
*   #XM1 @SET-SYMBOL $PMOS => @PLACE(48, -13) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M1") #XM1(part);
*   #XM2 @SET-SYMBOL $NMOS => @PLACE(48, -21) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M2") #XM2(part);
*   #XM3 @SET-SYMBOL $NMOS => @PLACE(48, -27) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M3") #XM3(part);
*   $SUPPLY @ATTACH &VDD(p) => @SET-SYMBOL $SUPPLY_SYMBOL => @PLACE(48, -11) => @ORIENT("R0") => %vdd1;
*   #C1 @SET-SYMBOL $CAPACITOR => @PLACE(53, -20) => @ORIENT("R0");
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(48, -29) => @ORIENT("R0") => %gnd1;
*   $IO_PORT @ATTACH &Vb2(p) => @SET-SYMBOL $CANVAS_PORT_FILLED => @PLACE(45, -21) => @ORIENT("R0") => %port1;
*   $IO_PORT @ATTACH &Vb2(p) => @SET-SYMBOL $CANVAS_PORT_FILLED => @PLACE(45, -13) => @ORIENT("R0") => %port2;
*   $IO_PORT @ATTACH &Vin(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(45, -27) => @ORIENT("R0") => %port3;
*   $IO_PORT @ATTACH &Vout(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(55, -17) => @ORIENT("R180") => %port4;
*   &VDD @REMOVE-FROM $PORT_FILL_SET;
*   &VSS @REMOVE-FROM $PORT_FILL_SET;
*   %j1 = (48, -17);
*   $JUNCTION @ATTACH %j1;
*   %j2 = (48, -24);
*   $JUNCTION @ATTACH %j2;
*   %j3 = (53, -17);
*   $JUNCTION @ATTACH %j3;
*   %j4 = (55, -17);
*   &Vout @WIRE(mode="straight") {#XM1:1 %j1};
*   &Vout @WIRE(mode="straight") {%j1 #XM2:1};
*   &net0 @WIRE(mode="straight") {#XM2:3 %j2};
*   &net0 @WIRE(mode="straight") {%j2 #XM3:1};
*   &Vout @WIRE(mode="straight") {%j1 %j3};
*   &Vout @WIRE(mode="straight") {%j3 #C1:1};
*   &net0 @WIRE(mode="straight") {#C1:2 (53, -24) %j2};
*   &Vout @WIRE(mode="straight") {%j3 %j4};
*   &VSS @WIRE(mode="straight") {%gnd1:p #XM3:3};
*   &Vb2 @WIRE(mode="straight") {#XM2:2 %port1:p};
*   &Vb2 @WIRE(mode="straight") {#XM1:2 %port2:p};
*   &Vin @WIRE(mode="straight") {#XM3:2 %port3:p};
*   &VDD @WIRE(mode="straight") {#XM1:3 %vdd1:p};
*   &Vout @WIRE(mode="straight") {%j4 %port4:p};
*   #XM1 @TEXT("\textbf{\textit{M}}_{\textbf{3}}", key="name", dx=0.4, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   #XM2 @TEXT("\textbf{\textit{M}}_{\textbf{2}}", key="name", dx=0.5, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM2::name(label);
*   #XM3 @TEXT("\textbf{\textit{M}}_{\textbf{1}}", key="name", dx=0.5, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   %vdd1 @TEXT("\textbf{\textit{V}}_{\textbf{DD}}", dx=2, dy=1, size=1.5116) => %power1;
*   $CANVAS_LABEL @ATTACH(bind="port") %power1(label);
*   #C1 @TEXT("\textbf{\textit{C}}_{\textbf{1}}", key="name", dx=1.2, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #C1::name(label);
*   %port1 @TEXT("\textbf{\textit{V}}_{\textbf{b2}}", key="name", dx=-2, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port1::name(label);
*   %port2 @TEXT("\textbf{\textit{V}}_{\textbf{b2}}", key="name", dx=-2, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port2::name(label);
*   %port3 @TEXT("\textbf{\textit{V}}_{\textbf{in}}", key="name", dx=-2, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port3::name(label);
*   %port4 @TEXT("\textbf{\textit{V}}_{\textbf{out}}", key="name", dx=2, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port4::name(label)
* }
.ends dut
