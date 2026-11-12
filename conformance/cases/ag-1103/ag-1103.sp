
* @RNL(type="header") {
*   @VERSION("0.3");
*   @USE-PACKAGE(name="rnl-std", version="0.3");
*   @USE-PACKAGE(name="rnl-std-no-labels", version="0.3");
*   @USE-PACKAGE(name="analog-canvas-extensions", version="0.6");
*   @USE-PACKAGE(name="rnl-std-rf", version="0.3")
* }
.subckt ct_inductor n1 n2 n3 params: l1=1n l2=1n k=0
L1 n1 n3 {l1}
L2 n3 n2 {l2}
K12 L1 L2 {k}
.ends ct_inductor

.subckt PA VDD VSS VB inp inn outp outn src
Cf1 outp net3 1p
Cf2 outn net1 1p
LBWa VDD outp 1n
LBWb VDD outn 1n
LBWc VB net5 1n
LBWg src VSS 1n
XMP1A net0 inp src VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XMP1B net2 inn src VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XMP2A outp net4 net0 VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XMP2B outn net4 net2 VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
Rc net5 net4 1k
Rf1 net3 inp 1k
Rf2 net1 inn 1k
* @RNL(author="analog-canvas") {
*   %PA_SYMBOL = @DEFINE-SYMBOL(box=[-6, -7, 6, 7]) {
*     (-2, 7) @PIN(terminal="VDD", label="\textbf{\textit{V}}_{\textbf{DD}}", direction="up");
*     (2, 7) @PIN(terminal="VB", label="\textbf{\textit{V}}_{\textbf{B}}", direction="up");
*     (-6, 2) @PIN(terminal="inp", label="\textbf{\textit{inp}}", direction="left");
*     (-6, -2) @PIN(terminal="inn", label="\textbf{\textit{inn}}", direction="left");
*     (6, 2) @PIN(terminal="outp", label="\textbf{\textit{outp}}", direction="right");
*     (6, -2) @PIN(terminal="outn", label="\textbf{\textit{outn}}", direction="right");
*     (0, -7) @PIN(terminal="src", label="\textbf{\textit{src}}", direction="down");
*     (0, 0) @RECTANGLE(width=10, height=12);
*     @LINE {(-2, 7) (-2, 6)};
*     @LINE {(2, 7) (2, 6)};
*     @LINE {(-6, 2) (-5, 2)};
*     @LINE {(-6, -2) (-5, -2)};
*     @LINE {(6, 2) (5, 2)};
*     @LINE {(6, -2) (5, -2)};
*     @LINE {(0, -7) (0, -6)}
*   };
*   # @SET-SYMBOL %PA_SYMBOL;
*   $CANVAS_TYPESETTING @ATTACH(subscript_italic=false) #(level);
*   #XMP1A @SET-SYMBOL $NMOS => @PLACE(0, -16) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="MP1A") #XMP1A(part);
*   #XMP1B @SET-SYMBOL $NMOS => @PLACE(14, -16) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="MP1B") #XMP1B(part);
*   #XMP2A @SET-SYMBOL $NMOS => @PLACE(0, -10) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="MP2A") #XMP2A(part);
*   #XMP2B @SET-SYMBOL $NMOS => @PLACE(14, -10) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="MP2B") #XMP2B(part);
*   #Rc @SET-SYMBOL $RESISTOR => @PLACE(7, -6) => @ORIENT("R0");
*   #LBWc @SET-SYMBOL $INDUCTOR => @PLACE(7, 0) => @ORIENT("R0");
*   #Cf1 @SET-SYMBOL $CAPACITOR => @PLACE(-4, -9) => @ORIENT("R0");
*   #Rf1 @SET-SYMBOL $RESISTOR => @PLACE(-4, -14) => @ORIENT("R0");
*   #Cf2 @SET-SYMBOL $CAPACITOR => @PLACE(18, -9) => @ORIENT("R0");
*   #Rf2 @SET-SYMBOL $RESISTOR => @PLACE(18, -14) => @ORIENT("R0");
*   #LBWg @SET-SYMBOL $INDUCTOR => @PLACE(7, -24) => @ORIENT("R0");
*   #LBWa @SET-SYMBOL $INDUCTOR => @PLACE(0, 1) => @ORIENT("R0");
*   #LBWb @SET-SYMBOL $INDUCTOR => @PLACE(14, 1) => @ORIENT("R0");
*   $SUPPLY @ATTACH &VDD(p) => @SET-SYMBOL $SUPPLY_SYMBOL => @PLACE(0, 3) => @ORIENT("R0") => %vdd1;
*   $SUPPLY @ATTACH &VDD(p) => @SET-SYMBOL $SUPPLY_SYMBOL => @PLACE(14, 3) => @ORIENT("R0") => %vdd2;
*   $IO_PORT @ATTACH &VB(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(7, 4) => @ORIENT("R270") => %port1;
*   $IO_PORT @ATTACH &inp(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(-9, -16) => @ORIENT("R0") => %port2;
*   $IO_PORT @ATTACH &inn(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(23, -16) => @ORIENT("MY") => %port3;
*   $IO_PORT @ATTACH &outp(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(-9, -2) => @ORIENT("R0") => %port4;
*   $IO_PORT @ATTACH &outn(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(23, -2) => @ORIENT("MY") => %port5;
*   $IO_PORT @ATTACH &src(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(23, -20) => @ORIENT("MY") => %port6;
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(7, -26) => @ORIENT("R0") => %gnd1;
*   &VDD @REMOVE-FROM $PORT_FILL_SET;
*   &VSS @REMOVE-FROM $PORT_FILL_SET;
*   %j1 = (7, -10);
*   $JUNCTION @ATTACH %j1;
*   %j2 = (0, -6);
*   $JUNCTION @ATTACH %j2;
*   %j3 = (14, -6);
*   $JUNCTION @ATTACH %j3;
*   %j4 = (7, -20);
*   $JUNCTION @ATTACH %j4;
*   %j5 = (14, -20);
*   $JUNCTION @ATTACH %j5;
*   %j6 = (0, -2);
*   $JUNCTION @ATTACH %j6;
*   %j7 = (14, -2);
*   $JUNCTION @ATTACH %j7;
*   &outp @WIRE(mode="straight") {%port4:p %j6};
*   &outp @WIRE(mode="straight") {%j6 %j2};
*   &outp @WIRE(mode="straight") {%j2 #XMP2A:1};
*   &outn @WIRE(mode="straight") {%port5:p %j7};
*   &outn @WIRE(mode="straight") {%j7 %j3};
*   &outn @WIRE(mode="straight") {%j3 #XMP2B:1};
*   &net0 @WIRE(mode="straight") {#XMP2A:3 #XMP1A:1};
*   &net2 @WIRE(mode="straight") {#XMP2B:3 #XMP1B:1};
*   &net4 @WIRE(mode="straight") {#XMP2A:2 %j1};
*   &net4 @WIRE(mode="straight") {%j1 #XMP2B:2};
*   &net4 @WIRE(mode="straight") {#Rc:2 %j1};
*   &net5 @WIRE(mode="straight") {#Rc:1 #LBWc:2};
*   &VB @WIRE(mode="straight") {#LBWc:1 %port1:p};
*   &outp @WIRE(mode="straight") {#Cf1:1 (-4, -6) %j2};
*   &net3 @WIRE(mode="straight") {#Cf1:2 #Rf1:1};
*   &inp @WIRE(mode="straight") {%port2:p #Rf1:2};
*   &inp @WIRE(mode="straight") {#Rf1:2 #XMP1A:2};
*   &outn @WIRE(mode="straight") {#Cf2:1 (18, -6) %j3};
*   &net1 @WIRE(mode="straight") {#Cf2:2 #Rf2:1};
*   &inn @WIRE(mode="straight") {%port3:p #Rf2:2};
*   &inn @WIRE(mode="straight") {#Rf2:2 #XMP1B:2};
*   &src @WIRE(mode="straight") {#XMP1A:3 (0, -20) %j4};
*   &src @WIRE(mode="straight") {%j4 %j5};
*   &src @WIRE(mode="straight") {%j5 #XMP1B:3};
*   &src @WIRE(mode="straight") {%j4 #LBWg:1};
*   &src @WIRE(mode="straight") {%port6:p %j5};
*   &outp @WIRE(mode="straight") {#LBWa:2 %j6};
*   &outn @WIRE(mode="straight") {#LBWb:2 %j7};
*   &VDD @WIRE(mode="straight") {#LBWb:1 %vdd2:p};
*   &VDD @WIRE(mode="straight") {#LBWa:1 %vdd1:p};
*   $JUNCTION @ATTACH (18, -16)(p) => %dot1;
*   $JUNCTION @ATTACH (-4, -16)(p) => %dot2;
*   &VSS @WIRE(mode="straight") {%gnd1:p #LBWg:2};
*   #XMP1A @TEXT("\textbf{\textit{M}}_{\textbf{P1A}}", key="name", dx=0.5, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XMP1A::name(label);
*   #XMP1B @TEXT("\textbf{\textit{M}}_{\textbf{P1B}}", key="name", dx=-0.5, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XMP1B::name(label);
*   #XMP2A @TEXT("\textbf{\textit{M}}_{\textbf{P2A}}", key="name", dx=3.4, dy=-1.8, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XMP2A::name(label);
*   #XMP2B
*       @TEXT("\textbf{\textit{M}}_{\textbf{P2B}}", key="name", dx=-2.2, dy=-3.5, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XMP2B::name(label);
*   #Rc @TEXT("\textbf{\textit{R}}_{\textbf{c}}", key="name", dx=0.9, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #Rc::name(label);
*   #LBWc @TEXT("\textbf{\textit{L}}_{\textbf{BWc}}", key="name", dx=1.2, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #LBWc::name(label);
*   #Cf1 @TEXT("\textbf{\textit{C}}_{\textbf{f1}}", key="name", dx=-1.2, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #Cf1::name(label);
*   #Rf1 @TEXT("\textbf{\textit{R}}_{\textbf{f1}}", key="name", dx=-0.9, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #Rf1::name(label);
*   #Cf2 @TEXT("\textbf{\textit{C}}_{\textbf{f2}}", key="name", dx=1.2, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #Cf2::name(label);
*   #Rf2 @TEXT("\textbf{\textit{R}}_{\textbf{f2}}", key="name", dx=0.9, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #Rf2::name(label);
*   #LBWg @TEXT("\textbf{\textit{L}}_{\textbf{BWg}}", key="name", dx=1.2, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #LBWg::name(label);
*   #LBWa @TEXT("\textbf{\textit{L}}_{\textbf{BWa}}", key="name", dx=1.2, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #LBWa::name(label);
*   #LBWb @TEXT("\textbf{\textit{L}}_{\textbf{BWb}}", key="name", dx=1.2, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #LBWb::name(label);
*   %vdd1 @TEXT("\textbf{\textit{V}}_{\textbf{DD}}", dx=2, dy=1, size=1.5116) => %power1;
*   $CANVAS_LABEL @ATTACH(bind="port") %power1(label);
*   %vdd2 @TEXT("\textbf{\textit{V}}_{\textbf{DD}}", dx=2, dy=1, size=1.5116) => %power2;
*   $CANVAS_LABEL @ATTACH(bind="port") %power2(label);
*   %port1 @TEXT("\textbf{\textit{V}}_{\textbf{B}}", key="name", dx=0, dy=1.9, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port1::name(label);
*   %port2 @TEXT("\textbf{\textit{inp}}", key="name", dx=-2, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port2::name(label);
*   %port3 @TEXT("\textbf{\textit{inn}}", key="name", dx=2, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port3::name(label);
*   %port4 @TEXT("\textbf{\textit{outp}}", key="name", dx=-2, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port4::name(label);
*   %port5 @TEXT("\textbf{\textit{outn}}", key="name", dx=2, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port5::name(label);
*   %port6 @TEXT("\textbf{\textit{src}}", key="name", dx=2, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port6::name(label)
* }
.ends PA

.subckt DA VSS VB inp inn outp outn src
Cf1 outp net0 1p
Cf2 outn net4 1p
LBWc VB net1 1n
LBWg src VSS 1n
XMD1A net2 inp src VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XMD1B net5 inn src VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XMD2A outp net3 net2 VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XMD2B outn net3 net5 VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
Rc net1 net3 1k
Rf1 net0 inp 1k
Rf2 net4 inn 1k
* @RNL(author="analog-canvas") {
*   %DA_SYMBOL = @DEFINE-SYMBOL(box=[-6, -7, 6, 7]) {
*     (0, 7) @PIN(terminal="VB", label="\textbf{\textit{V}}_{\textbf{B}}", direction="up");
*     (-6, 2) @PIN(terminal="inp", label="\textbf{\textit{inp}}", direction="left");
*     (-6, -2) @PIN(terminal="inn", label="\textbf{\textit{inn}}", direction="left");
*     (6, 2) @PIN(terminal="outp", label="\textbf{\textit{outp}}", direction="right");
*     (6, -2) @PIN(terminal="outn", label="\textbf{\textit{outn}}", direction="right");
*     (0, -7) @PIN(terminal="src", label="\textbf{\textit{src}}", direction="down");
*     (0, 0) @RECTANGLE(width=10, height=12);
*     @LINE {(0, 7) (0, 6)};
*     @LINE {(-6, 2) (-5, 2)};
*     @LINE {(-6, -2) (-5, -2)};
*     @LINE {(6, 2) (5, 2)};
*     @LINE {(6, -2) (5, -2)};
*     @LINE {(0, -7) (0, -6)}
*   };
*   # @SET-SYMBOL %DA_SYMBOL;
*   $CANVAS_TYPESETTING @ATTACH(subscript_italic=false) #(level);
*   #XMD1A @SET-SYMBOL $NMOS => @PLACE(0, -16) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="MD1A") #XMD1A(part);
*   #XMD1B @SET-SYMBOL $NMOS => @PLACE(14, -16) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="MD1B") #XMD1B(part);
*   #XMD2A @SET-SYMBOL $NMOS => @PLACE(0, -10) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="MD2A") #XMD2A(part);
*   #XMD2B @SET-SYMBOL $NMOS => @PLACE(14, -10) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="MD2B") #XMD2B(part);
*   #Rc @SET-SYMBOL $RESISTOR => @PLACE(7, -6) => @ORIENT("R0");
*   #LBWc @SET-SYMBOL $INDUCTOR => @PLACE(7, 0) => @ORIENT("R0");
*   #Cf1 @SET-SYMBOL $CAPACITOR => @PLACE(-4, -9) => @ORIENT("R0");
*   #Rf1 @SET-SYMBOL $RESISTOR => @PLACE(-4, -14) => @ORIENT("R0");
*   #Cf2 @SET-SYMBOL $CAPACITOR => @PLACE(18, -9) => @ORIENT("R0");
*   #Rf2 @SET-SYMBOL $RESISTOR => @PLACE(18, -14) => @ORIENT("R0");
*   #LBWg @SET-SYMBOL $INDUCTOR => @PLACE(7, -24) => @ORIENT("R0");
*   $IO_PORT @ATTACH &VB(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(7, 4) => @ORIENT("R270") => %port1;
*   $IO_PORT @ATTACH &inp(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(-9, -16) => @ORIENT("R0") => %port2;
*   $IO_PORT @ATTACH &inn(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(23, -16) => @ORIENT("MY") => %port3;
*   $IO_PORT @ATTACH &outp(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(-9, -2) => @ORIENT("R0") => %port4;
*   $IO_PORT @ATTACH &outn(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(23, -2) => @ORIENT("MY") => %port5;
*   $IO_PORT @ATTACH &src(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(23, -20) => @ORIENT("MY") => %port6;
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(7, -26) => @ORIENT("R0") => %gnd1;
*   &VSS @REMOVE-FROM $PORT_FILL_SET;
*   %j1 = (7, -10);
*   $JUNCTION @ATTACH %j1;
*   %j2 = (0, -6);
*   $JUNCTION @ATTACH %j2;
*   %j3 = (14, -6);
*   $JUNCTION @ATTACH %j3;
*   %j4 = (7, -20);
*   $JUNCTION @ATTACH %j4;
*   %j5 = (14, -20);
*   $JUNCTION @ATTACH %j5;
*   &outp @WIRE(mode="straight") {%port4:p (0, -2) %j2};
*   &outp @WIRE(mode="straight") {%j2 #XMD2A:1};
*   &outn @WIRE(mode="straight") {%port5:p (14, -2) %j3};
*   &outn @WIRE(mode="straight") {%j3 #XMD2B:1};
*   &net2 @WIRE(mode="straight") {#XMD2A:3 #XMD1A:1};
*   &net5 @WIRE(mode="straight") {#XMD2B:3 #XMD1B:1};
*   &net3 @WIRE(mode="straight") {#XMD2A:2 %j1};
*   &net3 @WIRE(mode="straight") {%j1 #XMD2B:2};
*   &net3 @WIRE(mode="straight") {#Rc:2 %j1};
*   &net1 @WIRE(mode="straight") {#Rc:1 #LBWc:2};
*   &VB @WIRE(mode="straight") {#LBWc:1 %port1:p};
*   &outp @WIRE(mode="straight") {#Cf1:1 (-4, -6) %j2};
*   &net0 @WIRE(mode="straight") {#Cf1:2 #Rf1:1};
*   &inp @WIRE(mode="straight") {%port2:p #Rf1:2};
*   &inp @WIRE(mode="straight") {#Rf1:2 #XMD1A:2};
*   &outn @WIRE(mode="straight") {#Cf2:1 (18, -6) %j3};
*   &net4 @WIRE(mode="straight") {#Cf2:2 #Rf2:1};
*   &inn @WIRE(mode="straight") {%port3:p #Rf2:2};
*   &inn @WIRE(mode="straight") {#Rf2:2 #XMD1B:2};
*   &src @WIRE(mode="straight") {#XMD1A:3 (0, -20) %j4};
*   &src @WIRE(mode="straight") {%j4 %j5};
*   &src @WIRE(mode="straight") {%j5 #XMD1B:3};
*   &src @WIRE(mode="straight") {%j4 #LBWg:1};
*   &src @WIRE(mode="straight") {%port6:p %j5};
*   $JUNCTION @ATTACH (18, -16)(p) => %dot1;
*   $JUNCTION @ATTACH (-4, -16)(p) => %dot2;
*   &VSS @WIRE(mode="straight") {%gnd1:p #LBWg:2};
*   #XMD1A @TEXT("\textbf{\textit{M}}_{\textbf{D1A}}", key="name", dx=0.5, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XMD1A::name(label);
*   #XMD1B @TEXT("\textbf{\textit{M}}_{\textbf{D1B}}", key="name", dx=-0.5, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XMD1B::name(label);
*   #XMD2A @TEXT("\textbf{\textit{M}}_{\textbf{D2A}}", key="name", dx=3.4, dy=-1.8, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XMD2A::name(label);
*   #XMD2B
*       @TEXT("\textbf{\textit{M}}_{\textbf{D2B}}", key="name", dx=-2.2, dy=-3.5, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XMD2B::name(label);
*   #Rc @TEXT("\textbf{\textit{R}}_{\textbf{c}}", key="name", dx=0.9, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #Rc::name(label);
*   #LBWc @TEXT("\textbf{\textit{L}}_{\textbf{BWc}}", key="name", dx=1.2, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #LBWc::name(label);
*   #Cf1 @TEXT("\textbf{\textit{C}}_{\textbf{f1}}", key="name", dx=-1.2, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #Cf1::name(label);
*   #Rf1 @TEXT("\textbf{\textit{R}}_{\textbf{f1}}", key="name", dx=-0.9, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #Rf1::name(label);
*   #Cf2 @TEXT("\textbf{\textit{C}}_{\textbf{f2}}", key="name", dx=1.2, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #Cf2::name(label);
*   #Rf2 @TEXT("\textbf{\textit{R}}_{\textbf{f2}}", key="name", dx=0.9, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #Rf2::name(label);
*   #LBWg @TEXT("\textbf{\textit{L}}_{\textbf{BWg}}", key="name", dx=1.2, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #LBWg::name(label);
*   %port1 @TEXT("\textbf{\textit{V}}_{\textbf{B}}", key="name", dx=0, dy=1.9, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port1::name(label);
*   %port2 @TEXT("\textbf{\textit{inp}}", key="name", dx=-2, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port2::name(label);
*   %port3 @TEXT("\textbf{\textit{inn}}", key="name", dx=2, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port3::name(label);
*   %port4 @TEXT("\textbf{\textit{outp}}", key="name", dx=-2, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port4::name(label);
*   %port5 @TEXT("\textbf{\textit{outn}}", key="name", dx=2, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port5::name(label);
*   %port6 @TEXT("\textbf{\textit{src}}", key="name", dx=2, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port6::name(label)
* }
.ends DA

.subckt dut VDD VSS RFIN RFOUT V_bias VB_DA VB_PA VB_PA2
C1 net9 net8 1p
Cblk1 net13 net10 1p
Cblk2 net24 net22 1p
Cblk3 net9 net14 1p
Cblk4 net8 net19 1p
Cblk5 net6 net9 1p
Cblk6 net0 net8 1p
Cbyp1 net11 net21 1p
Cbyp2 net7 net18 1p
CIN1 net16 net23 1p
CIN2 net13 net24 1p
Cout1a net20 net25 1p
Cout1b net4 net2 1p
Cout2 net3 net12 1p
Lb1 net16 net5 1n
Lb2 net5 net23 1n
Lb3 net13 VSS 1n
Lb4 VSS net24 1n
LBW1 RFIN net16 1n
LBW2 VSS net23 1n
LBW3 net1 V_bias 1n
LBW4 net21 VDD 1n
LBW5 V_bias net15 1n
LBW6 net17 V_bias 1n
LBW7 net12 RFOUT 1n
LBW8 net3 VSS 1n
Lp1a net20 net18 1n
Lp1b net18 net25 1n
Lp2 net4 net2 1n
Ls net12 net3 1n
R1 net1 net10 1k
R2 net1 net22 1k
R3 net14 net15 1k
R4 net19 net15 1k
R5 net6 net17 1k
R6 net0 net17 1k
X1 VSS VB_DA net10 net22 net9 net8 net11 DA
X2 VDD VSS VB_PA net14 net19 net20 net25 net7 PA
X3 VDD VSS VB_PA2 net6 net0 net4 net2 NC0001 PA
XL1 net9 net8 net21 ct_inductor l1=1n l2=1n k=0
KTF1 Lb1 Lb3 1
KTF2 Lb2 Lb4 1
KTF3 Lp1a Ls 1
KTF4 Lp1b Ls 1
KTF5 Lp2 Ls 1
* @RNL(author="analog-canvas") {
*   %dut_SYMBOL = @DEFINE-SYMBOL(box=[-8, -8, 8, 8]) {
*     (-8, 0) @PIN(terminal="RFIN", label="\textbf{\textit{RFIN}}", direction="left");
*     (8, -5) @PIN(terminal="RFOUT", label="\textbf{\textit{RFOUT}}", direction="right");
*     (8, 3) @PIN(terminal="V_bias", label="\textbf{\textit{V}}_{\textbf{\textit{bias}}}", direction="right");
*     (8, 1) @PIN(terminal="VB_DA", label="\textbf{\textit{VB}}_{\textbf{\textit{DA}}}", direction="right");
*     (-8, -2) @PIN(terminal="VB_PA", label="\textbf{\textit{VB}}_{\textbf{\textit{PA}}}", direction="left");
*     (8, -3) @PIN(terminal="VB_PA2", label="\textbf{\textit{VB}}_{\textbf{\textit{PA2}}}", direction="right");
*     (8, -1) @PIN(terminal="VDD", label="\textbf{\textit{V}}_{\textbf{DD}}", direction="right");
*     (0, 0) @RECTANGLE(width=14, height=14);
*     @LINE {(-8, 0) (-7, 0)};
*     @LINE {(8, -5) (7, -5)};
*     @LINE {(8, 3) (7, 3)};
*     @LINE {(8, 1) (7, 1)};
*     @LINE {(-8, -2) (-7, -2)};
*     @LINE {(8, -3) (7, -3)};
*     @LINE {(8, -1) (7, -1)}
*   };
*   # @SET-SYMBOL %dut_SYMBOL;
*   $CANVAS_TYPESETTING @ATTACH(subscript_italic=false) #(level);
*   #X1 @PLACE(40, -5) => @ORIENT("R0");
*   #X2 @PLACE(15, -29) => @ORIENT("R0");
*   #X3 @PLACE(52, -29) => @ORIENT("MY");
*   #LBW1 @SET-SYMBOL $INDUCTOR => @PLACE(2, 1) => @ORIENT("R90");
*   #CIN1 @SET-SYMBOL $CAPACITOR => @PLACE(6, -5) => @ORIENT("R0");
*   #Lb1 @SET-SYMBOL $INDUCTOR => @PLACE(10, -2) => @ORIENT("R0");
*   #Lb2 @SET-SYMBOL $INDUCTOR => @PLACE(10, -9) => @ORIENT("R0");
*   #LBW2 @SET-SYMBOL $INDUCTOR => @PLACE(2, -12) => @ORIENT("R90");
*   #Lb3 @SET-SYMBOL $INDUCTOR => @PLACE(14, -2) => @ORIENT("R0");
*   #Lb4 @SET-SYMBOL $INDUCTOR => @PLACE(14, -9) => @ORIENT("R0");
*   #CIN2 @SET-SYMBOL $CAPACITOR => @PLACE(20, -5) => @ORIENT("R0");
*   #Cblk1 @SET-SYMBOL $CAPACITOR => @PLACE(23, 1) => @ORIENT("R90");
*   #Cblk2 @SET-SYMBOL $CAPACITOR => @PLACE(23, -12) => @ORIENT("R90");
*   #R1 @SET-SYMBOL $RESISTOR => @PLACE(27, 4) => @ORIENT("R0");
*   #R2 @SET-SYMBOL $RESISTOR => @PLACE(30, 4) => @ORIENT("R0");
*   #LBW3 @SET-SYMBOL $INDUCTOR => @PLACE(33, 7) => @ORIENT("R90");
*   #C1 @SET-SYMBOL $VARIABLE_CAPACITOR => @PLACE(48, -5) => @ORIENT("R0");
*   #XL1 @SET-SYMBOL $CENTER_TAP_INDUCTOR => @PLACE(52, -5) => @ORIENT("MYR90");
*   #LBW4 @SET-SYMBOL $INDUCTOR => @PLACE(58, -5) => @ORIENT("R90");
*   #Cbyp1 @SET-SYMBOL $CAPACITOR => @PLACE(45, -14) => @ORIENT("R90");
*   #Cblk3 @SET-SYMBOL $CAPACITOR => @PLACE(2, -27) => @ORIENT("R90");
*   #Cblk4 @SET-SYMBOL $CAPACITOR => @PLACE(2, -31) => @ORIENT("R90");
*   #R3 @SET-SYMBOL $RESISTOR => @PLACE(5, -35) => @ORIENT("R0");
*   #R4 @SET-SYMBOL $RESISTOR => @PLACE(7, -35) => @ORIENT("R0");
*   #LBW5 @SET-SYMBOL $INDUCTOR => @PLACE(1, -38) => @ORIENT("R90");
*   #Cout1a @SET-SYMBOL $VARIABLE_CAPACITOR => @PLACE(23, -29) => @ORIENT("R0");
*   #Lp1a @SET-SYMBOL $INDUCTOR => @PLACE(27, -26) => @ORIENT("R0");
*   #Lp1b @SET-SYMBOL $INDUCTOR => @PLACE(27, -32) => @ORIENT("R0");
*   #Cbyp2 @SET-SYMBOL $CAPACITOR => @PLACE(21, -38) => @ORIENT("R90");
*   #Ls @SET-SYMBOL $INDUCTOR => @PLACE(31, -29) => @ORIENT("R0");
*   #Cout2 @SET-SYMBOL $CAPACITOR => @PLACE(34, -29) => @ORIENT("R0");
*   #LBW8 @SET-SYMBOL $INDUCTOR => @PLACE(37, -29) => @ORIENT("R0");
*   #LBW7 @SET-SYMBOL $INDUCTOR => @PLACE(31, -35) => @ORIENT("R0");
*   #Lp2 @SET-SYMBOL $INDUCTOR => @PLACE(40, -29) => @ORIENT("R0");
*   #Cout1b @SET-SYMBOL $VARIABLE_CAPACITOR => @PLACE(44, -29) => @ORIENT("R0");
*   #Cblk5 @SET-SYMBOL $CAPACITOR => @PLACE(65, -27) => @ORIENT("R90");
*   #Cblk6 @SET-SYMBOL $CAPACITOR => @PLACE(65, -31) => @ORIENT("R90");
*   #R5 @SET-SYMBOL $RESISTOR => @PLACE(62, -35) => @ORIENT("R0");
*   #R6 @SET-SYMBOL $RESISTOR => @PLACE(60, -35) => @ORIENT("R0");
*   #LBW6 @SET-SYMBOL $INDUCTOR => @PLACE(66, -38) => @ORIENT("R90");
*   $IO_PORT @ATTACH &RFIN(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(-3, 1) => @ORIENT("R0") => %port1;
*   $IO_PORT @ATTACH &RFOUT(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(72, -41) => @ORIENT("MY") => %port2;
*   $IO_PORT @ATTACH &V_bias(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(37, 7) => @ORIENT("MY") => %port3;
*   $IO_PORT @ATTACH &V_bias(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(-5, -38) => @ORIENT("R0") => %port4;
*   $IO_PORT @ATTACH &V_bias(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(72, -38) => @ORIENT("MY") => %port5;
*   $IO_PORT @ATTACH &VB_DA(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(45, 4) => @ORIENT("MY") => %port6;
*   $IO_PORT @ATTACH &VB_PA(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(20, -21) => @ORIENT("MY") => %port7;
*   $IO_PORT @ATTACH &VB_PA2(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(47, -21) => @ORIENT("R0") => %port8;
*   $SUPPLY @ATTACH &VDD(p) => @SET-SYMBOL $SUPPLY_SYMBOL => @PLACE(60, -5) => @ORIENT("R270") => %vdd1;
*   $SUPPLY @ATTACH &VDD(p) => @SET-SYMBOL $SUPPLY_SYMBOL => @PLACE(13, -22) => @ORIENT("R0") => %vdd2;
*   $SUPPLY @ATTACH &VDD(p) => @SET-SYMBOL $SUPPLY_SYMBOL => @PLACE(54, -22) => @ORIENT("R0") => %vdd3;
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(0, -12) => @ORIENT("R0") => %gnd1;
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(15, -5) => @ORIENT("R90") => %gnd2;
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(37, -31) => @ORIENT("R0") => %gnd3;
*   &VDD @REMOVE-FROM $PORT_FILL_SET;
*   &VSS @REMOVE-FROM $PORT_FILL_SET;
*   $NO_CONNECT @ATTACH #X3:8(t);
*   %j1 = (6, 1);
*   $JUNCTION @ATTACH %j1;
*   %j2 = (6, -12);
*   $JUNCTION @ATTACH %j2;
*   %j3 = (14, -5);
*   $JUNCTION @ATTACH %j3;
*   %j4 = (20, 1);
*   $JUNCTION @ATTACH %j4;
*   %j5 = (20, -12);
*   $JUNCTION @ATTACH %j5;
*   %j6 = (27, 1);
*   $JUNCTION @ATTACH %j6;
*   %j7 = (30, -12);
*   $JUNCTION @ATTACH %j7;
*   %j8 = (30, 7);
*   $JUNCTION @ATTACH %j8;
*   %j9 = (55, -5);
*   $JUNCTION @ATTACH %j9;
*   %j10 = (52, 1);
*   $JUNCTION @ATTACH %j10;
*   %j11 = (52, -11);
*   $JUNCTION @ATTACH %j11;
*   %j12 = (65, -16);
*   $JUNCTION @ATTACH %j12;
*   %j13 = (67, -18);
*   $JUNCTION @ATTACH %j13;
*   %j14 = (5, -27);
*   $JUNCTION @ATTACH %j14;
*   %j15 = (7, -31);
*   $JUNCTION @ATTACH %j15;
*   %j16 = (5, -38);
*   $JUNCTION @ATTACH %j16;
*   %j17 = (27, -29);
*   $JUNCTION @ATTACH %j17;
*   %j18 = (34, -26);
*   $JUNCTION @ATTACH %j18;
*   %j19 = (31, -32);
*   $JUNCTION @ATTACH %j19;
*   %j20 = (62, -27);
*   $JUNCTION @ATTACH %j20;
*   %j21 = (60, -31);
*   $JUNCTION @ATTACH %j21;
*   %j22 = (62, -38);
*   $JUNCTION @ATTACH %j22;
*   &RFIN @WIRE(mode="straight") {#LBW1:1 %port1:p};
*   &net16 @WIRE(mode="straight") {#LBW1:2 %j1};
*   &net16 @WIRE(mode="straight") {%j1 (10, 1) #Lb1:1};
*   &net16 @WIRE(mode="straight") {#CIN1:1 %j1};
*   &net5 @WIRE(mode="straight") {#Lb1:2 #Lb2:1};
*   &net23 @WIRE(mode="straight") {#Lb2:2 (10, -12) %j2};
*   &net23 @WIRE(mode="straight") {%j2 #CIN1:2};
*   &net23 @WIRE(mode="straight") {#LBW2:2 %j2};
*   &VSS @WIRE(mode="straight") {#Lb3:2 %j3};
*   &VSS @WIRE(mode="straight") {%j3 #Lb4:1};
*   &VSS @WIRE(mode="straight") {%j3 %gnd2:p};
*   &net13 @WIRE(mode="straight") {#Lb3:1 (14, 1) %j4};
*   &net13 @WIRE(mode="straight") {%j4 #Cblk1:1};
*   &net13 @WIRE(mode="straight") {#CIN2:1 %j4};
*   &net24 @WIRE(mode="straight") {#Lb4:2 (14, -12) %j5};
*   &net24 @WIRE(mode="straight") {%j5 #Cblk2:1};
*   &net24 @WIRE(mode="straight") {#CIN2:2 %j5};
*   &net10 @WIRE(mode="straight") {#Cblk1:2 %j6};
*   &net10 @WIRE(mode="straight") {%j6 (32, 1) (32, -3) #X1:3};
*   &net22 @WIRE(mode="straight") {#Cblk2:2 %j7};
*   &net22 @WIRE(mode="straight") {%j7 (32, -12) (32, -7) #X1:4};
*   &net10 @WIRE(mode="straight") {#R1:2 %j6};
*   &net22 @WIRE(mode="straight") {#R2:2 %j7};
*   &net1 @WIRE(mode="straight") {#R1:1 (27, 7) %j8};
*   &net1 @WIRE(mode="straight") {%j8 #R2:1};
*   &net1 @WIRE(mode="straight") {#LBW3:1 %j8};
*   &V_bias @WIRE(mode="straight") {#LBW3:2 %port3:p};
*   &VB_DA @WIRE(mode="straight") {#X1:2 (40, 4) %port6:p};
*   &net9 @WIRE(mode="straight") {#X1:5 #C1:1};
*   &net8 @WIRE(mode="straight") {#X1:6 #C1:2};
*   &net9 @WIRE(mode="straight") {#C1:1 (48, 1) %j10};
*   &net9 @WIRE(mode="straight") {%j10 #XL1:1};
*   &net8 @WIRE(mode="straight") {#C1:2 (48, -11) %j11};
*   &net8 @WIRE(mode="straight") {%j11 #XL1:2};
*   &net21 @WIRE(mode="straight") {#XL1:3 %j9};
*   &net21 @WIRE(mode="straight") {%j9 #LBW4:1};
*   &net11 @WIRE(mode="straight") {#X1:7 (40, -14) #Cbyp1:1};
*   &net21 @WIRE(mode="straight") {#Cbyp1:2 (55, -14) %j9};
*   &net9 @WIRE(mode="straight") {#Cblk3:1 (-3, -27) (-3, -16) %j12};
*   &net9 @WIRE(mode="straight") {%j12 (65, 1) %j10};
*   &net8 @WIRE(mode="straight") {#Cblk4:1 (-1, -31) (-1, -18) %j13};
*   &net8 @WIRE(mode="straight") {%j13 (67, -11) %j11};
*   &net9 @WIRE(mode="straight") {#Cblk5:2 (71, -27) (71, -16) %j12};
*   &net8 @WIRE(mode="straight") {#Cblk6:2 (69, -31) (69, -18) %j13};
*   &net14 @WIRE(mode="straight") {#Cblk3:2 %j14};
*   &net14 @WIRE(mode="straight") {%j14 #X2:4};
*   &net19 @WIRE(mode="straight") {#Cblk4:2 %j15};
*   &net19 @WIRE(mode="straight") {%j15 #X2:5};
*   &net14 @WIRE(mode="straight") {#R3:1 %j14};
*   &net19 @WIRE(mode="straight") {#R4:1 %j15};
*   &net15 @WIRE(mode="straight") {#R3:2 %j16};
*   &net15 @WIRE(mode="straight") {%j16 (7, -38) #R4:2};
*   &net15 @WIRE(mode="straight") {#LBW5:2 %j16};
*   &V_bias @WIRE(mode="straight") {%port4:p #LBW5:1};
*   &VB_PA @WIRE(mode="straight") {#X2:3 (17, -21) %port7:p};
*   &net20 @WIRE(mode="straight") {#X2:6 #Cout1a:1};
*   &net25 @WIRE(mode="straight") {#X2:7 #Cout1a:2};
*   &net20 @WIRE(mode="straight") {#Cout1a:1 (23, -23) (27, -23) #Lp1a:1};
*   &net25 @WIRE(mode="straight") {#Cout1a:2 (23, -35) (27, -35) #Lp1b:2};
*   &net18 @WIRE(mode="straight") {#Lp1a:2 %j17};
*   &net18 @WIRE(mode="straight") {%j17 #Lp1b:1};
*   &net7 @WIRE(mode="straight") {#X2:8 (15, -38) #Cbyp2:1};
*   &net18 @WIRE(mode="straight") {#Cbyp2:2 (25, -38) (25, -29) %j17};
*   &net3 @WIRE(mode="straight") {#Ls:1 (31, -26) %j18};
*   &net3 @WIRE(mode="straight") {%j18 #Cout2:1};
*   &net3 @WIRE(mode="straight") {#LBW8:1 (37, -26) %j18};
*   &net12 @WIRE(mode="straight") {#Ls:2 %j19};
*   &net12 @WIRE(mode="straight") {%j19 #LBW7:1};
*   &net12 @WIRE(mode="straight") {#Cout2:2 (34, -32) %j19};
*   &RFOUT @WIRE(mode="straight") {#LBW7:2 (31, -41) %port2:p};
*   &net4 @WIRE(mode="straight") {#X3:6 #Cout1b:1};
*   &net2 @WIRE(mode="straight") {#X3:7 #Cout1b:2};
*   &net4 @WIRE(mode="straight") {#Cout1b:1 (44, -23) (40, -23) #Lp2:1};
*   &net2 @WIRE(mode="straight") {#Cout1b:2 (44, -35) (40, -35) #Lp2:2};
*   &net6 @WIRE(mode="straight") {#Cblk5:1 %j20};
*   &net6 @WIRE(mode="straight") {%j20 #X3:4};
*   &net0 @WIRE(mode="straight") {#Cblk6:1 %j21};
*   &net0 @WIRE(mode="straight") {%j21 #X3:5};
*   &net6 @WIRE(mode="straight") {#R5:1 %j20};
*   &net0 @WIRE(mode="straight") {#R6:1 %j21};
*   &net17 @WIRE(mode="straight") {#R5:2 %j22};
*   &net17 @WIRE(mode="straight") {%j22 (60, -38) #R6:2};
*   &net17 @WIRE(mode="straight") {#LBW6:1 %j22};
*   &V_bias @WIRE(mode="straight") {%port5:p #LBW6:2};
*   &VB_PA2 @WIRE(mode="straight") {#X3:3 (50, -21) %port8:p};
*   &VDD @WIRE(mode="straight") {#X3:1 %vdd3:p};
*   &VDD @WIRE(mode="straight") {#X2:1 %vdd2:p};
*   &VDD @WIRE(mode="straight") {#LBW4:2 %vdd1:p};
*   &VSS @WIRE(mode="straight") {%gnd1:p #LBW2:1};
*   &VSS @WIRE(mode="straight") {%gnd3:p #LBW8:2};
*   $JUNCTION @ATTACH (44, -31)(p) => %dot1;
*   $JUNCTION @ATTACH (44, -27)(p) => %dot2;
*   $JUNCTION @ATTACH (48, -7)(p) => %dot3;
*   $JUNCTION @ATTACH (48, -3)(p) => %dot4;
*   $JUNCTION @ATTACH (23, -27)(p) => %dot5;
*   $JUNCTION @ATTACH (23, -31)(p) => %dot6;
*   #X1 @TEXT("\textbf{DA}", key="value", dx=-1.4, dy=-8.5, halign="middle", valign="baseline", size=1.5116);
*   #X2 @TEXT("\textbf{PA}", key="value", dx=-1.3, dy=-8.5, halign="middle", valign="baseline", size=1.5116);
*   #X3 @TEXT("\textbf{PA}", key="value", dx=0, dy=-8.5, halign="middle", valign="baseline", size=1.5116);
*   #LBW1 @TEXT("\textbf{\textit{L}}_{\textbf{BW1}}", key="name", dx=0, dy=1.7, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #LBW1::name(label);
*   #CIN1 @TEXT("\textbf{\textit{C}}_{\textbf{IN1}}", key="name", dx=1.2, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #CIN1::name(label);
*   #Lb1 @TEXT("\textbf{\textit{L}}_{\textbf{b1}}", key="name", dx=-1.1, dy=-0.1, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #Lb1::name(label);
*   #Lb2 @TEXT("\textbf{\textit{L}}_{\textbf{b2}}", key="name", dx=-1.1, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #Lb2::name(label);
*   #LBW2 @TEXT("\textbf{\textit{L}}_{\textbf{BW2}}", key="name", dx=0, dy=1.7, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #LBW2::name(label);
*   #Lb3 @TEXT("\textbf{\textit{L}}_{\textbf{b3}}", key="name", dx=1.2, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #Lb3::name(label);
*   #Lb4 @TEXT("\textbf{\textit{L}}_{\textbf{b4}}", key="name", dx=1.2, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #Lb4::name(label);
*   #CIN2 @TEXT("\textbf{\textit{C}}_{\textbf{IN2}}", key="name", dx=1.2, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #CIN2::name(label);
*   #Cblk1 @TEXT("\textbf{\textit{C}}_{\textbf{blk1}}", key="name", dx=0, dy=1.7, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #Cblk1::name(label);
*   #Cblk2 @TEXT("\textbf{\textit{C}}_{\textbf{blk2}}", key="name", dx=0, dy=1.7, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #Cblk2::name(label);
*   #R1 @TEXT("\textbf{\textit{R}}_{\textbf{1}}", key="name", dx=-0.9, dy=0.6, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #R1::name(label);
*   #R2 @TEXT("\textbf{\textit{R}}_{\textbf{2}}", key="name", dx=0.9, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #R2::name(label);
*   #LBW3 @TEXT("\textbf{\textit{L}}_{\textbf{BW3}}", key="name", dx=0, dy=1.7, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #LBW3::name(label);
*   #C1 @TEXT("\textbf{\textit{C}}_{\textbf{1}}", key="name", dx=1.6, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #C1::name(label);
*   #XL1 @TEXT("\textbf{\textit{L}}_{\textbf{1}}", key="name", dx=2.8, dy=-4.4, halign="start", valign="baseline", size=1.5116);
*   #LBW4 @TEXT("\textbf{\textit{L}}_{\textbf{BW4}}", key="name", dx=0, dy=1.7, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #LBW4::name(label);
*   #Cbyp1 @TEXT("\textbf{\textit{C}}_{\textbf{byp1}}", key="name", dx=3, dy=1.7, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #Cbyp1::name(label);
*   #Cblk3 @TEXT("\textbf{\textit{C}}_{\textbf{blk3}}", key="name", dx=0, dy=1.7, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #Cblk3::name(label);
*   #Cblk4 @TEXT("\textbf{\textit{C}}_{\textbf{blk4}}", key="name", dx=0, dy=1.7, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #Cblk4::name(label);
*   #R3 @TEXT("\textbf{\textit{R}}_{\textbf{3}}", key="name", dx=-0.9, dy=0.6, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #R3::name(label);
*   #R4 @TEXT("\textbf{\textit{R}}_{\textbf{4}}", key="name", dx=0.9, dy=-2.4, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #R4::name(label);
*   #LBW5 @TEXT("\textbf{\textit{L}}_{\textbf{BW5}}", key="name", dx=0, dy=1.7, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #LBW5::name(label);
*   #Cout1a
*       @TEXT("\textbf{\textit{C}}_{\textbf{out1a}}", key="name", dx=-1.6, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #Cout1a::name(label);
*   #Lp1a @TEXT("\textbf{\textit{L}}_{\textbf{p1a}}", key="name", dx=1.2, dy=1.8, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #Lp1a::name(label);
*   #Lp1b @TEXT("\textbf{\textit{L}}_{\textbf{p1b}}", key="name", dx=1.6, dy=-3.5, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #Lp1b::name(label);
*   #Cbyp2 @TEXT("\textbf{\textit{C}}_{\textbf{byp2}}", key="name", dx=0, dy=-2.3, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #Cbyp2::name(label);
*   #Ls @TEXT("\textbf{\textit{L}}_{\textbf{s}}", key="name", dx=-1.1, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #Ls::name(label);
*   #Cout2 @TEXT("\textbf{\textit{C}}_{\textbf{out2}}", key="name", dx=0, dy=3.7, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #Cout2::name(label);
*   #LBW8 @TEXT("\textbf{\textit{L}}_{\textbf{BW8}}", key="name", dx=0.8, dy=-5.3, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #LBW8::name(label);
*   #LBW7 @TEXT("\textbf{\textit{L}}_{\textbf{BW7}}", key="name", dx=1.2, dy=-1.2, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #LBW7::name(label);
*   #Lp2 @TEXT("\textbf{\textit{L}}_{\textbf{p2}}", key="name", dx=1.4, dy=-3.5, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #Lp2::name(label);
*   #Cout1b
*       @TEXT("\textbf{\textit{C}}_{\textbf{out1b}}", key="name", dx=1.6, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #Cout1b::name(label);
*   #Cblk5 @TEXT("\textbf{\textit{C}}_{\textbf{blk5}}", key="name", dx=0, dy=1.7, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #Cblk5::name(label);
*   #Cblk6 @TEXT("\textbf{\textit{C}}_{\textbf{blk6}}", key="name", dx=0, dy=1.7, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #Cblk6::name(label);
*   #R5 @TEXT("\textbf{\textit{R}}_{\textbf{5}}", key="name", dx=0.9, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #R5::name(label);
*   #R6 @TEXT("\textbf{\textit{R}}_{\textbf{6}}", key="name", dx=-0.9, dy=-2.4, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #R6::name(label);
*   #LBW6 @TEXT("\textbf{\textit{L}}_{\textbf{BW6}}", key="name", dx=2.4, dy=1.6, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #LBW6::name(label);
*   %port1 @TEXT("\textbf{\textit{RFIN}}", key="name", dx=-2, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port1::name(label);
*   %port2 @TEXT("\textbf{\textit{RFOUT}}", key="name", dx=2, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port2::name(label);
*   %port3 @TEXT("\textbf{\textit{V}}_{\textbf{bias}}", key="name", dx=2, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port3::name(label);
*   %port4 @TEXT("\textbf{\textit{V}}_{\textbf{bias}}", key="name", dx=-2, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port4::name(label);
*   %port5 @TEXT("\textbf{\textit{V}}_{\textbf{bias}}", key="name", dx=2, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port5::name(label);
*   %port6 @TEXT("\textbf{\textit{VB}}_{\textbf{DA}}", key="name", dx=2, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port6::name(label);
*   %port7 @TEXT("\textbf{\textit{VB}}_{\textbf{PA}}", key="name", dx=0.5, dy=1.2, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port7::name(label);
*   %port8 @TEXT("\textbf{\textit{VB}}_{\textbf{PA2}}", key="name", dx=-2, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port8::name(label);
*   %vdd1 @TEXT("\textbf{\textit{V}}_{\textbf{DD}}", dx=3, dy=0, size=1.5116) => %power1;
*   $CANVAS_LABEL @ATTACH(bind="port") %power1(label);
*   %vdd2 @TEXT("\textbf{\textit{V}}_{\textbf{DD}}", dx=-0.8, dy=1.5, halign="end", size=1.5116) => %power2;
*   $CANVAS_LABEL @ATTACH(bind="port") %power2(label);
*   %vdd3 @TEXT("\textbf{\textit{V}}_{\textbf{DD}}", dx=2, dy=1, size=1.5116) => %power3;
*   $CANVAS_LABEL @ATTACH(bind="port") %power3(label)
* }
.ends dut
