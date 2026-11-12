
* @RNL(type="header") {
*   @VERSION("0.3");
*   @USE-PACKAGE(name="rnl-std", version="0.3");
*   @USE-PACKAGE(name="rnl-std-no-labels", version="0.3");
*   @USE-PACKAGE(name="analog-canvas-extensions", version="0.6")
* }
.subckt sw_mux VDD VSS I O EN ENB
XMNM0 I EN O VSS sky130_fd_pr__nfet_01v8 l=1 w=2 nf=1 m=20
XMNM1 O ENB I VDD sky130_fd_pr__pfet_01v8 l=1 w=2 nf=1 m=40
* @RNL(author="analog-canvas") {
*   %sw_mux_SYMBOL = @DEFINE-SYMBOL(box=[-5, -5, 5, 5]) {
*     (-5, 0) @PIN(terminal="I", label="\textbf{\textit{I}}", direction="left");
*     (5, 0) @PIN(terminal="O", label="\textbf{\textit{O}}", direction="right");
*     (-2, 5) @PIN(terminal="EN", label="\textbf{\textit{EN}}", direction="up");
*     (2, 5) @PIN(terminal="ENB", label="\textbf{\textit{ENB}}", direction="up");
*     (0, 0) @RECTANGLE(width=8, height=8);
*     @LINE {(-5, 0) (-4, 0)};
*     @LINE {(5, 0) (4, 0)};
*     @LINE {(-2, 5) (-2, 4)};
*     @LINE {(2, 5) (2, 4)}
*   };
*   # @SET-SYMBOL %sw_mux_SYMBOL;
*   $CANVAS_TYPESETTING @ATTACH(subscript_italic=false) #(level);
*   #XMNM0 @SET-SYMBOL $NMOS => @PLACE(0, -1) => @ORIENT("MYR90");
*   $CANVAS_NAME @ATTACH(name="MNM0") #XMNM0(part);
*   #XMNM1 @SET-SYMBOL $PMOS => @PLACE(0, -5) => @ORIENT("R90");
*   $CANVAS_NAME @ATTACH(name="MNM1") #XMNM1(part);
*   $IO_PORT @ATTACH &I(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(-8, -3) => @ORIENT("R0") => %port1;
*   $IO_PORT @ATTACH &O(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(8, -3) => @ORIENT("MY") => %port2;
*   $IO_PORT @ATTACH &EN(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(0, 5) => @ORIENT("R270") => %port3;
*   $IO_PORT @ATTACH &ENB(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(0, -11) => @ORIENT("R90") => %port4;
*   &VDD @REMOVE-FROM $PORT_FILL_SET;
*   &VSS @REMOVE-FROM $PORT_FILL_SET;
*   %j1 = (-4, -3);
*   $JUNCTION @ATTACH %j1;
*   %j2 = (4, -3);
*   $JUNCTION @ATTACH %j2;
*   &I @WIRE(mode="straight") {%port1:p %j1};
*   &I @WIRE(mode="straight") {%j1 (-4, -1) #XMNM0:1};
*   &I @WIRE(mode="straight") {#XMNM1:3 (-4, -5) %j1};
*   &O @WIRE(mode="straight") {%port2:p %j2};
*   &O @WIRE(mode="straight") {%j2 (4, -1) #XMNM0:3};
*   &O @WIRE(mode="straight") {#XMNM1:1 (4, -5) %j2};
*   &EN @WIRE(mode="straight") {%port3:p #XMNM0:2};
*   &ENB @WIRE(mode="straight") {%port4:p #XMNM1:2};
*   #XMNM0 @TEXT("\textbf{\textit{M}}_{\textbf{NM0}}", key="name", dx=1.2, dy=4, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XMNM0::name(label);
*   #XMNM1 @TEXT("\textbf{\textit{M}}_{\textbf{NM1}}", key="name", dx=1.2, dy=-4.8, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #XMNM1::name(label);
*   %port1 @TEXT("\textbf{\textit{I}}", key="name", dx=-2, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port1::name(label);
*   %port2 @TEXT("\textbf{\textit{O}}", key="name", dx=2, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port2::name(label);
*   %port3 @TEXT("\textbf{\textit{EN}}", key="name", dx=0, dy=1.9, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port3::name(label);
*   %port4 @TEXT("\textbf{\textit{ENB}}", key="name", dx=0, dy=-2.8, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port4::name(label)
* }
.ends sw_mux

.subckt IVD2A VDD VSS A Y
Xmn0 Y A VSS VSS sky130_fd_pr__nfet_01v8 l=0.15 w=0.76 nf=1 m=2
Xmp0 Y A VDD VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1.13 nf=1 m=2
* @RNL(author="analog-canvas") {
*   %IVD2A_SYMBOL = @DEFINE-SYMBOL(box=[-5, -4, 5, 4]) {
*     (0, 4) @PIN(terminal="VDD", label="\textbf{\textit{V}}_{\textbf{DD}}", direction="up");
*     (-5, -1) @PIN(terminal="A", label="\textbf{\textit{A}}", direction="left");
*     (5, -1) @PIN(terminal="Y", label="\textbf{\textit{Y}}", direction="right");
*     (0, 0) @RECTANGLE(width=8, height=6);
*     @LINE {(0, 4) (0, 3)};
*     @LINE {(-5, -1) (-4, -1)};
*     @LINE {(5, -1) (4, -1)}
*   };
*   # @SET-SYMBOL %IVD2A_SYMBOL;
*   $CANVAS_TYPESETTING @ATTACH(subscript_italic=false) #(level);
*   #Xmp0 @SET-SYMBOL $PMOS => @PLACE(1, 4) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="mp0") #Xmp0(part);
*   $CANVAS_PARAMETER_TEXT @ATTACH(name="l", text="0.15u") #Xmp0(part);
*   #Xmn0 @SET-SYMBOL $NMOS => @PLACE(1, -4) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="mn0") #Xmn0(part);
*   $CANVAS_PARAMETER_TEXT @ATTACH(name="l", text="0.15u") #Xmn0(part);
*   $CANVAS_PARAMETER_TEXT @ATTACH(name="w", text="0.76u") #Xmn0(part);
*   $SUPPLY @ATTACH &VDD(p) => @SET-SYMBOL $SUPPLY_SYMBOL => @PLACE(1, 6) => @ORIENT("R0") => %vdd1;
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(1, -6) => @ORIENT("R0") => %gnd1;
*   $IO_PORT @ATTACH &A(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(-6, 0) => @ORIENT("R0") => %port1;
*   $IO_PORT @ATTACH &Y(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(6, 0) => @ORIENT("MY") => %port2;
*   &VDD @REMOVE-FROM $PORT_FILL_SET;
*   &VSS @REMOVE-FROM $PORT_FILL_SET;
*   %j1 = (-2, 0);
*   $JUNCTION @ATTACH %j1;
*   %j2 = (1, 0);
*   $JUNCTION @ATTACH %j2;
*   &A @WIRE(mode="straight") {#Xmp0:2 %j1};
*   &A @WIRE(mode="straight") {%j1 #Xmn0:2};
*   &A @WIRE(mode="straight") {%port1:p %j1};
*   &Y @WIRE(mode="straight") {#Xmp0:1 %j2};
*   &Y @WIRE(mode="straight") {%j2 #Xmn0:1};
*   &Y @WIRE(mode="straight") {%port2:p %j2};
*   &VDD @WIRE(mode="straight") {#Xmp0:3 %vdd1:p};
*   &VSS @WIRE(mode="straight") {%gnd1:p #Xmn0:3};
*   #Xmp0 @TEXT("\textbf{\textit{m}}_{\textbf{p0}}", key="name", dx=0.4, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #Xmp0::name(label);
*   #Xmn0 @TEXT("\textbf{\textit{m}}_{\textbf{n0}}", key="name", dx=0.5, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #Xmn0::name(label);
*   %vdd1 @TEXT("\textbf{\textit{V}}_{\textbf{DD}}", dx=2, dy=1, size=1.5116) => %power1;
*   $CANVAS_LABEL @ATTACH(bind="port") %power1(label);
*   %port1 @TEXT("\textbf{\textit{A}}", key="name", dx=-2, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port1::name(label);
*   %port2 @TEXT("\textbf{\textit{Y}}", key="name", dx=2, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port2::name(label)
* }
.ends IVD2A

.subckt input_mux_8to1 VDD VSS VIN_0_ VIN_1_ VIN_2_ VIN_3_ VIN_4_ VIN_5_ VIN_6_ VIN_7_ VO S_0_ S_1_
+ S_2_
X0 VDD VSS VIN_7_ net5 S_0_ SB_0_ sw_mux
X10 VDD VSS VIN_1_ net4 S_0_ SB_0_ sw_mux
X11 VDD VSS VIN_0_ net4 SB_0_ S_0_ sw_mux
X12 VDD VSS net5 net3 S_1_ SB_1_ sw_mux
X13 VDD VSS net0 net3 SB_1_ S_1_ sw_mux
X14 VDD VSS net4 net2 SB_1_ S_1_ sw_mux
X15 VDD VSS net1 net2 S_1_ SB_1_ sw_mux
X16 VDD VSS net3 VO S_2_ SB_2_ sw_mux
X17 VDD VSS net2 VO SB_2_ S_2_ sw_mux
X20 VDD VSS S_0_ SB_0_ IVD2A
X21 VDD VSS S_1_ SB_1_ IVD2A
X22 VDD VSS S_2_ SB_2_ IVD2A
X3 VDD VSS VIN_6_ net5 SB_0_ S_0_ sw_mux
X6 VDD VSS VIN_5_ net0 S_0_ SB_0_ sw_mux
X7 VDD VSS VIN_4_ net0 SB_0_ S_0_ sw_mux
X8 VDD VSS VIN_3_ net1 S_0_ SB_0_ sw_mux
X9 VDD VSS VIN_2_ net1 SB_0_ S_0_ sw_mux
* @RNL(author="analog-canvas") {
*   %input_mux_8to1_SYMBOL = @DEFINE-SYMBOL(box=[-7, -14, 7, 14]) {
*     (-7, 3) @PIN(terminal="VIN_0_", label="\textbf{\textit{VIN<0>}}", direction="left");
*     (-7, 1) @PIN(terminal="VIN_1_", label="\textbf{\textit{VIN<1>}}", direction="left");
*     (-7, -1) @PIN(terminal="VIN_2_", label="\textbf{\textit{VIN<2>}}", direction="left");
*     (-7, -3) @PIN(terminal="VIN_3_", label="\textbf{\textit{VIN<3>}}", direction="left");
*     (-7, -5) @PIN(terminal="VIN_4_", label="\textbf{\textit{VIN<4>}}", direction="left");
*     (-7, -7) @PIN(terminal="VIN_5_", label="\textbf{\textit{VIN<5>}}", direction="left");
*     (-7, -9) @PIN(terminal="VIN_6_", label="\textbf{\textit{VIN<6>}}", direction="left");
*     (-7, -11) @PIN(terminal="VIN_7_", label="\textbf{\textit{VIN<7>}}", direction="left");
*     (7, -2) @PIN(terminal="VO", label="\textbf{\textit{V}}_{\textbf{O}}", direction="right");
*     (-7, 7) @PIN(terminal="S_0_", label="\textbf{\textit{S<0>}}", direction="left");
*     (-7, 9) @PIN(terminal="VDD", label="\textbf{\textit{V}}_{\textbf{DD}}", direction="left");
*     (-7, 5) @PIN(terminal="S_1_", label="\textbf{\textit{S<1>}}", direction="left");
*     (7, 0) @PIN(terminal="S_2_", label="\textbf{\textit{S<2>}}", direction="right");
*     (0, 0) @RECTANGLE(width=12, height=26);
*     @LINE {(-7, 3) (-6, 3)};
*     @LINE {(-7, 1) (-6, 1)};
*     @LINE {(-7, -1) (-6, -1)};
*     @LINE {(-7, -3) (-6, -3)};
*     @LINE {(-7, -5) (-6, -5)};
*     @LINE {(-7, -7) (-6, -7)};
*     @LINE {(-7, -9) (-6, -9)};
*     @LINE {(-7, -11) (-6, -11)};
*     @LINE {(7, -2) (6, -2)};
*     @LINE {(-7, 7) (-6, 7)};
*     @LINE {(-7, 9) (-6, 9)};
*     @LINE {(-7, 5) (-6, 5)};
*     @LINE {(7, 0) (6, 0)}
*   };
*   # @SET-SYMBOL %input_mux_8to1_SYMBOL;
*   $CANVAS_TYPESETTING @ATTACH(subscript_italic=false) #(level);
*   #X11 @PLACE(0, 0) => @ORIENT("R0");
*   #X10 @PLACE(0, -16) => @ORIENT("R0");
*   #X9 @PLACE(0, -32) => @ORIENT("R0");
*   #X8 @PLACE(0, -48) => @ORIENT("R0");
*   #X7 @PLACE(0, -64) => @ORIENT("R0");
*   #X6 @PLACE(0, -80) => @ORIENT("R0");
*   #X3 @PLACE(0, -96) => @ORIENT("R0");
*   #X0 @PLACE(0, -112) => @ORIENT("R0");
*   #X14 @PLACE(26, -8) => @ORIENT("R0");
*   #X15 @PLACE(26, -40) => @ORIENT("R0");
*   #X13 @PLACE(26, -72) => @ORIENT("R0");
*   #X12 @PLACE(26, -104) => @ORIENT("R0");
*   #X17 @PLACE(52, -24) => @ORIENT("R0");
*   #X16 @PLACE(52, -88) => @ORIENT("R0");
*   #X20 @PLACE(0, 20) => @ORIENT("R0");
*   #X21 @PLACE(30, 20) => @ORIENT("R0");
*   #X22 @PLACE(60, 20) => @ORIENT("R0");
*   $IO_PORT @ATTACH &VIN_0_(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(-11, 0) => @ORIENT("R0") => %port1;
*   $IO_PORT @ATTACH &VIN_1_(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(-11, -16) => @ORIENT("R0") => %port2;
*   $IO_PORT @ATTACH &VIN_2_(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(-11, -32) => @ORIENT("R0") => %port3;
*   $IO_PORT @ATTACH &VIN_3_(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(-11, -48) => @ORIENT("R0") => %port4;
*   $IO_PORT @ATTACH &VIN_4_(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(-11, -64) => @ORIENT("R0") => %port5;
*   $IO_PORT @ATTACH &VIN_5_(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(-11, -80) => @ORIENT("R0") => %port6;
*   $IO_PORT @ATTACH &VIN_6_(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(-11, -96) => @ORIENT("R0") => %port7;
*   $IO_PORT @ATTACH &VIN_7_(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(-11, -112) => @ORIENT("R0") => %port8;
*   $IO_PORT @ATTACH &VO(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(70, -56) => @ORIENT("MY") => %port9;
*   $IO_PORT @ATTACH &S_0_(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(-10, 19) => @ORIENT("R0") => %port10;
*   $SUPPLY @ATTACH &VDD(p) => @SET-SYMBOL $SUPPLY_SYMBOL => @PLACE(0, 24) => @ORIENT("R0") => %vdd1;
*   $IO_PORT @ATTACH &S_1_(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(20, 19) => @ORIENT("R0") => %port11;
*   $SUPPLY @ATTACH &VDD(p) => @SET-SYMBOL $SUPPLY_SYMBOL => @PLACE(30, 24) => @ORIENT("R0") => %vdd2;
*   $IO_PORT @ATTACH &S_2_(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(50, 19) => @ORIENT("R0") => %port12;
*   $SUPPLY @ATTACH &VDD(p) => @SET-SYMBOL $SUPPLY_SYMBOL => @PLACE(60, 24) => @ORIENT("R0") => %vdd3;
*   &VDD @REMOVE-FROM $PORT_FILL_SET;
*   &VSS @REMOVE-FROM $PORT_FILL_SET;
*   %j1 = (-5, 7);
*   %j2 = (5, 7);
*   %j3 = (-5, -9);
*   %j4 = (5, -9);
*   %j5 = (-5, -25);
*   %j6 = (5, -25);
*   %j7 = (-5, -41);
*   %j8 = (5, -41);
*   %j9 = (-5, -57);
*   %j10 = (5, -57);
*   %j11 = (-5, -73);
*   %j12 = (5, -73);
*   %j13 = (-5, -89);
*   %j14 = (5, -89);
*   %j15 = (-5, -105);
*   %j16 = (5, -105);
*   %j17 = (21, -1);
*   %j18 = (31, -1);
*   %j19 = (21, -33);
*   %j20 = (31, -33);
*   %j21 = (21, -65);
*   %j22 = (31, -65);
*   %j23 = (21, -97);
*   %j24 = (31, -97);
*   %j25 = (47, -17);
*   %j26 = (57, -17);
*   %j27 = (47, -81);
*   %j28 = (57, -81);
*   %j29 = (10, -8);
*   $JUNCTION @ATTACH %j29;
*   %j30 = (10, -40);
*   $JUNCTION @ATTACH %j30;
*   %j31 = (10, -72);
*   $JUNCTION @ATTACH %j31;
*   %j32 = (10, -104);
*   $JUNCTION @ATTACH %j32;
*   %j33 = (36, -24);
*   $JUNCTION @ATTACH %j33;
*   %j34 = (36, -88);
*   $JUNCTION @ATTACH %j34;
*   %j35 = (62, -56);
*   $JUNCTION @ATTACH %j35;
*   %j36 = (10, 19);
*   %j37 = (40, 19);
*   %j38 = (70, 19);
*   &SB_0_ @WIRE(mode="straight") {#X11:5 (-2, 7) %j1} => %wire1;
*   &S_0_ @WIRE(mode="straight") {#X11:6 (2, 7) %j2} => %wire2;
*   &S_0_ @WIRE(mode="straight") {#X10:5 (-2, -9) %j3} => %wire3;
*   &SB_0_ @WIRE(mode="straight") {#X10:6 (2, -9) %j4} => %wire4;
*   &SB_0_ @WIRE(mode="straight") {#X9:5 (-2, -25) %j5} => %wire5;
*   &S_0_ @WIRE(mode="straight") {#X9:6 (2, -25) %j6} => %wire6;
*   &S_0_ @WIRE(mode="straight") {#X8:5 (-2, -41) %j7} => %wire7;
*   &SB_0_ @WIRE(mode="straight") {#X8:6 (2, -41) %j8} => %wire8;
*   &SB_0_ @WIRE(mode="straight") {#X7:5 (-2, -57) %j9} => %wire9;
*   &S_0_ @WIRE(mode="straight") {#X7:6 (2, -57) %j10} => %wire10;
*   &S_0_ @WIRE(mode="straight") {#X6:5 (-2, -73) %j11} => %wire11;
*   &SB_0_ @WIRE(mode="straight") {#X6:6 (2, -73) %j12} => %wire12;
*   &SB_0_ @WIRE(mode="straight") {#X3:5 (-2, -89) %j13} => %wire13;
*   &S_0_ @WIRE(mode="straight") {#X3:6 (2, -89) %j14} => %wire14;
*   &S_0_ @WIRE(mode="straight") {#X0:5 (-2, -105) %j15} => %wire15;
*   &SB_0_ @WIRE(mode="straight") {#X0:6 (2, -105) %j16} => %wire16;
*   &SB_1_ @WIRE(mode="straight") {#X14:5 (24, -1) %j17} => %wire17;
*   &S_1_ @WIRE(mode="straight") {#X14:6 (28, -1) %j18} => %wire18;
*   &S_1_ @WIRE(mode="straight") {#X15:5 (24, -33) %j19} => %wire19;
*   &SB_1_ @WIRE(mode="straight") {#X15:6 (28, -33) %j20} => %wire20;
*   &SB_1_ @WIRE(mode="straight") {#X13:5 (24, -65) %j21} => %wire21;
*   &S_1_ @WIRE(mode="straight") {#X13:6 (28, -65) %j22} => %wire22;
*   &S_1_ @WIRE(mode="straight") {#X12:5 (24, -97) %j23} => %wire23;
*   &SB_1_ @WIRE(mode="straight") {#X12:6 (28, -97) %j24} => %wire24;
*   &SB_2_ @WIRE(mode="straight") {#X17:5 (50, -17) %j25} => %wire25;
*   &S_2_ @WIRE(mode="straight") {#X17:6 (54, -17) %j26} => %wire26;
*   &S_2_ @WIRE(mode="straight") {#X16:5 (50, -81) %j27} => %wire27;
*   &SB_2_ @WIRE(mode="straight") {#X16:6 (54, -81) %j28} => %wire28;
*   &VIN_0_ @WIRE(mode="straight") {%port1:p #X11:3};
*   &VIN_1_ @WIRE(mode="straight") {%port2:p #X10:3};
*   &VIN_2_ @WIRE(mode="straight") {%port3:p #X9:3};
*   &VIN_3_ @WIRE(mode="straight") {%port4:p #X8:3};
*   &VIN_4_ @WIRE(mode="straight") {%port5:p #X7:3};
*   &VIN_5_ @WIRE(mode="straight") {%port6:p #X6:3};
*   &VIN_6_ @WIRE(mode="straight") {%port7:p #X3:3};
*   &VIN_7_ @WIRE(mode="straight") {%port8:p #X0:3};
*   &net4 @WIRE(mode="straight") {#X11:4 (10, 0) %j29};
*   &net4 @WIRE(mode="straight") {%j29 (10, -16) #X10:4};
*   &net4 @WIRE(mode="straight") {#X14:3 %j29};
*   &net1 @WIRE(mode="straight") {#X9:4 (10, -32) %j30};
*   &net1 @WIRE(mode="straight") {%j30 (10, -48) #X8:4};
*   &net1 @WIRE(mode="straight") {#X15:3 %j30};
*   &net0 @WIRE(mode="straight") {#X7:4 (10, -64) %j31};
*   &net0 @WIRE(mode="straight") {%j31 (10, -80) #X6:4};
*   &net0 @WIRE(mode="straight") {#X13:3 %j31};
*   &net5 @WIRE(mode="straight") {#X3:4 (10, -96) %j32};
*   &net5 @WIRE(mode="straight") {%j32 (10, -112) #X0:4};
*   &net5 @WIRE(mode="straight") {#X12:3 %j32};
*   &net2 @WIRE(mode="straight") {#X14:4 (36, -8) %j33};
*   &net2 @WIRE(mode="straight") {%j33 (36, -40) #X15:4};
*   &net2 @WIRE(mode="straight") {#X17:3 %j33};
*   &net3 @WIRE(mode="straight") {#X13:4 (36, -72) %j34};
*   &net3 @WIRE(mode="straight") {%j34 (36, -104) #X12:4};
*   &net3 @WIRE(mode="straight") {#X16:3 %j34};
*   &VO @WIRE(mode="straight") {#X17:4 (62, -24) %j35};
*   &VO @WIRE(mode="straight") {%j35 (62, -88) #X16:4};
*   &VO @WIRE(mode="straight") {%port9:p %j35};
*   &S_0_ @WIRE(mode="straight") {%port10:p #X20:3};
*   &SB_0_ @WIRE(mode="straight") {#X20:4 %j36} => %wire29;
*   &S_1_ @WIRE(mode="straight") {%port11:p #X21:3};
*   &SB_1_ @WIRE(mode="straight") {#X21:4 %j37} => %wire30;
*   &S_2_ @WIRE(mode="straight") {%port12:p #X22:3};
*   &SB_2_ @WIRE(mode="straight") {#X22:4 %j38} => %wire31;
*   &VDD @WIRE(mode="straight") {%vdd2:p #X21:1};
*   &VDD @WIRE(mode="straight") {%vdd1:p #X20:1};
*   &VDD @WIRE(mode="straight") {%vdd3:p #X22:1};
*   #X11 @TEXT("\textbf{sw\_mux}", key="value", dx=0, dy=-5.5, halign="middle", valign="baseline", size=1.5116);
*   #X10 @TEXT("\textbf{sw\_mux}", key="value", dx=0, dy=-5.5, halign="middle", valign="baseline", size=1.5116);
*   #X9 @TEXT("\textbf{sw\_mux}", key="value", dx=0, dy=-5.5, halign="middle", valign="baseline", size=1.5116);
*   #X8 @TEXT("\textbf{sw\_mux}", key="value", dx=0, dy=-5.5, halign="middle", valign="baseline", size=1.5116);
*   #X7 @TEXT("\textbf{sw\_mux}", key="value", dx=0, dy=-5.5, halign="middle", valign="baseline", size=1.5116);
*   #X6 @TEXT("\textbf{sw\_mux}", key="value", dx=0, dy=-5.5, halign="middle", valign="baseline", size=1.5116);
*   #X3 @TEXT("\textbf{sw\_mux}", key="value", dx=0, dy=-5.5, halign="middle", valign="baseline", size=1.5116);
*   #X0 @TEXT("\textbf{sw\_mux}", key="value", dx=0, dy=-5.5, halign="middle", valign="baseline", size=1.5116);
*   #X14 @TEXT("\textbf{sw\_mux}", key="value", dx=0, dy=-5.5, halign="middle", valign="baseline", size=1.5116);
*   #X15 @TEXT("\textbf{sw\_mux}", key="value", dx=0, dy=-5.5, halign="middle", valign="baseline", size=1.5116);
*   #X13 @TEXT("\textbf{sw\_mux}", key="value", dx=0, dy=-5.5, halign="middle", valign="baseline", size=1.5116);
*   #X12 @TEXT("\textbf{sw\_mux}", key="value", dx=0, dy=-5.5, halign="middle", valign="baseline", size=1.5116);
*   #X17 @TEXT("\textbf{sw\_mux}", key="value", dx=0, dy=-5.5, halign="middle", valign="baseline", size=1.5116);
*   #X16 @TEXT("\textbf{sw\_mux}", key="value", dx=0, dy=-5.5, halign="middle", valign="baseline", size=1.5116);
*   #X20 @TEXT("\textbf{IVD2A}", key="value", dx=0, dy=-4.5, halign="middle", valign="baseline", size=1.5116);
*   #X21 @TEXT("\textbf{IVD2A}", key="value", dx=0, dy=-4.5, halign="middle", valign="baseline", size=1.5116);
*   #X22 @TEXT("\textbf{IVD2A}", key="value", dx=0, dy=-4.5, halign="middle", valign="baseline", size=1.5116);
*   %port1 @TEXT("\textbf{\textit{VIN<0>}}", key="name", dx=-2, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port1::name(label);
*   %port2 @TEXT("\textbf{\textit{VIN<1>}}", key="name", dx=-2, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port2::name(label);
*   %port3 @TEXT("\textbf{\textit{VIN<2>}}", key="name", dx=-2, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port3::name(label);
*   %port4 @TEXT("\textbf{\textit{VIN<3>}}", key="name", dx=-2, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port4::name(label);
*   %port5 @TEXT("\textbf{\textit{VIN<4>}}", key="name", dx=-2, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port5::name(label);
*   %port6 @TEXT("\textbf{\textit{VIN<5>}}", key="name", dx=-2, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port6::name(label);
*   %port7 @TEXT("\textbf{\textit{VIN<6>}}", key="name", dx=-2, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port7::name(label);
*   %port8 @TEXT("\textbf{\textit{VIN<7>}}", key="name", dx=-2, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port8::name(label);
*   %port9 @TEXT("\textbf{\textit{V}}_{\textbf{O}}", key="name", dx=2, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port9::name(label);
*   %port10 @TEXT("\textbf{\textit{S<0>}}", key="name", dx=-2, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port10::name(label);
*   %vdd1 @TEXT("\textbf{\textit{V}}_{\textbf{DD}}", dx=2, dy=1, size=1.5116) => %power1;
*   $CANVAS_LABEL @ATTACH(bind="port") %power1(label);
*   %port11 @TEXT("\textbf{\textit{S<1>}}", key="name", dx=-2, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port11::name(label);
*   %vdd2 @TEXT("\textbf{\textit{V}}_{\textbf{DD}}", dx=2, dy=1, size=1.5116) => %power2;
*   $CANVAS_LABEL @ATTACH(bind="port") %power2(label);
*   %port12 @TEXT("\textbf{\textit{S<2>}}", key="name", dx=-2, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port12::name(label);
*   %vdd3 @TEXT("\textbf{\textit{V}}_{\textbf{DD}}", dx=2, dy=1, size=1.5116) => %power3;
*   $CANVAS_LABEL @ATTACH(bind="port") %power3(label);
*   %wire1 @TEXT("\textbf{\textit{SB<0>}}", halign="middle", size=1.5116) => @PLACE(-5, 7.4) => %label1;
*   $CANVAS_LABEL @ATTACH(bind="net") %label1(label);
*   %wire2 @TEXT("\textbf{\textit{S<0>}}", halign="middle", size=1.5116) => @PLACE(2.2, 7.4) => %label2;
*   $CANVAS_LABEL @ATTACH(bind="net") %label2(label);
*   %wire3 @TEXT("\textbf{\textit{S<0>}}", halign="middle", size=1.5116) => @PLACE(-5, -8.6) => %label3;
*   $CANVAS_LABEL @ATTACH(bind="net") %label3(label);
*   %wire4 @TEXT("\textbf{\textit{SB<0>}}", halign="middle", size=1.5116) => @PLACE(2.2, -8.6) => %label4;
*   $CANVAS_LABEL @ATTACH(bind="net") %label4(label);
*   %wire5 @TEXT("\textbf{\textit{SB<0>}}", halign="middle", size=1.5116) => @PLACE(-5, -24.6) => %label5;
*   $CANVAS_LABEL @ATTACH(bind="net") %label5(label);
*   %wire6 @TEXT("\textbf{\textit{S<0>}}", halign="middle", size=1.5116) => @PLACE(2.2, -24.6) => %label6;
*   $CANVAS_LABEL @ATTACH(bind="net") %label6(label);
*   %wire7 @TEXT("\textbf{\textit{S<0>}}", halign="middle", size=1.5116) => @PLACE(-5, -40.6) => %label7;
*   $CANVAS_LABEL @ATTACH(bind="net") %label7(label);
*   %wire8 @TEXT("\textbf{\textit{SB<0>}}", halign="middle", size=1.5116) => @PLACE(2.2, -40.6) => %label8;
*   $CANVAS_LABEL @ATTACH(bind="net") %label8(label);
*   %wire9 @TEXT("\textbf{\textit{SB<0>}}", halign="middle", size=1.5116) => @PLACE(-5, -56.6) => %label9;
*   $CANVAS_LABEL @ATTACH(bind="net") %label9(label);
*   %wire10 @TEXT("\textbf{\textit{S<0>}}", halign="middle", size=1.5116) => @PLACE(2.2, -56.6) => %label10;
*   $CANVAS_LABEL @ATTACH(bind="net") %label10(label);
*   %wire11 @TEXT("\textbf{\textit{S<0>}}", halign="middle", size=1.5116) => @PLACE(-5, -72.6) => %label11;
*   $CANVAS_LABEL @ATTACH(bind="net") %label11(label);
*   %wire12 @TEXT("\textbf{\textit{SB<0>}}", halign="middle", size=1.5116) => @PLACE(2.2, -72.6) => %label12;
*   $CANVAS_LABEL @ATTACH(bind="net") %label12(label);
*   %wire13 @TEXT("\textbf{\textit{SB<0>}}", halign="middle", size=1.5116) => @PLACE(-5, -88.6) => %label13;
*   $CANVAS_LABEL @ATTACH(bind="net") %label13(label);
*   %wire14 @TEXT("\textbf{\textit{S<0>}}", halign="middle", size=1.5116) => @PLACE(2.2, -88.6) => %label14;
*   $CANVAS_LABEL @ATTACH(bind="net") %label14(label);
*   %wire15 @TEXT("\textbf{\textit{S<0>}}", halign="middle", size=1.5116) => @PLACE(-5, -104.6) => %label15;
*   $CANVAS_LABEL @ATTACH(bind="net") %label15(label);
*   %wire16 @TEXT("\textbf{\textit{SB<0>}}", halign="middle", size=1.5116) => @PLACE(2.2, -104.6) => %label16;
*   $CANVAS_LABEL @ATTACH(bind="net") %label16(label);
*   %wire17 @TEXT("\textbf{\textit{SB<1>}}", halign="middle", size=1.5116) => @PLACE(21, -0.6) => %label17;
*   $CANVAS_LABEL @ATTACH(bind="net") %label17(label);
*   %wire18 @TEXT("\textbf{\textit{S<1>}}", halign="middle", size=1.5116) => @PLACE(28.2, -0.6) => %label18;
*   $CANVAS_LABEL @ATTACH(bind="net") %label18(label);
*   %wire19 @TEXT("\textbf{\textit{S<1>}}", halign="middle", size=1.5116) => @PLACE(21, -32.6) => %label19;
*   $CANVAS_LABEL @ATTACH(bind="net") %label19(label);
*   %wire20 @TEXT("\textbf{\textit{SB<1>}}", halign="middle", size=1.5116) => @PLACE(28.2, -32.6) => %label20;
*   $CANVAS_LABEL @ATTACH(bind="net") %label20(label);
*   %wire21 @TEXT("\textbf{\textit{SB<1>}}", halign="middle", size=1.5116) => @PLACE(21, -64.6) => %label21;
*   $CANVAS_LABEL @ATTACH(bind="net") %label21(label);
*   %wire22 @TEXT("\textbf{\textit{S<1>}}", halign="middle", size=1.5116) => @PLACE(28.2, -64.6) => %label22;
*   $CANVAS_LABEL @ATTACH(bind="net") %label22(label);
*   %wire23 @TEXT("\textbf{\textit{S<1>}}", halign="middle", size=1.5116) => @PLACE(21, -96.6) => %label23;
*   $CANVAS_LABEL @ATTACH(bind="net") %label23(label);
*   %wire24 @TEXT("\textbf{\textit{SB<1>}}", halign="middle", size=1.5116) => @PLACE(28.2, -96.6) => %label24;
*   $CANVAS_LABEL @ATTACH(bind="net") %label24(label);
*   %wire25 @TEXT("\textbf{\textit{SB<2>}}", halign="middle", size=1.5116) => @PLACE(47, -16.6) => %label25;
*   $CANVAS_LABEL @ATTACH(bind="net") %label25(label);
*   %wire26 @TEXT("\textbf{\textit{S<2>}}", halign="middle", size=1.5116) => @PLACE(54.2, -16.6) => %label26;
*   $CANVAS_LABEL @ATTACH(bind="net") %label26(label);
*   %wire27 @TEXT("\textbf{\textit{S<2>}}", halign="middle", size=1.5116) => @PLACE(47, -80.6) => %label27;
*   $CANVAS_LABEL @ATTACH(bind="net") %label27(label);
*   %wire28 @TEXT("\textbf{\textit{SB<2>}}", halign="middle", size=1.5116) => @PLACE(54.2, -80.6) => %label28;
*   $CANVAS_LABEL @ATTACH(bind="net") %label28(label);
*   %wire29 @TEXT("\textbf{\textit{SB<0>}}", halign="middle", size=1.5116) => @PLACE(7.6, 19.4) => %label29;
*   $CANVAS_LABEL @ATTACH(bind="net") %label29(label);
*   %wire30 @TEXT("\textbf{\textit{SB<1>}}", halign="middle", size=1.5116) => @PLACE(37.6, 19.4) => %label30;
*   $CANVAS_LABEL @ATTACH(bind="net") %label30(label);
*   %wire31 @TEXT("\textbf{\textit{SB<2>}}", size=1.5116) => @PLACE(70, 19.4) => %label31;
*   $CANVAS_LABEL @ATTACH(bind="net") %label31(label)
* }
.ends input_mux_8to1
