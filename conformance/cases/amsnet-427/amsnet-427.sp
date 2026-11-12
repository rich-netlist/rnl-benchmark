
* @RNL(type="header") {
*   @VERSION("0.3");
*   @USE-PACKAGE(name="rnl-std", version="0.3");
*   @USE-PACKAGE(name="rnl-std-no-labels", version="0.3");
*   @USE-PACKAGE(name="analog-canvas-extensions", version="0.6")
* }
.subckt dut Vout+ Vout-
C Vout+ Vout- 1p
R Vout+ Vout- 1k
* @RNL(author="analog-canvas") {
*   $CANVAS_TYPESETTING @ATTACH(subscript_italic=false) #(level);
*   #R @SET-SYMBOL $RESISTOR => @PLACE(15, -10) => @ORIENT("R270");
*   #C @SET-SYMBOL $CAPACITOR => @PLACE(21, -14) => @ORIENT("R0");
*   $IO_PORT @ATTACH &"Vout+"(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(26, -10) => @ORIENT("R180") => %port1;
*   $IO_PORT @ATTACH &"Vout-"(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(26, -18) => @ORIENT("R180") => %port2;
*   %j1 = (21, -10);
*   $JUNCTION @ATTACH %j1;
*   %j2 = (21, -18);
*   $JUNCTION @ATTACH %j2;
*   &"Vout+" @WIRE(mode="straight") {#R:1 %j1};
*   &"Vout+" @WIRE(mode="straight") {%j1 #C:1};
*   &"Vout-" @WIRE(mode="straight") {#R:2 (11, -10) (11, -18) %j2};
*   &"Vout-" @WIRE(mode="straight") {%j2 #C:2};
*   &"Vout+" @WIRE(mode="straight") {%port1:p %j1};
*   &"Vout-" @WIRE(mode="straight") {%port2:p %j2};
*   #R @TEXT("\textbf{\textit{R}}", key="name", dx=0, dy=1.6, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #R::name(label);
*   #C @TEXT("\textbf{\textit{C}}", key="name", dx=1.2, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #C::name(label);
*   %port1 @TEXT("\textbf{\textit{V}}_{\textbf{out+}}", key="name", dx=2, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port1::name(label);
*   %port2 @TEXT("\textbf{\textit{V}}_{\textbf{out-}}", key="name", dx=2, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port2::name(label)
* }
.ends dut
