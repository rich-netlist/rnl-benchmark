
* @RNL(type="header") {
*   @VERSION("0.3");
*   @USE-PACKAGE(name="rnl-std", version="0.3");
*   @USE-PACKAGE(name="rnl-std-no-labels", version="0.3");
*   @USE-PACKAGE(name="analog-canvas-extensions", version="0.6")
* }
.subckt dut VDD VSS IN1 IN2 P1 P2 S0 S1 S2 S3 params: P_I0_dc={20u} P_L2_w={10u} P_L2_l={1u}
+ P_L1_w={10u} P_L1_l={1u} P_M0_w={10u} P_M0_l={1u} P_M1_w={10u} P_M1_l={1u} P_R1_w={10u}
+ P_R1_l={1u} P_R2_w={10u} P_R2_l={1u}
.model ideal_switch SW(RON=1 ROFF=1e12 VT=0.5 VH=0)
I0 VDD net4 DC {P_I0_dc}
XM0 P1 IN1 net4 VDD IV_SKY_P_SI L={P_M0_l} W={P_M0_w}
XM1 P2 IN2 net4 VDD IV_SKY_P_SI L={P_M1_l} W={P_M1_w}
XM2 P1 IN1 net1 VDD IV_SKY_P_SI L={P_L2_l} W={P_L2_w}
XM3 P1 IN1 net0 VDD IV_SKY_P_SI L={P_L1_l} W={P_L1_w}
XM4 P2 IN2 net2 VDD IV_SKY_P_SI L={P_R1_l} W={P_R1_w}
XM5 P2 IN2 net3 VDD IV_SKY_P_SI L={P_R2_l} W={P_R2_w}
S0 net4 net1 S0 VSS ideal_switch
S1 net4 net0 S1 VSS ideal_switch
S2 net4 net2 S2 VSS ideal_switch
S3 net4 net3 S3 VSS ideal_switch
* @RNL(author="analog-canvas") {
*   $CANVAS_TYPESETTING @ATTACH(subscript_italic=false) #(level);
*   #I0 @SET-SYMBOL $CURRENT_SOURCE => @PLACE(15, -3.6) => @ORIENT("R0");
*   #XM2 @SET-SYMBOL $PMOS => @PLACE(0, -16.4) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M2") #XM2(part);
*   #S0 @SET-SYMBOL $CANVAS_SIMPLE_SWITCH => @PLACE(0, -10) => @ORIENT("R270");
*   #XM3 @SET-SYMBOL $PMOS => @PLACE(6, -16.4) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M3") #XM3(part);
*   #S1 @SET-SYMBOL $CANVAS_SIMPLE_SWITCH => @PLACE(6, -10) => @ORIENT("R270");
*   #XM0 @SET-SYMBOL $PMOS => @PLACE(12, -16.4) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M0") #XM0(part);
*   #XM1 @SET-SYMBOL $PMOS => @PLACE(18, -16.4) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M1") #XM1(part);
*   #XM4 @SET-SYMBOL $PMOS => @PLACE(24, -16.4) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M4") #XM4(part);
*   #S2 @SET-SYMBOL $CANVAS_SIMPLE_SWITCH => @PLACE(24, -10) => @ORIENT("R270");
*   #XM5 @SET-SYMBOL $PMOS => @PLACE(30, -16.4) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M5") #XM5(part);
*   #S3 @SET-SYMBOL $CANVAS_SIMPLE_SWITCH => @PLACE(30, -10) => @ORIENT("R270");
*   $SUPPLY @ATTACH &VDD(p) => @SET-SYMBOL $SUPPLY_SYMBOL => @PLACE(15, 0.4) => @ORIENT("R0") => %vdd1;
*   $IO_PORT @ATTACH &IN1(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(-5, -16.4) => @ORIENT("R0") => %port1;
*   $IO_PORT @ATTACH &IN2(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(35, -16.4) => @ORIENT("R180") => %port2;
*   $IO_PORT @ATTACH &P1(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(12, -22.4) => @ORIENT("R90") => %port3;
*   $IO_PORT @ATTACH &P2(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(18, -22.4) => @ORIENT("R90") => %port4;
*   &VDD @REMOVE-FROM $PORT_FILL_SET;
*   &VSS @REMOVE-FROM $PORT_FILL_SET;
*   &S0 @REMOVE-FROM $PORT_FILL_SET;
*   &S1 @REMOVE-FROM $PORT_FILL_SET;
*   &S2 @REMOVE-FROM $PORT_FILL_SET;
*   &S3 @REMOVE-FROM $PORT_FILL_SET;
*   %j1 = (15, -6.8);
*   $JUNCTION @ATTACH %j1;
*   %j2 = (12, -6.8);
*   $JUNCTION @ATTACH %j2;
*   %j3 = (6, -6.8);
*   $JUNCTION @ATTACH %j3;
*   %j4 = (0, -6.8);
*   %j5 = (18, -6.8);
*   $JUNCTION @ATTACH %j5;
*   %j6 = (24, -6.8);
*   $JUNCTION @ATTACH %j6;
*   %j7 = (30, -6.8);
*   %j8 = (0, -20.4);
*   %j9 = (6, -20.4);
*   $JUNCTION @ATTACH %j9;
*   %j10 = (12, -20.4);
*   $JUNCTION @ATTACH %j10;
*   %j11 = (18, -20.4);
*   $JUNCTION @ATTACH %j11;
*   %j12 = (24, -20.4);
*   $JUNCTION @ATTACH %j12;
*   %j13 = (30, -20.4);
*   &VDD @WIRE(mode="straight") {#I0:1 %vdd1:p};
*   &net4 @WIRE(mode="straight") {#I0:2 %j1};
*   &net4 @WIRE(mode="straight") {%j1 %j2};
*   &net4 @WIRE(mode="straight") {%j2 %j3};
*   &net4 @WIRE(mode="straight", linestyle="solid") {%j3 %j4};
*   &net4 @WIRE(mode="straight") {%j1 %j5};
*   &net4 @WIRE(mode="straight") {%j5 %j6};
*   &net4 @WIRE(mode="straight", linestyle="solid") {%j6 %j7};
*   &net4 @WIRE(mode="straight") {%j4 #S0:1};
*   &net1 @WIRE(mode="straight") {#S0:2 #XM2:3};
*   &P1 @WIRE(mode="straight") {#XM2:1 %j8};
*   &net4 @WIRE(mode="straight") {%j3 #S1:1};
*   &net0 @WIRE(mode="straight") {#S1:2 #XM3:3};
*   &P1 @WIRE(mode="straight") {#XM3:1 %j9};
*   &net4 @WIRE(mode="straight") {%j2 #XM0:3};
*   &P1 @WIRE(mode="straight") {#XM0:1 %j10};
*   &net4 @WIRE(mode="straight") {%j5 #XM1:3};
*   &P2 @WIRE(mode="straight") {#XM1:1 %j11};
*   &net4 @WIRE(mode="straight") {%j6 #S2:1};
*   &net2 @WIRE(mode="straight") {#S2:2 #XM4:3};
*   &P2 @WIRE(mode="straight") {#XM4:1 %j12};
*   &net4 @WIRE(mode="straight") {%j7 #S3:1};
*   &net3 @WIRE(mode="straight") {#S3:2 #XM5:3};
*   &P2 @WIRE(mode="straight") {#XM5:1 %j13};
*   &IN1 @WIRE(mode="straight") {%port1:p #XM2:2};
*   &IN1 @WIRE(mode="straight", linestyle="solid") {#XM2:2 #XM3:2};
*   &IN1 @WIRE(mode="straight") {#XM3:2 #XM0:2};
*   &IN2 @WIRE(mode="straight") {#XM1:2 #XM4:2};
*   &IN2 @WIRE(mode="straight", linestyle="solid") {#XM4:2 #XM5:2};
*   &IN2 @WIRE(mode="straight") {#XM5:2 %port2:p};
*   &P1 @WIRE(mode="straight") {%port3:p %j10};
*   &P1 @WIRE(mode="straight") {%j10 %j9};
*   &P1 @WIRE(mode="straight", linestyle="solid") {%j9 %j8};
*   &P2 @WIRE(mode="straight") {%port4:p %j11};
*   &P2 @WIRE(mode="straight") {%j11 %j12};
*   &P2 @WIRE(mode="straight", linestyle="solid") {%j12 %j13};
*   %port1 @TEXT("\textbf{in}_{\textbf{1}}", dx=-1.2, dy=1.3, size=1.5116) => %label1;
*   $CANVAS_LABEL @ATTACH(bind="net") %label1(label);
*   %port2 @TEXT("\textbf{in}_{\textbf{2}}", dx=-1.2, dy=1.3, size=1.5116) => %label2;
*   $CANVAS_LABEL @ATTACH(bind="net") %label2(label);
*   %port3 @TEXT("\textbf{p1}", dx=1.4, dy=-0.5, size=1.5116) => %label3;
*   $CANVAS_LABEL @ATTACH(bind="net") %label3(label);
*   %port4 @TEXT("\textbf{p2}", dx=1.4, dy=-0.5, size=1.5116) => %label4;
*   $CANVAS_LABEL @ATTACH(bind="net") %label4(label);
*   %vdd1 @TEXT("\textbf{\textit{V}}_{\textbf{DD}}", dx=1.4, dy=1.5, size=1.5116) => %label5;
*   $CANVAS_LABEL @ATTACH(bind="net") %label5(label);
*   #I0 @TEXT("\textbf{\textit{I}}_{\textbf{0}}", key="name", dx=2.4, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #I0::name(label);
*   #XM0 @TEXT("\textbf{\textit{M}}_{\textbf{0}}", key="name", dx=-4.3, dy=0.9, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM0::name(label);
*   #XM1 @TEXT("\textbf{\textit{M}}_{\textbf{1}}", key="name", dx=4.3, dy=-1.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM1::name(label);
*   #XM2 @TEXT("\textbf{\textit{M}}_{\textbf{2}}", key="name", dx=-2.5, dy=1.9, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM2::name(label);
*   #XM3 @TEXT("\textbf{\textit{M}}_{\textbf{3}}", key="name", dx=-4.3, dy=0.9, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM3::name(label);
*   #XM4 @TEXT("\textbf{\textit{M}}_{\textbf{4}}", key="name", dx=4.2, dy=-1.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM4::name(label);
*   #XM5 @TEXT("\textbf{\textit{M}}_{\textbf{5}}", key="name", dx=3, dy=1.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM5::name(label);
*   #S0 @TEXT("\textbf{\textit{S}}_{\textbf{0}}", key="name", dx=2.4, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #S0::name(label);
*   #S1 @TEXT("\textbf{\textit{S}}_{\textbf{1}}", key="name", dx=2.4, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #S1::name(label);
*   #S2 @TEXT("\textbf{\textit{S}}_{\textbf{2}}", key="name", dx=2.4, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #S2::name(label);
*   #S3 @TEXT("\textbf{\textit{S}}_{\textbf{3}}", key="name", dx=2.4, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #S3::name(label)
* }
.ends dut

* Project model: applied version 3
* Wrapper subcircuits only. They call SKY130 devices (sky130_fd_pr__*) by name;
* the reader's SKY130 PDK library supplies them.
.subckt IV_SKY_P_SI D G S B params: W=20u L=1u MULT=1
.param FINGER_W={min(10u,max(1u,W))}
.param WRAP_PARALLEL_M={MULT*W/FINGER_W}
XPDK D G S B sky130_fd_pr__pfet_g5v0d10v5 W={FINGER_W} L={L} m={WRAP_PARALLEL_M}
.ends IV_SKY_P_SI
