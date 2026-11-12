
* @RNL(type="header") {
*   @VERSION("0.3");
*   @USE-PACKAGE(name="rnl-std", version="0.3");
*   @USE-PACKAGE(name="rnl-std-no-labels", version="0.3");
*   @USE-PACKAGE(name="analog-canvas-extensions", version="0.6")
* }
.global VDD

.subckt PMOS_16_Series_Stack_MP2 S D G
XMP2_0 D G net0 S sky130_fd_pr__pfet_g5v0d10v5 l=1 w=2 nf=1 m=2 ad=0.6 as=0.6 pd=4.6 ps=4.6
XMP2_1 net0 G net7 S sky130_fd_pr__pfet_g5v0d10v5 l=1 w=2 nf=1 m=2 ad=0.6 as=0.6 pd=4.6 ps=4.6
XMP2_10 net1 G net2 S sky130_fd_pr__pfet_g5v0d10v5 l=1 w=2 nf=1 m=2 ad=0.6 as=0.6 pd=4.6 ps=4.6
XMP2_11 net2 G net3 S sky130_fd_pr__pfet_g5v0d10v5 l=1 w=2 nf=1 m=2 ad=0.6 as=0.6 pd=4.6 ps=4.6
XMP2_12 net3 G net4 S sky130_fd_pr__pfet_g5v0d10v5 l=1 w=2 nf=1 m=2 ad=0.6 as=0.6 pd=4.6 ps=4.6
XMP2_13 net4 G net5 S sky130_fd_pr__pfet_g5v0d10v5 l=1 w=2 nf=1 m=2 ad=0.6 as=0.6 pd=4.6 ps=4.6
XMP2_14 net5 G net6 S sky130_fd_pr__pfet_g5v0d10v5 l=1 w=2 nf=1 m=2 ad=0.6 as=0.6 pd=4.6 ps=4.6
XMP2_15 net6 G S S sky130_fd_pr__pfet_g5v0d10v5 l=1 w=2 nf=1 m=2 ad=0.6 as=0.6 pd=4.6 ps=4.6
XMP2_2 net7 G net8 S sky130_fd_pr__pfet_g5v0d10v5 l=1 w=2 nf=1 m=2 ad=0.6 as=0.6 pd=4.6 ps=4.6
XMP2_3 net8 G net9 S sky130_fd_pr__pfet_g5v0d10v5 l=1 w=2 nf=1 m=2 ad=0.6 as=0.6 pd=4.6 ps=4.6
XMP2_4 net9 G net10 S sky130_fd_pr__pfet_g5v0d10v5 l=1 w=2 nf=1 m=2 ad=0.6 as=0.6 pd=4.6 ps=4.6
XMP2_5 net10 G net11 S sky130_fd_pr__pfet_g5v0d10v5 l=1 w=2 nf=1 m=2 ad=0.6 as=0.6 pd=4.6 ps=4.6
XMP2_6 net11 G net12 S sky130_fd_pr__pfet_g5v0d10v5 l=1 w=2 nf=1 m=2 ad=0.6 as=0.6 pd=4.6 ps=4.6
XMP2_7 net12 G net13 S sky130_fd_pr__pfet_g5v0d10v5 l=1 w=2 nf=1 m=2 ad=0.6 as=0.6 pd=4.6 ps=4.6
XMP2_8 net13 G net14 S sky130_fd_pr__pfet_g5v0d10v5 l=1 w=2 nf=1 m=2 ad=0.6 as=0.6 pd=4.6 ps=4.6
XMP2_9 net14 G net1 S sky130_fd_pr__pfet_g5v0d10v5 l=1 w=2 nf=1 m=2 ad=0.6 as=0.6 pd=4.6 ps=4.6
* @RNL(author="analog-canvas") {
*   %PMOS_16_Series_Stack_MP2_SYMBOL = @DEFINE-SYMBOL(box=[-4.2, -6.2, 3.4, 6.2]) {
*     (1, -6) @PIN(terminal="D", direction="down");
*     (-4, 0) @PIN(terminal="G", direction="left");
*     (1, 6) @PIN(terminal="S", direction="up");
*     @LINE {(-0.424419, 2.302326) (1, 2.302326) (1, 1)};
*     (-1.034884, 3) @RECTANGLE(width=0.290698, height=1.918605, fill="linecolor", linestyle="none");
*     (-0.511628, 3) @RECTANGLE(width=0.290698, height=2.5, fill="linecolor", linestyle="none");
*     @LINE {(-0.889535, 3) (-2, 3)};
*     @LINE {(0.563954, 3.712209) (1, 3.712209) (1, 5)};
*     @LINE(fill="linecolor", linestyle="none") {(-0.366279, 3.712209) (0.563954, 4.119186) (0.563954, 3.305233)
*         (-0.366279, 3.712209)};
*     @LINE {(-0.424419, -3.697674) (1, -3.697674) (1, -5)};
*     (-1.034884, -3) @RECTANGLE(width=0.290698, height=1.918605, fill="linecolor", linestyle="none");
*     (-0.511628, -3) @RECTANGLE(width=0.290698, height=2.5, fill="linecolor", linestyle="none");
*     @LINE {(-0.889535, -3) (-2, -3)};
*     @LINE {(0.563954, -2.287791) (1, -2.287791) (1, -1)};
*     @LINE(fill="linecolor", linestyle="none") {(-0.366279, -2.287791) (0.563954, -1.880814) (0.563954, -2.694767)
*         (-0.366279, -2.287791)};
*     @LINE {(1, 6) (1, 5)};
*     @LINE {(1, -5) (1, -6)};
*     @LINE {(-4, 0) (-3, 0)};
*     @LINE {(-3, 3) (-3, -3)};
*     @LINE {(-3, 3) (-2, 3)};
*     @LINE {(-3, -3) (-2, -3)};
*     @LINE {(1, 5.5) (3, 5.5)};
*     @LINE {(3, 5.5) (3, -3)};
*     @LINE {(-0.366279, 3) (3, 3)};
*     @LINE {(-0.366279, -3) (3, -3)};
*     (1, 5.5) @CIRCLE(radius=0.3, fill="linecolor", linestyle="none");
*     (3, 3) @CIRCLE(radius=0.3, fill="linecolor", linestyle="none");
*     (-3, 0) @CIRCLE(radius=0.3, fill="linecolor", linestyle="none");
*     (1, 0.5) @CIRCLE(radius=0.125, fill="linecolor", linestyle="none");
*     (1, 0) @CIRCLE(radius=0.125, fill="linecolor", linestyle="none");
*     (1, -0.5) @CIRCLE(radius=0.125, fill="linecolor", linestyle="none")
*   };
*   # @SET-SYMBOL %PMOS_16_Series_Stack_MP2_SYMBOL;
*   $CANVAS_TYPESETTING @ATTACH #(level);
*   #XMP2_15 @SET-SYMBOL $PMOS_4TERM => @PLACE(1, 0) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="MP2_15") #XMP2_15(part);
*   #XMP2_14 @SET-SYMBOL $PMOS_4TERM => @PLACE(1, -6) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="MP2_14") #XMP2_14(part);
*   #XMP2_13 @SET-SYMBOL $PMOS_4TERM => @PLACE(1, -12) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="MP2_13") #XMP2_13(part);
*   #XMP2_12 @SET-SYMBOL $PMOS_4TERM => @PLACE(1, -18) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="MP2_12") #XMP2_12(part);
*   #XMP2_11 @SET-SYMBOL $PMOS_4TERM => @PLACE(1, -24) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="MP2_11") #XMP2_11(part);
*   #XMP2_10 @SET-SYMBOL $PMOS_4TERM => @PLACE(1, -30) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="MP2_10") #XMP2_10(part);
*   #XMP2_9 @SET-SYMBOL $PMOS_4TERM => @PLACE(1, -36) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="MP2_9") #XMP2_9(part);
*   #XMP2_8 @SET-SYMBOL $PMOS_4TERM => @PLACE(1, -42) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="MP2_8") #XMP2_8(part);
*   #XMP2_7 @SET-SYMBOL $PMOS_4TERM => @PLACE(1, -48) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="MP2_7") #XMP2_7(part);
*   #XMP2_6 @SET-SYMBOL $PMOS_4TERM => @PLACE(1, -54) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="MP2_6") #XMP2_6(part);
*   #XMP2_5 @SET-SYMBOL $PMOS_4TERM => @PLACE(1, -60) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="MP2_5") #XMP2_5(part);
*   #XMP2_4 @SET-SYMBOL $PMOS_4TERM => @PLACE(1, -66) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="MP2_4") #XMP2_4(part);
*   #XMP2_3 @SET-SYMBOL $PMOS_4TERM => @PLACE(1, -72) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="MP2_3") #XMP2_3(part);
*   #XMP2_2 @SET-SYMBOL $PMOS_4TERM => @PLACE(1, -78) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="MP2_2") #XMP2_2(part);
*   #XMP2_1 @SET-SYMBOL $PMOS_4TERM => @PLACE(1, -84) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="MP2_1") #XMP2_1(part);
*   #XMP2_0 @SET-SYMBOL $PMOS_4TERM => @PLACE(1, -90) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="MP2_0") #XMP2_0(part);
*   $IO_PORT @ATTACH &S(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(1, 6) => @ORIENT("R270") => %port1;
*   $IO_PORT @ATTACH &D(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(1, -96) => @ORIENT("R270") => %port2;
*   $IO_PORT @ATTACH &G(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(-8, 2) => @ORIENT("R0") => %port3;
*   %j1 = (-4, 0);
*   $JUNCTION @ATTACH %j1;
*   %j2 = (5, 0);
*   $JUNCTION @ATTACH %j2;
*   %j3 = (-4, -6);
*   $JUNCTION @ATTACH %j3;
*   %j4 = (5, -6);
*   $JUNCTION @ATTACH %j4;
*   %j5 = (-4, -12);
*   $JUNCTION @ATTACH %j5;
*   %j6 = (5, -12);
*   $JUNCTION @ATTACH %j6;
*   %j7 = (-4, -18);
*   $JUNCTION @ATTACH %j7;
*   %j8 = (5, -18);
*   $JUNCTION @ATTACH %j8;
*   %j9 = (-4, -24);
*   $JUNCTION @ATTACH %j9;
*   %j10 = (5, -24);
*   $JUNCTION @ATTACH %j10;
*   %j11 = (-4, -30);
*   $JUNCTION @ATTACH %j11;
*   %j12 = (5, -30);
*   $JUNCTION @ATTACH %j12;
*   %j13 = (-4, -36);
*   $JUNCTION @ATTACH %j13;
*   %j14 = (5, -36);
*   $JUNCTION @ATTACH %j14;
*   %j15 = (-4, -42);
*   $JUNCTION @ATTACH %j15;
*   %j16 = (5, -42);
*   $JUNCTION @ATTACH %j16;
*   %j17 = (-4, -48);
*   $JUNCTION @ATTACH %j17;
*   %j18 = (5, -48);
*   $JUNCTION @ATTACH %j18;
*   %j19 = (-4, -54);
*   $JUNCTION @ATTACH %j19;
*   %j20 = (5, -54);
*   $JUNCTION @ATTACH %j20;
*   %j21 = (-4, -60);
*   $JUNCTION @ATTACH %j21;
*   %j22 = (5, -60);
*   $JUNCTION @ATTACH %j22;
*   %j23 = (-4, -66);
*   $JUNCTION @ATTACH %j23;
*   %j24 = (5, -66);
*   $JUNCTION @ATTACH %j24;
*   %j25 = (-4, -72);
*   $JUNCTION @ATTACH %j25;
*   %j26 = (5, -72);
*   $JUNCTION @ATTACH %j26;
*   %j27 = (-4, -78);
*   $JUNCTION @ATTACH %j27;
*   %j28 = (5, -78);
*   $JUNCTION @ATTACH %j28;
*   %j29 = (-4, -84);
*   $JUNCTION @ATTACH %j29;
*   %j30 = (5, -84);
*   $JUNCTION @ATTACH %j30;
*   %j31 = (-4, -90);
*   %j32 = (5, -90);
*   %j33 = (1, 4);
*   $JUNCTION @ATTACH %j33;
*   &G @WIRE(mode="straight") {%j1 #XMP2_15:2};
*   &S @WIRE(mode="straight") {#XMP2_15:4 %j2};
*   &G @WIRE(mode="straight") {%j3 #XMP2_14:2};
*   &G @WIRE(mode="straight") {%j1 %j3};
*   &S @WIRE(mode="straight") {#XMP2_14:4 %j4};
*   &S @WIRE(mode="straight") {%j2 %j4};
*   &net6 @WIRE(mode="straight") {#XMP2_15:1 #XMP2_14:3};
*   &G @WIRE(mode="straight") {%j5 #XMP2_13:2};
*   &G @WIRE(mode="straight") {%j3 %j5};
*   &S @WIRE(mode="straight") {#XMP2_13:4 %j6};
*   &S @WIRE(mode="straight") {%j4 %j6};
*   &net5 @WIRE(mode="straight") {#XMP2_14:1 #XMP2_13:3};
*   &G @WIRE(mode="straight") {%j7 #XMP2_12:2};
*   &G @WIRE(mode="straight") {%j5 %j7};
*   &S @WIRE(mode="straight") {#XMP2_12:4 %j8};
*   &S @WIRE(mode="straight") {%j6 %j8};
*   &net4 @WIRE(mode="straight") {#XMP2_13:1 #XMP2_12:3};
*   &G @WIRE(mode="straight") {%j9 #XMP2_11:2};
*   &G @WIRE(mode="straight") {%j7 %j9};
*   &S @WIRE(mode="straight") {#XMP2_11:4 %j10};
*   &S @WIRE(mode="straight") {%j8 %j10};
*   &net3 @WIRE(mode="straight") {#XMP2_12:1 #XMP2_11:3};
*   &G @WIRE(mode="straight") {%j11 #XMP2_10:2};
*   &G @WIRE(mode="straight") {%j9 %j11};
*   &S @WIRE(mode="straight") {#XMP2_10:4 %j12};
*   &S @WIRE(mode="straight") {%j10 %j12};
*   &net2 @WIRE(mode="straight") {#XMP2_11:1 #XMP2_10:3};
*   &G @WIRE(mode="straight") {%j13 #XMP2_9:2};
*   &G @WIRE(mode="straight") {%j11 %j13};
*   &S @WIRE(mode="straight") {#XMP2_9:4 %j14};
*   &S @WIRE(mode="straight") {%j12 %j14};
*   &net1 @WIRE(mode="straight") {#XMP2_10:1 #XMP2_9:3};
*   &G @WIRE(mode="straight") {%j15 #XMP2_8:2};
*   &G @WIRE(mode="straight") {%j13 %j15};
*   &S @WIRE(mode="straight") {#XMP2_8:4 %j16};
*   &S @WIRE(mode="straight") {%j14 %j16};
*   &net14 @WIRE(mode="straight") {#XMP2_9:1 #XMP2_8:3};
*   &G @WIRE(mode="straight") {%j17 #XMP2_7:2};
*   &G @WIRE(mode="straight") {%j15 %j17};
*   &S @WIRE(mode="straight") {#XMP2_7:4 %j18};
*   &S @WIRE(mode="straight") {%j16 %j18};
*   &net13 @WIRE(mode="straight") {#XMP2_8:1 #XMP2_7:3};
*   &G @WIRE(mode="straight") {%j19 #XMP2_6:2};
*   &G @WIRE(mode="straight") {%j17 %j19};
*   &S @WIRE(mode="straight") {#XMP2_6:4 %j20};
*   &S @WIRE(mode="straight") {%j18 %j20};
*   &net12 @WIRE(mode="straight") {#XMP2_7:1 #XMP2_6:3};
*   &G @WIRE(mode="straight") {%j21 #XMP2_5:2};
*   &G @WIRE(mode="straight") {%j19 %j21};
*   &S @WIRE(mode="straight") {#XMP2_5:4 %j22};
*   &S @WIRE(mode="straight") {%j20 %j22};
*   &net11 @WIRE(mode="straight") {#XMP2_6:1 #XMP2_5:3};
*   &G @WIRE(mode="straight") {%j23 #XMP2_4:2};
*   &G @WIRE(mode="straight") {%j21 %j23};
*   &S @WIRE(mode="straight") {#XMP2_4:4 %j24};
*   &S @WIRE(mode="straight") {%j22 %j24};
*   &net10 @WIRE(mode="straight") {#XMP2_5:1 #XMP2_4:3};
*   &G @WIRE(mode="straight") {%j25 #XMP2_3:2};
*   &G @WIRE(mode="straight") {%j23 %j25};
*   &S @WIRE(mode="straight") {#XMP2_3:4 %j26};
*   &S @WIRE(mode="straight") {%j24 %j26};
*   &net9 @WIRE(mode="straight") {#XMP2_4:1 #XMP2_3:3};
*   &G @WIRE(mode="straight") {%j27 #XMP2_2:2};
*   &G @WIRE(mode="straight") {%j25 %j27};
*   &S @WIRE(mode="straight") {#XMP2_2:4 %j28};
*   &S @WIRE(mode="straight") {%j26 %j28};
*   &net8 @WIRE(mode="straight") {#XMP2_3:1 #XMP2_2:3};
*   &G @WIRE(mode="straight") {%j29 #XMP2_1:2};
*   &G @WIRE(mode="straight") {%j27 %j29};
*   &S @WIRE(mode="straight") {#XMP2_1:4 %j30};
*   &S @WIRE(mode="straight") {%j28 %j30};
*   &net7 @WIRE(mode="straight") {#XMP2_2:1 #XMP2_1:3};
*   &G @WIRE(mode="straight") {%j31 #XMP2_0:2};
*   &G @WIRE(mode="straight") {%j29 %j31};
*   &S @WIRE(mode="straight") {#XMP2_0:4 %j32};
*   &S @WIRE(mode="straight") {%j30 %j32};
*   &net0 @WIRE(mode="straight") {#XMP2_1:1 #XMP2_0:3};
*   &S @WIRE(mode="straight") {%port1:p %j33};
*   &S @WIRE(mode="straight") {%j33 #XMP2_15:3};
*   &S @WIRE(mode="straight") {%j33 (5, 4) %j2};
*   &D @WIRE(mode="straight") {#XMP2_0:1 %port2:p};
*   &G @WIRE(mode="straight") {%port3:p (-4, 2) %j1};
*   #XMP2_15
*       @TEXT("\textbf{\textit{M}}_{\textbf{P2\_15}}", key="name", dx=-7.3, dy=0, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XMP2_15::name(label);
*   #XMP2_14
*       @TEXT("\textbf{\textit{M}}_{\textbf{P2\_14}}", key="name", dx=-7.3, dy=0, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XMP2_14::name(label);
*   #XMP2_13
*       @TEXT("\textbf{\textit{M}}_{\textbf{P2\_13}}", key="name", dx=-7.3, dy=0, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XMP2_13::name(label);
*   #XMP2_12
*       @TEXT("\textbf{\textit{M}}_{\textbf{P2\_12}}", key="name", dx=-7.3, dy=0, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XMP2_12::name(label);
*   #XMP2_11
*       @TEXT("\textbf{\textit{M}}_{\textbf{P2\_11}}", key="name", dx=-7.3, dy=0, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XMP2_11::name(label);
*   #XMP2_10
*       @TEXT("\textbf{\textit{M}}_{\textbf{P2\_10}}", key="name", dx=-7.3, dy=0, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XMP2_10::name(label);
*   #XMP2_9 @TEXT("\textbf{\textit{M}}_{\textbf{P2\_9}}", key="name", dx=-7.3, dy=0, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XMP2_9::name(label);
*   #XMP2_8 @TEXT("\textbf{\textit{M}}_{\textbf{P2\_8}}", key="name", dx=-7.3, dy=0, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XMP2_8::name(label);
*   #XMP2_7 @TEXT("\textbf{\textit{M}}_{\textbf{P2\_7}}", key="name", dx=-7.3, dy=0, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XMP2_7::name(label);
*   #XMP2_6 @TEXT("\textbf{\textit{M}}_{\textbf{P2\_6}}", key="name", dx=-7.3, dy=0, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XMP2_6::name(label);
*   #XMP2_5 @TEXT("\textbf{\textit{M}}_{\textbf{P2\_5}}", key="name", dx=-7.3, dy=0, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XMP2_5::name(label);
*   #XMP2_4 @TEXT("\textbf{\textit{M}}_{\textbf{P2\_4}}", key="name", dx=-7.3, dy=0, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XMP2_4::name(label);
*   #XMP2_3 @TEXT("\textbf{\textit{M}}_{\textbf{P2\_3}}", key="name", dx=-7.3, dy=0, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XMP2_3::name(label);
*   #XMP2_2 @TEXT("\textbf{\textit{M}}_{\textbf{P2\_2}}", key="name", dx=-7.3, dy=0, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XMP2_2::name(label);
*   #XMP2_1 @TEXT("\textbf{\textit{M}}_{\textbf{P2\_1}}", key="name", dx=-7.3, dy=0, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XMP2_1::name(label);
*   #XMP2_0 @TEXT("\textbf{\textit{M}}_{\textbf{P2\_0}}", key="name", dx=-7.3, dy=0, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XMP2_0::name(label)
* }
.ends PMOS_16_Series_Stack_MP2

.subckt PMOS_16_Series_Stack_MP1 S D G
XMP1_0 D G net0 S sky130_fd_pr__pfet_g5v0d10v5 l=0.5 w=0.9 nf=1 m=1 ad=0.27 as=0.27 pd=2.4 ps=2.4
XMP1_1 net0 G net7 S sky130_fd_pr__pfet_g5v0d10v5 l=0.5 w=0.9 nf=1 m=1 ad=0.27 as=0.27 pd=2.4 ps=2.4
XMP1_10 net1 G net2 S sky130_fd_pr__pfet_g5v0d10v5 l=0.5 w=0.9 nf=1 m=1 ad=0.27 as=0.27 pd=2.4
+ ps=2.4
XMP1_11 net2 G net3 S sky130_fd_pr__pfet_g5v0d10v5 l=0.5 w=0.9 nf=1 m=1 ad=0.27 as=0.27 pd=2.4
+ ps=2.4
XMP1_12 net3 G net4 S sky130_fd_pr__pfet_g5v0d10v5 l=0.5 w=0.9 nf=1 m=1 ad=0.27 as=0.27 pd=2.4
+ ps=2.4
XMP1_13 net4 G net5 S sky130_fd_pr__pfet_g5v0d10v5 l=0.5 w=0.9 nf=1 m=1 ad=0.27 as=0.27 pd=2.4
+ ps=2.4
XMP1_14 net5 G net6 S sky130_fd_pr__pfet_g5v0d10v5 l=0.5 w=0.9 nf=1 m=1 ad=0.27 as=0.27 pd=2.4
+ ps=2.4
XMP1_15 net6 G S S sky130_fd_pr__pfet_g5v0d10v5 l=0.5 w=0.9 nf=1 m=1 ad=0.27 as=0.27 pd=2.4 ps=2.4
XMP1_2 net7 G net8 S sky130_fd_pr__pfet_g5v0d10v5 l=0.5 w=0.9 nf=1 m=1 ad=0.27 as=0.27 pd=2.4 ps=2.4
XMP1_3 net8 G net9 S sky130_fd_pr__pfet_g5v0d10v5 l=0.5 w=0.9 nf=1 m=1 ad=0.27 as=0.27 pd=2.4 ps=2.4
XMP1_4 net9 G net10 S sky130_fd_pr__pfet_g5v0d10v5 l=0.5 w=0.9 nf=1 m=1 ad=0.27 as=0.27 pd=2.4
+ ps=2.4
XMP1_5 net10 G net11 S sky130_fd_pr__pfet_g5v0d10v5 l=0.5 w=0.9 nf=1 m=1 ad=0.27 as=0.27 pd=2.4
+ ps=2.4
XMP1_6 net11 G net12 S sky130_fd_pr__pfet_g5v0d10v5 l=0.5 w=0.9 nf=1 m=1 ad=0.27 as=0.27 pd=2.4
+ ps=2.4
XMP1_7 net12 G net13 S sky130_fd_pr__pfet_g5v0d10v5 l=0.5 w=0.9 nf=1 m=1 ad=0.27 as=0.27 pd=2.4
+ ps=2.4
XMP1_8 net13 G net14 S sky130_fd_pr__pfet_g5v0d10v5 l=0.5 w=0.9 nf=1 m=1 ad=0.27 as=0.27 pd=2.4
+ ps=2.4
XMP1_9 net14 G net1 S sky130_fd_pr__pfet_g5v0d10v5 l=0.5 w=0.9 nf=1 m=1 ad=0.27 as=0.27 pd=2.4
+ ps=2.4
* @RNL(author="analog-canvas") {
*   %PMOS_16_Series_Stack_MP1_SYMBOL = @DEFINE-SYMBOL(box=[-4.2, -6.2, 3.4, 6.2]) {
*     (1, -6) @PIN(terminal="D", direction="down");
*     (-4, 0) @PIN(terminal="G", direction="left");
*     (1, 6) @PIN(terminal="S", direction="up");
*     @LINE {(-0.424419, 2.302326) (1, 2.302326) (1, 1)};
*     (-1.034884, 3) @RECTANGLE(width=0.290698, height=1.918605, fill="linecolor", linestyle="none");
*     (-0.511628, 3) @RECTANGLE(width=0.290698, height=2.5, fill="linecolor", linestyle="none");
*     @LINE {(-0.889535, 3) (-2, 3)};
*     @LINE {(0.563954, 3.712209) (1, 3.712209) (1, 5)};
*     @LINE(fill="linecolor", linestyle="none") {(-0.366279, 3.712209) (0.563954, 4.119186) (0.563954, 3.305233)
*         (-0.366279, 3.712209)};
*     @LINE {(-0.424419, -3.697674) (1, -3.697674) (1, -5)};
*     (-1.034884, -3) @RECTANGLE(width=0.290698, height=1.918605, fill="linecolor", linestyle="none");
*     (-0.511628, -3) @RECTANGLE(width=0.290698, height=2.5, fill="linecolor", linestyle="none");
*     @LINE {(-0.889535, -3) (-2, -3)};
*     @LINE {(0.563954, -2.287791) (1, -2.287791) (1, -1)};
*     @LINE(fill="linecolor", linestyle="none") {(-0.366279, -2.287791) (0.563954, -1.880814) (0.563954, -2.694767)
*         (-0.366279, -2.287791)};
*     @LINE {(1, 6) (1, 5)};
*     @LINE {(1, -5) (1, -6)};
*     @LINE {(-4, 0) (-3, 0)};
*     @LINE {(-3, 3) (-3, -3)};
*     @LINE {(-3, 3) (-2, 3)};
*     @LINE {(-3, -3) (-2, -3)};
*     @LINE {(1, 5.5) (3, 5.5)};
*     @LINE {(3, 5.5) (3, -3)};
*     @LINE {(-0.366279, 3) (3, 3)};
*     @LINE {(-0.366279, -3) (3, -3)};
*     (1, 5.5) @CIRCLE(radius=0.3, fill="linecolor", linestyle="none");
*     (3, 3) @CIRCLE(radius=0.3, fill="linecolor", linestyle="none");
*     (-3, 0) @CIRCLE(radius=0.3, fill="linecolor", linestyle="none");
*     (1, 0.5) @CIRCLE(radius=0.125, fill="linecolor", linestyle="none");
*     (1, 0) @CIRCLE(radius=0.125, fill="linecolor", linestyle="none");
*     (1, -0.5) @CIRCLE(radius=0.125, fill="linecolor", linestyle="none")
*   };
*   # @SET-SYMBOL %PMOS_16_Series_Stack_MP1_SYMBOL;
*   $CANVAS_TYPESETTING @ATTACH #(level);
*   #XMP1_15 @SET-SYMBOL $PMOS_4TERM => @PLACE(1, 0) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="MP1_15") #XMP1_15(part);
*   $CANVAS_PARAMETER_TEXT @ATTACH(name="l", text="0.5u") #XMP1_15(part);
*   $CANVAS_PARAMETER_TEXT @ATTACH(name="w", text="0.9u") #XMP1_15(part);
*   #XMP1_14 @SET-SYMBOL $PMOS_4TERM => @PLACE(1, -6) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="MP1_14") #XMP1_14(part);
*   $CANVAS_PARAMETER_TEXT @ATTACH(name="l", text="0.5u") #XMP1_14(part);
*   $CANVAS_PARAMETER_TEXT @ATTACH(name="w", text="0.9u") #XMP1_14(part);
*   #XMP1_13 @SET-SYMBOL $PMOS_4TERM => @PLACE(1, -12) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="MP1_13") #XMP1_13(part);
*   $CANVAS_PARAMETER_TEXT @ATTACH(name="l", text="0.5u") #XMP1_13(part);
*   $CANVAS_PARAMETER_TEXT @ATTACH(name="w", text="0.9u") #XMP1_13(part);
*   #XMP1_12 @SET-SYMBOL $PMOS_4TERM => @PLACE(1, -18) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="MP1_12") #XMP1_12(part);
*   $CANVAS_PARAMETER_TEXT @ATTACH(name="l", text="0.5u") #XMP1_12(part);
*   $CANVAS_PARAMETER_TEXT @ATTACH(name="w", text="0.9u") #XMP1_12(part);
*   #XMP1_11 @SET-SYMBOL $PMOS_4TERM => @PLACE(1, -24) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="MP1_11") #XMP1_11(part);
*   $CANVAS_PARAMETER_TEXT @ATTACH(name="l", text="0.5u") #XMP1_11(part);
*   $CANVAS_PARAMETER_TEXT @ATTACH(name="w", text="0.9u") #XMP1_11(part);
*   #XMP1_10 @SET-SYMBOL $PMOS_4TERM => @PLACE(1, -30) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="MP1_10") #XMP1_10(part);
*   $CANVAS_PARAMETER_TEXT @ATTACH(name="l", text="0.5u") #XMP1_10(part);
*   $CANVAS_PARAMETER_TEXT @ATTACH(name="w", text="0.9u") #XMP1_10(part);
*   #XMP1_9 @SET-SYMBOL $PMOS_4TERM => @PLACE(1, -36) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="MP1_9") #XMP1_9(part);
*   $CANVAS_PARAMETER_TEXT @ATTACH(name="l", text="0.5u") #XMP1_9(part);
*   $CANVAS_PARAMETER_TEXT @ATTACH(name="w", text="0.9u") #XMP1_9(part);
*   #XMP1_8 @SET-SYMBOL $PMOS_4TERM => @PLACE(1, -42) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="MP1_8") #XMP1_8(part);
*   $CANVAS_PARAMETER_TEXT @ATTACH(name="l", text="0.5u") #XMP1_8(part);
*   $CANVAS_PARAMETER_TEXT @ATTACH(name="w", text="0.9u") #XMP1_8(part);
*   #XMP1_7 @SET-SYMBOL $PMOS_4TERM => @PLACE(1, -48) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="MP1_7") #XMP1_7(part);
*   $CANVAS_PARAMETER_TEXT @ATTACH(name="l", text="0.5u") #XMP1_7(part);
*   $CANVAS_PARAMETER_TEXT @ATTACH(name="w", text="0.9u") #XMP1_7(part);
*   #XMP1_6 @SET-SYMBOL $PMOS_4TERM => @PLACE(1, -54) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="MP1_6") #XMP1_6(part);
*   $CANVAS_PARAMETER_TEXT @ATTACH(name="l", text="0.5u") #XMP1_6(part);
*   $CANVAS_PARAMETER_TEXT @ATTACH(name="w", text="0.9u") #XMP1_6(part);
*   #XMP1_5 @SET-SYMBOL $PMOS_4TERM => @PLACE(1, -60) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="MP1_5") #XMP1_5(part);
*   $CANVAS_PARAMETER_TEXT @ATTACH(name="l", text="0.5u") #XMP1_5(part);
*   $CANVAS_PARAMETER_TEXT @ATTACH(name="w", text="0.9u") #XMP1_5(part);
*   #XMP1_4 @SET-SYMBOL $PMOS_4TERM => @PLACE(1, -66) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="MP1_4") #XMP1_4(part);
*   $CANVAS_PARAMETER_TEXT @ATTACH(name="l", text="0.5u") #XMP1_4(part);
*   $CANVAS_PARAMETER_TEXT @ATTACH(name="w", text="0.9u") #XMP1_4(part);
*   #XMP1_3 @SET-SYMBOL $PMOS_4TERM => @PLACE(1, -72) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="MP1_3") #XMP1_3(part);
*   $CANVAS_PARAMETER_TEXT @ATTACH(name="l", text="0.5u") #XMP1_3(part);
*   $CANVAS_PARAMETER_TEXT @ATTACH(name="w", text="0.9u") #XMP1_3(part);
*   #XMP1_2 @SET-SYMBOL $PMOS_4TERM => @PLACE(1, -78) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="MP1_2") #XMP1_2(part);
*   $CANVAS_PARAMETER_TEXT @ATTACH(name="l", text="0.5u") #XMP1_2(part);
*   $CANVAS_PARAMETER_TEXT @ATTACH(name="w", text="0.9u") #XMP1_2(part);
*   #XMP1_1 @SET-SYMBOL $PMOS_4TERM => @PLACE(1, -84) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="MP1_1") #XMP1_1(part);
*   $CANVAS_PARAMETER_TEXT @ATTACH(name="l", text="0.5u") #XMP1_1(part);
*   $CANVAS_PARAMETER_TEXT @ATTACH(name="w", text="0.9u") #XMP1_1(part);
*   #XMP1_0 @SET-SYMBOL $PMOS_4TERM => @PLACE(1, -90) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="MP1_0") #XMP1_0(part);
*   $CANVAS_PARAMETER_TEXT @ATTACH(name="l", text="0.5u") #XMP1_0(part);
*   $CANVAS_PARAMETER_TEXT @ATTACH(name="w", text="0.9u") #XMP1_0(part);
*   $IO_PORT @ATTACH &S(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(1, 6) => @ORIENT("R270") => %port1;
*   $IO_PORT @ATTACH &D(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(1, -96) => @ORIENT("R270") => %port2;
*   $IO_PORT @ATTACH &G(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(-8, 2) => @ORIENT("R0") => %port3;
*   %j1 = (-4, 0);
*   $JUNCTION @ATTACH %j1;
*   %j2 = (5, 0);
*   $JUNCTION @ATTACH %j2;
*   %j3 = (-4, -6);
*   $JUNCTION @ATTACH %j3;
*   %j4 = (5, -6);
*   $JUNCTION @ATTACH %j4;
*   %j5 = (-4, -12);
*   $JUNCTION @ATTACH %j5;
*   %j6 = (5, -12);
*   $JUNCTION @ATTACH %j6;
*   %j7 = (-4, -18);
*   $JUNCTION @ATTACH %j7;
*   %j8 = (5, -18);
*   $JUNCTION @ATTACH %j8;
*   %j9 = (-4, -24);
*   $JUNCTION @ATTACH %j9;
*   %j10 = (5, -24);
*   $JUNCTION @ATTACH %j10;
*   %j11 = (-4, -30);
*   $JUNCTION @ATTACH %j11;
*   %j12 = (5, -30);
*   $JUNCTION @ATTACH %j12;
*   %j13 = (-4, -36);
*   $JUNCTION @ATTACH %j13;
*   %j14 = (5, -36);
*   $JUNCTION @ATTACH %j14;
*   %j15 = (-4, -42);
*   $JUNCTION @ATTACH %j15;
*   %j16 = (5, -42);
*   $JUNCTION @ATTACH %j16;
*   %j17 = (-4, -48);
*   $JUNCTION @ATTACH %j17;
*   %j18 = (5, -48);
*   $JUNCTION @ATTACH %j18;
*   %j19 = (-4, -54);
*   $JUNCTION @ATTACH %j19;
*   %j20 = (5, -54);
*   $JUNCTION @ATTACH %j20;
*   %j21 = (-4, -60);
*   $JUNCTION @ATTACH %j21;
*   %j22 = (5, -60);
*   $JUNCTION @ATTACH %j22;
*   %j23 = (-4, -66);
*   $JUNCTION @ATTACH %j23;
*   %j24 = (5, -66);
*   $JUNCTION @ATTACH %j24;
*   %j25 = (-4, -72);
*   $JUNCTION @ATTACH %j25;
*   %j26 = (5, -72);
*   $JUNCTION @ATTACH %j26;
*   %j27 = (-4, -78);
*   $JUNCTION @ATTACH %j27;
*   %j28 = (5, -78);
*   $JUNCTION @ATTACH %j28;
*   %j29 = (-4, -84);
*   $JUNCTION @ATTACH %j29;
*   %j30 = (5, -84);
*   $JUNCTION @ATTACH %j30;
*   %j31 = (-4, -90);
*   %j32 = (5, -90);
*   %j33 = (1, 4);
*   $JUNCTION @ATTACH %j33;
*   &G @WIRE(mode="straight") {%j1 #XMP1_15:2};
*   &S @WIRE(mode="straight") {#XMP1_15:4 %j2};
*   &G @WIRE(mode="straight") {%j3 #XMP1_14:2};
*   &G @WIRE(mode="straight") {%j1 %j3};
*   &S @WIRE(mode="straight") {#XMP1_14:4 %j4};
*   &S @WIRE(mode="straight") {%j2 %j4};
*   &net6 @WIRE(mode="straight") {#XMP1_15:1 #XMP1_14:3};
*   &G @WIRE(mode="straight") {%j5 #XMP1_13:2};
*   &G @WIRE(mode="straight") {%j3 %j5};
*   &S @WIRE(mode="straight") {#XMP1_13:4 %j6};
*   &S @WIRE(mode="straight") {%j4 %j6};
*   &net5 @WIRE(mode="straight") {#XMP1_14:1 #XMP1_13:3};
*   &G @WIRE(mode="straight") {%j7 #XMP1_12:2};
*   &G @WIRE(mode="straight") {%j5 %j7};
*   &S @WIRE(mode="straight") {#XMP1_12:4 %j8};
*   &S @WIRE(mode="straight") {%j6 %j8};
*   &net4 @WIRE(mode="straight") {#XMP1_13:1 #XMP1_12:3};
*   &G @WIRE(mode="straight") {%j9 #XMP1_11:2};
*   &G @WIRE(mode="straight") {%j7 %j9};
*   &S @WIRE(mode="straight") {#XMP1_11:4 %j10};
*   &S @WIRE(mode="straight") {%j8 %j10};
*   &net3 @WIRE(mode="straight") {#XMP1_12:1 #XMP1_11:3};
*   &G @WIRE(mode="straight") {%j11 #XMP1_10:2};
*   &G @WIRE(mode="straight") {%j9 %j11};
*   &S @WIRE(mode="straight") {#XMP1_10:4 %j12};
*   &S @WIRE(mode="straight") {%j10 %j12};
*   &net2 @WIRE(mode="straight") {#XMP1_11:1 #XMP1_10:3};
*   &G @WIRE(mode="straight") {%j13 #XMP1_9:2};
*   &G @WIRE(mode="straight") {%j11 %j13};
*   &S @WIRE(mode="straight") {#XMP1_9:4 %j14};
*   &S @WIRE(mode="straight") {%j12 %j14};
*   &net1 @WIRE(mode="straight") {#XMP1_10:1 #XMP1_9:3};
*   &G @WIRE(mode="straight") {%j15 #XMP1_8:2};
*   &G @WIRE(mode="straight") {%j13 %j15};
*   &S @WIRE(mode="straight") {#XMP1_8:4 %j16};
*   &S @WIRE(mode="straight") {%j14 %j16};
*   &net14 @WIRE(mode="straight") {#XMP1_9:1 #XMP1_8:3};
*   &G @WIRE(mode="straight") {%j17 #XMP1_7:2};
*   &G @WIRE(mode="straight") {%j15 %j17};
*   &S @WIRE(mode="straight") {#XMP1_7:4 %j18};
*   &S @WIRE(mode="straight") {%j16 %j18};
*   &net13 @WIRE(mode="straight") {#XMP1_8:1 #XMP1_7:3};
*   &G @WIRE(mode="straight") {%j19 #XMP1_6:2};
*   &G @WIRE(mode="straight") {%j17 %j19};
*   &S @WIRE(mode="straight") {#XMP1_6:4 %j20};
*   &S @WIRE(mode="straight") {%j18 %j20};
*   &net12 @WIRE(mode="straight") {#XMP1_7:1 #XMP1_6:3};
*   &G @WIRE(mode="straight") {%j21 #XMP1_5:2};
*   &G @WIRE(mode="straight") {%j19 %j21};
*   &S @WIRE(mode="straight") {#XMP1_5:4 %j22};
*   &S @WIRE(mode="straight") {%j20 %j22};
*   &net11 @WIRE(mode="straight") {#XMP1_6:1 #XMP1_5:3};
*   &G @WIRE(mode="straight") {%j23 #XMP1_4:2};
*   &G @WIRE(mode="straight") {%j21 %j23};
*   &S @WIRE(mode="straight") {#XMP1_4:4 %j24};
*   &S @WIRE(mode="straight") {%j22 %j24};
*   &net10 @WIRE(mode="straight") {#XMP1_5:1 #XMP1_4:3};
*   &G @WIRE(mode="straight") {%j25 #XMP1_3:2};
*   &G @WIRE(mode="straight") {%j23 %j25};
*   &S @WIRE(mode="straight") {#XMP1_3:4 %j26};
*   &S @WIRE(mode="straight") {%j24 %j26};
*   &net9 @WIRE(mode="straight") {#XMP1_4:1 #XMP1_3:3};
*   &G @WIRE(mode="straight") {%j27 #XMP1_2:2};
*   &G @WIRE(mode="straight") {%j25 %j27};
*   &S @WIRE(mode="straight") {#XMP1_2:4 %j28};
*   &S @WIRE(mode="straight") {%j26 %j28};
*   &net8 @WIRE(mode="straight") {#XMP1_3:1 #XMP1_2:3};
*   &G @WIRE(mode="straight") {%j29 #XMP1_1:2};
*   &G @WIRE(mode="straight") {%j27 %j29};
*   &S @WIRE(mode="straight") {#XMP1_1:4 %j30};
*   &S @WIRE(mode="straight") {%j28 %j30};
*   &net7 @WIRE(mode="straight") {#XMP1_2:1 #XMP1_1:3};
*   &G @WIRE(mode="straight") {%j31 #XMP1_0:2};
*   &G @WIRE(mode="straight") {%j29 %j31};
*   &S @WIRE(mode="straight") {#XMP1_0:4 %j32};
*   &S @WIRE(mode="straight") {%j30 %j32};
*   &net0 @WIRE(mode="straight") {#XMP1_1:1 #XMP1_0:3};
*   &S @WIRE(mode="straight") {%port1:p %j33};
*   &S @WIRE(mode="straight") {%j33 #XMP1_15:3};
*   &S @WIRE(mode="straight") {%j33 (5, 4) %j2};
*   &D @WIRE(mode="straight") {#XMP1_0:1 %port2:p};
*   &G @WIRE(mode="straight") {%port3:p (-4, 2) %j1};
*   #XMP1_15
*       @TEXT("\textbf{\textit{M}}_{\textbf{P1\_15}}", key="name", dx=-7.3, dy=0, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XMP1_15::name(label);
*   #XMP1_14
*       @TEXT("\textbf{\textit{M}}_{\textbf{P1\_14}}", key="name", dx=-7.3, dy=0, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XMP1_14::name(label);
*   #XMP1_13
*       @TEXT("\textbf{\textit{M}}_{\textbf{P1\_13}}", key="name", dx=-7.3, dy=0, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XMP1_13::name(label);
*   #XMP1_12
*       @TEXT("\textbf{\textit{M}}_{\textbf{P1\_12}}", key="name", dx=-7.3, dy=0, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XMP1_12::name(label);
*   #XMP1_11
*       @TEXT("\textbf{\textit{M}}_{\textbf{P1\_11}}", key="name", dx=-7.3, dy=0, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XMP1_11::name(label);
*   #XMP1_10
*       @TEXT("\textbf{\textit{M}}_{\textbf{P1\_10}}", key="name", dx=-7.3, dy=0, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XMP1_10::name(label);
*   #XMP1_9 @TEXT("\textbf{\textit{M}}_{\textbf{P1\_9}}", key="name", dx=-7.3, dy=0, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XMP1_9::name(label);
*   #XMP1_8 @TEXT("\textbf{\textit{M}}_{\textbf{P1\_8}}", key="name", dx=-7.3, dy=0, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XMP1_8::name(label);
*   #XMP1_7 @TEXT("\textbf{\textit{M}}_{\textbf{P1\_7}}", key="name", dx=-7.3, dy=0, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XMP1_7::name(label);
*   #XMP1_6 @TEXT("\textbf{\textit{M}}_{\textbf{P1\_6}}", key="name", dx=-7.3, dy=0, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XMP1_6::name(label);
*   #XMP1_5 @TEXT("\textbf{\textit{M}}_{\textbf{P1\_5}}", key="name", dx=-7.3, dy=0, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XMP1_5::name(label);
*   #XMP1_4 @TEXT("\textbf{\textit{M}}_{\textbf{P1\_4}}", key="name", dx=-7.3, dy=0, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XMP1_4::name(label);
*   #XMP1_3 @TEXT("\textbf{\textit{M}}_{\textbf{P1\_3}}", key="name", dx=-7.3, dy=0, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XMP1_3::name(label);
*   #XMP1_2 @TEXT("\textbf{\textit{M}}_{\textbf{P1\_2}}", key="name", dx=-7.3, dy=0, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XMP1_2::name(label);
*   #XMP1_1 @TEXT("\textbf{\textit{M}}_{\textbf{P1\_1}}", key="name", dx=-7.3, dy=0, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XMP1_1::name(label);
*   #XMP1_0 @TEXT("\textbf{\textit{M}}_{\textbf{P1\_0}}", key="name", dx=-7.3, dy=0, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XMP1_0::name(label)
* }
.ends PMOS_16_Series_Stack_MP1

.subckt PMOS_16_Series_Stack_MP3 S D G
XMP3_0 D G net0 S sky130_fd_pr__pfet_g5v0d10v5 l=1 w=1 nf=1 m=1 ad=0.3 as=0.3 pd=2.6 ps=2.6
XMP3_1 net0 G net7 S sky130_fd_pr__pfet_g5v0d10v5 l=1 w=1 nf=1 m=1 ad=0.3 as=0.3 pd=2.6 ps=2.6
XMP3_10 net1 G net2 S sky130_fd_pr__pfet_g5v0d10v5 l=1 w=1 nf=1 m=1 ad=0.3 as=0.3 pd=2.6 ps=2.6
XMP3_11 net2 G net3 S sky130_fd_pr__pfet_g5v0d10v5 l=1 w=1 nf=1 m=1 ad=0.3 as=0.3 pd=2.6 ps=2.6
XMP3_12 net3 G net4 S sky130_fd_pr__pfet_g5v0d10v5 l=1 w=1 nf=1 m=1 ad=0.3 as=0.3 pd=2.6 ps=2.6
XMP3_13 net4 G net5 S sky130_fd_pr__pfet_g5v0d10v5 l=1 w=1 nf=1 m=1 ad=0.3 as=0.3 pd=2.6 ps=2.6
XMP3_14 net5 G net6 S sky130_fd_pr__pfet_g5v0d10v5 l=1 w=1 nf=1 m=1 ad=0.3 as=0.3 pd=2.6 ps=2.6
XMP3_15 net6 G S S sky130_fd_pr__pfet_g5v0d10v5 l=1 w=1 nf=1 m=1 ad=0.3 as=0.3 pd=2.6 ps=2.6
XMP3_2 net7 G net8 S sky130_fd_pr__pfet_g5v0d10v5 l=1 w=1 nf=1 m=1 ad=0.3 as=0.3 pd=2.6 ps=2.6
XMP3_3 net8 G net9 S sky130_fd_pr__pfet_g5v0d10v5 l=1 w=1 nf=1 m=1 ad=0.3 as=0.3 pd=2.6 ps=2.6
XMP3_4 net9 G net10 S sky130_fd_pr__pfet_g5v0d10v5 l=1 w=1 nf=1 m=1 ad=0.3 as=0.3 pd=2.6 ps=2.6
XMP3_5 net10 G net11 S sky130_fd_pr__pfet_g5v0d10v5 l=1 w=1 nf=1 m=1 ad=0.3 as=0.3 pd=2.6 ps=2.6
XMP3_6 net11 G net12 S sky130_fd_pr__pfet_g5v0d10v5 l=1 w=1 nf=1 m=1 ad=0.3 as=0.3 pd=2.6 ps=2.6
XMP3_7 net12 G net13 S sky130_fd_pr__pfet_g5v0d10v5 l=1 w=1 nf=1 m=1 ad=0.3 as=0.3 pd=2.6 ps=2.6
XMP3_8 net13 G net14 S sky130_fd_pr__pfet_g5v0d10v5 l=1 w=1 nf=1 m=1 ad=0.3 as=0.3 pd=2.6 ps=2.6
XMP3_9 net14 G net1 S sky130_fd_pr__pfet_g5v0d10v5 l=1 w=1 nf=1 m=1 ad=0.3 as=0.3 pd=2.6 ps=2.6
* @RNL(author="analog-canvas") {
*   %PMOS_16_Series_Stack_MP3_SYMBOL = @DEFINE-SYMBOL(box=[-4.2, -6.2, 3.4, 6.2]) {
*     (1, -6) @PIN(terminal="D", direction="down");
*     (-4, 0) @PIN(terminal="G", direction="left");
*     (1, 6) @PIN(terminal="S", direction="up");
*     @LINE {(-0.424419, 2.302326) (1, 2.302326) (1, 1)};
*     (-1.034884, 3) @RECTANGLE(width=0.290698, height=1.918605, fill="linecolor", linestyle="none");
*     (-0.511628, 3) @RECTANGLE(width=0.290698, height=2.5, fill="linecolor", linestyle="none");
*     @LINE {(-0.889535, 3) (-2, 3)};
*     @LINE {(0.563954, 3.712209) (1, 3.712209) (1, 5)};
*     @LINE(fill="linecolor", linestyle="none") {(-0.366279, 3.712209) (0.563954, 4.119186) (0.563954, 3.305233)
*         (-0.366279, 3.712209)};
*     @LINE {(-0.424419, -3.697674) (1, -3.697674) (1, -5)};
*     (-1.034884, -3) @RECTANGLE(width=0.290698, height=1.918605, fill="linecolor", linestyle="none");
*     (-0.511628, -3) @RECTANGLE(width=0.290698, height=2.5, fill="linecolor", linestyle="none");
*     @LINE {(-0.889535, -3) (-2, -3)};
*     @LINE {(0.563954, -2.287791) (1, -2.287791) (1, -1)};
*     @LINE(fill="linecolor", linestyle="none") {(-0.366279, -2.287791) (0.563954, -1.880814) (0.563954, -2.694767)
*         (-0.366279, -2.287791)};
*     @LINE {(1, 6) (1, 5)};
*     @LINE {(1, -5) (1, -6)};
*     @LINE {(-4, 0) (-3, 0)};
*     @LINE {(-3, 3) (-3, -3)};
*     @LINE {(-3, 3) (-2, 3)};
*     @LINE {(-3, -3) (-2, -3)};
*     @LINE {(1, 5.5) (3, 5.5)};
*     @LINE {(3, 5.5) (3, -3)};
*     @LINE {(-0.366279, 3) (3, 3)};
*     @LINE {(-0.366279, -3) (3, -3)};
*     (1, 5.5) @CIRCLE(radius=0.3, fill="linecolor", linestyle="none");
*     (3, 3) @CIRCLE(radius=0.3, fill="linecolor", linestyle="none");
*     (-3, 0) @CIRCLE(radius=0.3, fill="linecolor", linestyle="none");
*     (1, 0.5) @CIRCLE(radius=0.125, fill="linecolor", linestyle="none");
*     (1, 0) @CIRCLE(radius=0.125, fill="linecolor", linestyle="none");
*     (1, -0.5) @CIRCLE(radius=0.125, fill="linecolor", linestyle="none")
*   };
*   # @SET-SYMBOL %PMOS_16_Series_Stack_MP3_SYMBOL;
*   $CANVAS_TYPESETTING @ATTACH #(level);
*   #XMP3_15 @SET-SYMBOL $PMOS_4TERM => @PLACE(1, 0) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="MP3_15") #XMP3_15(part);
*   #XMP3_14 @SET-SYMBOL $PMOS_4TERM => @PLACE(1, -6) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="MP3_14") #XMP3_14(part);
*   #XMP3_13 @SET-SYMBOL $PMOS_4TERM => @PLACE(1, -12) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="MP3_13") #XMP3_13(part);
*   #XMP3_12 @SET-SYMBOL $PMOS_4TERM => @PLACE(1, -18) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="MP3_12") #XMP3_12(part);
*   #XMP3_11 @SET-SYMBOL $PMOS_4TERM => @PLACE(1, -24) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="MP3_11") #XMP3_11(part);
*   #XMP3_10 @SET-SYMBOL $PMOS_4TERM => @PLACE(1, -30) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="MP3_10") #XMP3_10(part);
*   #XMP3_9 @SET-SYMBOL $PMOS_4TERM => @PLACE(1, -36) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="MP3_9") #XMP3_9(part);
*   #XMP3_8 @SET-SYMBOL $PMOS_4TERM => @PLACE(1, -42) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="MP3_8") #XMP3_8(part);
*   #XMP3_7 @SET-SYMBOL $PMOS_4TERM => @PLACE(1, -48) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="MP3_7") #XMP3_7(part);
*   #XMP3_6 @SET-SYMBOL $PMOS_4TERM => @PLACE(1, -54) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="MP3_6") #XMP3_6(part);
*   #XMP3_5 @SET-SYMBOL $PMOS_4TERM => @PLACE(1, -60) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="MP3_5") #XMP3_5(part);
*   #XMP3_4 @SET-SYMBOL $PMOS_4TERM => @PLACE(1, -66) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="MP3_4") #XMP3_4(part);
*   #XMP3_3 @SET-SYMBOL $PMOS_4TERM => @PLACE(1, -72) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="MP3_3") #XMP3_3(part);
*   #XMP3_2 @SET-SYMBOL $PMOS_4TERM => @PLACE(1, -78) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="MP3_2") #XMP3_2(part);
*   #XMP3_1 @SET-SYMBOL $PMOS_4TERM => @PLACE(1, -84) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="MP3_1") #XMP3_1(part);
*   #XMP3_0 @SET-SYMBOL $PMOS_4TERM => @PLACE(1, -90) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="MP3_0") #XMP3_0(part);
*   $IO_PORT @ATTACH &S(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(1, 6) => @ORIENT("R270") => %port1;
*   $IO_PORT @ATTACH &D(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(1, -96) => @ORIENT("R270") => %port2;
*   $IO_PORT @ATTACH &G(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(-8, 2) => @ORIENT("R0") => %port3;
*   %j1 = (-4, 0);
*   $JUNCTION @ATTACH %j1;
*   %j2 = (5, 0);
*   $JUNCTION @ATTACH %j2;
*   %j3 = (-4, -6);
*   $JUNCTION @ATTACH %j3;
*   %j4 = (5, -6);
*   $JUNCTION @ATTACH %j4;
*   %j5 = (-4, -12);
*   $JUNCTION @ATTACH %j5;
*   %j6 = (5, -12);
*   $JUNCTION @ATTACH %j6;
*   %j7 = (-4, -18);
*   $JUNCTION @ATTACH %j7;
*   %j8 = (5, -18);
*   $JUNCTION @ATTACH %j8;
*   %j9 = (-4, -24);
*   $JUNCTION @ATTACH %j9;
*   %j10 = (5, -24);
*   $JUNCTION @ATTACH %j10;
*   %j11 = (-4, -30);
*   $JUNCTION @ATTACH %j11;
*   %j12 = (5, -30);
*   $JUNCTION @ATTACH %j12;
*   %j13 = (-4, -36);
*   $JUNCTION @ATTACH %j13;
*   %j14 = (5, -36);
*   $JUNCTION @ATTACH %j14;
*   %j15 = (-4, -42);
*   $JUNCTION @ATTACH %j15;
*   %j16 = (5, -42);
*   $JUNCTION @ATTACH %j16;
*   %j17 = (-4, -48);
*   $JUNCTION @ATTACH %j17;
*   %j18 = (5, -48);
*   $JUNCTION @ATTACH %j18;
*   %j19 = (-4, -54);
*   $JUNCTION @ATTACH %j19;
*   %j20 = (5, -54);
*   $JUNCTION @ATTACH %j20;
*   %j21 = (-4, -60);
*   $JUNCTION @ATTACH %j21;
*   %j22 = (5, -60);
*   $JUNCTION @ATTACH %j22;
*   %j23 = (-4, -66);
*   $JUNCTION @ATTACH %j23;
*   %j24 = (5, -66);
*   $JUNCTION @ATTACH %j24;
*   %j25 = (-4, -72);
*   $JUNCTION @ATTACH %j25;
*   %j26 = (5, -72);
*   $JUNCTION @ATTACH %j26;
*   %j27 = (-4, -78);
*   $JUNCTION @ATTACH %j27;
*   %j28 = (5, -78);
*   $JUNCTION @ATTACH %j28;
*   %j29 = (-4, -84);
*   $JUNCTION @ATTACH %j29;
*   %j30 = (5, -84);
*   $JUNCTION @ATTACH %j30;
*   %j31 = (-4, -90);
*   %j32 = (5, -90);
*   %j33 = (1, 4);
*   $JUNCTION @ATTACH %j33;
*   &G @WIRE(mode="straight") {%j1 #XMP3_15:2};
*   &S @WIRE(mode="straight") {#XMP3_15:4 %j2};
*   &G @WIRE(mode="straight") {%j3 #XMP3_14:2};
*   &G @WIRE(mode="straight") {%j1 %j3};
*   &S @WIRE(mode="straight") {#XMP3_14:4 %j4};
*   &S @WIRE(mode="straight") {%j2 %j4};
*   &net6 @WIRE(mode="straight") {#XMP3_15:1 #XMP3_14:3};
*   &G @WIRE(mode="straight") {%j5 #XMP3_13:2};
*   &G @WIRE(mode="straight") {%j3 %j5};
*   &S @WIRE(mode="straight") {#XMP3_13:4 %j6};
*   &S @WIRE(mode="straight") {%j4 %j6};
*   &net5 @WIRE(mode="straight") {#XMP3_14:1 #XMP3_13:3};
*   &G @WIRE(mode="straight") {%j7 #XMP3_12:2};
*   &G @WIRE(mode="straight") {%j5 %j7};
*   &S @WIRE(mode="straight") {#XMP3_12:4 %j8};
*   &S @WIRE(mode="straight") {%j6 %j8};
*   &net4 @WIRE(mode="straight") {#XMP3_13:1 #XMP3_12:3};
*   &G @WIRE(mode="straight") {%j9 #XMP3_11:2};
*   &G @WIRE(mode="straight") {%j7 %j9};
*   &S @WIRE(mode="straight") {#XMP3_11:4 %j10};
*   &S @WIRE(mode="straight") {%j8 %j10};
*   &net3 @WIRE(mode="straight") {#XMP3_12:1 #XMP3_11:3};
*   &G @WIRE(mode="straight") {%j11 #XMP3_10:2};
*   &G @WIRE(mode="straight") {%j9 %j11};
*   &S @WIRE(mode="straight") {#XMP3_10:4 %j12};
*   &S @WIRE(mode="straight") {%j10 %j12};
*   &net2 @WIRE(mode="straight") {#XMP3_11:1 #XMP3_10:3};
*   &G @WIRE(mode="straight") {%j13 #XMP3_9:2};
*   &G @WIRE(mode="straight") {%j11 %j13};
*   &S @WIRE(mode="straight") {#XMP3_9:4 %j14};
*   &S @WIRE(mode="straight") {%j12 %j14};
*   &net1 @WIRE(mode="straight") {#XMP3_10:1 #XMP3_9:3};
*   &G @WIRE(mode="straight") {%j15 #XMP3_8:2};
*   &G @WIRE(mode="straight") {%j13 %j15};
*   &S @WIRE(mode="straight") {#XMP3_8:4 %j16};
*   &S @WIRE(mode="straight") {%j14 %j16};
*   &net14 @WIRE(mode="straight") {#XMP3_9:1 #XMP3_8:3};
*   &G @WIRE(mode="straight") {%j17 #XMP3_7:2};
*   &G @WIRE(mode="straight") {%j15 %j17};
*   &S @WIRE(mode="straight") {#XMP3_7:4 %j18};
*   &S @WIRE(mode="straight") {%j16 %j18};
*   &net13 @WIRE(mode="straight") {#XMP3_8:1 #XMP3_7:3};
*   &G @WIRE(mode="straight") {%j19 #XMP3_6:2};
*   &G @WIRE(mode="straight") {%j17 %j19};
*   &S @WIRE(mode="straight") {#XMP3_6:4 %j20};
*   &S @WIRE(mode="straight") {%j18 %j20};
*   &net12 @WIRE(mode="straight") {#XMP3_7:1 #XMP3_6:3};
*   &G @WIRE(mode="straight") {%j21 #XMP3_5:2};
*   &G @WIRE(mode="straight") {%j19 %j21};
*   &S @WIRE(mode="straight") {#XMP3_5:4 %j22};
*   &S @WIRE(mode="straight") {%j20 %j22};
*   &net11 @WIRE(mode="straight") {#XMP3_6:1 #XMP3_5:3};
*   &G @WIRE(mode="straight") {%j23 #XMP3_4:2};
*   &G @WIRE(mode="straight") {%j21 %j23};
*   &S @WIRE(mode="straight") {#XMP3_4:4 %j24};
*   &S @WIRE(mode="straight") {%j22 %j24};
*   &net10 @WIRE(mode="straight") {#XMP3_5:1 #XMP3_4:3};
*   &G @WIRE(mode="straight") {%j25 #XMP3_3:2};
*   &G @WIRE(mode="straight") {%j23 %j25};
*   &S @WIRE(mode="straight") {#XMP3_3:4 %j26};
*   &S @WIRE(mode="straight") {%j24 %j26};
*   &net9 @WIRE(mode="straight") {#XMP3_4:1 #XMP3_3:3};
*   &G @WIRE(mode="straight") {%j27 #XMP3_2:2};
*   &G @WIRE(mode="straight") {%j25 %j27};
*   &S @WIRE(mode="straight") {#XMP3_2:4 %j28};
*   &S @WIRE(mode="straight") {%j26 %j28};
*   &net8 @WIRE(mode="straight") {#XMP3_3:1 #XMP3_2:3};
*   &G @WIRE(mode="straight") {%j29 #XMP3_1:2};
*   &G @WIRE(mode="straight") {%j27 %j29};
*   &S @WIRE(mode="straight") {#XMP3_1:4 %j30};
*   &S @WIRE(mode="straight") {%j28 %j30};
*   &net7 @WIRE(mode="straight") {#XMP3_2:1 #XMP3_1:3};
*   &G @WIRE(mode="straight") {%j31 #XMP3_0:2};
*   &G @WIRE(mode="straight") {%j29 %j31};
*   &S @WIRE(mode="straight") {#XMP3_0:4 %j32};
*   &S @WIRE(mode="straight") {%j30 %j32};
*   &net0 @WIRE(mode="straight") {#XMP3_1:1 #XMP3_0:3};
*   &S @WIRE(mode="straight") {%port1:p %j33};
*   &S @WIRE(mode="straight") {%j33 #XMP3_15:3};
*   &S @WIRE(mode="straight") {%j33 (5, 4) %j2};
*   &D @WIRE(mode="straight") {#XMP3_0:1 %port2:p};
*   &G @WIRE(mode="straight") {%port3:p (-4, 2) %j1};
*   #XMP3_15
*       @TEXT("\textbf{\textit{M}}_{\textbf{P3\_15}}", key="name", dx=-7.3, dy=0, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XMP3_15::name(label);
*   #XMP3_14
*       @TEXT("\textbf{\textit{M}}_{\textbf{P3\_14}}", key="name", dx=-7.3, dy=0, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XMP3_14::name(label);
*   #XMP3_13
*       @TEXT("\textbf{\textit{M}}_{\textbf{P3\_13}}", key="name", dx=-7.3, dy=0, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XMP3_13::name(label);
*   #XMP3_12
*       @TEXT("\textbf{\textit{M}}_{\textbf{P3\_12}}", key="name", dx=-7.3, dy=0, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XMP3_12::name(label);
*   #XMP3_11
*       @TEXT("\textbf{\textit{M}}_{\textbf{P3\_11}}", key="name", dx=-7.3, dy=0, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XMP3_11::name(label);
*   #XMP3_10
*       @TEXT("\textbf{\textit{M}}_{\textbf{P3\_10}}", key="name", dx=-7.3, dy=0, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XMP3_10::name(label);
*   #XMP3_9 @TEXT("\textbf{\textit{M}}_{\textbf{P3\_9}}", key="name", dx=-7.3, dy=0, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XMP3_9::name(label);
*   #XMP3_8 @TEXT("\textbf{\textit{M}}_{\textbf{P3\_8}}", key="name", dx=-7.3, dy=0, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XMP3_8::name(label);
*   #XMP3_7 @TEXT("\textbf{\textit{M}}_{\textbf{P3\_7}}", key="name", dx=-7.3, dy=0, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XMP3_7::name(label);
*   #XMP3_6 @TEXT("\textbf{\textit{M}}_{\textbf{P3\_6}}", key="name", dx=-7.3, dy=0, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XMP3_6::name(label);
*   #XMP3_5 @TEXT("\textbf{\textit{M}}_{\textbf{P3\_5}}", key="name", dx=-7.3, dy=0, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XMP3_5::name(label);
*   #XMP3_4 @TEXT("\textbf{\textit{M}}_{\textbf{P3\_4}}", key="name", dx=-7.3, dy=0, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XMP3_4::name(label);
*   #XMP3_3 @TEXT("\textbf{\textit{M}}_{\textbf{P3\_3}}", key="name", dx=-7.3, dy=0, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XMP3_3::name(label);
*   #XMP3_2 @TEXT("\textbf{\textit{M}}_{\textbf{P3\_2}}", key="name", dx=-7.3, dy=0, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XMP3_2::name(label);
*   #XMP3_1 @TEXT("\textbf{\textit{M}}_{\textbf{P3\_1}}", key="name", dx=-7.3, dy=0, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XMP3_1::name(label);
*   #XMP3_0 @TEXT("\textbf{\textit{M}}_{\textbf{P3\_0}}", key="name", dx=-7.3, dy=0, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XMP3_0::name(label)
* }
.ends PMOS_16_Series_Stack_MP3

.subckt Geometry_Compensated_All_MOS_Current_Reference VSS
CC net1 B 10p
XMN1 B C VSS VSS sky130_fd_pr__nfet_g5v0d10v5 l=3 w=5 nf=1 m=16 ad=1.5 as=1.5 pd=10.6 ps=10.6
XMN10 SU C VSS VSS sky130_fd_pr__nfet_g5v0d10v5 l=1 w=100 nf=1 m=10 ad=30 as=30 pd=200.6 ps=200.6
XMN11 A SU VSS VSS sky130_fd_pr__nfet_g5v0d10v5 l=8 w=1 nf=1 m=1 ad=0.3 as=0.3 pd=2.6 ps=2.6
XMN2 C C VSS VSS sky130_fd_pr__nfet_g5v0d10v5 l=3 w=5 nf=1 m=16 ad=1.5 as=1.5 pd=10.6 ps=10.6
XMN3 A B VSS VSS sky130_fd_pr__nfet_g5v0d10v5 l=3 w=5 nf=1 m=4 ad=1.5 as=1.5 pd=10.6 ps=10.6
XMP10 SU C net0 VDD sky130_fd_pr__pfet_g5v0d10v5 l=8 w=1 nf=1 m=1 ad=0.3 as=0.3 pd=2.6 ps=2.6
XMP4 U6 U6 VDD VDD sky130_fd_pr__pfet_g5v0d10v5 l=0.5 w=5 nf=1 m=48 ad=1.5 as=1.5 pd=10.6 ps=10.6
XMP5 U5 U5 VDD VDD sky130_fd_pr__pfet_g5v0d10v5 l=0.5 w=5 nf=1 m=16 ad=1.5 as=1.5 pd=10.6 ps=10.6
XMP6 U9 U9 VDD VDD sky130_fd_pr__pfet_g5v0d10v5 l=0.5 w=5 nf=1 m=4 ad=1.5 as=1.5 pd=10.6 ps=10.6
RC A net1 100k
RLIM VDD net0 500meg
XMP1 U6 B A PMOS_16_Series_Stack_MP1
XMP2 U5 C A PMOS_16_Series_Stack_MP2
XMP3 U9 A A PMOS_16_Series_Stack_MP3
* @RNL(author="analog-canvas") {
*   $CANVAS_TYPESETTING @ATTACH #(level);
*   $SUPPLY @ATTACH &VDD(p) => @SET-SYMBOL $SUPPLY_SYMBOL => @PLACE(20, 4.5) => @ORIENT("R0") => %vdd1;
*   #XMP5 @SET-SYMBOL $PMOS => @PLACE(6, 0) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="MP5") #XMP5(part);
*   $CANVAS_PARAMETER_TEXT @ATTACH(name="l", text="0.5u") #XMP5(part);
*   #XMP2 @PLACE(7, -11) => @ORIENT("MY");
*   #XMP4 @SET-SYMBOL $PMOS => @PLACE(20, 0) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="MP4") #XMP4(part);
*   $CANVAS_PARAMETER_TEXT @ATTACH(name="l", text="0.5u") #XMP4(part);
*   #XMP1 @PLACE(21, -11) => @ORIENT("MY");
*   #XMP6 @SET-SYMBOL $PMOS => @PLACE(34, 0) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="MP6") #XMP6(part);
*   $CANVAS_PARAMETER_TEXT @ATTACH(name="l", text="0.5u") #XMP6(part);
*   #XMP3 @PLACE(33, -11) => @ORIENT("R0");
*   #XMN2 @SET-SYMBOL $NMOS => @PLACE(6, -26) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="MN2") #XMN2(part);
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(6, -28.9) => @ORIENT("R0") => %gnd1;
*   #XMN1 @SET-SYMBOL $NMOS => @PLACE(20, -26) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="MN1") #XMN1(part);
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(20, -28.9) => @ORIENT("R0") => %gnd2;
*   #XMN3 @SET-SYMBOL $NMOS => @PLACE(34, -26) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="MN3") #XMN3(part);
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(34, -28.9) => @ORIENT("R0") => %gnd3;
*   #RC @SET-SYMBOL $RESISTOR => @PLACE(29.4, -19.6) => @ORIENT("R270");
*   #CC @SET-SYMBOL $CAPACITOR => @PLACE(24, -19.6) => @ORIENT("R270");
*   #XMP10 @SET-SYMBOL $PMOS => @PLACE(-6.3, -7.2) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="MP10") #XMP10(part);
*   #XMN10 @SET-SYMBOL $NMOS => @PLACE(-6.3, -13.6) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="MN10") #XMN10(part);
*   #XMN11 @SET-SYMBOL $NMOS => @PLACE(-13.3, -10) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="MN11") #XMN11(part);
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(-6.3, -16.9) => @ORIENT("R0") => %gnd4;
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(-13.3, -13.3) => @ORIENT("R0") => %gnd5;
*   #RLIM @SET-SYMBOL $RESISTOR => @PLACE(-6.3, -2.8) => @ORIENT("R0");
*   &VSS @REMOVE-FROM $PORT_FILL_SET;
*   %j1 = (20, 4);
*   $JUNCTION @ATTACH %j1;
*   %j2 = (6, -3.4);
*   $JUNCTION @ATTACH %j2;
*   %j3 = (20, -3.4);
*   $JUNCTION @ATTACH %j3;
*   %j4 = (34, -3.4);
*   $JUNCTION @ATTACH %j4;
*   %j5 = (6, -23);
*   $JUNCTION @ATTACH %j5;
*   %j6 = (20, -23);
*   $JUNCTION @ATTACH %j6;
*   %j7 = (34, -18);
*   $JUNCTION @ATTACH %j7;
*   %j8 = (13, -26);
*   $JUNCTION @ATTACH %j8;
*   %j9 = (11, -4.6);
*   %j10 = (25, -4.6);
*   $JUNCTION @ATTACH %j10;
*   %j11 = (29, -4.6);
*   %j12 = (34, -19.6);
*   $JUNCTION @ATTACH %j12;
*   %j13 = (20, -19.6);
*   $JUNCTION @ATTACH %j13;
*   %j14 = (-6.3, -10);
*   $JUNCTION @ATTACH %j14;
*   %j15 = (-2.8, -10);
*   &VDD @WIRE(mode="straight") {%vdd1:p %j1};
*   &VDD @WIRE(mode="straight") {%j1 (6, 4) #XMP5:3};
*   &U5 @WIRE(mode="straight") {#XMP5:1 %j2};
*   &U5 @WIRE(mode="straight") {%j2 (10.6, -3.4) (10.6, 0) #XMP5:2};
*   &U5 @WIRE(mode="straight") {%j2 #XMP2:1};
*   &VDD @WIRE(mode="straight") {%j1 #XMP4:3};
*   &U6 @WIRE(mode="straight") {#XMP4:1 %j3};
*   &U6 @WIRE(mode="straight") {%j3 (24.6, -3.4) (24.6, 0) #XMP4:2};
*   &U6 @WIRE(mode="straight") {%j3 #XMP1:1};
*   &VDD @WIRE(mode="straight") {%j1 (34, 4) #XMP6:3};
*   &U9 @WIRE(mode="straight") {#XMP6:1 %j4};
*   &U9 @WIRE(mode="straight") {%j4 (38.6, -3.4) (38.6, 0) #XMP6:2};
*   &U9 @WIRE(mode="straight") {%j4 #XMP3:1};
*   &VSS @WIRE(mode="straight") {#XMN2:3 %gnd1:p};
*   &VSS @WIRE(mode="straight") {#XMN1:3 %gnd2:p};
*   &VSS @WIRE(mode="straight") {#XMN3:3 %gnd3:p};
*   &C @WIRE(mode="straight") {#XMP2:2 %j5};
*   &C @WIRE(mode="straight") {%j5 #XMN2:1};
*   &B @WIRE(mode="straight") {#XMP1:2 %j6};
*   &B @WIRE(mode="straight") {%j6 #XMN1:1};
*   &A @WIRE(mode="straight") {#XMP3:2 %j7};
*   &A @WIRE(mode="straight") {%j7 #XMN3:1};
*   &C @WIRE(mode="straight") {%j5 (13, -23) %j8};
*   &C @WIRE(mode="straight") {#XMN2:2 %j8};
*   &C @WIRE(mode="straight") {%j8 #XMN1:2};
*   &A @WIRE(mode="straight") {%j9 #XMP2:3};
*   &A @WIRE(mode="straight") {%j10 #XMP1:3};
*   &A @WIRE(mode="straight") {%j9 %j10};
*   &A @WIRE(mode="straight") {%j10 %j11};
*   &A @WIRE(mode="straight") {%j11 #XMP3:3};
*   &A @WIRE(mode="straight") {%j7 (29, -18) #XMP3:3};
*   &B @WIRE(mode="straight") {%j6 (28.5, -23) (28.5, -26) #XMN3:2};
*   &A @WIRE(mode="straight") {%j12 #RC:1};
*   &net1 @WIRE(mode="straight") {#RC:2 #CC:1};
*   &B @WIRE(mode="straight") {#CC:2 %j13};
*   &SU @WIRE(mode="straight") {#XMP10:1 %j14};
*   &SU @WIRE(mode="straight") {%j14 #XMN10:1};
*   &SU @WIRE(mode="straight") {%j14 #XMN11:2};
*   &C @WIRE(mode="straight") {%j15 (-2.8, -7.2) #XMP10:2};
*   &C @WIRE(mode="straight") {%j15 (-2.8, -13.6) #XMN10:2};
*   &C @WIRE(mode="straight") {%j15 (-2.8, -23) %j5};
*   &VDD @WIRE(mode="straight") {%j1 (-6.3, 4) #RLIM:1};
*   &VSS @WIRE(mode="straight") {#XMN10:3 %gnd4:p};
*   &VSS @WIRE(mode="straight") {#XMN11:3 %gnd5:p};
*   &net0 @WIRE(mode="straight") {#RLIM:2 #XMP10:3};
*   $JUNCTION @ATTACH (29, -11)(p) => %dot1;
*   #XMP5 @TEXT("\textbf{\textit{M}}_{\textbf{P5}}", key="name", dx=-0.8, dy=0.8, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XMP5::name(label);
*   #XMP2 @TEXT("\textbf{\textit{X}}_{\textbf{MP2}}", key="name", dx=-4, dy=0.9, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XMP2::name(label);
*   #XMP4 @TEXT("\textbf{\textit{M}}_{\textbf{P4}}", key="name", dx=-0.8, dy=0.8, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XMP4::name(label);
*   #XMP1 @TEXT("\textbf{\textit{X}}_{\textbf{MP1}}", key="name", dx=-4, dy=0.9, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XMP1::name(label);
*   #XMP6 @TEXT("\textbf{\textit{M}}_{\textbf{P6}}", key="name", dx=-0.8, dy=0.8, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XMP6::name(label);
*   #XMP3 @TEXT("\textbf{\textit{X}}_{\textbf{MP3}}", key="name", dx=4, dy=0.9, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XMP3::name(label);
*   #XMN2 @TEXT("\textbf{\textit{M}}_{\textbf{N2}}", key="name", dx=-0.8, dy=-0.2, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XMN2::name(label);
*   #XMN1 @TEXT("\textbf{\textit{M}}_{\textbf{N1}}", key="name", dx=0.8, dy=-0.2, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XMN1::name(label);
*   #XMN3 @TEXT("\textbf{\textit{M}}_{\textbf{N3}}", key="name", dx=0.8, dy=-0.2, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XMN3::name(label);
*   #RC @TEXT("\textbf{\textit{R}}_{\textbf{C}}", key="name", dx=0, dy=-2.5, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #RC::name(label);
*   #CC @TEXT("\textbf{\textit{C}}_{\textbf{C}}", key="name", dx=0, dy=-2.5, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #CC::name(label);
*   #XMP10 @TEXT("\textbf{\textit{M}}_{\textbf{P10}}", key="name", dx=-0.8, dy=0.1, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XMP10::name(label);
*   #XMN10 @TEXT("\textbf{\textit{M}}_{\textbf{N10}}", key="name", dx=-0.8, dy=0, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XMN10::name(label);
*   #XMN11 @TEXT("\textbf{\textit{M}}_{\textbf{N11}}", key="name", dx=-0.8, dy=0, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XMN11::name(label);
*   #RLIM @TEXT("\textbf{\textit{R}}_{\textbf{LIM}}", key="name", dx=-1.3, dy=0, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #RLIM::name(label);
*   &SU @TEXT("\textbf{SU}", halign="end", size=1.5116) => @PLACE(-7.2, -9.1) => %label1;
*   $CANVAS_LABEL @ATTACH(bind="net") %label1(label);
*   &A @TEXT("\textbf{\textit{A}}", size=1.5116) => @PLACE(-13.3, -7.1) => %label2;
*   $CANVAS_LABEL @ATTACH(bind="net") %label2(label);
*   &VDD @TEXT("\textbf{\textit{V}}_{\textbf{DD}}", size=1.5116) => @PLACE(21.7, 6.3) => %power1;
*   $CANVAS_LABEL @ATTACH(bind="net") %power1(label);
*   &U5 @TEXT("\textbf{\textit{U}}_{\textbf{5}}", halign="end", size=1.5116) => @PLACE(5, -3.4) => %label3;
*   $CANVAS_LABEL @ATTACH(bind="net") %label3(label);
*   &U6 @TEXT("\textbf{\textit{U}}_{\textbf{6}}", halign="end", size=1.5116) => @PLACE(19, -3.4) => %label4;
*   $CANVAS_LABEL @ATTACH(bind="net") %label4(label);
*   &U9 @TEXT("\textbf{\textit{U}}_{\textbf{9}}", halign="end", size=1.5116) => @PLACE(33, -3.4) => %label5;
*   $CANVAS_LABEL @ATTACH(bind="net") %label5(label);
*   &C @TEXT("\textbf{\textit{C}}", halign="end", size=1.5116) => @PLACE(4.8, -22.5) => %label6;
*   $CANVAS_LABEL @ATTACH(bind="net") %label6(label);
*   &B @TEXT("\textbf{\textit{B}}", halign="end", size=1.5116) => @PLACE(19, -22.9) => %label7;
*   $CANVAS_LABEL @ATTACH(bind="net") %label7(label);
*   &A @TEXT("\textbf{\textit{A}}", size=1.5116) => @PLACE(35.4, -18) => %label8;
*   $CANVAS_LABEL @ATTACH(bind="net") %label8(label);
*   (3, -12) @TEXT("N=16", halign="end", size=1.1337, bold=true) => %text1;
*   $CANVAS_TYPOGRAPHY @ATTACH(token="label") %text1(text);
*   (17, -12) @TEXT("N=16", halign="end", size=1.1337, bold=true) => %text2;
*   $CANVAS_TYPOGRAPHY @ATTACH(token="label") %text2(text);
*   (37, -12) @TEXT("N=16", size=1.1337, bold=true) => %text3;
*   $CANVAS_TYPOGRAPHY @ATTACH(token="label") %text3(text)
* }
.ends Geometry_Compensated_All_MOS_Current_Reference
