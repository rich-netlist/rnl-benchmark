
* @RNL(type="header") {
*   @VERSION("0.3");
*   @USE-PACKAGE(name="rnl-std", version="0.3");
*   @USE-PACKAGE(name="rnl-std-no-labels", version="0.3");
*   @USE-PACKAGE(name="analog-canvas-extensions", version="0.6")
* }
.subckt astra_018_cmos_pulse_coincidence vdd VSS a b out
C1 net4 VSS 1p
C2 net5 VSS 1p
CL out VSS 100f
M1 vdd a net4 VSS ANMOS l=1u w=20u
M10 bp net1 VSS VSS ANMOS l=1u w=4u
M11 net2 ap vdd vdd APMOS l=1u w=5u
M12 net2 bp vdd vdd APMOS l=1u w=5u
M13 net2 ap net3 VSS ANMOS l=1u w=4u
M14 net3 bp VSS VSS ANMOS l=1u w=4u
M15 out net2 vdd vdd APMOS l=1u w=10u
M16 out net2 VSS VSS ANMOS l=1u w=4u
M2 net0 net4 vdd vdd APMOS l=1u w=5u
M3 net0 net4 VSS VSS ANMOS l=1u w=2u
M4 ap net0 vdd vdd APMOS l=1u w=10u
M5 ap net0 VSS VSS ANMOS l=1u w=4u
M6 vdd b net5 VSS ANMOS l=1u w=20u
M7 net1 net5 vdd vdd APMOS l=1u w=5u
M8 net1 net5 VSS VSS ANMOS l=1u w=2u
M9 bp net1 vdd vdd APMOS l=1u w=10u
R1 net4 VSS 1meg
R2 net5 VSS 1meg
* @RNL(author="analog-canvas") {
*   $CANVAS_TYPESETTING @ATTACH(subscript_italic=false, subscript_after_first=true) #(level);
*   #M1 @SET-SYMBOL $NMOS_4TERM => @PLACE(6, 0) => @ORIENT("R0");
*   $SUPPLY @ATTACH &vdd(p) => @SET-SYMBOL $SUPPLY_SYMBOL => @PLACE(6, 3) => @ORIENT("R0") => %vdd1;
*   $IO_PORT @ATTACH &a(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(2, 0) => @ORIENT("R0") => %port1;
*   #R1 @SET-SYMBOL $RESISTOR => @PLACE(6, -11) => @ORIENT("R0");
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(6, -14) => @ORIENT("R0") => %gnd1;
*   #C1 @SET-SYMBOL $CAPACITOR => @PLACE(16, -11) => @ORIENT("R0");
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(16, -14) => @ORIENT("R0") => %gnd2;
*   #M2 @SET-SYMBOL $PMOS_4TERM => @PLACE(32, -2) => @ORIENT("R0");
*   #M3 @SET-SYMBOL $NMOS_4TERM => @PLACE(32, -10) => @ORIENT("R0");
*   $SUPPLY @ATTACH &vdd(p) => @SET-SYMBOL $SUPPLY_SYMBOL => @PLACE(32, 1) => @ORIENT("R0") => %vdd2;
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(32, -13) => @ORIENT("R0") => %gnd3;
*   #M4 @SET-SYMBOL $PMOS_4TERM => @PLACE(49, -2) => @ORIENT("R0");
*   #M5 @SET-SYMBOL $NMOS_4TERM => @PLACE(49, -10) => @ORIENT("R0");
*   $SUPPLY @ATTACH &vdd(p) => @SET-SYMBOL $SUPPLY_SYMBOL => @PLACE(49, 1) => @ORIENT("R0") => %vdd3;
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(49, -13) => @ORIENT("R0") => %gnd4;
*   #M6 @SET-SYMBOL $NMOS_4TERM => @PLACE(6, -28) => @ORIENT("R0");
*   $SUPPLY @ATTACH &vdd(p) => @SET-SYMBOL $SUPPLY_SYMBOL => @PLACE(6, -25) => @ORIENT("R0") => %vdd4;
*   $IO_PORT @ATTACH &b(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(2, -28) => @ORIENT("R0") => %port2;
*   #R2 @SET-SYMBOL $RESISTOR => @PLACE(6, -39) => @ORIENT("R0");
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(6, -42) => @ORIENT("R0") => %gnd5;
*   #C2 @SET-SYMBOL $CAPACITOR => @PLACE(16, -39) => @ORIENT("R0");
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(16, -42) => @ORIENT("R0") => %gnd6;
*   #M7 @SET-SYMBOL $PMOS_4TERM => @PLACE(32, -30) => @ORIENT("R0");
*   #M8 @SET-SYMBOL $NMOS_4TERM => @PLACE(32, -38) => @ORIENT("R0");
*   $SUPPLY @ATTACH &vdd(p) => @SET-SYMBOL $SUPPLY_SYMBOL => @PLACE(32, -27) => @ORIENT("R0") => %vdd5;
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(32, -41) => @ORIENT("R0") => %gnd7;
*   #M9 @SET-SYMBOL $PMOS_4TERM => @PLACE(49, -30) => @ORIENT("R0");
*   #M10 @SET-SYMBOL $NMOS_4TERM => @PLACE(49, -38) => @ORIENT("R0");
*   $SUPPLY @ATTACH &vdd(p) => @SET-SYMBOL $SUPPLY_SYMBOL => @PLACE(49, -27) => @ORIENT("R0") => %vdd6;
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(49, -41) => @ORIENT("R0") => %gnd8;
*   #M11 @SET-SYMBOL $PMOS_4TERM => @PLACE(69, -6) => @ORIENT("R0");
*   #M12 @SET-SYMBOL $PMOS_4TERM => @PLACE(83, -6) => @ORIENT("R0");
*   $SUPPLY @ATTACH &vdd(p) => @SET-SYMBOL $SUPPLY_SYMBOL => @PLACE(69, -3) => @ORIENT("R0") => %vdd7;
*   $SUPPLY @ATTACH &vdd(p) => @SET-SYMBOL $SUPPLY_SYMBOL => @PLACE(83, -3) => @ORIENT("R0") => %vdd8;
*   #M13 @SET-SYMBOL $NMOS_4TERM => @PLACE(76, -16) => @ORIENT("R0");
*   #M14 @SET-SYMBOL $NMOS_4TERM => @PLACE(76, -24) => @ORIENT("R0");
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(76, -27) => @ORIENT("R0") => %gnd9;
*   #M15 @SET-SYMBOL $PMOS_4TERM => @PLACE(99, -12) => @ORIENT("R0");
*   #M16 @SET-SYMBOL $NMOS_4TERM => @PLACE(99, -20) => @ORIENT("R0");
*   $SUPPLY @ATTACH &vdd(p) => @SET-SYMBOL $SUPPLY_SYMBOL => @PLACE(99, -9) => @ORIENT("R0") => %vdd9;
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(99, -23) => @ORIENT("R0") => %gnd10;
*   #CL @SET-SYMBOL $CAPACITOR => @PLACE(110, -24) => @ORIENT("R0");
*   $GROUND @ATTACH &VSS(p) => @SET-SYMBOL $GROUND_SYMBOL => @PLACE(110, -27) => @ORIENT("R0") => %gnd11;
*   $IO_PORT @ATTACH &out(p) => @SET-SYMBOL $IO_PORT_SYMBOL => @PLACE(114, -16) => @ORIENT("MY") => %port3;
*   &vdd @REMOVE-FROM $PORT_FILL_SET;
*   &VSS @REMOVE-FROM $PORT_FILL_SET;
*   %j1 = (6, -6);
*   $JUNCTION @ATTACH %j1;
*   %j2 = (16, -6);
*   $JUNCTION @ATTACH %j2;
*   %j3 = (28, -6);
*   $JUNCTION @ATTACH %j3;
*   %j4 = (28, -2);
*   %j5 = (28, -10);
*   %j6 = (32, -6);
*   $JUNCTION @ATTACH %j6;
*   %j7 = (45, -2);
*   %j8 = (45, -6);
*   $JUNCTION @ATTACH %j8;
*   %j9 = (45, -10);
*   %j10 = (49, -6);
*   $JUNCTION @ATTACH %j10;
*   %j11 = (51, -6);
*   %j12 = (6, -34);
*   $JUNCTION @ATTACH %j12;
*   %j13 = (16, -34);
*   $JUNCTION @ATTACH %j13;
*   %j14 = (28, -34);
*   $JUNCTION @ATTACH %j14;
*   %j15 = (28, -30);
*   %j16 = (28, -38);
*   %j17 = (32, -34);
*   $JUNCTION @ATTACH %j17;
*   %j18 = (45, -30);
*   %j19 = (45, -34);
*   $JUNCTION @ATTACH %j19;
*   %j20 = (45, -38);
*   %j21 = (49, -34);
*   $JUNCTION @ATTACH %j21;
*   %j22 = (51, -34);
*   %j23 = (65, -6);
*   %j24 = (79, -6);
*   %j25 = (69, -10);
*   %j26 = (76, -10);
*   $JUNCTION @ATTACH %j26;
*   %j27 = (83, -10);
*   $JUNCTION @ATTACH %j27;
*   %j28 = (72, -16);
*   %j29 = (72, -24);
*   %j30 = (95, -12);
*   %j31 = (95, -16);
*   $JUNCTION @ATTACH %j31;
*   %j32 = (95, -20);
*   %j33 = (99, -16);
*   $JUNCTION @ATTACH %j33;
*   %j34 = (90, -10);
*   %j35 = (90, -16);
*   %j36 = (110, -16);
*   $JUNCTION @ATTACH %j36;
*   &vdd @WIRE(mode="straight") {%vdd1:p #M1:1};
*   &a @WIRE(mode="straight") {#M1:2 %port1:p};
*   &net4 @WIRE(mode="straight") {#M1:3 %j1};
*   &net4 @WIRE(mode="straight") {%j1 %j2};
*   &net4 @WIRE(mode="straight") {%j2 %j3};
*   &VSS @WIRE(mode="straight") {#R1:2 %gnd1:p};
*   &VSS @WIRE(mode="straight") {#C1:2 %gnd2:p};
*   &net4 @WIRE(mode="straight") {%j1 #R1:1};
*   &net4 @WIRE(mode="straight") {%j2 #C1:1};
*   &vdd @WIRE(mode="straight") {%vdd2:p #M2:3};
*   &VSS @WIRE(mode="straight") {#M3:3 %gnd3:p};
*   &net4 @WIRE(mode="straight") {#M2:2 %j4};
*   &net4 @WIRE(mode="straight") {%j4 %j3};
*   &net4 @WIRE(mode="straight") {%j3 %j5};
*   &net4 @WIRE(mode="straight") {%j5 #M3:2};
*   &net0 @WIRE(mode="straight") {#M2:1 %j6};
*   &net0 @WIRE(mode="straight") {%j6 #M3:1};
*   &vdd @WIRE(mode="straight") {%vdd3:p #M4:3};
*   &VSS @WIRE(mode="straight") {#M5:3 %gnd4:p};
*   &net0 @WIRE(mode="straight") {#M4:2 %j7};
*   &net0 @WIRE(mode="straight") {%j7 %j8};
*   &net0 @WIRE(mode="straight") {%j8 %j9};
*   &net0 @WIRE(mode="straight") {%j9 #M5:2};
*   &ap @WIRE(mode="straight") {#M4:1 %j10};
*   &ap @WIRE(mode="straight") {%j10 #M5:1};
*   &ap @WIRE(mode="straight") {%j10 %j11};
*   &net0 @WIRE(mode="straight") {%j6 %j8};
*   &vdd @WIRE(mode="straight") {%vdd4:p #M6:1};
*   &b @WIRE(mode="straight") {#M6:2 %port2:p};
*   &net5 @WIRE(mode="straight") {#M6:3 %j12};
*   &net5 @WIRE(mode="straight") {%j12 %j13};
*   &net5 @WIRE(mode="straight") {%j13 %j14};
*   &VSS @WIRE(mode="straight") {#R2:2 %gnd5:p};
*   &VSS @WIRE(mode="straight") {#C2:2 %gnd6:p};
*   &net5 @WIRE(mode="straight") {%j12 #R2:1};
*   &net5 @WIRE(mode="straight") {%j13 #C2:1};
*   &vdd @WIRE(mode="straight") {%vdd5:p #M7:3};
*   &VSS @WIRE(mode="straight") {#M8:3 %gnd7:p};
*   &net5 @WIRE(mode="straight") {#M7:2 %j15};
*   &net5 @WIRE(mode="straight") {%j15 %j14};
*   &net5 @WIRE(mode="straight") {%j14 %j16};
*   &net5 @WIRE(mode="straight") {%j16 #M8:2};
*   &net1 @WIRE(mode="straight") {#M7:1 %j17};
*   &net1 @WIRE(mode="straight") {%j17 #M8:1};
*   &vdd @WIRE(mode="straight") {%vdd6:p #M9:3};
*   &VSS @WIRE(mode="straight") {#M10:3 %gnd8:p};
*   &net1 @WIRE(mode="straight") {#M9:2 %j18};
*   &net1 @WIRE(mode="straight") {%j18 %j19};
*   &net1 @WIRE(mode="straight") {%j19 %j20};
*   &net1 @WIRE(mode="straight") {%j20 #M10:2};
*   &bp @WIRE(mode="straight") {#M9:1 %j21};
*   &bp @WIRE(mode="straight") {%j21 #M10:1};
*   &bp @WIRE(mode="straight") {%j21 %j22};
*   &net1 @WIRE(mode="straight") {%j17 %j19};
*   &vdd @WIRE(mode="straight") {%vdd7:p #M11:3};
*   &vdd @WIRE(mode="straight") {%vdd8:p #M12:3};
*   &ap @WIRE(mode="straight") {#M11:2 %j23};
*   &bp @WIRE(mode="straight") {#M12:2 %j24};
*   &net2 @WIRE(mode="straight") {#M11:1 %j25};
*   &net2 @WIRE(mode="straight") {%j25 %j26};
*   &net2 @WIRE(mode="straight") {%j26 %j27};
*   &net2 @WIRE(mode="straight") {%j27 #M12:1};
*   &net2 @WIRE(mode="straight") {%j26 #M13:1};
*   &net3 @WIRE(mode="straight") {#M13:3 #M14:1};
*   &VSS @WIRE(mode="straight") {#M14:3 %gnd9:p};
*   &ap @WIRE(mode="straight") {#M13:2 %j28};
*   &bp @WIRE(mode="straight") {#M14:2 %j29};
*   &vdd @WIRE(mode="straight") {%vdd9:p #M15:3};
*   &VSS @WIRE(mode="straight") {#M16:3 %gnd10:p};
*   &net2 @WIRE(mode="straight") {#M15:2 %j30};
*   &net2 @WIRE(mode="straight") {%j30 %j31};
*   &net2 @WIRE(mode="straight") {%j31 %j32};
*   &net2 @WIRE(mode="straight") {%j32 #M16:2};
*   &out @WIRE(mode="straight") {#M15:1 %j33};
*   &out @WIRE(mode="straight") {%j33 #M16:1};
*   &net2 @WIRE(mode="straight") {%j27 %j34};
*   &net2 @WIRE(mode="straight") {%j34 %j35};
*   &net2 @WIRE(mode="straight") {%j35 %j31};
*   &VSS @WIRE(mode="straight") {#CL:2 %gnd11:p};
*   &out @WIRE(mode="straight") {%j33 %j36};
*   &out @WIRE(mode="straight") {%j36 #CL:1};
*   &out @WIRE(mode="straight") {%j36 %port3:p};
*   #M1 @TEXT("\textbf{\textit{M}}_{\textbf{1}}", key="name", dx=0.5, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #M1::name(label);
*   &vdd @TEXT("\textbf{\textit{v}}_{\textbf{dd}}", halign="middle", size=1.5116) => @PLACE(6, 6) => %power1;
*   $CANVAS_LABEL @ATTACH(bind="net") %power1(label);
*   %port1 @TEXT("\textbf{\textit{a}}", dx=-1.4, dy=-0.4, halign="end", size=1.5116) => %label1;
*   $CANVAS_LABEL @ATTACH(bind="port") %label1(label);
*   #R1 @TEXT("\textbf{\textit{R}}_{\textbf{1}}", key="name", dx=0.9, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #R1::name(label);
*   #R1 @TEXT("\textbf{1meg}", key="value", dx=0.9, dy=-2.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="value") #R1::value(label);
*   #C1 @TEXT("\textbf{\textit{C}}_{\textbf{1}}", key="name", dx=1.2, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #C1::name(label);
*   #C1 @TEXT("\textbf{1p}", key="value", dx=1.2, dy=-2.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="value") #C1::value(label);
*   #M2 @TEXT("\textbf{\textit{M}}_{\textbf{2}}", key="name", dx=0.4, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #M2::name(label);
*   #M3 @TEXT("\textbf{\textit{M}}_{\textbf{3}}", key="name", dx=0.5, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #M3::name(label);
*   &vdd @TEXT("\textbf{\textit{v}}_{\textbf{dd}}", halign="middle", size=1.5116) => @PLACE(32, 4) => %power2;
*   $CANVAS_LABEL @ATTACH(bind="net") %power2(label);
*   #M4 @TEXT("\textbf{\textit{M}}_{\textbf{4}}", key="name", dx=0.4, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #M4::name(label);
*   #M5 @TEXT("\textbf{\textit{M}}_{\textbf{5}}", key="name", dx=0.5, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #M5::name(label);
*   &vdd @TEXT("\textbf{\textit{v}}_{\textbf{dd}}", halign="middle", size=1.5116) => @PLACE(49, 4) => %power3;
*   $CANVAS_LABEL @ATTACH(bind="net") %power3(label);
*   &ap @TEXT("\textbf{\textit{ap}}", size=1.5116) => @PLACE(52, -6.4) => %label2;
*   $CANVAS_LABEL @ATTACH(bind="net") %label2(label);
*   #M6 @TEXT("\textbf{\textit{M}}_{\textbf{6}}", key="name", dx=0.5, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #M6::name(label);
*   &vdd @TEXT("\textbf{\textit{v}}_{\textbf{dd}}", halign="middle", size=1.5116) => @PLACE(6, -22) => %power4;
*   $CANVAS_LABEL @ATTACH(bind="net") %power4(label);
*   %port2 @TEXT("\textbf{\textit{b}}", dx=-1.4, dy=-0.4, halign="end", size=1.5116) => %label3;
*   $CANVAS_LABEL @ATTACH(bind="port") %label3(label);
*   #R2 @TEXT("\textbf{\textit{R}}_{\textbf{2}}", key="name", dx=0.9, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #R2::name(label);
*   #R2 @TEXT("\textbf{1meg}", key="value", dx=0.9, dy=-2.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="value") #R2::value(label);
*   #C2 @TEXT("\textbf{\textit{C}}_{\textbf{2}}", key="name", dx=1.2, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #C2::name(label);
*   #C2 @TEXT("\textbf{1p}", key="value", dx=1.2, dy=-2.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="value") #C2::value(label);
*   #M7 @TEXT("\textbf{\textit{M}}_{\textbf{7}}", key="name", dx=0.4, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #M7::name(label);
*   #M8 @TEXT("\textbf{\textit{M}}_{\textbf{8}}", key="name", dx=0.5, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #M8::name(label);
*   &vdd @TEXT("\textbf{\textit{v}}_{\textbf{dd}}", halign="middle", size=1.5116) => @PLACE(32, -24) => %power5;
*   $CANVAS_LABEL @ATTACH(bind="net") %power5(label);
*   #M9 @TEXT("\textbf{\textit{M}}_{\textbf{9}}", key="name", dx=0.4, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #M9::name(label);
*   #M10 @TEXT("\textbf{\textit{M}}_{\textbf{10}}", key="name", dx=0.5, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #M10::name(label);
*   &vdd @TEXT("\textbf{\textit{v}}_{\textbf{dd}}", halign="middle", size=1.5116) => @PLACE(49, -24) => %power6;
*   $CANVAS_LABEL @ATTACH(bind="net") %power6(label);
*   &bp @TEXT("\textbf{\textit{bp}}", size=1.5116) => @PLACE(52, -34.4) => %label4;
*   $CANVAS_LABEL @ATTACH(bind="net") %label4(label);
*   #M11 @TEXT("\textbf{\textit{M}}_{\textbf{11}}", key="name", dx=0.4, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #M11::name(label);
*   #M12 @TEXT("\textbf{\textit{M}}_{\textbf{12}}", key="name", dx=0.4, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #M12::name(label);
*   &vdd @TEXT("\textbf{\textit{v}}_{\textbf{dd}}", halign="middle", size=1.5116) => @PLACE(69, 0) => %power7;
*   $CANVAS_LABEL @ATTACH(bind="net") %power7(label);
*   &vdd @TEXT("\textbf{\textit{v}}_{\textbf{dd}}", halign="middle", size=1.5116) => @PLACE(83, 0) => %power8;
*   $CANVAS_LABEL @ATTACH(bind="net") %power8(label);
*   &ap @TEXT("\textbf{\textit{ap}}", halign="end", size=1.5116) => @PLACE(64, -6.4) => %label5;
*   $CANVAS_LABEL @ATTACH(bind="net") %label5(label);
*   &bp @TEXT("\textbf{\textit{bp}}", halign="end", size=1.5116) => @PLACE(78, -6.4) => %label6;
*   $CANVAS_LABEL @ATTACH(bind="net") %label6(label);
*   #M13 @TEXT("\textbf{\textit{M}}_{\textbf{13}}", key="name", dx=0.5, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #M13::name(label);
*   #M14 @TEXT("\textbf{\textit{M}}_{\textbf{14}}", key="name", dx=0.5, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #M14::name(label);
*   &ap @TEXT("\textbf{\textit{ap}}", halign="end", size=1.5116) => @PLACE(71, -16.4) => %label7;
*   $CANVAS_LABEL @ATTACH(bind="net") %label7(label);
*   &bp @TEXT("\textbf{\textit{bp}}", halign="end", size=1.5116) => @PLACE(71, -24.4) => %label8;
*   $CANVAS_LABEL @ATTACH(bind="net") %label8(label);
*   #M15 @TEXT("\textbf{\textit{M}}_{\textbf{15}}", key="name", dx=0.4, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #M15::name(label);
*   #M16 @TEXT("\textbf{\textit{M}}_{\textbf{16}}", key="name", dx=0.5, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #M16::name(label);
*   &vdd @TEXT("\textbf{\textit{v}}_{\textbf{dd}}", halign="middle", size=1.5116) => @PLACE(99, -6) => %power9;
*   $CANVAS_LABEL @ATTACH(bind="net") %power9(label);
*   #CL @TEXT("\textbf{\textit{C}}_{\textbf{L}}", key="name", dx=1.2, dy=-0.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="name") #CL::name(label);
*   #CL @TEXT("\textbf{100f}", key="value", dx=1.2, dy=-2.5, halign="start", valign="baseline", size=1.5116);
*   $CANVAS_LABEL @ATTACH(bind="value") #CL::value(label);
*   %port3 @TEXT("\textbf{\textit{out}}", dx=1.4, dy=-0.4, size=1.5116) => %label9;
*   $CANVAS_LABEL @ATTACH(bind="port") %label9(label)
* }
.ends astra_018_cmos_pulse_coincidence
