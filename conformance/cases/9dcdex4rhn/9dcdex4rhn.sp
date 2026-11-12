
* @RNL(type="header") {
*   @VERSION("0.3");
*   @USE-PACKAGE(name="rnl-std", version="0.3");
*   @USE-PACKAGE(name="rnl-std-no-labels", version="0.3");
*   @USE-PACKAGE(name="analog-canvas-extensions", version="0.6")
* }
.subckt dut VDD VSS Vin- Vin+ Vout Vb1 Vb2 Vb3 Vb4
.model NMOS nmos level=54
.model PMOS pmos level=54
Cmn net6 net3 1p
Cmp net7 net2 1p
I3 VDD net13 DC 1m
I4 net11 VSS DC 1m
M1 net8 Vin- net14 VSS NMOS l=150n m=1 nf=1 w=1u
M10 net0 Vin- net5 VDD PMOS l=150n m=1 nf=1 w=1u
M11 net1 Vin+ net5 VDD PMOS l=150n m=1 nf=1 w=1u
M12 net5 Vb4 VDD VDD PMOS l=150n m=1 nf=1 w=1u
M13 net3 Vb2 net1 VSS NMOS l=150n m=1 nf=1 w=1u
M14 net1 net4 VSS VSS NMOS l=150n m=1 nf=1 w=1u
M15 net8 Vb4 VDD VDD PMOS l=150n m=1 nf=1 w=1u
M16 net9 Vb4 VDD VDD PMOS l=150n m=1 nf=1 w=1u
M17 net4 Vb3 net8 VDD PMOS l=150n m=1 nf=1 w=1u
M18 net2 Vb3 net9 VDD PMOS l=150n m=1 nf=1 w=1u
M2 net9 Vin+ net14 VSS NMOS l=150n m=1 nf=1 w=1u
M3 net14 Vb1 VSS VSS NMOS l=150n m=1 nf=1 w=1u
M4 net4 Vb2 net0 VSS NMOS l=150n m=1 nf=1 w=1u
M5 net0 net4 VSS VSS NMOS l=150n m=1 nf=1 w=1u
Mc1 net3 net11 net2 VDD PMOS l=150n m=1 nf=1 w=1u
Mc2 net2 net13 net3 VSS NMOS l=150n m=1 nf=1 w=1u
Mc3 net10 net10 VDD VDD PMOS l=150n m=1 nf=1 w=1u
Mc4 net11 net11 net10 VDD PMOS l=150n m=1 nf=1 w=1u
Mc5 net13 net13 net12 VSS NMOS l=150n m=1 nf=1 w=1u
Mc6 net12 net12 VSS VSS NMOS l=150n m=1 nf=1 w=1u
Mc7 Vout net2 VDD VDD PMOS l=150n m=1 nf=1 w=1u
Mc8 Vout net3 VSS VSS NMOS l=150n m=1 nf=1 w=1u
Rzn Vout net6 1k
Rzp Vout net7 1k
* @RNL(author="analog-canvas") {
*   %dut_SYMBOL = @DEFINE-SYMBOL(box=[-6, -7, 6, 7]) {
*     (-6, 1) @PIN(terminal="Vin-", label="\textbf{\textit{V}}_{\textbf{in-}}", direction="left");
*     (-6, -1) @PIN(terminal="Vin+", label="\textbf{\textit{V}}_{\textbf{in+}}", direction="left");
*     (6, -2) @PIN(terminal="Vout", label="\textbf{\textit{V}}_{\textbf{out}}", direction="right");
*     (0, 7) @PIN(terminal="VDD", label="\textbf{\textit{V}}_{\textbf{DD}}", direction="up");
*     (-6, 0) @PIN(terminal="VSS", label="\textbf{\textit{V}}_{\textbf{SS}}", direction="left");
*     (-6, -3) @PIN(terminal="Vb1", label="\textbf{\textit{V}}_{\textbf{b1}}", direction="left");
*     (6, -4) @PIN(terminal="Vb2", label="\textbf{\textit{V}}_{\textbf{b2}}", direction="right");
*     (6, 0) @PIN(terminal="Vb3", label="\textbf{\textit{V}}_{\textbf{b3}}", direction="right");
*     (6, 2) @PIN(terminal="Vb4", label="\textbf{\textit{V}}_{\textbf{b4}}", direction="right");
*     (0, 0) @RECTANGLE(width=10, height=12);
*     @LINE {(-6, 1) (-5, 1)};
*     @LINE {(-6, -1) (-5, -1)};
*     @LINE {(6, -2) (5, -2)};
*     @LINE {(0, 7) (0, 6)};
*     @LINE {(-6, 0) (-5, 0)};
*     @LINE {(-6, -3) (-5, -3)};
*     @LINE {(6, -4) (5, -4)};
*     @LINE {(6, 0) (5, 0)};
*     @LINE {(6, 2) (5, 2)}
*   };
*   # @SET-SYMBOL %dut_SYMBOL;
*   $CANVAS_TYPESETTING @ATTACH(subscript_italic=false) #(level);
*   #M1 @SET-SYMBOL $NMOS => @PLACE(26, -23) => @ORIENT("R0");
*   #M2 @SET-SYMBOL $NMOS => @PLACE(34, -23) => @ORIENT("MY");
*   #M3 @SET-SYMBOL $NMOS => @PLACE(30, -42) => @ORIENT("MY");
*   #M5 @SET-SYMBOL $NMOS => @PLACE(53, -42) => @ORIENT("MY");
*   #Mc2 @SET-SYMBOL $NMOS => @PLACE(69, -25) => @ORIENT("MY");
*   #Mc8 @SET-SYMBOL $NMOS => @PLACE(105, -31) => @ORIENT("R0");
*   #Mc5 @SET-SYMBOL $NMOS => @PLACE(87, -38) => @ORIENT("MY");
*   #Mc6 @SET-SYMBOL $NMOS => @PLACE(87, -45) => @ORIENT("MY");
*   #M10 @SET-SYMBOL $PMOS => @PLACE(20, -23) => @ORIENT("R0");
*   #M11 @SET-SYMBOL $PMOS => @PLACE(40, -23) => @ORIENT("MY");
*   #M12 @SET-SYMBOL $PMOS => @PLACE(30, 1) => @ORIENT("MY");
*   #M13 @SET-SYMBOL $NMOS => @PLACE(65, -35) => @ORIENT("MY");
*   #M14 @SET-SYMBOL $NMOS => @PLACE(65, -42) => @ORIENT("R0");
*   #M15 @SET-SYMBOL $PMOS => @PLACE(53, 1) => @ORIENT("MY");
*   #M16 @SET-SYMBOL $PMOS => @PLACE(65, 1) => @ORIENT("MY");
*   #M17 @SET-SYMBOL $PMOS => @PLACE(53, -8) => @ORIENT("MY");
*   #M18 @SET-SYMBOL $PMOS => @PLACE(65, -8) => @ORIENT("MY");
*   #Mc1 @SET-SYMBOL $PMOS => @PLACE(61, -20) => @ORIENT("MY");
*   #Mc7 @SET-SYMBOL $PMOS => @PLACE(105, -14) => @ORIENT("R0");
*   #Cmp @SET-SYMBOL $CAPACITOR => @PLACE(98, -17) => @ORIENT("R270");
*   #Cmn @SET-SYMBOL $CAPACITOR => @PLACE(98, -27) => @ORIENT("R270");
*   #Rzp @SET-SYMBOL $RESISTOR => @PLACE(102, -17) => @ORIENT("R270");
*   #Rzn @SET-SYMBOL $RESISTOR => @PLACE(102, -27) => @ORIENT("R270");
*   #I3 @SET-SYMBOL $CURRENT_SOURCE => @PLACE(87, -8) => @ORIENT("R0");
*   $CANVAS_PARAMETER @ATTACH(name="amplitude", text="1m") #I3(part);
*   $CANVAS_PARAMETER @ATTACH(name="damping", text="0") #I3(part);
*   $CANVAS_PARAMETER @ATTACH(name="delay", text="0") #I3(part);
*   $CANVAS_PARAMETER @ATTACH(name="fall", text="1ps") #I3(part);
*   $CANVAS_PARAMETER @ATTACH(name="frequency", text="1k") #I3(part);
*   $CANVAS_PARAMETER @ATTACH(name="high", text="1m") #I3(part);
*   $CANVAS_PARAMETER @ATTACH(name="low", text="0") #I3(part);
*   $CANVAS_PARAMETER @ATTACH(name="offset", text="0") #I3(part);
*   $CANVAS_PARAMETER @ATTACH(name="period", text="10ns") #I3(part);
*   $CANVAS_PARAMETER @ATTACH(name="phase", text="0") #I3(part);
*   $CANVAS_PARAMETER @ATTACH(name="rise", text="1ps") #I3(part);
*   $CANVAS_PARAMETER @ATTACH(name="waveform", text="dc") #I3(part);
*   $CANVAS_PARAMETER @ATTACH(name="width", text="5ns") #I3(part);
*   #I4 @SET-SYMBOL $CURRENT_SOURCE => @PLACE(78, -38) => @ORIENT("R0");
*   $CANVAS_PARAMETER @ATTACH(name="amplitude", text="1m") #I4(part);
*   $CANVAS_PARAMETER @ATTACH(name="damping", text="0") #I4(part);
*   $CANVAS_PARAMETER @ATTACH(name="delay", text="0") #I4(part);
*   $CANVAS_PARAMETER @ATTACH(name="fall", text="1ps") #I4(part);
*   $CANVAS_PARAMETER @ATTACH(name="frequency", text="1k") #I4(part);
*   $CANVAS_PARAMETER @ATTACH(name="high", text="1m") #I4(part);
*   $CANVAS_PARAMETER @ATTACH(name="low", text="0") #I4(part);
*   $CANVAS_PARAMETER @ATTACH(name="offset", text="0") #I4(part);
*   $CANVAS_PARAMETER @ATTACH(name="period", text="10ns") #I4(part);
*   $CANVAS_PARAMETER @ATTACH(name="phase", text="0") #I4(part);
*   $CANVAS_PARAMETER @ATTACH(name="rise", text="1ps") #I4(part);
*   $CANVAS_PARAMETER @ATTACH(name="waveform", text="dc") #I4(part);
*   $CANVAS_PARAMETER @ATTACH(name="width", text="5ns") #I4(part);
*   #Mc3 @SET-SYMBOL $PMOS => @PLACE(78, -1) => @ORIENT("MY");
*   #Mc4 @SET-SYMBOL $PMOS => @PLACE(78, -9) => @ORIENT("MY");
*   $IO_PORT @ATTACH &"Vin-"(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(10, -23) => @ORIENT("R0") => %port1;
*   $IO_PORT @ATTACH &"Vin+"(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(48, -23) => @ORIENT("R180") => %port2;
*   $IO_PORT @ATTACH &Vout(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(115, -22) => @ORIENT("R180") => %port3;
*   #M4 @SET-SYMBOL $NMOS => @PLACE(53, -35) => @ORIENT("MY");
*   $IO_PORT @ATTACH &Vb1(p) => @SET-SYMBOL $CANVAS_PORT_FILLED => @PLACE(35, -42) => @ORIENT("R180") => %port4;
*   $IO_PORT @ATTACH &Vb2(p) => @SET-SYMBOL $CANVAS_PORT_FILLED => @PLACE(70, -35) => @ORIENT("R180") => %port5;
*   $IO_PORT @ATTACH &Vb3(p) => @SET-SYMBOL $CANVAS_PORT_FILLED => @PLACE(70, -8) => @ORIENT("R180") => %port6;
*   $IO_PORT @ATTACH &Vb4(p) => @SET-SYMBOL $CANVAS_PORT_FILLED => @PLACE(70, 1) => @ORIENT("R180") => %port7;
*   &VDD @REMOVE-FROM $PORT_FILL_SET;
*   &VSS @REMOVE-FROM $PORT_FILL_SET;
*   %j1 = (10, -23);
*   %j2 = (48, -23);
*   %j3 = (30, -33);
*   $JUNCTION @ATTACH %j3;
*   %j4 = (30, -12);
*   $JUNCTION @ATTACH %j4;
*   %j5 = (53, -3);
*   $JUNCTION @ATTACH %j5;
*   %j6 = (36, -42);
*   %j7 = (65, -4);
*   $JUNCTION @ATTACH %j7;
*   %j8 = (65, -38);
*   $JUNCTION @ATTACH %j8;
*   %j9 = (65, -30);
*   $JUNCTION @ATTACH %j9;
*   %j10 = (78, -4);
*   $JUNCTION @ATTACH %j10;
*   %j11 = (78, -12);
*   $JUNCTION @ATTACH %j11;
*   %j12 = (87, -35);
*   $JUNCTION @ATTACH %j12;
*   %j13 = (87, -42);
*   $JUNCTION @ATTACH %j13;
*   %j14 = (105, -27);
*   $JUNCTION @ATTACH %j14;
*   %j15 = (105, -17);
*   $JUNCTION @ATTACH %j15;
*   %j16 = (105, -22);
*   $JUNCTION @ATTACH %j16;
*   %j17 = (65, -15);
*   $JUNCTION @ATTACH %j17;
*   %j18 = (59, -42);
*   $JUNCTION @ATTACH %j18;
*   %j19 = (95, -14);
*   $JUNCTION @ATTACH %j19;
*   %j20 = (65, -14);
*   $JUNCTION @ATTACH %j20;
*   %j21 = (95, -31);
*   $JUNCTION @ATTACH %j21;
*   %j22 = (65, -31);
*   $JUNCTION @ATTACH %j22;
*   %j23 = (78, -20);
*   $JUNCTION @ATTACH %j23;
*   %j24 = (87, -25);
*   $JUNCTION @ATTACH %j24;
*   %j25 = (109, 6);
*   %j26 = (26, 6);
*   %j27 = (30, 6);
*   $JUNCTION @ATTACH %j27;
*   %j28 = (53, 6);
*   $JUNCTION @ATTACH %j28;
*   %j29 = (65, 6);
*   $JUNCTION @ATTACH %j29;
*   %j30 = (78, 6);
*   $JUNCTION @ATTACH %j30;
*   %j31 = (87, 6);
*   $JUNCTION @ATTACH %j31;
*   %j32 = (105, 6);
*   $JUNCTION @ATTACH %j32;
*   %j33 = (26, -49);
*   %j34 = (109, -49);
*   %j35 = (30, -49);
*   $JUNCTION @ATTACH %j35;
*   %j36 = (53, -49);
*   $JUNCTION @ATTACH %j36;
*   %j37 = (65, -49);
*   $JUNCTION @ATTACH %j37;
*   %j38 = (87, -49);
*   $JUNCTION @ATTACH %j38;
*   %j39 = (78, -49);
*   $JUNCTION @ATTACH %j39;
*   %j40 = (105, -49);
*   $JUNCTION @ATTACH %j40;
*   %j41 = (71, 1);
*   %j42 = (71, -8);
*   %j43 = (71, -35);
*   %j44 = (56, -35);
*   %j45 = (53, -39);
*   $JUNCTION @ATTACH %j45;
*   %j46 = (53, -29);
*   $JUNCTION @ATTACH %j46;
*   &"Vin-" @WIRE(mode="straight") {#M1:2 #M10:2};
*   &"Vin-" @WIRE(mode="straight") {#M10:2 %j1};
*   &"Vin+" @WIRE(mode="straight") {#M2:2 #M11:2};
*   &"Vin+" @WIRE(mode="straight") {#M11:2 %j2};
*   &net14 @WIRE(mode="straight") {#M1:3 (26, -33) %j3};
*   &net14 @WIRE(mode="straight") {%j3 #M3:1};
*   &net14 @WIRE(mode="straight") {#M2:3 (34, -33) %j3};
*   &net5 @WIRE(mode="straight") {#M11:3 (40, -12) %j4};
*   &net5 @WIRE(mode="straight") {%j4 #M12:1};
*   &net5 @WIRE(mode="straight") {#M10:3 (20, -12) %j4};
*   &net8 @WIRE(mode="straight") {#M15:1 %j5};
*   &net8 @WIRE(mode="straight") {%j5 #M17:3};
*   &net8 @WIRE(mode="straight") {#M1:1 (26, -3) %j5};
*   &Vb1 @WIRE(mode="straight") {#M3:2 %port4:p};
*   &Vb1 @WIRE(mode="straight") {%port4:p %j6};
*   &net9 @WIRE(mode="straight") {#M2:1 (34, -4) %j7};
*   &net9 @WIRE(mode="straight") {#M16:1 %j7};
*   &net9 @WIRE(mode="straight") {%j7 #M18:3};
*   &net1 @WIRE(mode="straight") {#M11:1 (40, -38) %j8};
*   &net1 @WIRE(mode="straight") {#M13:3 %j8};
*   &net1 @WIRE(mode="straight") {%j8 #M14:1};
*   &net10 @WIRE(mode="straight") {#Mc3:1 %j10};
*   &net10 @WIRE(mode="straight") {%j10 #Mc4:3};
*   &net10 @WIRE(mode="straight") {#Mc3:2 (83, -1) (83, -4) %j10};
*   &net12 @WIRE(mode="straight") {#Mc5:3 %j13};
*   &net12 @WIRE(mode="straight") {%j13 #Mc6:1};
*   &net13 @WIRE(mode="straight") {#Mc5:1 %j12};
*   &net13 @WIRE(mode="straight") {%j12 %j24};
*   &net13 @WIRE(mode="straight") {%j24 #I3:2};
*   &net13 @WIRE(mode="straight") {#Mc5:2 (92, -38) (92, -35) %j12};
*   &net12 @WIRE(mode="straight") {#Mc6:2 (92, -45) (92, -42) %j13};
*   &Vout @WIRE(mode="straight") {#Rzp:1 %j15};
*   &Vout @WIRE(mode="straight") {#Rzn:1 %j14};
*   &Vout @WIRE(mode="straight") {#Mc7:1 %j15};
*   &Vout @WIRE(mode="straight") {%j15 %j16};
*   &Vout @WIRE(mode="straight") {%j16 %j14};
*   &Vout @WIRE(mode="straight") {%j16 %port3:p};
*   &Vout @WIRE(mode="straight") {%j14 #Mc8:1};
*   &net2 @WIRE(mode="straight") {#Mc7:2 %j19};
*   &net2 @WIRE(mode="straight") {%j19 (95, -17) #Cmp:2};
*   &net2 @WIRE(mode="straight") {#Mc1:3 (61, -15) %j17};
*   &net2 @WIRE(mode="straight") {#M18:1 %j20};
*   &net2 @WIRE(mode="straight") {%j20 %j17};
*   &net2 @WIRE(mode="straight") {%j17 (69, -15) #Mc2:1};
*   &net3 @WIRE(mode="straight") {#Mc8:2 %j21};
*   &net3 @WIRE(mode="straight") {%j21 (95, -27) #Cmn:2};
*   &net3 @WIRE(mode="straight") {#Mc1:1 (61, -30) %j9};
*   &net3 @WIRE(mode="straight") {%j9 %j22};
*   &net3 @WIRE(mode="straight") {%j22 #M13:1};
*   &net3 @WIRE(mode="straight") {%j9 (69, -30) #Mc2:3};
*   &net2 @WIRE(mode="straight") {%j19 %j20};
*   &net3 @WIRE(mode="straight") {%j21 %j22};
*   &net11 @WIRE(mode="straight") {#Mc1:2 %j23};
*   &net11 @WIRE(mode="straight") {#Mc4:1 %j11};
*   &net11 @WIRE(mode="straight") {%j11 %j23};
*   &net11 @WIRE(mode="straight") {%j11 (83, -12) (83, -9) #Mc4:2};
*   &net11 @WIRE(mode="straight") {%j23 #I4:1};
*   &net13 @WIRE(mode="straight") {#Mc2:2 %j24};
*   &Vb2 @WIRE(mode="straight") {%j44 #M13:2};
*   &Vb4 @WIRE(mode="straight") {#M15:2 #M16:2};
*   &Vb4 @WIRE(mode="straight") {#M12:2 #M15:2};
*   &VDD @WIRE(mode="straight", linestyle="bold") {%j25 %j32};
*   &VDD @WIRE(mode="straight", linestyle="bold") {%j32 %j31};
*   &VDD @WIRE(mode="straight", linestyle="bold") {%j31 %j30};
*   &VDD @WIRE(mode="straight", linestyle="bold") {%j30 %j29};
*   &VDD @WIRE(mode="straight", linestyle="bold") {%j29 %j28};
*   &VDD @WIRE(mode="straight", linestyle="bold") {%j28 %j27};
*   &VDD @WIRE(mode="straight", linestyle="bold") {%j27 %j26};
*   &VSS @WIRE(mode="straight", linestyle="bold") {%j33 %j35};
*   &VSS @WIRE(mode="straight", linestyle="bold") {%j35 %j36};
*   &VSS @WIRE(mode="straight", linestyle="bold") {%j36 %j37};
*   &VSS @WIRE(mode="straight", linestyle="bold") {%j37 %j39};
*   &VSS @WIRE(mode="straight", linestyle="bold") {%j39 %j38};
*   &VSS @WIRE(mode="straight", linestyle="bold") {%j38 %j40};
*   &VSS @WIRE(mode="straight", linestyle="bold") {%j40 %j34};
*   &VSS @WIRE(mode="straight") {#M3:3 %j35};
*   &VSS @WIRE(mode="straight") {#M5:3 %j36};
*   &VSS @WIRE(mode="straight") {#M14:3 %j37};
*   &VSS @WIRE(mode="straight") {#Mc6:3 %j38};
*   &VSS @WIRE(mode="straight") {#I4:2 %j39};
*   &VSS @WIRE(mode="straight") {#Mc8:3 %j40};
*   &VDD @WIRE(mode="straight") {#Mc7:3 %j32};
*   &VDD @WIRE(mode="straight") {#I3:1 %j31};
*   &VDD @WIRE(mode="straight") {#Mc3:3 %j30};
*   &VDD @WIRE(mode="straight") {#M16:3 %j29};
*   &VDD @WIRE(mode="straight") {#M15:3 %j28};
*   &VDD @WIRE(mode="straight") {#M12:3 %j27};
*   &Vb4 @WIRE(mode="straight") {#M16:2 %port7:p};
*   &Vb4 @WIRE(mode="straight") {%port7:p %j41};
*   &Vb3 @WIRE(mode="straight") {#M17:2 #M18:2};
*   &Vb3 @WIRE(mode="straight") {#M18:2 %port6:p};
*   &Vb3 @WIRE(mode="straight") {%port6:p %j42};
*   &Vb2 @WIRE(mode="straight") {#M13:2 %port5:p};
*   &Vb2 @WIRE(mode="straight") {%port5:p %j43};
*   &net4 @WIRE(mode="straight") {#M17:1 %j46};
*   &net4 @WIRE(mode="straight") {%j46 (59, -29) %j18};
*   &net4 @WIRE(mode="straight") {#M5:2 %j18};
*   &net4 @WIRE(mode="straight") {%j18 #M14:2};
*   &net0 @WIRE(mode="straight") {#M10:1 (20, -39) %j45};
*   &net0 @WIRE(mode="straight") {#M4:3 %j45};
*   &net0 @WIRE(mode="straight") {%j45 #M5:1};
*   &net4 @WIRE(mode="straight") {#M4:1 %j46};
*   &Vb2 @WIRE(mode="straight") {%j44 #M4:2};
*   &"Vin-" @WIRE(mode="straight") {%j1 %port1:p};
*   &net6 @WIRE(mode="straight") {#Cmn:1 #Rzn:2};
*   &net7 @WIRE(mode="straight") {#Cmp:1 #Rzp:2};
*   &"Vin+" @WIRE(mode="straight") {%j2 %port2:p};
*   #M1 @TEXT("\textbf{\textit{M}}_{\textbf{1}}", key="name", dx=0.5, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #M1::name(label);
*   #M2 @TEXT("\textbf{\textit{M}}_{\textbf{2}}", key="name", dx=-0.5, dy=-0.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #M2::name(label);
*   #M3 @TEXT("\textbf{\textit{M}}_{\textbf{13}}", key="name", dx=5, dy=1, halign="end", valign="baseline", size=1.5116);
*   #M5 @TEXT("\textbf{\textit{M}}_{\textbf{11}}", key="name", dx=4.5, dy=1, halign="end", valign="baseline", size=1.5116);
*   #Mc2 @TEXT("\textbf{\textit{M}}_{\textbf{c2}}", key="name", dx=5, dy=1, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #Mc2::name(label);
*   #Mc8 @TEXT("\textbf{\textit{M}}_{\textbf{c8}}", key="name", dx=-5, dy=1, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #Mc8::name(label);
*   #Mc5 @TEXT("\textbf{\textit{M}}_{\textbf{c5}}", key="name", dx=5, dy=-2, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #Mc5::name(label);
*   #Mc6 @TEXT("\textbf{\textit{M}}_{\textbf{c6}}", key="name", dx=5, dy=-2, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #Mc6::name(label);
*   #M10 @TEXT("\textbf{\textit{M}}_{\textbf{3}}", key="name", dx=-4.5, dy=1, halign="start", valign="baseline", size=1.5116);
*   #M11 @TEXT("\textbf{\textit{M}}_{\textbf{4}}", key="name", dx=4.5, dy=1, halign="end", valign="baseline", size=1.5116);
*   #M12 @TEXT("\textbf{\textit{M}}_{\textbf{14}}", key="name", dx=5, dy=1, halign="end", valign="baseline", size=1.5116);
*   #M13 @TEXT("\textbf{\textit{M}}_{\textbf{10}}", key="name", dx=5, dy=1, halign="end", valign="baseline", size=1.5116);
*   #M14 @TEXT("\textbf{\textit{M}}_{\textbf{12}}", key="name", dx=0.5, dy=1, halign="start", valign="baseline", size=1.5116);
*   #M15 @TEXT("\textbf{\textit{M}}_{\textbf{5}}", key="name", dx=4.5, dy=1, halign="end", valign="baseline", size=1.5116);
*   #M16 @TEXT("\textbf{\textit{M}}_{\textbf{6}}", key="name", dx=4.5, dy=1, halign="end", valign="baseline", size=1.5116);
*   #M17 @TEXT("\textbf{\textit{M}}_{\textbf{7}}", key="name", dx=4.5, dy=1, halign="end", valign="baseline", size=1.5116);
*   #M18 @TEXT("\textbf{\textit{M}}_{\textbf{8}}", key="name", dx=4.5, dy=1, halign="end", valign="baseline", size=1.5116);
*   #Mc1 @TEXT("\textbf{\textit{M}}_{\textbf{c1}}", key="name", dx=4.5, dy=-2.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #Mc1::name(label);
*   #Mc7 @TEXT("\textbf{\textit{M}}_{\textbf{c7}}", key="name", dx=-5, dy=1, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #Mc7::name(label);
*   #Cmp @TEXT("\textbf{\textit{C}}_{\textbf{mp}}", key="name", dx=0, dy=-2.3, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #Cmp::name(label);
*   #Cmn @TEXT("\textbf{\textit{C}}_{\textbf{mn}}", key="name", dx=0, dy=1.5, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #Cmn::name(label);
*   #Rzp @TEXT("\textbf{\textit{R}}_{\textbf{zp}}", key="name", dx=0, dy=-2.5, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #Rzp::name(label);
*   #Rzn @TEXT("\textbf{\textit{R}}_{\textbf{zn}}", key="name", dx=0, dy=1.5, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #Rzn::name(label);
*   #I3 @TEXT("\textbf{\textit{I}}_{\textbf{3}}", key="name", dx=1.5, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #I3::name(label);
*   #I4 @TEXT("\textbf{\textit{I}}_{\textbf{4}}", key="name", dx=1.5, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #I4::name(label);
*   #Mc3 @TEXT("\textbf{\textit{M}}_{\textbf{c3}}", key="name", dx=5, dy=1, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #Mc3::name(label);
*   #Mc4 @TEXT("\textbf{\textit{M}}_{\textbf{c4}}", key="name", dx=5, dy=1, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #Mc4::name(label);
*   %port1 @TEXT("\textbf{\textit{V}}_{\textbf{in-}}", key="name", dx=2, dy=-1.5, halign="end", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port1::name(label);
*   %port2
*       @TEXT("\textbf{\textit{V}}_{\textbf{in+}}", key="name", dx=0.5, dy=-1.5, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port2::name(label);
*   %port3 @TEXT("\textbf{\textit{V}}_{\textbf{out}}", key="name", dx=-1, dy=-2, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port3::name(label);
*   &VDD @TEXT("\textbf{\textit{V}}_{\textbf{DD}}", size=1.5116) => @PLACE(106, 7) => %power1;
*   $CANVAS_LABEL @ATTACH(bind="port") %power1(label);
*   &VSS @TEXT("\textbf{\textit{V}}_{\textbf{SS}}", size=1.5116) => @PLACE(106.5, -51) => %power2;
*   $CANVAS_LABEL @ATTACH(bind="port") %power2(label);
*   #M4 @TEXT("\textbf{\textit{M}}_{\textbf{9}}", key="name", dx=4.5, dy=1, halign="end", valign="baseline", size=1.5116);
*   %port4 @TEXT("\textbf{\textit{V}}_{\textbf{b1}}", key="name", dx=2, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port4::name(label);
*   %port5 @TEXT("\textbf{\textit{V}}_{\textbf{b2}}", key="name", dx=-1, dy=-1.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port5::name(label);
*   %port6 @TEXT("\textbf{\textit{V}}_{\textbf{b3}}", key="name", dx=1, dy=-1.5, halign="middle", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port6::name(label);
*   %port7 @TEXT("\textbf{\textit{V}}_{\textbf{b4}}", key="name", dx=-0.5, dy=-1.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="port") %port7::name(label);
*   (49.5, -2) @TEXT("\textbf{I}_{\textbf{ outn+}}", halign="middle", size=1.5116, bold=true) => %text1;
*   $CANVAS_TYPOGRAPHY @ATTACH(token="label") %text1(text);
*   (47.5, -5.5) @TEXT("\textbf{I}_{\textbf{ outn-}}", halign="middle", size=1.5116, bold=true) => %text2;
*   $CANVAS_TYPOGRAPHY @ATTACH(token="label") %text2(text);
*   (49.5, -37) @TEXT("\textbf{I}_{\textbf{ outp+}}", halign="middle", size=1.5116, bold=true) => %text3;
*   $CANVAS_TYPOGRAPHY @ATTACH(token="label") %text3(text);
*   (49.5, -40.5) @TEXT("\textbf{I}_{\textbf{ outp-}}", halign="middle", size=1.5116, bold=true) => %text4;
*   $CANVAS_TYPOGRAPHY @ATTACH(token="label") %text4(text);
*   (65, -16.5) @TEXT("\textbf{V}_{\textbf{ GP}}", halign="middle", size=1.5116, bold=true) => %text5;
*   $CANVAS_TYPOGRAPHY @ATTACH(token="label") %text5(text);
*   (65.5, -29) @TEXT("V_{ GN}", halign="middle", size=1.5116, bold=true) => %text6;
*   $CANVAS_TYPOGRAPHY @ATTACH(token="label") %text6(text)
* }
.ends dut
