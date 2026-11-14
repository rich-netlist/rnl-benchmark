
* @RNL(type="header") {
*   @VERSION("0.4");
*   @USE-PACKAGE(name="rnl-std-style", version="0.4");
*   @USE-PACKAGE(name="rnl-std-basic", version="0.4");
*   @USE-PACKAGE(name="rnl-std-semiconductors", version="0.4");
*   @USE-PACKAGE(name="rnl-std-no-labels", version="0.4");
*   @USE-PACKAGE(name="analog-canvas-extensions", version="0.7")
* }
.subckt dut VDD VSS Vout
Iref VDD net2 DC 1m
XM0 net2 net2 VSS VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM1 net0 net2 VSS VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM2 net1 net2 VSS VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM3 Vout net2 VSS VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
XM4 net0 net0 VDD VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM5 net1 net0 VDD VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM6 Vout net0 VDD VDD sky130_fd_pr__pfet_01v8 l=0.15 w=1 nf=1 m=1
XM7 Vout Vout VSS VSS sky130_fd_pr__nfet_01v8 l=0.15 w=1 nf=1 m=1
* @RNL(author="analog-canvas") {
*   %dut_SYMBOL = @DEFINE-SYMBOL(box=[-5, -4, 5, 4]) {
*     (5, -1) @PIN(terminal="Vout", label="\textbf{\textit{V}}_{\textbf{out}}", direction="right");
*     (0, 4) @PIN(terminal="VDD", label="\textbf{\textit{V}}_{\textbf{DD}}", direction="up");
*     (0, 0) @RECTANGLE(width=8, height=6);
*     @LINE {(5, -1) (4, -1)};
*     @LINE {(0, 4) (0, 3)}
*   };
*   # @SET-SYMBOL %dut_SYMBOL;
*   $CANVAS_TYPESETTING @ATTACH(subscript_italic=false) #(level);
*   #Iref @SET-SYMBOL $CURRENT_SOURCE => @PLACE(4, -4) => @ORIENT("R0");
*   $CANVAS_PARAMETER @ATTACH(name="amplitude", text="1m") #Iref(part);
*   $CANVAS_PARAMETER @ATTACH(name="damping", text="0") #Iref(part);
*   $CANVAS_PARAMETER @ATTACH(name="delay", text="0") #Iref(part);
*   $CANVAS_PARAMETER @ATTACH(name="fall", text="1ps") #Iref(part);
*   $CANVAS_PARAMETER @ATTACH(name="frequency", text="1k") #Iref(part);
*   $CANVAS_PARAMETER @ATTACH(name="high", text="1m") #Iref(part);
*   $CANVAS_PARAMETER @ATTACH(name="low", text="0") #Iref(part);
*   $CANVAS_PARAMETER @ATTACH(name="offset", text="0") #Iref(part);
*   $CANVAS_PARAMETER @ATTACH(name="period", text="10ns") #Iref(part);
*   $CANVAS_PARAMETER @ATTACH(name="phase", text="0") #Iref(part);
*   $CANVAS_PARAMETER @ATTACH(name="rise", text="1ps") #Iref(part);
*   $CANVAS_PARAMETER @ATTACH(name="waveform", text="dc") #Iref(part);
*   $CANVAS_PARAMETER @ATTACH(name="width", text="5ns") #Iref(part);
*   #XM0 @SET-SYMBOL(terminals=[[1, "d"], [2, "g"], [3, "s"]]) $NMOS => @PLACE(4, -18) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M0") #XM0(part);
*   #XM1 @SET-SYMBOL(terminals=[[1, "d"], [2, "g"], [3, "s"]]) $NMOS => @PLACE(15, -18) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M1") #XM1(part);
*   #XM2 @SET-SYMBOL(terminals=[[1, "d"], [2, "g"], [3, "s"]]) $NMOS => @PLACE(26, -18) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M2") #XM2(part);
*   #XM3 @SET-SYMBOL(terminals=[[1, "d"], [2, "g"], [3, "s"]]) $NMOS => @PLACE(37, -18) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M3") #XM3(part);
*   #XM7 @SET-SYMBOL(terminals=[[1, "d"], [2, "g"], [3, "s"]]) $NMOS => @PLACE(48, -18) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M7") #XM7(part);
*   #XM4 @SET-SYMBOL(terminals=[[1, "d"], [2, "g"], [3, "s"]]) $PMOS => @PLACE(15, -4) => @ORIENT("MY");
*   $CANVAS_NAME @ATTACH(name="M4") #XM4(part);
*   #XM5 @SET-SYMBOL(terminals=[[1, "d"], [2, "g"], [3, "s"]]) $PMOS => @PLACE(26, -4) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M5") #XM5(part);
*   #XM6 @SET-SYMBOL(terminals=[[1, "d"], [2, "g"], [3, "s"]]) $PMOS => @PLACE(37, -4) => @ORIENT("R0");
*   $CANVAS_NAME @ATTACH(name="M6") #XM6(part);
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(4, -20) => @ORIENT("R0") => %gnd1;
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(15, -20) => @ORIENT("R0") => %gnd2;
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(26, -20) => @ORIENT("R0") => %gnd3;
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(37, -20) => @ORIENT("R0") => %gnd4;
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(48, -20) => @ORIENT("R0") => %gnd5;
*   $IO_PORT @ATTACH &Vout(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(52, -11) => @ORIENT("R180") => %port1;
*   %j1 = (2, 0);
*   %j2 = (39, 0);
*   %j3 = (4, 0);
*   %j4 = (15, 0);
*   %j5 = (26, 0);
*   %j6 = (37, 0);
*   %j7 = (4, -14);
*   %j8 = (15, -8);
*   %j9 = (20, -8);
*   %j10 = (37, -11);
*   %j11 = (48, -14);
*   %j12 = (48, -11);
*   %j13 = (20, -4);
*   &VDD @WIRE(mode="straight", linestyle="bold") {%j1 %j3};
*   &VDD @WIRE(mode="straight", linestyle="bold") {%j3 %j4};
*   &VDD @WIRE(mode="straight", linestyle="bold") {%j4 %j5};
*   &VDD @WIRE(mode="straight", linestyle="bold") {%j5 %j6};
*   &VDD @WIRE(mode="straight", linestyle="bold") {%j6 %j2};
*   &VDD @WIRE(mode="straight") {#Iref:1 %j3};
*   &VDD @WIRE(mode="straight") {#XM4:3 %j4};
*   &VDD @WIRE(mode="straight") {#XM5:3 %j5};
*   &VDD @WIRE(mode="straight") {#XM6:3 %j6};
*   &net1 @WIRE(mode="straight") {#XM5:1 #XM2:1};
*   &Vout @WIRE(mode="straight") {#XM6:1 %j10};
*   &Vout @WIRE(mode="straight") {%j10 #XM3:1};
*   &Vout @WIRE(mode="straight") {%j10 %j12};
*   &Vout @WIRE(mode="straight") {%j12 %j11};
*   &Vout @WIRE(mode="straight") {%j11 #XM7:1};
*   &Vout @WIRE(mode="straight") {%j11 (45, -14) #XM7:2};
*   &Vout @WIRE(mode="straight") {%port1::pin %j12};
*   &net2 @WIRE(mode="straight") {#XM3:2 #XM2:2 #XM1:2 #XM0:2};
*   &net2 @WIRE(mode="straight") {%j7 #XM0:1};
*   &net2 @WIRE(mode="straight") {%j7 #Iref:2};
*   &net2 @WIRE(mode="straight") {%j7 (7, -14) #XM0:2};
*   &net0 @WIRE(mode="straight") {#XM1:1 %j8};
*   &net0 @WIRE(mode="straight") {#XM4:1 %j8};
*   &net0 @WIRE(mode="straight") {%j8 %j9};
*   &net0 @WIRE(mode="straight") {#XM4:2 %j13};
*   &net0 @WIRE(mode="straight") {%j13 %j9};
*   &net0 @WIRE(mode="straight") {%j13 #XM5:2};
*   &net0 @WIRE(mode="straight") {%j9 (34, -8) #XM6:2};
*   $JUNCTION @ATTACH %j10(p) => @PLACE(37, -11) => %dot1;
*   $JUNCTION @ATTACH %j12(p) => @PLACE(48, -11) => %dot2;
*   $JUNCTION @ATTACH %j11(p) => @PLACE(48, -14) => %dot3;
*   $JUNCTION @ATTACH %j3(p) => @PLACE(4, 0) => %dot4;
*   $JUNCTION @ATTACH %j4(p) => @PLACE(15, 0) => %dot5;
*   $JUNCTION @ATTACH %j5(p) => @PLACE(26, 0) => %dot6;
*   $JUNCTION @ATTACH %j6(p) => @PLACE(37, 0) => %dot7;
*   &VSS @WIRE(mode="straight") {%gnd1::pin #XM0:3};
*   &VSS @WIRE(mode="straight") {%gnd2::pin #XM1:3};
*   &VSS @WIRE(mode="straight") {%gnd3::pin #XM2:3};
*   &VSS @WIRE(mode="straight") {%gnd4::pin #XM3:3};
*   &VSS @WIRE(mode="straight") {%gnd5::pin #XM7:3};
*   $JUNCTION @ATTACH %j8(p) => @PLACE(15, -8) => %dot8;
*   $JUNCTION @ATTACH %j13(p) => @PLACE(20, -4) => %dot9;
*   $JUNCTION @ATTACH %j9(p) => @PLACE(20, -8) => %dot10;
*   $JUNCTION @ATTACH %j7(p) => @PLACE(4, -14) => %dot11;
*   $JUNCTION @ATTACH (7, -18)(p) => @PLACE(7, -18) => %dot12;
*   #Iref
*       @TEXT("\textbf{\textit{I}}_{\textbf{ref}}", key="name", dx=-4.5, dy=0, halign="start", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #Iref::name(label);
*   #XM0
*       @TEXT("\textbf{\textit{M}}_{\textbf{0}}", key="name", dx=-0.5, dy=-0.5, halign="end", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM0::name(label);
*   #XM1
*       @TEXT("\textbf{\textit{M}}_{\textbf{1}}", key="name", dx=0.5, dy=1, halign="start", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM1::name(label);
*   #XM2
*       @TEXT("\textbf{\textit{M}}_{\textbf{2}}", key="name", dx=0.5, dy=1, halign="start", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM2::name(label);
*   #XM3
*       @TEXT("\textbf{\textit{M}}_{\textbf{3}}", key="name", dx=0.5, dy=-0.5, halign="start", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM3::name(label);
*   #XM7
*       @TEXT("\textbf{\textit{M}}_{\textbf{7}}", key="name", dx=0.5, dy=-0.5, halign="start", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM7::name(label);
*   #XM4
*       @TEXT("\textbf{\textit{M}}_{\textbf{4}}", key="name", dx=-0.4, dy=-0.5, halign="end", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM4::name(label);
*   #XM5
*       @TEXT("\textbf{\textit{M}}_{\textbf{5}}", key="name", dx=0.4, dy=-0.5, halign="start", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM5::name(label);
*   #XM6
*       @TEXT("\textbf{\textit{M}}_{\textbf{6}}", key="name", dx=0.4, dy=-0.5, halign="start", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="name") #XM6::name(label);
*   %port1
*       @TEXT("\textbf{\textit{V}}_{\textbf{out}}", key="netname", dx=2, dy=-0.5, halign="start", valign="baseline", size=1.5116,
*       bold=false, textvisible=true);
*   $CANVAS_LABEL @ATTACH(bind="port") %port1::netname(label);
*   &VDD @TEXT("\textbf{\textit{V}}_{\textbf{DD}}", size=1.5116, bold=false) => @PLACE(40, -1) => %power1;
*   $CANVAS_LABEL @ATTACH(bind="port") %power1(label);
*   (-1, -6.2) @TEXT("1\textbackslash{},\textbackslash{}mathrm\{mA\}", size=1.5116, bold=true) => %text1;
*   $CANVAS_TYPOGRAPHY @ATTACH(token="label") %text1(text);
*   (2.6, -21) @TEXT("W/L", halign="end", size=1.5116, bold=true) => %text2;
*   $CANVAS_TYPOGRAPHY @ATTACH(token="label") %text2(text);
*   (16.4, -21) @TEXT("2W/L", size=1.5116, bold=true) => %text3;
*   $CANVAS_TYPOGRAPHY @ATTACH(token="label") %text3(text);
*   (27.4, -21) @TEXT("4W/L", size=1.5116, bold=true) => %text4;
*   $CANVAS_TYPOGRAPHY @ATTACH(token="label") %text4(text);
*   (38.4, -21) @TEXT("3W/L", size=1.5116, bold=true) => %text5;
*   $CANVAS_TYPOGRAPHY @ATTACH(token="label") %text5(text);
*   (49.4, -21) @TEXT("W/L", size=1.5116, bold=true) => %text6;
*   $CANVAS_TYPOGRAPHY @ATTACH(token="label") %text6(text);
*   (14.2, -6.6) @TEXT("5W/L", halign="end", size=1.5116, bold=true) => %text7;
*   $CANVAS_TYPOGRAPHY @ATTACH(token="label") %text7(text);
*   (27.4, -6.6) @TEXT("W/L", size=1.5116, bold=true) => %text8;
*   $CANVAS_TYPOGRAPHY @ATTACH(token="label") %text8(text);
*   (38.4, -6.6) @TEXT("10W/L", size=1.5116, bold=true) => %text9;
*   $CANVAS_TYPOGRAPHY @ATTACH(token="label") %text9(text);
*   (15.6, -12.8) @TEXT("\textbackslash{}downarrow I\_1", size=1.5116, bold=true) => %text10;
*   $CANVAS_TYPOGRAPHY @ATTACH(token="label") %text10(text);
*   (26.6, -12.8) @TEXT("\textbackslash{}downarrow I\_2", size=1.5116, bold=true) => %text11;
*   $CANVAS_TYPOGRAPHY @ATTACH(token="label") %text11(text);
*   (37.6, -9) @TEXT("\textbackslash{}downarrow I\_3", size=1.5116, bold=true) => %text12;
*   $CANVAS_TYPOGRAPHY @ATTACH(token="label") %text12(text);
*   (37.6, -13.8) @TEXT("\textbackslash{}downarrow I\_4", size=1.5116, bold=true) => %text13;
*   $CANVAS_TYPOGRAPHY @ATTACH(token="label") %text13(text);
*   (42.2, -10) @TEXT("I\_\{out\}\textbackslash{}rightarrow", size=1.5116, bold=true) => %text14;
*   $CANVAS_TYPOGRAPHY @ATTACH(token="label") %text14(text)
* }
.ends dut
