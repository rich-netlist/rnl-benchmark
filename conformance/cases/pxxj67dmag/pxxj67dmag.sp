
* @RNL(type="header") {
*   @VERSION("0.3");
*   @USE-PACKAGE(name="rnl-std", version="0.3");
*   @USE-PACKAGE(name="rnl-std-no-labels", version="0.3");
*   @USE-PACKAGE(name="analog-canvas-extensions", version="0.6")
* }
.subckt Main VDD VSS Iout
XM1 Iout net2 net0 VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM2 net0 net0 VSS VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM3 net3 net2 net1 VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM4 net1 net0 VSS VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
R1 VDD net3 1k
R2 net0 VSS 1k
* @RNL(author="analog-canvas") {
*   $CANVAS_TYPESETTING @ATTACH #(level);
*   #XM1 @SET-SYMBOL $NMOS => @PLACE(33, -27) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M1") #XM1(part);
*   #XM2 @SET-SYMBOL $NMOS => @PLACE(33, -33) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M2") #XM2(part);
*   #XM3 @SET-SYMBOL $NMOS => @PLACE(19, -27) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M3") #XM3(part);
*   #XM4 @SET-SYMBOL $NMOS => @PLACE(19, -33) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M4") #XM4(part);
*   #R1 @SET-SYMBOL $RESISTOR => @PLACE(19, -24) => @ORIENT("R0");
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(26, -39) => @ORIENT("R0") => %gnd1;
*   #R2 @SET-SYMBOL $RESISTOR => @PLACE(28, -36) => @ORIENT("R0");
*   $IO_PORT @ATTACH &Iout(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(33, -25) => @ORIENT("R270") => %port1;
*   $SUPPLY @ATTACH &VDD(p) => @SET-SYMBOL $SUPPLY_SYMBOL => @PLACE(19, -22) => @ORIENT("R0") => %vdd1;
*   &VDD @REMOVE-FROM $PORT_FILL_SET;
*   &VSS @REMOVE-FROM $PORT_FILL_SET;
*   %j1 = (26, -33);
*   $JUNCTION @ATTACH %j1;
*   %j2 = (33, -30);
*   $JUNCTION @ATTACH %j2;
*   %j3 = (28, -39);
*   $JUNCTION @ATTACH %j3;
*   %j4 = (28, -33);
*   $JUNCTION @ATTACH %j4;
*   &net1 @WIRE(mode="straight") {#XM3:3 #XM4:1};
*   &net2 @WIRE(mode="straight") {#XM3:2 #XM1:2};
*   &net0 @WIRE(mode="straight") {#XM4:2 %j1};
*   &net0 @WIRE(mode="straight") {%j1 %j4};
*   &net0 @WIRE(mode="straight") {%j1 (26, -30) %j2};
*   &net0 @WIRE(mode="straight") {%j4 #R2:1};
*   &net0 @WIRE(mode="straight") {%j4 #XM2:2};
*   &net0 @WIRE(mode="straight") {#XM1:3 %j2};
*   &net0 @WIRE(mode="straight") {%j2 #XM2:1};
*   &VSS @WIRE(mode="straight") {#XM4:3 (19, -39) %gnd1:p};
*   &VSS @WIRE(mode="straight") {%gnd1:p %j3};
*   &VSS @WIRE(mode="straight") {#R2:2 %j3};
*   &VSS @WIRE(mode="straight") {%j3 (33, -39) #XM2:3};
*   &net3 @WIRE(mode="straight") {#XM3:1 #R1:2};
*   $JUNCTION @ATTACH (26, -39)(p) => %dot1;
*   &VDD @WIRE(mode="straight") {#R1:1 %vdd1:p};
*   &Iout @WIRE(mode="straight") {#XM1:1 %port1:p};
*   #XM1 @TEXT("\textbf{\textit{M}}_{\textbf{1}}", key="name", dx=1, dy=-1, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM1::name(label);
*   #XM2 @TEXT("\textbf{\textit{M}}_{\textbf{2}}", key="name", dx=1, dy=-1, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM2::name(label);
*   #XM3 @TEXT("\textbf{\textit{M}}_{\textbf{3}}", key="name", dx=-1, dy=-1, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM3::name(label);
*   #XM4 @TEXT("\textbf{\textit{M}}_{\textbf{4}}", key="name", dx=-1, dy=-1, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM4::name(label);
*   #R1 @TEXT("\textbf{\textit{R}}", key="name", dx=2, dy=-1, halign="start", valign="baseline", size=1.5116);
*   #R2 @TEXT("\textbf{\textit{R/2}}", key="name", dx=-4, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   %port1 @TEXT("\textbf{\textit{I}}_{\textbf{out}}", key="name", dx=-1, dy=2, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port1::name(label);
*   %vdd1 @TEXT("\textbf{\textit{V}}_{\textbf{DD}}", dx=2, dy=1, size=1.5116) => %power1;
*   $CANVAS_LABEL @ATTACH(bind="port") %power1(label);
*   (30, -15) @TEXT("Iout=(VDD-Vgs3-Vgs2)/R+Vgs2/(R/2)", halign="middle", size=1.5116, bold=true) => %text1;
*   $CANVAS_TYPOGRAPHY @ATTACH(token="label") %text1(text);
*   (20, -17.7) @TEXT("=VDD/R", halign="middle", size=1.5116, bold=true) => %text2;
*   $CANVAS_TYPOGRAPHY @ATTACH(token="label") %text2(text);
*   (32.5, -17.7) @TEXT("if Vgs3=Vgs2", halign="middle", size=1.5116, bold=true) => %text3;
*   $CANVAS_TYPOGRAPHY @ATTACH(token="label") %text3(text)
* }
.ends Main
