
* @RNL(type="header") {
*   @VERSION("0.3");
*   @USE-PACKAGE(name="rnl-std", version="0.3");
*   @USE-PACKAGE(name="rnl-std-no-labels", version="0.3");
*   @USE-PACKAGE(name="analog-canvas-extensions", version="0.6")
* }
.subckt ND2D1A VDD VSS A B Y
XMN0 net0 A VSS VSS sky130_fd_pr__nfet_01v8 l=0.2 w=0.76 nf=1 m=1
XMN1 Y B net0 VSS sky130_fd_pr__nfet_01v8 l=0.2 w=0.76 nf=1 m=1
XMP0 Y A VDD VDD sky130_fd_pr__pfet_01v8 l=0.2 w=1.13 nf=1 m=1
XMP1 Y B VDD VDD sky130_fd_pr__pfet_01v8 l=0.2 w=1.13 nf=1 m=1
* @RNL(author="analog-canvas") {
*   %ND2D1A_SYMBOL = @DEFINE-SYMBOL(box=[-5, -4, 5, 4]) {
*     (-5, 1) @PIN(terminal="A", label="\textbf{\textit{A}}", direction="left");
*     (-5, -1) @PIN(terminal="B", label="\textbf{\textit{B}}", direction="left");
*     (5, 0) @PIN(terminal="Y", label="\textbf{\textit{Y}}", direction="right");
*     (0, 4) @PIN(terminal="VDD", label="\textbf{\textit{V}}_{\textbf{DD}}", direction="up");
*     (0, 0) @RECTANGLE(width=8, height=6);
*     @LINE {(-5, 1) (-4, 1)};
*     @LINE {(-5, -1) (-4, -1)};
*     @LINE {(5, 0) (4, 0)};
*     @LINE {(0, 4) (0, 3)}
*   };
*   # @SET-SYMBOL %ND2D1A_SYMBOL;
*   $CANVAS_TYPESETTING @ATTACH(subscript_italic=false) #(level);
*   #XMP0 @SET-SYMBOL $PMOS => @PLACE(0, 8) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="MP0") #XMP0(part);
*   $CANVAS_PARAMETER_TEXT @ATTACH(name="l", text="0.2u") #XMP0(part);
*   #XMP1 @SET-SYMBOL $PMOS => @PLACE(12, 8) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="MP1") #XMP1(part);
*   $CANVAS_PARAMETER_TEXT @ATTACH(name="l", text="0.2u") #XMP1(part);
*   #XMN1 @SET-SYMBOL $NMOS => @PLACE(6, 0) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="MN1") #XMN1(part);
*   $CANVAS_PARAMETER_TEXT @ATTACH(name="l", text="0.2u") #XMN1(part);
*   $CANVAS_PARAMETER_TEXT @ATTACH(name="w", text="0.76u") #XMN1(part);
*   #XMN0 @SET-SYMBOL $NMOS => @PLACE(6, -7) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="MN0") #XMN0(part);
*   $CANVAS_PARAMETER_TEXT @ATTACH(name="l", text="0.2u") #XMN0(part);
*   $CANVAS_PARAMETER_TEXT @ATTACH(name="w", text="0.76u") #XMN0(part);
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(6, -9) => @ORIENT("R0") => %gnd1;
*   $IO_PORT @ATTACH &A(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(-3, 8) => @ORIENT("R0") => %port1;
*   $IO_PORT @ATTACH &B(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(9, 8) => @ORIENT("R0") => %port2;
*   $IO_PORT @ATTACH &B(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(3, 0) => @ORIENT("R0") => %port3;
*   $IO_PORT @ATTACH &A(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(3, -7) => @ORIENT("R0") => %port4;
*   $IO_PORT @ATTACH &Y(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(17, 4) => @ORIENT("MY") => %port5;
*   &VDD @REMOVE-FROM $PORT_FILL_SET;
*   &VSS @REMOVE-FROM $PORT_FILL_SET;
*   %j1 = (6, 4);
*   $JUNCTION @ATTACH %j1;
*   %j2 = (12, 4);
*   $JUNCTION @ATTACH %j2;
*   %j3 = (0, 12);
*   $JUNCTION @ATTACH %j3;
*   %j4 = (12, 12);
*   $JUNCTION @ATTACH %j4;
*   %j5 = (-2, 12);
*   %j6 = (14, 12);
*   &Y @WIRE(mode="straight") {#XMP0:1 (0, 4) %j1};
*   &Y @WIRE(mode="straight") {%j1 %j2};
*   &Y @WIRE(mode="straight") {%j2 #XMP1:1};
*   &Y @WIRE(mode="straight") {#XMN1:1 %j1};
*   &net0 @WIRE(mode="straight") {#XMN1:3 #XMN0:1};
*   &Y @WIRE(mode="straight") {%port5:p %j2};
*   &VDD @WIRE(mode="straight") {#XMP0:3 %j3};
*   &VDD @WIRE(mode="straight") {#XMP1:3 %j4};
*   &VDD @WIRE(mode="straight", linestyle="bold") {%j5 %j3};
*   &VDD @WIRE(mode="straight", linestyle="bold") {%j3 %j4};
*   &VDD @WIRE(mode="straight", linestyle="bold") {%j4 %j6};
*   &A @WIRE(mode="straight") {#XMP0:2 %port1:p};
*   &B @WIRE(mode="straight") {#XMP1:2 %port2:p};
*   &B @WIRE(mode="straight") {#XMN1:2 %port3:p};
*   &A @WIRE(mode="straight") {#XMN0:2 %port4:p};
*   &VSS @WIRE(mode="straight") {%gnd1:p #XMN0:3};
*   #XMP0 @TEXT("\textbf{\textit{M}}_{\textbf{P0}}", key="name", dx=0.4, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XMP0::name(label);
*   #XMP1 @TEXT("\textbf{\textit{M}}_{\textbf{P1}}", key="name", dx=0.4, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XMP1::name(label);
*   #XMN1 @TEXT("\textbf{\textit{M}}_{\textbf{N1}}", key="name", dx=0.5, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XMN1::name(label);
*   #XMN0 @TEXT("\textbf{\textit{M}}_{\textbf{N0}}", key="name", dx=0.5, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XMN0::name(label);
*   %port1 @TEXT("\textbf{\textit{A}}", key="name", dx=-2, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port1::name(label);
*   %port2 @TEXT("\textbf{\textit{B}}", key="name", dx=-2, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port2::name(label);
*   %port3 @TEXT("\textbf{\textit{B}}", key="name", dx=-2, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port3::name(label);
*   %port4 @TEXT("\textbf{\textit{A}}", key="name", dx=-2, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port4::name(label);
*   %port5 @TEXT("\textbf{\textit{Y}}", key="name", dx=2, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port5::name(label);
*   &VDD @TEXT("\textbf{\textit{V}}_{\textbf{DD}}", size=1.5116) => @PLACE(15, 11) => %power1;
*   $CANVAS_LABEL @ATTACH(bind="port") %power1(label)
* }
.ends ND2D1A

.subckt IVD4A VDD VSS A Y
XMN0 Y A VSS VSS sky130_fd_pr__nfet_01v8 l=0.2 w=0.76 nf=1 m=4
XMP0 Y A VDD VDD sky130_fd_pr__pfet_01v8 l=0.2 w=1.13 nf=1 m=4
* @RNL(author="analog-canvas") {
*   %IVD4A_SYMBOL = @DEFINE-SYMBOL(box=[-5, -3, 5, 3]) {
*     (0, 3) @PIN(terminal="VDD", label="\textbf{\textit{V}}_{\textbf{DD}}", direction="up");
*     (-5, 0) @PIN(terminal="A", label="\textbf{\textit{A}}", direction="left");
*     (5, 0) @PIN(terminal="Y", label="\textbf{\textit{Y}}", direction="right");
*     (0, 0) @RECTANGLE(width=8, height=4);
*     @LINE {(0, 3) (0, 2)};
*     @LINE {(-5, 0) (-4, 0)};
*     @LINE {(5, 0) (4, 0)}
*   };
*   # @SET-SYMBOL %IVD4A_SYMBOL;
*   $CANVAS_TYPESETTING @ATTACH(subscript_italic=false) #(level);
*   #XMP0 @SET-SYMBOL $PMOS => @PLACE(2, 4) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="MP0") #XMP0(part);
*   $CANVAS_PARAMETER_TEXT @ATTACH(name="l", text="0.2u") #XMP0(part);
*   #XMN0 @SET-SYMBOL $NMOS => @PLACE(2, -4) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="MN0") #XMN0(part);
*   $CANVAS_PARAMETER_TEXT @ATTACH(name="l", text="0.2u") #XMN0(part);
*   $CANVAS_PARAMETER_TEXT @ATTACH(name="w", text="0.76u") #XMN0(part);
*   $SUPPLY @ATTACH &VDD(p) => @SET-SYMBOL $SUPPLY_SYMBOL => @PLACE(2, 6) => @ORIENT("R0") => %vdd1;
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(2, -6) => @ORIENT("R0") => %gnd1;
*   $IO_PORT @ATTACH &A(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(-4, 0) => @ORIENT("R0") => %port1;
*   $IO_PORT @ATTACH &Y(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(7, 0) => @ORIENT("MY") => %port2;
*   &VDD @REMOVE-FROM $PORT_FILL_SET;
*   &VSS @REMOVE-FROM $PORT_FILL_SET;
*   %j1 = (-1, 0);
*   $JUNCTION @ATTACH %j1;
*   %j2 = (2, 0);
*   $JUNCTION @ATTACH %j2;
*   &Y @WIRE(mode="straight") {#XMP0:1 %j2};
*   &Y @WIRE(mode="straight") {%j2 #XMN0:1};
*   &A @WIRE(mode="straight") {#XMP0:2 %j1};
*   &A @WIRE(mode="straight") {%j1 #XMN0:2};
*   &A @WIRE(mode="straight") {%port1:p %j1};
*   &Y @WIRE(mode="straight") {%port2:p %j2};
*   &VDD @WIRE(mode="straight") {#XMP0:3 %vdd1:p};
*   &VSS @WIRE(mode="straight") {%gnd1:p #XMN0:3};
*   #XMP0 @TEXT("\textbf{\textit{M}}_{\textbf{P0}}", key="name", dx=0.4, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XMP0::name(label);
*   #XMN0 @TEXT("\textbf{\textit{M}}_{\textbf{N0}}", key="name", dx=0.5, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XMN0::name(label);
*   %vdd1 @TEXT("\textbf{\textit{V}}_{\textbf{DD}}", dx=0, dy=3.2, halign="middle", size=1.5116) => %power1;
*   $CANVAS_LABEL @ATTACH(bind="port") %power1(label);
*   %port1 @TEXT("\textbf{\textit{A}}", key="name", dx=-2, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port1::name(label);
*   %port2 @TEXT("\textbf{\textit{Y}}", key="name", dx=2, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port2::name(label)
* }
.ends IVD4A

.subckt charge_pump_unregulate AVDD VSS CLK EN VOUT
XC0 net2 net4 sky130_fd_pr__cap_mim_m3_1 w=25 l=25 mf=5
XC1 net0 net1 sky130_fd_pr__cap_mim_m3_1 w=25 l=25 mf=5
XMNM0 VOUT net2 net2 VSS sky130_fd_pr__nfet_05v0_nvt l=0.9 w=10 nf=1 m=2
XMNM1 VOUT net0 net0 VSS sky130_fd_pr__nfet_05v0_nvt l=0.9 w=10 nf=1 m=2
XMNM3 AVDD net2 net0 VSS sky130_fd_pr__nfet_05v0_nvt l=0.9 w=10 nf=1 m=2
XMNM4 AVDD net0 net2 VSS sky130_fd_pr__nfet_05v0_nvt l=0.9 w=10 nf=1 m=2
XI1 AVDD VSS CLK EN net3 ND2D1A
XI3 AVDD VSS net3 net4 IVD4A
XI4 AVDD VSS net4 net1 IVD4A
* @RNL(author="analog-canvas") {
*   %charge_pump_unregulate_SYMBOL = @DEFINE-SYMBOL(box=[-6, -5, 6, 5]) {
*     (-6, 0) @PIN(terminal="CLK", label="\textbf{\textit{CLK}}", direction="left");
*     (-6, -2) @PIN(terminal="EN", label="\textbf{\textit{EN}}", direction="left");
*     (6, -1) @PIN(terminal="VOUT", label="\textbf{\textit{V}}_{\textbf{OUT}}", direction="right");
*     (0, 5) @PIN(terminal="AVDD", label="\textbf{\textit{AVDD}}", direction="up");
*     (0, 0) @RECTANGLE(width=10, height=8);
*     @LINE {(-6, 0) (-5, 0)};
*     @LINE {(-6, -2) (-5, -2)};
*     @LINE {(6, -1) (5, -1)};
*     @LINE {(0, 5) (0, 4)}
*   };
*   # @SET-SYMBOL %charge_pump_unregulate_SYMBOL;
*   $CANVAS_TYPESETTING @ATTACH(subscript_italic=false) #(level);
*   #XI1 @SET-SYMBOL $CANVAS_CALL_NAND_GATE__0_0_1_2_3 => @PLACE(0, -14) => @ORIENT("R0");
*   #XI3 @SET-SYMBOL $CANVAS_CALL_INVERTER__0_0_1_2 => @PLACE(16, -14) => @ORIENT("R0");
*   #XI4 @SET-SYMBOL $CANVAS_CALL_INVERTER__0_0_1_2 => @PLACE(32, -14) => @ORIENT("R0");
*   #XMNM4 @SET-SYMBOL $NMOS => @PLACE(26, 14) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="MNM4") #XMNM4(part);
*   $CANVAS_PARAMETER_TEXT @ATTACH(name="l", text="0.9u") #XMNM4(part);
*   #XMNM3 @SET-SYMBOL $NMOS => @PLACE(54, 14) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="MNM3") #XMNM3(part);
*   $CANVAS_PARAMETER_TEXT @ATTACH(name="l", text="0.9u") #XMNM3(part);
*   #XMNM0 @SET-SYMBOL $NMOS => @PLACE(34, 3) => @ORIENT("R180");
*   $CANVAS_NAME @ATTACH(name="MNM0") #XMNM0(part);
*   $CANVAS_PARAMETER_TEXT @ATTACH(name="l", text="0.9u") #XMNM0(part);
*   #XMNM1 @SET-SYMBOL $NMOS => @PLACE(46, 3) => @ORIENT("MX");
*   $CANVAS_NAME @ATTACH(name="MNM1") #XMNM1(part);
*   $CANVAS_PARAMETER_TEXT @ATTACH(name="l", text="0.9u") #XMNM1(part);
*   #XC0 @SET-SYMBOL $CAPACITOR => @PLACE(26, -7) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="C0") #XC0(part);
*   #XC1 @SET-SYMBOL $CAPACITOR => @PLACE(54, -7) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="C1") #XC1(part);
*   $IO_PORT @ATTACH &CLK(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(-8, -13) => @ORIENT("R0") => %port1;
*   $IO_PORT @ATTACH &EN(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(-8, -15) => @ORIENT("R0") => %port2;
*   $IO_PORT @ATTACH &VOUT(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(40, -3) => @ORIENT("R90") => %port3;
*   &AVDD @REMOVE-FROM $PORT_FILL_SET;
*   &VSS @REMOVE-FROM $PORT_FILL_SET;
*   %j1 = (26, 6);
*   $JUNCTION @ATTACH %j1;
*   %j2 = (34, 6);
*   $JUNCTION @ATTACH %j2;
*   %j3 = (54, 6);
*   $JUNCTION @ATTACH %j3;
*   %j4 = (46, 6);
*   $JUNCTION @ATTACH %j4;
*   %j5 = (54, 10);
*   $JUNCTION @ATTACH %j5;
*   %j6 = (26, 10);
*   $JUNCTION @ATTACH %j6;
*   %j7 = (40, -1);
*   $JUNCTION @ATTACH %j7;
*   %j8 = (26, -14);
*   $JUNCTION @ATTACH %j8;
*   %j9 = (26, 18);
*   $JUNCTION @ATTACH %j9;
*   %j10 = (54, 18);
*   $JUNCTION @ATTACH %j10;
*   %j11 = (24, 18);
*   %j12 = (56, 18);
*   &net2 @WIRE(mode="straight") {#XMNM4:3 %j6};
*   &net2 @WIRE(mode="straight") {%j6 %j1};
*   &net2 @WIRE(mode="straight") {%j1 #XC0:1};
*   &net0 @WIRE(mode="straight") {#XMNM3:3 %j5};
*   &net0 @WIRE(mode="straight") {%j5 %j3};
*   &net0 @WIRE(mode="straight") {%j3 #XC1:1};
*   &net2 @WIRE(mode="straight") {#XMNM0:2 (37, 6) %j2};
*   &net2 @WIRE(mode="straight") {%j2 %j1};
*   &net2 @WIRE(mode="straight") {#XMNM0:3 %j2};
*   &net0 @WIRE(mode="straight") {#XMNM1:2 (43, 6) %j4};
*   &net0 @WIRE(mode="straight") {%j4 %j3};
*   &net0 @WIRE(mode="straight") {#XMNM1:3 %j4};
*   &net0 @WIRE(mode="straight") {#XMNM4:2 (38, 14) (42, 10) %j5};
*   &net2 @WIRE(mode="straight") {#XMNM3:2 (42, 14) (38, 10) %j6};
*   &VOUT @WIRE(mode="straight") {#XMNM0:1 (34, -1) %j7};
*   &VOUT @WIRE(mode="straight") {%j7 (46, -1) #XMNM1:1};
*   &VOUT @WIRE(mode="straight") {%port3:p %j7};
*   &CLK @WIRE(mode="straight") {%port1:p #XI1:3};
*   &EN @WIRE(mode="straight") {%port2:p #XI1:4};
*   &net3 @WIRE(mode="straight") {#XI1:5 #XI3:3};
*   &net4 @WIRE(mode="straight") {#XI3:4 %j8};
*   &net4 @WIRE(mode="straight") {%j8 #XI4:3};
*   &net4 @WIRE(mode="straight") {%j8 #XC0:2};
*   &net1 @WIRE(mode="straight") {#XI4:4 (54, -14) #XC1:2};
*   &AVDD @WIRE(mode="straight") {#XMNM4:1 %j9};
*   &AVDD @WIRE(mode="straight") {#XMNM3:1 %j10};
*   &AVDD @WIRE(mode="straight", linestyle="bold") {%j11 %j9};
*   &AVDD @WIRE(mode="straight", linestyle="bold") {%j9 %j10};
*   &AVDD @WIRE(mode="straight", linestyle="bold") {%j10 %j12};
*   #XI1 @TEXT("\textbf{\textit{XI}}_{\textbf{1}}", key="name", dx=0, dy=-3, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XI1::name(label);
*   #XI3 @TEXT("\textbf{\textit{XI}}_{\textbf{3}}", key="name", dx=-0.5, dy=-2.9, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XI3::name(label);
*   #XI4 @TEXT("\textbf{\textit{XI}}_{\textbf{4}}", key="name", dx=-0.5, dy=-2.9, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XI4::name(label);
*   #XMNM4 @TEXT("\textbf{\textit{M}}_{\textbf{NM4}}", key="name", dx=-0.5, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XMNM4::name(label);
*   #XMNM3 @TEXT("\textbf{\textit{M}}_{\textbf{NM3}}", key="name", dx=0.5, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XMNM3::name(label);
*   #XMNM0 @TEXT("\textbf{\textit{M}}_{\textbf{NM0}}", key="name", dx=-0.5, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XMNM0::name(label);
*   #XMNM1 @TEXT("\textbf{\textit{M}}_{\textbf{NM1}}", key="name", dx=0.5, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XMNM1::name(label);
*   #XC0 @TEXT("\textbf{\textit{C}}_{\textbf{0}}", key="name", dx=1.2, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XC0::name(label);
*   #XC1 @TEXT("\textbf{\textit{C}}_{\textbf{1}}", key="name", dx=1.2, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XC1::name(label);
*   %port1 @TEXT("\textbf{\textit{CLK}}", key="name", dx=-2, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port1::name(label);
*   %port2 @TEXT("\textbf{\textit{EN}}", key="name", dx=-2, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port2::name(label);
*   %port3 @TEXT("\textbf{\textit{V}}_{\textbf{OUT}}", key="name", dx=0, dy=-2.8, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port3::name(label);
*   &AVDD @TEXT("\textbf{\textit{AVDD}}", size=1.5116) => @PLACE(57, 17) => %power1;
*   $CANVAS_LABEL @ATTACH(bind="port") %power1(label)
* }
.ends charge_pump_unregulate
* @RNL(author="analog-canvas") {
*   $CANVAS_CALL_NAND_GATE__0_0_1_2_3 = @DEFINE-SYMBOL(box=[-4.4, -2.4, 4.4, 2.4]) {
*     (-3, 1) @PIN(terminal=3, direction="left");
*     (-3, -1) @PIN(terminal=4, direction="left");
*     (3, 0) @PIN(terminal=5, direction="right");
*     @LINE(linewidth=0.16) {(-3, 1) (-2, 1)};
*     @LINE(linewidth=0.16) {(-3, -1) (-2, -1)};
*     @BEZIER(linewidth=0.24) {(-0.140553, -1.507978) (-0.140553, -1.507978) (-0.140553, -1.507978) (-0.123638, -1.506583)
*         (-0.098875, -1.505188) (-0.049351, -1.502572) (-0.024588, -1.501351) (0.000174, -1.500131) (0.000174, -1.500131)
*         (0.067835, -1.489493) (0.135496, -1.479205) (0.270817, -1.458279) (0.391839, -1.423402) (0.513035, -1.388002)
*         (0.619932, -1.338652) (0.735897, -1.259133) (0.851687, -1.179789) (0.97672, -1.070451) (1.072979, -0.955881)
*         (1.169239, -0.841311) (1.237074, -0.721336) (1.289214, -0.599093) (1.341181, -0.476676) (1.377801, -0.351644)
*         (1.397332, -0.221379) (1.416688, -0.091115) (1.419479, 0.044206) (1.406225, 0.170634) (1.393321, 0.296887)
*         (1.364897, 0.414073) (1.311187, 0.542942) (1.257825, 0.671811) (1.179702, 0.812538) (1.089895, 0.928328)
*         (1.000087, 1.044293) (0.898596, 1.135496) (0.815241, 1.203156) (0.731886, 1.270817) (0.666841, 1.31511)
*         (0.59796, 1.350336) (0.528555, 1.385387) (0.456012, 1.411544) (0.390618, 1.432296) (0.325748, 1.453047)
*         (0.268376, 1.468742) (0.21763, 1.47781) (0.16671, 1.487052) (0.122417, 1.489493) (0.076903, 1.490889) (0.031389, 1.492109)
*         (-0.01552, 1.492109) (-0.065045, 1.492109) (-0.114395, 1.492109) (-0.166536, 1.492109) (-0.192693, 1.492109)
*         (-0.210829, 1.492109) (-0.210829, 1.492109) (-0.210829, 1.492109) (-0.807219, 1.492109) (-1.40361, 1.492109)
*         (-2, 1.492109) (-2, 0.49208) (-2, -0.507949) (-2, -1.507978) (-1.380184, -1.507978) (-0.760369, -1.507978)
*         (-0.140553, -1.507978)};
*     (1.965298, -0.001046) @CIRCLE(radius=0.337519, linewidth=0.24);
*     @LINE(linewidth=0.16) {(2.302816, 0) (3, 0)}
*   };
*   $CANVAS_CALL_INVERTER__0_0_1_2 = @DEFINE-SYMBOL(box=[-4.4, -2.4, 4.4, 2.4]) {
*     (-3, 0) @PIN(terminal=3, direction="left");
*     (2, 0) @PIN(terminal=4, direction="right");
*     @LINE(linewidth=0.16) {(-3, 0) (-2, 0)};
*     @LINE(linewidth=0.24) {(0.375098, 0) (-2, 1.500044) (-2, -1.374836) (0.375098, 0)};
*     (0.752202, -0.000959) @CIRCLE(radius=0.375011, linewidth=0.24);
*     @LINE(linewidth=0.16) {(1.127212, 0) (2, 0)}
*   }
* }
