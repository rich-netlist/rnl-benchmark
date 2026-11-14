
* @RNL(type="header") {
*   @VERSION("0.4");
*   @USE-PACKAGE(name="rnl-std-style", version="0.4");
*   @USE-PACKAGE(name="rnl-std-basic", version="0.4");
*   @USE-PACKAGE(name="rnl-std-semiconductors", version="0.4");
*   @USE-PACKAGE(name="rnl-std-no-labels", version="0.4");
*   @USE-PACKAGE(name="analog-canvas-extensions", version="0.7")
* }
.subckt sram_8t VDD VSS wbl wblb wwl rwl preb dout
Crbl rbl VSS 20fF
XM1 net0 qb VSS VSS sky130_fd_pr__nfet_01v8 l=0.15 w=0.84 nf=1 m=1
XM10 dout rbl VDD VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM11 dout rbl VSS VSS sky130_fd_pr__nfet_01v8 l=0.15 w=0.5 nf=1 m=1
XM2 qb net0 VSS VSS sky130_fd_pr__nfet_01v8 l=0.15 w=0.84 nf=1 m=1
XM3 net0 qb VDD VDD sky130_fd_pr__pfet_01v8 l=0.15 w=0.42 nf=1 m=1
XM4 qb net0 VDD VDD sky130_fd_pr__pfet_01v8 l=0.15 w=0.42 nf=1 m=1
XM5 net0 wwl wbl VSS sky130_fd_pr__nfet_01v8 l=0.15 w=0.55 nf=1 m=1
XM6 qb wwl wblb VSS sky130_fd_pr__nfet_01v8 l=0.15 w=0.55 nf=1 m=1
XM7 net1 qb VSS VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM8 rbl rwl net1 VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM9 rbl preb VDD VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
* @RNL(author="analog-canvas") {
*   %sram_8t_SYMBOL = @DEFINE-SYMBOL(box=[-6, -6, 6, 6]) {
*     (0, 6) @PIN(terminal="VDD", label="\textbf{\textit{V}}_{\textbf{DD}}", direction="up");
*     (-6, -1) @PIN(terminal="wbl", label="\textbf{\textit{wbl}}", direction="left");
*     (-6, -3) @PIN(terminal="wblb", label="\textbf{\textit{wblb}}", direction="left");
*     (-6, 1) @PIN(terminal="wwl", label="\textbf{\textit{wwl}}", direction="left");
*     (6, -3) @PIN(terminal="rwl", label="\textbf{\textit{rwl}}", direction="right");
*     (6, 1) @PIN(terminal="preb", label="\textbf{\textit{preb}}", direction="right");
*     (6, -1) @PIN(terminal="dout", label="\textbf{\textit{dout}}", direction="right");
*     (0, 0) @RECTANGLE(width=10, height=10);
*     @LINE {(0, 6) (0, 5)};
*     @LINE {(-6, -1) (-5, -1)};
*     @LINE {(-6, -3) (-5, -3)};
*     @LINE {(-6, 1) (-5, 1)};
*     @LINE {(6, -3) (5, -3)};
*     @LINE {(6, 1) (5, 1)};
*     @LINE {(6, -1) (5, -1)}
*   };
*   # @SET-SYMBOL %sram_8t_SYMBOL;
*   $CANVAS_TYPESETTING @ATTACH(subscript_italic=false) #(level);
*   #XM3 @SET-SYMBOL(terminals=[[1, "d"], [2, "g"], [3, "s"]]) $PMOS => @PLACE(18, 10) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M3") #XM3(part);
*   $CANVAS_PARAMETER_TEXT @ATTACH(name="l", text="0.15u") #XM3(part);
*   $CANVAS_PARAMETER_TEXT @ATTACH(name="w", text="0.42u") #XM3(part);
*   #XM1 @SET-SYMBOL(terminals=[[1, "d"], [2, "g"], [3, "s"]]) $NMOS => @PLACE(18, 0) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M1") #XM1(part);
*   $CANVAS_PARAMETER_TEXT @ATTACH(name="l", text="0.15u") #XM1(part);
*   $CANVAS_PARAMETER_TEXT @ATTACH(name="w", text="0.84u") #XM1(part);
*   #XM4 @SET-SYMBOL(terminals=[[1, "d"], [2, "g"], [3, "s"]]) $PMOS => @PLACE(30, 10) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M4") #XM4(part);
*   $CANVAS_PARAMETER_TEXT @ATTACH(name="l", text="0.15u") #XM4(part);
*   $CANVAS_PARAMETER_TEXT @ATTACH(name="w", text="0.42u") #XM4(part);
*   #XM2 @SET-SYMBOL(terminals=[[1, "d"], [2, "g"], [3, "s"]]) $NMOS => @PLACE(30, 0) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M2") #XM2(part);
*   $CANVAS_PARAMETER_TEXT @ATTACH(name="l", text="0.15u") #XM2(part);
*   $CANVAS_PARAMETER_TEXT @ATTACH(name="w", text="0.84u") #XM2(part);
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(18, -2) => @ORIENT("R0") => %gnd1;
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(30, -2) => @ORIENT("R0") => %gnd2;
*   #XM5 @SET-SYMBOL(terminals=[[1, "d"], [2, "g"], [3, "s"]]) $NMOS => @PLACE(13, 5) => @ORIENT("R270");
*   $CANVAS_NAME @ATTACH(name="M5") #XM5(part);
*   $CANVAS_PARAMETER_TEXT @ATTACH(name="l", text="0.15u") #XM5(part);
*   $CANVAS_PARAMETER_TEXT @ATTACH(name="w", text="0.55u") #XM5(part);
*   #XM6 @SET-SYMBOL(terminals=[[1, "d"], [2, "g"], [3, "s"]]) $NMOS => @PLACE(35, 5) => @ORIENT("MYR90");
*   $CANVAS_NAME @ATTACH(name="M6") #XM6(part);
*   $CANVAS_PARAMETER_TEXT @ATTACH(name="l", text="0.15u") #XM6(part);
*   $CANVAS_PARAMETER_TEXT @ATTACH(name="w", text="0.55u") #XM6(part);
*   $IO_PORT @ATTACH &wbl(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(9, 5) => @ORIENT("R0") => %port1;
*   $IO_PORT @ATTACH &wblb(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(39, 5) => @ORIENT("MY") => %port2;
*   $IO_PORT @ATTACH &wwl(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(13, 10) => @ORIENT("R270") => %port3;
*   $IO_PORT @ATTACH &wwl(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(35, 10) => @ORIENT("R270") => %port4;
*   #XM7 @SET-SYMBOL(terminals=[[1, "d"], [2, "g"], [3, "s"]]) $NMOS => @PLACE(56, 3) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M7") #XM7(part);
*   $CANVAS_PARAMETER_TEXT @ATTACH(name="l", text="0.15u") #XM7(part);
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(56, 1) => @ORIENT("R0") => %gnd3;
*   #XM8 @SET-SYMBOL(terminals=[[1, "d"], [2, "g"], [3, "s"]]) $NMOS => @PLACE(56, 11) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M8") #XM8(part);
*   $CANVAS_PARAMETER_TEXT @ATTACH(name="l", text="0.15u") #XM8(part);
*   $IO_PORT @ATTACH &rwl(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(51, 11) => @ORIENT("R0") => %port5;
*   #XM9 @SET-SYMBOL(terminals=[[1, "d"], [2, "g"], [3, "s"]]) $PMOS => @PLACE(68, 18) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M9") #XM9(part);
*   $CANVAS_PARAMETER_TEXT @ATTACH(name="l", text="0.15u") #XM9(part);
*   $SUPPLY @ATTACH &VDD(p) => @SET-SYMBOL $SUPPLY_SYMBOL => @PLACE(68, 20) => @ORIENT("R0") => %vdd1;
*   $IO_PORT @ATTACH &preb(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(63, 18) => @ORIENT("R0") => %port6;
*   #Crbl @SET-SYMBOL $CAPACITOR => @PLACE(74, 10) => @ORIENT("R0");
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(74, 8) => @ORIENT("R0") => %gnd4;
*   #XM10 @SET-SYMBOL(terminals=[[1, "d"], [2, "g"], [3, "s"]]) $PMOS => @PLACE(84, 18) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M10") #XM10(part);
*   $CANVAS_PARAMETER_TEXT @ATTACH(name="l", text="0.15u") #XM10(part);
*   $SUPPLY @ATTACH &VDD(p) => @SET-SYMBOL $SUPPLY_SYMBOL => @PLACE(84, 20) => @ORIENT("R0") => %vdd2;
*   #XM11 @SET-SYMBOL(terminals=[[1, "d"], [2, "g"], [3, "s"]]) $NMOS => @PLACE(84, 10) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M11") #XM11(part);
*   $CANVAS_PARAMETER_TEXT @ATTACH(name="l", text="0.15u") #XM11(part);
*   $CANVAS_PARAMETER_TEXT @ATTACH(name="w", text="0.5u") #XM11(part);
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(84, 8) => @ORIENT("R0") => %gnd5;
*   $IO_PORT @ATTACH &dout(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(90, 14) => @ORIENT("MY") => %port7;
*   %j1 = (4, 16);
*   %j2 = (44, 16);
*   %j3 = (18, 16);
*   %j4 = (30, 16);
*   %j5 = (18, 7);
*   %j6 = (27, 3);
*   %j7 = (30, 7);
*   %j8 = (21, 3);
*   %j9 = (18, 5);
*   %j10 = (30, 5);
*   %j11 = (30, 3);
*   %j12 = (81, 14);
*   %j13 = (68, 14);
*   %j14 = (74, 14);
*   %j15 = (84, 14);
*   &VDD @WIRE(mode="straight", linestyle="bold") {%j1 %j3};
*   &VDD @WIRE(mode="straight", linestyle="bold") {%j3 %j4};
*   &VDD @WIRE(mode="straight", linestyle="bold") {%j4 %j2};
*   &VDD @WIRE(mode="straight") {#XM3:3 %j3};
*   &VDD @WIRE(mode="straight") {#XM4:3 %j4};
*   &net0 @WIRE(mode="straight") {#XM3:1 %j5};
*   &net0 @WIRE(mode="straight") {%j5 %j9};
*   &net0 @WIRE(mode="straight") {%j9 #XM1:1};
*   &qb @WIRE(mode="straight") {#XM4:1 %j7};
*   &qb @WIRE(mode="straight") {%j7 %j10};
*   &qb @WIRE(mode="straight") {%j10 %j11};
*   &qb @WIRE(mode="straight") {%j11 #XM2:1};
*   &qb @WIRE(mode="straight") {#XM3:2 %j8};
*   &qb @WIRE(mode="straight") {%j8 #XM1:2};
*   &net0 @WIRE(mode="straight") {#XM4:2 %j6};
*   &net0 @WIRE(mode="straight") {%j6 #XM2:2};
*   &net0 @WIRE(mode="straight") {%j5 (22, 7) (26, 3) %j6};
*   &qb @WIRE(mode="straight") {%j7 (26, 7) (22, 3) %j8};
*   &net0 @WIRE(mode="straight") {#XM5:1 %j9};
*   &qb @WIRE(mode="straight") {#XM6:1 %j10};
*   &wbl @WIRE(mode="straight") {%port1::pin #XM5:3};
*   &wblb @WIRE(mode="straight") {%port2::pin #XM6:3};
*   &wwl @WIRE(mode="straight") {%port3::pin #XM5:2};
*   &wwl @WIRE(mode="straight") {%port4::pin #XM6:2};
*   &qb @WIRE(mode="straight") {%j11 #XM7:2} => %wire1;
*   &net1 @WIRE(mode="straight") {#XM8:3 #XM7:1};
*   &rwl @WIRE(mode="straight") {%port5::pin #XM8:2};
*   &dout @WIRE(mode="straight") {#XM10:1 %j15};
*   &dout @WIRE(mode="straight") {%j15 #XM11:1};
*   &rbl @WIRE(mode="straight") {#XM10:2 %j12};
*   &rbl @WIRE(mode="straight") {%j12 #XM11:2};
*   &rbl @WIRE(mode="straight") {#XM8:1 (56, 14) %j13} => %wire2;
*   &rbl @WIRE(mode="straight") {%j13 %j14};
*   &rbl @WIRE(mode="straight") {%j14 %j12};
*   &rbl @WIRE(mode="straight") {#XM9:1 %j13};
*   &preb @WIRE(mode="straight") {%port6::pin #XM9:2};
*   &rbl @WIRE(mode="straight") {#Crbl:1 %j14};
*   &dout @WIRE(mode="straight") {%j15 %port7::pin};
*   $JUNCTION @ATTACH %j3(p) => @PLACE(18, 16) => %dot1;
*   $JUNCTION @ATTACH %j4(p) => @PLACE(30, 16) => %dot2;
*   &VDD @WIRE(mode="straight") {#XM10:3 %vdd2::pin};
*   $JUNCTION @ATTACH %j15(p) => @PLACE(84, 14) => %dot3;
*   &VDD @WIRE(mode="straight") {#XM9:3 %vdd1::pin};
*   &VSS @WIRE(mode="straight") {#XM11:3 %gnd5::pin};
*   &VSS @WIRE(mode="straight") {#Crbl:2 %gnd4::pin};
*   &VSS @WIRE(mode="straight") {%gnd3::pin #XM7:3};
*   &VSS @WIRE(mode="straight") {#XM2:3 %gnd2::pin};
*   &VSS @WIRE(mode="straight") {#XM1:3 %gnd1::pin};
*   $JUNCTION @ATTACH %j8(p) => @PLACE(21, 3) => %dot4;
*   $JUNCTION @ATTACH %j7(p) => @PLACE(30, 7) => %dot5;
*   $JUNCTION @ATTACH %j10(p) => @PLACE(30, 5) => %dot6;
*   $JUNCTION @ATTACH %j11(p) => @PLACE(30, 3) => %dot7;
*   $JUNCTION @ATTACH %j13(p) => @PLACE(68, 14) => %dot8;
*   $JUNCTION @ATTACH %j14(p) => @PLACE(74, 14) => %dot9;
*   $JUNCTION @ATTACH %j12(p) => @PLACE(81, 14) => %dot10;
*   $JUNCTION @ATTACH %j5(p) => @PLACE(18, 7) => %dot11;
*   $JUNCTION @ATTACH %j9(p) => @PLACE(18, 5) => %dot12;
*   $JUNCTION @ATTACH %j6(p) => @PLACE(27, 3) => %dot13;
*   &VDD @TEXT("\textbf{\textit{V}}_{\textbf{DD}}", size=1.5116, bold=false) => @PLACE(45, 15) => %power1;
*   $CANVAS_LABEL @ATTACH(bind="port") %power1(label);
*   #XM3
*       @TEXT("\textbf{\textit{M}}_{\textbf{3}}", key="name", dx=-0.4, dy=-0.5, halign="end", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM3::name(label);
*   #XM1
*       @TEXT("\textbf{\textit{M}}_{\textbf{1}}", key="name", dx=-0.5, dy=-0.5, halign="end", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM1::name(label);
*   #XM4
*       @TEXT("\textbf{\textit{M}}_{\textbf{4}}", key="name", dx=0.4, dy=-0.5, halign="start", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM4::name(label);
*   #XM2
*       @TEXT("\textbf{\textit{M}}_{\textbf{2}}", key="name", dx=0.5, dy=-0.5, halign="start", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM2::name(label);
*   #XM5
*       @TEXT("\textbf{\textit{M}}_{\textbf{5}}", key="name", dx=0, dy=-1.5, halign="middle", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM5::name(label);
*   #XM6
*       @TEXT("\textbf{\textit{M}}_{\textbf{6}}", key="name", dx=2.4, dy=0.9, halign="start", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM6::name(label);
*   %port1
*       @TEXT("\textbf{\textit{wbl}}", key="netname", dx=-2, dy=-0.5, halign="end", valign="baseline", size=1.5116, bold=false,
*       textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="port") %port1::netname(label);
*   %port2
*       @TEXT("\textbf{\textit{wblb}}", key="netname", dx=2, dy=-0.5, halign="start", valign="baseline", size=1.5116, bold=false,
*       textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="port") %port2::netname(label);
*   %port3
*       @TEXT("\textbf{\textit{wwl}}", key="netname", dx=0, dy=1.9, halign="middle", valign="baseline", size=1.5116, bold=false,
*       textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="port") %port3::netname(label);
*   %port4
*       @TEXT("\textbf{\textit{wwl}}", key="netname", dx=0, dy=1.9, halign="middle", valign="baseline", size=1.5116, bold=false,
*       textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="port") %port4::netname(label);
*   #XM7
*       @TEXT("\textbf{\textit{M}}_{\textbf{7}}", key="name", dx=0.5, dy=-0.5, halign="start", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM7::name(label);
*   #XM8
*       @TEXT("\textbf{\textit{M}}_{\textbf{8}}", key="name", dx=0.5, dy=-0.5, halign="start", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM8::name(label);
*   %port5
*       @TEXT("\textbf{\textit{rwl}}", key="netname", dx=-2, dy=-0.5, halign="end", valign="baseline", size=1.5116, bold=false,
*       textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="port") %port5::netname(label);
*   #XM9
*       @TEXT("\textbf{\textit{M}}_{\textbf{9}}", key="name", dx=0.4, dy=-0.5, halign="start", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM9::name(label);
*   %vdd1 @TEXT("\textbf{\textit{V}}_{\textbf{DD}}", dx=2, dy=1, size=1.5116, bold=false) => %power2;
*   $CANVAS_LABEL @ATTACH(bind="port") %power2(label);
*   %port6
*       @TEXT("\textbf{\textit{preb}}", key="netname", dx=-2, dy=-0.5, halign="end", valign="baseline", size=1.5116, bold=false,
*       textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="port") %port6::netname(label);
*   #Crbl
*       @TEXT("\textbf{\textit{C}}_{\textbf{rbl}}", key="name", dx=1.2, dy=-0.5, halign="start", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #Crbl::name(label);
*   #Crbl
*       @TEXT("\textbf{20fF}", key="value", dx=1.2, dy=-2.5, halign="start", valign="baseline", size=1.5116, bold=false,
*       textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="value") #Crbl::value(label);
*   #XM10
*       @TEXT("\textbf{\textit{M}}_{\textbf{10}}", key="name", dx=0.4, dy=-0.5, halign="start", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM10::name(label);
*   %vdd2 @TEXT("\textbf{\textit{V}}_{\textbf{DD}}", dx=2, dy=1, size=1.5116, bold=false) => %power3;
*   $CANVAS_LABEL @ATTACH(bind="port") %power3(label);
*   #XM11
*       @TEXT("\textbf{\textit{M}}_{\textbf{11}}", key="name", dx=0.5, dy=-0.5, halign="start", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM11::name(label);
*   %port7
*       @TEXT("\textbf{\textit{dout}}", key="netname", dx=2, dy=-0.5, halign="start", valign="baseline", size=1.5116, bold=false,
*       textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="port") %port7::netname(label);
*   %wire1 @TEXT("\textbf{\textit{qb}}", halign="middle", size=1.5116, bold=false) => @PLACE(46, 3.8) => %label1;
*   $CANVAS_LABEL @ATTACH(bind="net") %label1(label);
*   %wire2 @TEXT("\textbf{\textit{rbl}}", halign="middle", size=1.5116, bold=false) => @PLACE(60, 14.4) => %label2;
*   $CANVAS_LABEL @ATTACH(bind="net") %label2(label);
*   %vdd1 @TEXT("${p}", key="netname", textvisible=false);
*   %vdd2 @TEXT("${p}", key="netname", textvisible=false)
* }
.ends sram_8t
