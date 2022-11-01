EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Device:R R2
U 1 1 61596F29
P 3500 2350
F 0 "R2" V 3293 2350 50  0000 C CNN
F 1 "43.2 1%" V 3384 2350 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 3430 2350 50  0001 C CNN
F 3 "~" H 3500 2350 50  0001 C CNN
F 4 "P43.2HCT-ND" H 3500 2350 50  0001 C CNN "Digikey"
	1    3500 2350
	0    1    1    0   
$EndComp
$Comp
L Device:R R1
U 1 1 615976E1
P 3150 2700
F 0 "R1" H 3220 2746 50  0000 L CNN
F 1 "86.6 1%" H 3220 2655 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 3080 2700 50  0001 C CNN
F 3 "~" H 3150 2700 50  0001 C CNN
F 4 "P86.6HCT-ND" H 3150 2700 50  0001 C CNN "Digikey"
	1    3150 2700
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 615977F6
P 4150 2350
F 0 "C1" V 3898 2350 50  0000 C CNN
F 1 "100p" V 3989 2350 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4188 2200 50  0001 C CNN
F 3 "~" H 4150 2350 50  0001 C CNN
F 4 "1284-1164-1-ND" H 4150 2350 50  0001 C CNN "Digikey"
	1    4150 2350
	0    1    1    0   
$EndComp
$Comp
L Device:L L1
U 1 1 6159902B
P 4400 2850
F 0 "L1" H 4453 2896 50  0000 L CNN
F 1 "39nH" H 4453 2805 50  0000 L CNN
F 2 "Inductor_SMD:L_0603_1608Metric" H 4400 2850 50  0001 C CNN
F 3 "~" H 4400 2850 50  0001 C CNN
F 4 "490-15822-1-ND" H 4400 2850 50  0001 C CNN "Digikey"
	1    4400 2850
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_Coaxial J3
U 1 1 61599B39
P 5500 2350
F 0 "J3" H 5600 2325 50  0000 L CNN
F 1 "LNB" H 5600 2234 50  0000 L CNN
F 2 "Parts:F_Molex_73330-0030_Horizontal" H 5500 2350 50  0001 C CNN
F 3 " ~" H 5500 2350 50  0001 C CNN
F 4 "WM5387-ND" H 5500 2350 50  0001 C CNN "Digikey"
	1    5500 2350
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_Coaxial J1
U 1 1 6159A657
P 2350 2350
F 0 "J1" H 2278 2588 50  0000 C CNN
F 1 "SDR" H 2278 2497 50  0000 C CNN
F 2 "Connector_Coaxial:SMA_Molex_73251-1153_EdgeMount_Horizontal" H 2350 2350 50  0001 C CNN
F 3 " ~" H 2350 2350 50  0001 C CNN
F 4 "WM5534-ND" H 2350 2350 50  0001 C CNN "Digikey"
	1    2350 2350
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR02
U 1 1 6159C457
P 3150 3000
F 0 "#PWR02" H 3150 2750 50  0001 C CNN
F 1 "GND" H 3155 2827 50  0000 C CNN
F 2 "" H 3150 3000 50  0001 C CNN
F 3 "" H 3150 3000 50  0001 C CNN
	1    3150 3000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR01
U 1 1 6159C56E
P 2350 2700
F 0 "#PWR01" H 2350 2450 50  0001 C CNN
F 1 "GND" H 2355 2527 50  0000 C CNN
F 2 "" H 2350 2700 50  0001 C CNN
F 3 "" H 2350 2700 50  0001 C CNN
	1    2350 2700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR04
U 1 1 6159C691
P 5500 3450
F 0 "#PWR04" H 5500 3200 50  0001 C CNN
F 1 "GND" H 5505 3277 50  0000 C CNN
F 2 "" H 5500 3450 50  0001 C CNN
F 3 "" H 5500 3450 50  0001 C CNN
	1    5500 3450
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 6159E778
P 4800 3300
F 0 "C2" V 4548 3300 50  0000 C CNN
F 1 "100p" V 4639 3300 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4838 3150 50  0001 C CNN
F 3 "~" H 4800 3300 50  0001 C CNN
F 4 "1284-1164-1-ND" H 4800 3300 50  0001 C CNN "Digikey"
	1    4800 3300
	0    1    1    0   
$EndComp
Wire Wire Line
	5500 3450 5500 3300
Wire Wire Line
	4950 3300 5500 3300
Connection ~ 5500 3300
Wire Wire Line
	5500 3300 5500 2550
Wire Wire Line
	4650 3300 4400 3300
Wire Wire Line
	4400 3300 4400 3000
Wire Wire Line
	4400 2700 4400 2350
Wire Wire Line
	4400 2350 5300 2350
Wire Wire Line
	2350 2700 2350 2550
Wire Wire Line
	3150 3000 3150 2850
Text Notes 3050 2050 0    50   ~ 0
50 <-> 75 Ohm
Text Notes 5350 2100 0    50   ~ 0
LNB F-Conn
Wire Wire Line
	4300 2350 4400 2350
Connection ~ 4400 2350
Wire Wire Line
	4000 2350 3650 2350
Wire Wire Line
	2550 2350 3150 2350
Wire Wire Line
	3150 2550 3150 2350
Connection ~ 3150 2350
Wire Wire Line
	3150 2350 3350 2350
Text Notes 2150 1950 0    50   ~ 0
Pluto-SMA
$Comp
L Connector_Generic:Conn_01x02 J2
U 1 1 615C7C2C
P 4000 3600
F 0 "J2" H 3918 3817 50  0000 C CNN
F 1 "13V" H 3918 3726 50  0000 C CNN
F 2 "Connector_Molex:Molex_PicoBlade_53047-0210_1x02_P1.25mm_Vertical" H 4000 3600 50  0001 C CNN
F 3 "~" H 4000 3600 50  0001 C CNN
F 4 "WM1731-ND" H 4000 3600 50  0001 C CNN "Digikey"
	1    4000 3600
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4200 3600 4400 3600
Wire Wire Line
	4400 3600 4400 3300
Connection ~ 4400 3300
$Comp
L power:GND #PWR03
U 1 1 615C939F
P 4400 3800
F 0 "#PWR03" H 4400 3550 50  0001 C CNN
F 1 "GND" H 4405 3627 50  0000 C CNN
F 2 "" H 4400 3800 50  0001 C CNN
F 3 "" H 4400 3800 50  0001 C CNN
	1    4400 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	4200 3700 4400 3700
Wire Wire Line
	4400 3700 4400 3800
Text Notes 2000 2400 0    50   ~ 0
50 R
Text Notes 5800 2350 0    50   ~ 0
75 R
$EndSCHEMATC