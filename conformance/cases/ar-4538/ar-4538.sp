
* @RNL(type="header") {
*   @VERSION("0.3");
*   @USE-PACKAGE(name="rnl-std", version="0.3");
*   @USE-PACKAGE(name="rnl-std-no-labels", version="0.3");
*   @USE-PACKAGE(name="analog-canvas-extensions", version="0.6");
*   @USE-PACKAGE(name="rnl-std-functional", version="0.3")
* }
.subckt opamp VIP VIN VDD VSS VOUT params: gain=1e6 vhigh=5 vlow=-5
Blin nlin 0 V={gain*(V(VIP)-V(VIN))}
Bcore VOUT 0 V={0.5*(vhigh+(0.5*(vlow+V(nlin)+sqrt((V(nlin)-vlow)*(V(nlin)-vlow)+(1e-4*(vhigh-vlow))*(1e-4*(vhigh-vlow))+1e-12)))-sqrt((vhigh-(0.5*(vlow+V(nlin)+sqrt((V(nlin)-vlow)*(V(nlin)-vlow)+(1e-4*(vhigh-vlow))*(1e-4*(vhigh-vlow))+1e-12))))*(vhigh-(0.5*(vlow+V(nlin)+sqrt((V(nlin)-vlow)*(V(nlin)-vlow)+(1e-4*(vhigh-vlow))*(1e-4*(vhigh-vlow))+1e-12))))+(1e-4*(vhigh-vlow))*(1e-4*(vhigh-vlow))+1e-12))}
.ends opamp

* Potentiometer: end 1 to wiper r*pos, wiper to end 2 r*(1-pos)
.subckt potentiometer n1 nw n2 params: r=10k pos=0.5
R1 n1 nw {max(r*pos,1m)}
R2 nw n2 {max(r*(1-pos),1m)}
.ends potentiometer

.subckt dut VSS vO A B
CX net0 VSS 0.01uF
R1 B VSS 10kΩ
R2 vO A 10kΩ
RX net0 vO 1k
X1 net1 net0 0 VSS vO opamp gain=1e6
X2 A net1 B potentiometer pos=0.5 r=10kΩ
* @RNL(author="analog-canvas") {
*   $CANVAS_TYPESETTING @ATTACH(subscript_italic=false) #(level);
*   #X1 @SET-SYMBOL $OPAMP_5TERM => @PLACE(20, -20) => @ORIENT("MX");
*   $CANVAS_PARAMETER @ATTACH(name="vhigh", text="VDD") #X1(part);
*   $CANVAS_PARAMETER @ATTACH(name="vlow", text="VSS") #X1(part);
*   #RX @SET-SYMBOL $RESISTOR => @PLACE(19, -15) => @ORIENT("R90");
*   #CX @SET-SYMBOL $CAPACITOR => @PLACE(13, -23) => @ORIENT("R0");
*   #R2 @SET-SYMBOL $RESISTOR => @PLACE(26, -23) => @ORIENT("R0");
*   #X2 @SET-SYMBOL $CANVAS_POTENTIOMETER => @PLACE(26, -29) => @ORIENT("MY");
*   #R1 @SET-SYMBOL $RESISTOR => @PLACE(26, -35) => @ORIENT("R0");
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(13, -25) => @ORIENT("R0") => %gnd1;
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(26, -37) => @ORIENT("R0") => %gnd2;
*   $IO_PORT @ATTACH &vO(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(30, -20) => @ORIENT("MY") => %port1;
*   $IO_PORT @ATTACH &A(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(24, -26) => @ORIENT("R0") => %port2;
*   $IO_PORT @ATTACH &B(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(24, -32) => @ORIENT("R0") => %port3;
*   &VSS @REMOVE-FROM $PORT_FILL_SET;
*   %j1 = (26, -20);
*   $JUNCTION @ATTACH %j1;
*   %j2 = (13, -19);
*   $JUNCTION @ATTACH %j2;
*   %j3 = (26, -26);
*   $JUNCTION @ATTACH %j3;
*   %j4 = (26, -32);
*   $JUNCTION @ATTACH %j4;
*   &vO @WIRE(mode="straight") {#X1:5 %j1};
*   &vO @WIRE(mode="straight") {%j1 %port1:p};
*   &vO @WIRE(mode="straight") {#R2:1 %j1};
*   &vO @WIRE(mode="straight") {#RX:2 (26, -15) %j1};
*   &net0 @WIRE(mode="straight") {#CX:1 %j2};
*   &net0 @WIRE(mode="straight") {%j2 #X1:2};
*   &net0 @WIRE(mode="straight") {#RX:1 (13, -15) %j2};
*   &A @WIRE(mode="straight") {#R2:2 %j3};
*   &A @WIRE(mode="straight") {%j3 #X2:1};
*   &B @WIRE(mode="straight") {#X2:3 %j4};
*   &B @WIRE(mode="straight") {%j4 #R1:1};
*   &A @WIRE(mode="straight") {%port2:p %j3};
*   &B @WIRE(mode="straight") {%port3:p %j4};
*   &net1 @WIRE(mode="straight") {#X2:2 (15, -29) (15, -21) #X1:1};
*   &VSS @WIRE(mode="straight") {%gnd1:p #CX:2};
*   &VSS @WIRE(mode="straight") {%gnd2:p #R1:2};
*   #RX @TEXT("\textbf{\textit{R}}_{\textbf{X}}", key="name", dx=0, dy=1.4, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #RX::name(label);
*   #CX @TEXT("\textbf{\textit{C}}_{\textbf{X}}", key="name", dx=-1.2, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #CX::name(label);
*   #CX @TEXT("\textbf{0.01uF}", key="value", dx=-1.2, dy=-2.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="value") #CX::value(label);
*   #R2 @TEXT("\textbf{\textit{R}}_{\textbf{2}}", key="name", dx=0.9, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #R2::name(label);
*   #R2 @TEXT("\textbf{10kΩ}", key="value", dx=0.9, dy=-2.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="value") #R2::value(label);
*   #X2 @TEXT("\textbf{\textit{R}}_{\textbf{3}}", key="name", dx=1, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   #R1 @TEXT("\textbf{\textit{R}}_{\textbf{1}}", key="name", dx=0.9, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #R1::name(label);
*   #R1 @TEXT("\textbf{10kΩ}", key="value", dx=0.9, dy=-2.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="value") #R1::value(label);
*   %port1 @TEXT("\textbf{\textit{v}}_{\textbf{O}}", key="name", dx=2, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port1::name(label);
*   %port2 @TEXT("\textbf{\textit{A}}", key="name", dx=-2, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port2::name(label);
*   %port3 @TEXT("\textbf{\textit{B}}", key="name", dx=-2, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port3::name(label)
* }
.ends dut
