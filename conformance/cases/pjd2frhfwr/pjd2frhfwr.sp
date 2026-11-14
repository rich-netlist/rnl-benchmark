
* @RNL(type="header") {
*   @VERSION("0.4");
*   @USE-PACKAGE(name="rnl-std-style", version="0.4");
*   @USE-PACKAGE(name="rnl-std-basic", version="0.4");
*   @USE-PACKAGE(name="rnl-std-semiconductors", version="0.4");
*   @USE-PACKAGE(name="rnl-std-no-labels", version="0.4");
*   @USE-PACKAGE(name="analog-canvas-extensions", version="0.7")
* }
.subckt dut VDD VSS Vin Vinn Vout1 Vout2
ISS net4 VSS DC 1m
XM1 net0 Vin net4 VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM2 net2 Vinn net4 VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM3 net0 net3 VDD VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM4 net2 net3 VDD VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM5 Vout1 net0 VDD VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM6 Vout2 net2 VDD VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM7 Vout1 net1 VSS VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM8 Vout2 net1 VSS VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
R1 net0 net3 1k
R2 net3 net2 1k
R3 net1 Vout1 1k
R4 Vout2 net1 1k
* @RNL(author="analog-canvas") {
*   %dut_SYMBOL = @DEFINE-SYMBOL(box=[-7, -6, 7, 6]) {
*     (0, 6) @PIN(terminal="VDD", label="\textbf{\textit{V}}_{\textbf{DD}}", direction="up");
*     (-7, 1) @PIN(terminal="Vin", label="\textbf{\textit{V}}_{\textbf{in}}", direction="left");
*     (-7, -3) @PIN(terminal="Vinn", label="\textbf{\textit{Vinn}}", direction="left");
*     (-7, -1) @PIN(terminal="Vout1", label="\textbf{\textit{V}}_{\textbf{out1}}", direction="left");
*     (7, -1) @PIN(terminal="Vout2", label="\textbf{\textit{V}}_{\textbf{out2}}", direction="right");
*     (0, 0) @RECTANGLE(width=12, height=10);
*     @LINE {(0, 6) (0, 5)};
*     @LINE {(-7, 1) (-6, 1)};
*     @LINE {(-7, -3) (-6, -3)};
*     @LINE {(-7, -1) (-6, -1)};
*     @LINE {(7, -1) (6, -1)}
*   };
*   # @SET-SYMBOL %dut_SYMBOL;
*   $CANVAS_TYPESETTING @ATTACH(subscript_italic=false) #(level);
*   #XM1 @SET-SYMBOL(terminals=[[1, "d"], [2, "g"], [3, "s"]]) $NMOS => @PLACE(43, -37) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M1") #XM1(part);
*   #XM2 @SET-SYMBOL(terminals=[[1, "d"], [2, "g"], [3, "s"]]) $NMOS => @PLACE(55, -37) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M2") #XM2(part);
*   #XM3 @SET-SYMBOL(terminals=[[1, "d"], [2, "g"], [3, "s"]]) $PMOS => @PLACE(43, -26) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M3") #XM3(part);
*   #XM4 @SET-SYMBOL(terminals=[[1, "d"], [2, "g"], [3, "s"]]) $PMOS => @PLACE(55, -26) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M4") #XM4(part);
*   #XM5 @SET-SYMBOL(terminals=[[1, "d"], [2, "g"], [3, "s"]]) $PMOS => @PLACE(34, -31) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M5") #XM5(part);
*   #XM6 @SET-SYMBOL(terminals=[[1, "d"], [2, "g"], [3, "s"]]) $PMOS => @PLACE(64, -31) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M6") #XM6(part);
*   #XM7 @SET-SYMBOL(terminals=[[1, "d"], [2, "g"], [3, "s"]]) $NMOS => @PLACE(34, -49) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M7") #XM7(part);
*   #XM8 @SET-SYMBOL(terminals=[[1, "d"], [2, "g"], [3, "s"]]) $NMOS => @PLACE(64, -49) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M8") #XM8(part);
*   #ISS @SET-SYMBOL $CURRENT_SOURCE => @PLACE(49, -44) => @ORIENT("R0");
*   $CANVAS_PARAMETER @ATTACH(name="amplitude", text="1m") #ISS(part);
*   $CANVAS_PARAMETER @ATTACH(name="damping", text="0") #ISS(part);
*   $CANVAS_PARAMETER @ATTACH(name="delay", text="0") #ISS(part);
*   $CANVAS_PARAMETER @ATTACH(name="fall", text="1ps") #ISS(part);
*   $CANVAS_PARAMETER @ATTACH(name="frequency", text="1k") #ISS(part);
*   $CANVAS_PARAMETER @ATTACH(name="high", text="1m") #ISS(part);
*   $CANVAS_PARAMETER @ATTACH(name="low", text="0") #ISS(part);
*   $CANVAS_PARAMETER @ATTACH(name="offset", text="0") #ISS(part);
*   $CANVAS_PARAMETER @ATTACH(name="period", text="10ns") #ISS(part);
*   $CANVAS_PARAMETER @ATTACH(name="phase", text="0") #ISS(part);
*   $CANVAS_PARAMETER @ATTACH(name="rise", text="1ps") #ISS(part);
*   $CANVAS_PARAMETER @ATTACH(name="waveform", text="dc") #ISS(part);
*   $CANVAS_PARAMETER @ATTACH(name="width", text="5ns") #ISS(part);
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(49, -45) => @ORIENT("R0") => %gnd1;
*   #R1 @SET-SYMBOL $RESISTOR => @PLACE(46, -31) => @ORIENT("R90");
*   #R2 @SET-SYMBOL $RESISTOR => @PLACE(52, -31) => @ORIENT("R90");
*   $IO_PORT @ATTACH &Vin(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(39, -37) => @ORIENT("R0") => %port1;
*   $IO_PORT @ATTACH &Vinn(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(39, -41) => @ORIENT("R0") => %port2;
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(34, -51) => @ORIENT("R0") => %gnd2;
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(64, -51) => @ORIENT("R0") => %gnd3;
*   #R3 @SET-SYMBOL $RESISTOR => @PLACE(39, -46) => @ORIENT("R270");
*   #R4 @SET-SYMBOL $RESISTOR => @PLACE(59, -46) => @ORIENT("R270");
*   $IO_PORT @ATTACH &Vout1(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(32, -39) => @ORIENT("R0") => %port3;
*   $IO_PORT @ATTACH &Vout2(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(66, -39) => @ORIENT("MY") => %port4;
*   %j1 = (31, -22);
*   %j2 = (66, -22);
*   %j3 = (43, -22);
*   %j4 = (55, -22);
*   %j5 = (33, -22);
*   %j6 = (64, -22);
*   %j7 = (43, -31);
*   %j8 = (55, -31);
*   %j9 = (49, -31);
*   %j10 = (49, -26);
*   %j11 = (49, -40);
*   %j12 = (34, -46);
*   %j13 = (44, -49);
*   %j14 = (64, -46);
*   %j15 = (54, -49);
*   %j16 = (34, -39);
*   %j17 = (64, -39);
*   &VDD @WIRE(mode="straight", linestyle="bold") {%j1 %j5};
*   &VDD @WIRE(mode="straight", linestyle="bold") {%j5 %j3};
*   &VDD @WIRE(mode="straight", linestyle="bold") {%j3 %j4};
*   &VDD @WIRE(mode="straight", linestyle="bold") {%j4 %j6};
*   &VDD @WIRE(mode="straight", linestyle="bold") {%j6 %j2};
*   &VDD @WIRE(mode="straight") {%j5 (34, -22) #XM5:3};
*   &VDD @WIRE(mode="straight") {%j4 #XM4:3};
*   &VDD @WIRE(mode="straight") {%j6 #XM6:3};
*   &VDD @WIRE(mode="straight") {%j3 #XM3:3};
*   &net0 @WIRE(mode="straight") {#XM3:1 %j7};
*   &net0 @WIRE(mode="straight") {%j7 #XM1:1};
*   &net2 @WIRE(mode="straight") {#XM4:1 %j8};
*   &net2 @WIRE(mode="straight") {%j8 #XM2:1};
*   &net3 @WIRE(mode="straight") {#XM3:2 %j10};
*   &net3 @WIRE(mode="straight") {%j10 #XM4:2};
*   &net0 @WIRE(mode="straight") {#R1:1 %j7};
*   &net2 @WIRE(mode="straight") {#R2:2 %j8};
*   &net3 @WIRE(mode="straight") {#R1:2 %j9};
*   &net3 @WIRE(mode="straight") {%j9 #R2:1};
*   &net3 @WIRE(mode="straight") {%j9 %j10};
*   &net4 @WIRE(mode="straight") {#XM1:3 (43, -40) %j11};
*   &net4 @WIRE(mode="straight") {%j11 #ISS:1};
*   &net4 @WIRE(mode="straight") {%j11 (55, -40) #XM2:3};
*   &Vin @WIRE(mode="straight") {#XM1:2 %port1::pin};
*   &Vinn @WIRE(mode="straight") {%port2::pin (59, -41) (59, -37) #XM2:2};
*   &net0 @WIRE(mode="straight") {%j7 #XM5:2};
*   &net2 @WIRE(mode="straight") {%j8 #XM6:2};
*   &net1 @WIRE(mode="straight") {#XM7:2 %j13};
*   &net1 @WIRE(mode="straight") {%j13 %j15};
*   &net1 @WIRE(mode="straight") {%j15 #XM8:2};
*   &VSS @WIRE(mode="straight") {%gnd1::pin #ISS:2};
*   &net1 @WIRE(mode="straight") {#R3:1 (44, -46) %j13};
*   &net1 @WIRE(mode="straight") {#R4:2 (54, -46) %j15};
*   &Vout1 @WIRE(mode="straight") {%port3::pin %j16};
*   &Vout1 @WIRE(mode="straight") {#XM5:1 %j16};
*   &Vout1 @WIRE(mode="straight") {%j16 %j12};
*   &Vout1 @WIRE(mode="straight") {%j12 #XM7:1};
*   &Vout1 @WIRE(mode="straight") {%j12 #R3:2};
*   &Vout2 @WIRE(mode="straight") {#R4:1 %j14};
*   &Vout2 @WIRE(mode="straight") {#XM6:1 %j17};
*   &Vout2 @WIRE(mode="straight") {%j17 %j14};
*   &Vout2 @WIRE(mode="straight") {%j17 %port4::pin};
*   &Vout2 @WIRE(mode="straight") {%j14 #XM8:1};
*   &VSS @WIRE(mode="straight") {%gnd2::pin #XM7:3};
*   &VSS @WIRE(mode="straight") {%gnd3::pin #XM8:3};
*   $JUNCTION @ATTACH %j3(p) => @PLACE(43, -22) => %dot1;
*   $JUNCTION @ATTACH %j4(p) => @PLACE(55, -22) => %dot2;
*   $JUNCTION @ATTACH %j6(p) => @PLACE(64, -22) => %dot3;
*   $JUNCTION @ATTACH %j7(p) => @PLACE(43, -31) => %dot4;
*   $JUNCTION @ATTACH %j16(p) => @PLACE(34, -39) => %dot5;
*   $JUNCTION @ATTACH %j12(p) => @PLACE(34, -46) => %dot6;
*   $JUNCTION @ATTACH %j17(p) => @PLACE(64, -39) => %dot7;
*   $JUNCTION @ATTACH %j14(p) => @PLACE(64, -46) => %dot8;
*   $JUNCTION @ATTACH %j13(p) => @PLACE(44, -49) => %dot9;
*   $JUNCTION @ATTACH %j15(p) => @PLACE(54, -49) => %dot10;
*   $JUNCTION @ATTACH %j8(p) => @PLACE(55, -31) => %dot11;
*   $JUNCTION @ATTACH %j10(p) => @PLACE(49, -26) => %dot12;
*   $JUNCTION @ATTACH %j9(p) => @PLACE(49, -31) => %dot13;
*   $JUNCTION @ATTACH %j11(p) => @PLACE(49, -40) => %dot14;
*   #XM1
*       @TEXT("\textbf{\textit{M}}_{\textbf{1}}", key="name", dx=0.5, dy=-0.5, halign="start", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM1::name(label);
*   #XM2
*       @TEXT("\textbf{\textit{M}}_{\textbf{2}}", key="name", dx=-0.5, dy=-0.5, halign="end", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM2::name(label);
*   #XM3
*       @TEXT("\textbf{\textit{M}}_{\textbf{3}}", key="name", dx=-0.4, dy=-0.5, halign="end", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM3::name(label);
*   #XM4
*       @TEXT("\textbf{\textit{M}}_{\textbf{4}}", key="name", dx=0.4, dy=-0.5, halign="start", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM4::name(label);
*   #XM5
*       @TEXT("\textbf{\textit{M}}_{\textbf{5}}", key="name", dx=-0.4, dy=-0.5, halign="end", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM5::name(label);
*   #XM6
*       @TEXT("\textbf{\textit{M}}_{\textbf{6}}", key="name", dx=0.4, dy=-0.5, halign="start", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM6::name(label);
*   #XM7
*       @TEXT("\textbf{\textit{M}}_{\textbf{7}}", key="name", dx=-0.5, dy=-0.5, halign="end", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM7::name(label);
*   #XM8
*       @TEXT("\textbf{\textit{M}}_{\textbf{8}}", key="name", dx=0.5, dy=-0.5, halign="start", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM8::name(label);
*   &VDD @TEXT("\textbf{\textit{V}}_{\textbf{DD}}", size=1.5116, bold=false) => @PLACE(67, -23) => %power1;
*   $CANVAS_LABEL @ATTACH(bind="port") %power1(label);
*   #ISS
*       @TEXT("\textbf{\textit{I}}_{\textbf{SS}}", key="name", dx=1.5, dy=-0.5, halign="start", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #ISS::name(label);
*   #R1
*       @TEXT("\textbf{\textit{R}}_{\textbf{1}}", key="name", dx=0, dy=1.4, halign="middle", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #R1::name(label);
*   #R2
*       @TEXT("\textbf{\textit{R}}_{\textbf{2}}", key="name", dx=0, dy=1.4, halign="middle", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #R2::name(label);
*   %port1
*       @TEXT("\textbf{\textit{V}}_{\textbf{in}}", key="netname", dx=0, dy=-2.5, halign="end", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="port") %port1::netname(label);
*   #R3
*       @TEXT("\textbf{\textit{R}}_{\textbf{3}}", key="name", dx=0, dy=1, halign="middle", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #R3::name(label);
*   #R4
*       @TEXT("\textbf{\textit{R}}_{\textbf{4}}", key="name", dx=0, dy=1, halign="middle", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #R4::name(label);
*   %port3
*       @TEXT("\textbf{\textit{V}}_{\textbf{out1}}", key="netname", dx=-2, dy=-0.5, halign="end", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="port") %port3::netname(label);
*   %port4
*       @TEXT("\textbf{\textit{V}}_{\textbf{out2}}", key="netname", dx=2, dy=-0.5, halign="start", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="port") %port4::netname(label);
*   %port2 @TEXT("${p}", key="netname", textvisible=false)
* }
.ends dut
