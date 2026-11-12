
* @RNL(type="header") {
*   @VERSION("0.3");
*   @USE-PACKAGE(name="rnl-std", version="0.3");
*   @USE-PACKAGE(name="rnl-std-no-labels", version="0.3");
*   @USE-PACKAGE(name="analog-canvas-extensions", version="0.6")
* }
.subckt dut VEE VSS
.model DIODE D(IS=1e-14 N=1)
.model icm_zener_D1 D(BV=6.2)
D1 net0 VEE icm_zener_D1
D2 net1 VSS DIODE
XQ1 net1 net0 net2 sky130_fd_pr__pnp_05v5_W0p68L0p68 m=1
R1 net0 VSS 620Ω
RC VEE net2 200Ω
* @RNL(author="analog-canvas") {
*   %dut_SYMBOL = @DEFINE-SYMBOL(box=[-5, -3, 5, 3]) {
*     (0, 3) @PIN(terminal="VEE", label="\textbf{\textit{V}}_{\textbf{EE}}", direction="up");
*     (0, 0) @RECTANGLE(width=8, height=4);
*     @LINE {(0, 3) (0, 2)}
*   };
*   # @SET-SYMBOL %dut_SYMBOL;
*   $CANVAS_TYPESETTING @ATTACH(subscript_italic=false) #(level);
*   #XQ1 @SET-SYMBOL $PNP => @PLACE(20, -10) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="Q1") #XQ1(part);
*   #RC @SET-SYMBOL $RESISTOR => @PLACE(20, -4) => @ORIENT("R0");
*   #D1 @SET-SYMBOL $ZENER_DIODE => @PLACE(10, -4) => @ORIENT("R90");
*   $CANVAS_PARAMETER @ATTACH(name="bv", text="6.2") #D1(part);
*   #R1 @SET-SYMBOL $RESISTOR => @PLACE(10, -15) => @ORIENT("R0");
*   #D2 @SET-SYMBOL $CANVAS_LED => @PLACE(20, -15) => @ORIENT("R270");
*   $SUPPLY @ATTACH &VEE(p) => @SET-SYMBOL $SUPPLY_SYMBOL => @PLACE(20, 0) => @ORIENT("R0") => %vdd1;
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(10, -17) => @ORIENT("R0") => %gnd1;
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(20, -17) => @ORIENT("R0") => %gnd2;
*   &VEE @REMOVE-FROM $PORT_FILL_SET;
*   &VSS @REMOVE-FROM $PORT_FILL_SET;
*   %j1 = (10, -10);
*   $JUNCTION @ATTACH %j1;
*   &VEE @WIRE(mode="straight") {#D1:2 #RC:1};
*   &VEE @WIRE(mode="straight") {%vdd1:p #RC:1};
*   &net2 @WIRE(mode="straight") {#RC:2 #XQ1:3};
*   &net0 @WIRE(mode="straight") {#D1:1 %j1};
*   &net0 @WIRE(mode="straight") {%j1 #R1:1};
*   &net0 @WIRE(mode="straight") {#XQ1:2 %j1};
*   &net1 @WIRE(mode="straight") {#XQ1:1 #D2:1};
*   $JUNCTION @ATTACH (20, -2)(p) => %dot1;
*   &VSS @WIRE(mode="straight") {%gnd1:p #R1:2};
*   &VSS @WIRE(mode="straight") {%gnd2:p #D2:2};
*   #XQ1 @TEXT("\textbf{\textit{Q}}_{\textbf{1}}", key="name", dx=0.4, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XQ1::name(label);
*   #RC @TEXT("\textbf{\textit{R}}_{\textbf{C}}", key="name", dx=0.9, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #RC::name(label);
*   #RC @TEXT("\textbf{200Ω}", key="value", dx=0.9, dy=-2.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="value") #RC::value(label);
*   #D1 @TEXT("\textbf{\textit{D}}_{\textbf{1}}", key="name", dx=1.2, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #D1::name(label);
*   #R1 @TEXT("\textbf{\textit{R}}_{\textbf{1}}", key="name", dx=0.9, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #R1::name(label);
*   #R1 @TEXT("\textbf{620Ω}", key="value", dx=0.9, dy=-2.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="value") #R1::value(label);
*   #D2 @TEXT("\textbf{\textit{D}}_{\textbf{2}}", key="name", dx=-1.1, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #D2::name(label);
*   %vdd1 @TEXT("\textbf{\textit{V}}_{\textbf{EE}}", dx=0, dy=3.2, halign="middle", size=1.5116) => %power1;
*   $CANVAS_LABEL @ATTACH(bind="port") %power1(label);
*   (21.8, 1.6) @TEXT("+12V", size=1.5116, bold=true) => %text1;
*   $CANVAS_TYPOGRAPHY @ATTACH(token="label") %text1(text);
*   (11.4, -6.4) @TEXT("6.2V", size=1.5116, bold=true) => %text2;
*   $CANVAS_TYPOGRAPHY @ATTACH(token="label") %text2(text)
* }
.ends dut
