
* @RNL(type="header") {
*   @VERSION("0.3");
*   @USE-PACKAGE(name="rnl-std", version="0.3");
*   @USE-PACKAGE(name="rnl-std-no-labels", version="0.3");
*   @USE-PACKAGE(name="analog-canvas-extensions", version="0.6")
* }
.subckt level_shifted_nmos_gate_driver VDD VDDH VSS VEA VOUT
XM1 net1 VEA VSS VSS sky130_fd_pr__nfet_01v8 l=1 w=4 nf=1 m=1
XM2 net1 net1 VDDH VDD sky130_fd_pr__pfet_01v8 l=1 w=10 nf=1 m=1
XM3 net0 net1 VDDH VDD sky130_fd_pr__pfet_01v8 l=1 w=20 nf=1 m=1
XMP VDD net0 VOUT VSS sky130_fd_pr__nfet_01v8 l=1 w=20 nf=1 m=1
XMS net0 net0 VOUT VSS sky130_fd_pr__nfet_01v8 l=1 w=4 nf=1 m=1
* @RNL(author="analog-canvas") {
*   $CANVAS_TYPESETTING @ATTACH(subscript_italic=false) #(level);
*   #XM1 @SET-SYMBOL $NMOS => @PLACE(6, -14.4) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M1") #XM1(part);
*   #XM2 @SET-SYMBOL $PMOS => @PLACE(6, -8) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M2") #XM2(part);
*   #XM3 @SET-SYMBOL $PMOS => @PLACE(13, -8) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M3") #XM3(part);
*   #XMS @SET-SYMBOL $NMOS => @PLACE(13, -14.4) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="MS") #XMS(part);
*   #XMP @SET-SYMBOL $NMOS => @PLACE(20, -14.4) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="MP") #XMP(part);
*   $SUPPLY @ATTACH &VDDH(p) => @SET-SYMBOL $SUPPLY_SYMBOL => @PLACE(10, -3.5) => @ORIENT("R0") => %vdd1;
*   $SUPPLY @ATTACH &VDD(p) => @SET-SYMBOL $SUPPLY_SYMBOL => @PLACE(20, -11.9) => @ORIENT("R0") => %vdd2;
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(6, -18.7) => @ORIENT("R0") => %gnd1;
*   $IO_PORT @ATTACH &VEA(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(3, -14.4) => @ORIENT("R0") => %port1;
*   $IO_PORT @ATTACH &VOUT(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(20.2, -16.4) => @ORIENT("MY") => %port2;
*   &VDD @REMOVE-FROM $PORT_FILL_SET;
*   &VDDH @REMOVE-FROM $PORT_FILL_SET;
*   &VSS @REMOVE-FROM $PORT_FILL_SET;
*   %j1 = (6, -4);
*   %j2 = (10, -4);
*   $JUNCTION @ATTACH %j2;
*   %j3 = (13, -4);
*   %j4 = (6, -11.2);
*   $JUNCTION @ATTACH %j4;
*   %j5 = (9.5, -11.2);
*   %j6 = (9.5, -8);
*   $JUNCTION @ATTACH %j6;
*   %j7 = (13, -11.2);
*   $JUNCTION @ATTACH %j7;
*   %j8 = (16.5, -11.2);
*   %j9 = (16.5, -14.4);
*   $JUNCTION @ATTACH %j9;
*   &VDDH @WIRE(mode="straight") {#XM2:3 %j1};
*   &VDDH @WIRE(mode="straight") {%j1 %j2};
*   &VDDH @WIRE(mode="straight") {%j2 %j3};
*   &VDDH @WIRE(mode="straight") {%j3 #XM3:3};
*   &VDDH @WIRE(mode="straight") {%j2 %vdd1:p};
*   &net1 @WIRE(mode="straight") {#XM2:1 %j4};
*   &net1 @WIRE(mode="straight") {%j4 #XM1:1};
*   &net1 @WIRE(mode="straight") {%j4 %j5};
*   &net1 @WIRE(mode="straight") {%j5 %j6};
*   &net1 @WIRE(mode="straight") {%j6 #XM2:2};
*   &net1 @WIRE(mode="straight") {%j6 #XM3:2};
*   &net0 @WIRE(mode="straight") {#XM3:1 %j7};
*   &net0 @WIRE(mode="straight") {%j7 #XMS:1};
*   &net0 @WIRE(mode="straight") {%j7 %j8};
*   &net0 @WIRE(mode="straight") {%j8 %j9};
*   &net0 @WIRE(mode="straight") {%j9 #XMS:2};
*   &net0 @WIRE(mode="straight") {%j9 #XMP:2};
*   &VOUT @WIRE(mode="straight") {#XMS:3 #XMP:3};
*   &VOUT @WIRE(mode="straight") {#XMP:3 %port2:p};
*   &VSS @WIRE(mode="straight") {#XM1:3 %gnd1:p};
*   &VDD @WIRE(mode="straight") {#XMP:1 %vdd2:p};
*   &VEA @WIRE(mode="straight") {#XM1:2 %port1:p};
*   $JUNCTION @ATTACH (20, -16.4)(p) => %dot1;
*   &VDDH @TEXT("\textbf{\textit{V}}_{\textbf{DDH}}", size=1.5116) => @PLACE(6.5, -5.9) => %label1;
*   $CANVAS_LABEL @ATTACH(bind="net") %label1(label);
*   %vdd2 @TEXT("\textbf{\textit{V}}_{\textbf{DD}}", dx=1.4, dy=1.5, size=1.5116) => %label2;
*   $CANVAS_LABEL @ATTACH(bind="net") %label2(label);
*   %port1 @TEXT("\textbf{\textit{V}}_{\textbf{EA}}", dx=-3.9, dy=-0.3, size=1.5116) => %label3;
*   $CANVAS_LABEL @ATTACH(bind="net") %label3(label);
*   %port2 @TEXT("\textbf{\textit{V}}_{\textbf{OUT}}", dx=1.1, dy=-0.3, size=1.5116) => %label4;
*   $CANVAS_LABEL @ATTACH(bind="net") %label4(label);
*   #XM1 @TEXT("\textbf{\textit{M}}_{\textbf{1}}", key="name", dx=-3.4, dy=-2.3, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM1::name(label);
*   #XM2 @TEXT("\textbf{\textit{M}}_{\textbf{2}}", key="name", dx=-1.7, dy=0.1, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM2::name(label);
*   #XM3 @TEXT("\textbf{\textit{M}}_{\textbf{3}}", key="name", dx=-3.2, dy=-2.3, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM3::name(label);
*   #XMS @TEXT("\textbf{\textit{M}}_{\textbf{S}}", key="name", dx=-2, dy=0.1, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XMS::name(label);
*   #XMP @TEXT("\textbf{\textit{M}}_{\textbf{P}}", key="name", dx=-2.3, dy=1.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XMP::name(label)
* }
.ends level_shifted_nmos_gate_driver
