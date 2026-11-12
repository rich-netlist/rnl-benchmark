
* @RNL(type="header") {
*   @VERSION("0.3");
*   @USE-PACKAGE(name="rnl-std", version="0.3");
*   @USE-PACKAGE(name="rnl-std-no-labels", version="0.3");
*   @USE-PACKAGE(name="analog-canvas-extensions", version="0.6")
* }
.subckt dut VDD VSS IB1
XM10 net3 net7 net9 VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM11 net7 net7 net2 VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM12 IB1 net7 net1 VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM3 net0 net0 net4 VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM4 net8 net0 net5 VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM5 net9 net2 VDD VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM6 net2 net2 VDD VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM7 net1 net2 VDD VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM8 net3 net3 net0 VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM9 net7 net3 net8 VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XQ1 VSS VSS net4 sky130_fd_pr__pnp_05v5_W0p68L0p68 m=1
XQ2 VSS VSS net6 sky130_fd_pr__pnp_05v5_W0p68L0p68 m=1
R net5 net6 1k
* @RNL(author="analog-canvas") {
*   %dut_SYMBOL = @DEFINE-SYMBOL(box=[-5, -4, 5, 4]) {
*     (5, -1) @PIN(terminal="IB1", label="\textbf{\textit{I}}_{\textbf{B1}}", direction="right");
*     (0, 4) @PIN(terminal="VDD", label="\textbf{\textit{V}}_{\textbf{DD}}", direction="up");
*     (0, 0) @RECTANGLE(width=8, height=6);
*     @LINE {(5, -1) (4, -1)};
*     @LINE {(0, 4) (0, 3)}
*   };
*   # @SET-SYMBOL %dut_SYMBOL;
*   $CANVAS_TYPESETTING @ATTACH(subscript_italic=false) #(level);
*   #XM5 @SET-SYMBOL $PMOS => @PLACE(8, -8) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M5") #XM5(part);
*   #XM6 @SET-SYMBOL $PMOS => @PLACE(20, -8) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M6") #XM6(part);
*   #XM7 @SET-SYMBOL $PMOS => @PLACE(30, -8) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M7") #XM7(part);
*   #XM10 @SET-SYMBOL $PMOS => @PLACE(8, -15) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M10") #XM10(part);
*   #XM11 @SET-SYMBOL $PMOS => @PLACE(20, -15) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M11") #XM11(part);
*   #XM12 @SET-SYMBOL $PMOS => @PLACE(30, -15) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M12") #XM12(part);
*   #XM8 @SET-SYMBOL $NMOS => @PLACE(8, -23) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M8") #XM8(part);
*   #XM9 @SET-SYMBOL $NMOS => @PLACE(20, -23) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M9") #XM9(part);
*   #XM3 @SET-SYMBOL $NMOS => @PLACE(8, -30) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M3") #XM3(part);
*   #XM4 @SET-SYMBOL $NMOS => @PLACE(20, -30) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M4") #XM4(part);
*   #R @SET-SYMBOL $RESISTOR => @PLACE(20, -36) => @ORIENT("R0");
*   #XQ1 @SET-SYMBOL $PNP => @PLACE(8, -42) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="Q1") #XQ1(part);
*   #XQ2 @SET-SYMBOL $PNP => @PLACE(20, -42) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="Q2") #XQ2(part);
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(14, -49) => @ORIENT("R0") => %gnd1;
*   $IO_PORT @ATTACH &IB1(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(30, -22) => @ORIENT("R90") => %port1;
*   &VDD @REMOVE-FROM $PORT_FILL_SET;
*   &VSS @REMOVE-FROM $PORT_FILL_SET;
*   %j1 = (14, -8);
*   $JUNCTION @ATTACH %j1;
*   %j2 = (20, -12);
*   $JUNCTION @ATTACH %j2;
*   %j3 = (14, -15);
*   $JUNCTION @ATTACH %j3;
*   %j4 = (20, -19);
*   $JUNCTION @ATTACH %j4;
*   %j5 = (8, -19);
*   $JUNCTION @ATTACH %j5;
*   %j6 = (13, -23);
*   $JUNCTION @ATTACH %j6;
*   %j7 = (8, -27);
*   $JUNCTION @ATTACH %j7;
*   %j8 = (13, -30);
*   $JUNCTION @ATTACH %j8;
*   %j9 = (8, -47);
*   $JUNCTION @ATTACH %j9;
*   %j10 = (20, -47);
*   $JUNCTION @ATTACH %j10;
*   %j11 = (14, -47);
*   $JUNCTION @ATTACH %j11;
*   %j12 = (8, -3);
*   $JUNCTION @ATTACH %j12;
*   %j13 = (20, -3);
*   $JUNCTION @ATTACH %j13;
*   %j14 = (30, -3);
*   $JUNCTION @ATTACH %j14;
*   %j15 = (5, -3);
*   %j16 = (33, -3);
*   &VDD @WIRE(mode="straight") {%j12 #XM5:3};
*   &VDD @WIRE(mode="straight") {%j13 #XM6:3};
*   &VDD @WIRE(mode="straight") {%j14 #XM7:3};
*   &net9 @WIRE(mode="straight") {#XM5:1 #XM10:3};
*   &net2 @WIRE(mode="straight") {#XM6:1 %j2};
*   &net2 @WIRE(mode="straight") {%j2 #XM11:3};
*   &net1 @WIRE(mode="straight") {#XM7:1 #XM12:3};
*   &net3 @WIRE(mode="straight") {#XM10:1 %j5};
*   &net3 @WIRE(mode="straight") {%j5 #XM8:1};
*   &net7 @WIRE(mode="straight") {#XM11:1 %j4};
*   &net7 @WIRE(mode="straight") {%j4 #XM9:1};
*   &net0 @WIRE(mode="straight") {#XM8:3 %j7};
*   &net0 @WIRE(mode="straight") {%j7 #XM3:1};
*   &net8 @WIRE(mode="straight") {#XM9:3 #XM4:1};
*   &net2 @WIRE(mode="straight") {#XM5:2 %j1};
*   &net2 @WIRE(mode="straight") {%j1 #XM6:2};
*   &net7 @WIRE(mode="straight") {#XM10:2 %j3};
*   &net7 @WIRE(mode="straight") {%j3 #XM11:2};
*   &net3 @WIRE(mode="straight") {#XM8:2 %j6};
*   &net3 @WIRE(mode="straight") {%j6 #XM9:2};
*   &net0 @WIRE(mode="straight") {#XM3:2 %j8};
*   &net0 @WIRE(mode="straight") {%j8 #XM4:2};
*   &net2 @WIRE(mode="straight") {%j1 (14, -12) %j2};
*   &net2 @WIRE(mode="straight") {#XM7:2 (26, -8) (26, -12) %j2};
*   &net7 @WIRE(mode="straight") {%j3 (14, -19) %j4};
*   &net7 @WIRE(mode="straight") {#XM12:2 (26, -15) (26, -19) %j4};
*   &net3 @WIRE(mode="straight") {%j5 (13, -19) %j6};
*   &net0 @WIRE(mode="straight") {%j7 (13, -27) %j8};
*   &net5 @WIRE(mode="straight") {#XM4:3 #R:1};
*   &net6 @WIRE(mode="straight") {#R:2 #XQ2:3};
*   &net4 @WIRE(mode="straight") {#XM3:3 #XQ1:3};
*   &VSS @WIRE(mode="straight") {#XQ1:1 %j9};
*   &VSS @WIRE(mode="straight") {%j9 %j11};
*   &VSS @WIRE(mode="straight") {%j11 %j10};
*   &VSS @WIRE(mode="straight") {%j10 #XQ2:1};
*   &VSS @WIRE(mode="straight") {#XQ1:2 (3, -42) (3, -47) %j9};
*   &VSS @WIRE(mode="straight") {#XQ2:2 (25, -42) (25, -47) %j10};
*   &VSS @WIRE(mode="straight") {%gnd1:p %j11};
*   &IB1 @WIRE(mode="straight") {%port1:p #XM12:1};
*   &VDD @WIRE(mode="straight", linestyle="bold") {%j15 %j12};
*   &VDD @WIRE(mode="straight", linestyle="bold") {%j12 %j13};
*   &VDD @WIRE(mode="straight", linestyle="bold") {%j13 %j14};
*   &VDD @WIRE(mode="straight", linestyle="bold") {%j14 %j16};
*   #XM5 @TEXT("\textbf{\textit{M}}_{\textbf{5}}", key="name", dx=-0.4, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM5::name(label);
*   #XM6 @TEXT("\textbf{\textit{M}}_{\textbf{6}}", key="name", dx=0.4, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM6::name(label);
*   #XM7 @TEXT("\textbf{\textit{M}}_{\textbf{7}}", key="name", dx=0.4, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM7::name(label);
*   #XM10 @TEXT("\textbf{\textit{M}}_{\textbf{10}}", key="name", dx=-0.4, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM10::name(label);
*   #XM11 @TEXT("\textbf{\textit{M}}_{\textbf{11}}", key="name", dx=0.4, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM11::name(label);
*   #XM12 @TEXT("\textbf{\textit{M}}_{\textbf{12}}", key="name", dx=0.4, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM12::name(label);
*   #XM8 @TEXT("\textbf{\textit{M}}_{\textbf{8}}", key="name", dx=-0.5, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM8::name(label);
*   #XM9 @TEXT("\textbf{\textit{M}}_{\textbf{9}}", key="name", dx=0.5, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM9::name(label);
*   #XM3 @TEXT("\textbf{\textit{M}}_{\textbf{3}}", key="name", dx=-0.5, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM3::name(label);
*   #XM4 @TEXT("\textbf{\textit{M}}_{\textbf{4}}", key="name", dx=0.5, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM4::name(label);
*   #R @TEXT("\textbf{\textit{R}}", key="name", dx=0.9, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #R::name(label);
*   #XQ1 @TEXT("\textbf{\textit{Q}}_{\textbf{1}}", key="name", dx=0.4, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XQ1::name(label);
*   #XQ2 @TEXT("\textbf{\textit{Q}}_{\textbf{2}}", key="name", dx=-0.4, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XQ2::name(label);
*   %port1 @TEXT("\textbf{\textit{I}}_{\textbf{B1}}", key="name", dx=0, dy=-2.5, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port1::name(label);
*   &VDD @TEXT("\textbf{\textit{V}}_{\textbf{DD}}", size=1.5116) => @PLACE(18, -1.5) => %power1;
*   $CANVAS_LABEL @ATTACH(bind="port") %power1(label)
* }
.ends dut
