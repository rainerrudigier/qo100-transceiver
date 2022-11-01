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
L Interface:LTC6957xMS-3 U1
U 1 1 61797B38
P 6600 3650
F 0 "U1" H 6250 4250 50  0000 L CNN
F 1 "LTC6957xMS-3" H 6850 4250 50  0000 L CNN
F 2 "Package_SO:MSOP-12_3x4mm_P0.65mm" H 6600 3000 50  0001 C CNN
F 3 "https://www.analog.com/media/en/technical-documentation/data-sheets/6957fb.pdf" H 6600 3650 50  0001 C CNN
	1    6600 3650
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR04
U 1 1 617983BE
P 6600 2600
F 0 "#PWR04" H 6600 2450 50  0001 C CNN
F 1 "+3V3" H 6615 2773 50  0000 C CNN
F 2 "" H 6600 2600 50  0001 C CNN
F 3 "" H 6600 2600 50  0001 C CNN
	1    6600 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 3050 6600 2750
Wire Wire Line
	6700 3050 6700 2750
Wire Wire Line
	6700 2750 6600 2750
Connection ~ 6600 2750
Wire Wire Line
	6600 2750 6600 2600
Wire Wire Line
	6600 2750 5950 2750
Wire Wire Line
	5950 2750 5950 3750
Wire Wire Line
	5950 3750 6200 3750
$Comp
L power:GND #PWR05
U 1 1 61798F03
P 6600 4650
F 0 "#PWR05" H 6600 4400 50  0001 C CNN
F 1 "GND" H 6605 4477 50  0000 C CNN
F 2 "" H 6600 4650 50  0001 C CNN
F 3 "" H 6600 4650 50  0001 C CNN
	1    6600 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 4650 6600 4350
Wire Wire Line
	6600 4350 6700 4350
Wire Wire Line
	6700 4350 6700 4250
Connection ~ 6600 4350
Wire Wire Line
	6600 4350 6600 4250
$Comp
L Device:R R2
U 1 1 6179977F
P 5600 3000
F 0 "R2" H 5670 3046 50  0000 L CNN
F 1 "4k7" H 5670 2955 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 5530 3000 50  0001 C CNN
F 3 "~" H 5600 3000 50  0001 C CNN
	1    5600 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5600 2850 5600 2750
Wire Wire Line
	5600 2750 5950 2750
Connection ~ 5950 2750
Wire Wire Line
	6200 4050 5600 4050
$Comp
L power:GND #PWR03
U 1 1 6179B306
P 6050 4650
F 0 "#PWR03" H 6050 4400 50  0001 C CNN
F 1 "GND" H 6055 4477 50  0000 C CNN
F 2 "" H 6050 4650 50  0001 C CNN
F 3 "" H 6050 4650 50  0001 C CNN
	1    6050 4650
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 6179B857
P 4850 3500
F 0 "R1" H 4920 3546 50  0000 L CNN
F 1 "49.9" H 4920 3455 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 4780 3500 50  0001 C CNN
F 3 "~" H 4850 3500 50  0001 C CNN
	1    4850 3500
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 6179BE59
P 4850 4000
F 0 "C2" H 4965 4046 50  0000 L CNN
F 1 "0.01u" H 4965 3955 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4888 3850 50  0001 C CNN
F 3 "~" H 4850 4000 50  0001 C CNN
	1    4850 4000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 6179C052
P 4450 3250
F 0 "C1" V 4198 3250 50  0000 C CNN
F 1 "0.01u" V 4289 3250 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4488 3100 50  0001 C CNN
F 3 "~" H 4450 3250 50  0001 C CNN
	1    4450 3250
	0    1    1    0   
$EndComp
Wire Wire Line
	6200 3250 4850 3250
Wire Wire Line
	4850 3350 4850 3250
Connection ~ 4850 3250
Wire Wire Line
	4850 3250 4600 3250
Wire Wire Line
	4850 3850 4850 3750
Wire Wire Line
	6200 3350 5300 3350
Wire Wire Line
	5300 3350 5300 3750
Wire Wire Line
	5300 3750 4850 3750
Connection ~ 4850 3750
Wire Wire Line
	4850 3750 4850 3650
$Comp
L power:GND #PWR02
U 1 1 6179D511
P 4850 4650
F 0 "#PWR02" H 4850 4400 50  0001 C CNN
F 1 "GND" H 4855 4477 50  0000 C CNN
F 2 "" H 4850 4650 50  0001 C CNN
F 3 "" H 4850 4650 50  0001 C CNN
	1    4850 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	4850 4650 4850 4150
$Comp
L Device:R R5
U 1 1 6179DA7D
P 7900 3550
F 0 "R5" V 7693 3550 50  0000 C CNN
F 1 "240" V 7784 3550 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 7830 3550 50  0001 C CNN
F 3 "~" H 7900 3550 50  0001 C CNN
	1    7900 3550
	0    1    1    0   
$EndComp
$Comp
L Device:R R6
U 1 1 6179E064
P 8250 3850
F 0 "R6" H 8320 3896 50  0000 L CNN
F 1 "240" H 8320 3805 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 8180 3850 50  0001 C CNN
F 3 "~" H 8250 3850 50  0001 C CNN
	1    8250 3850
	1    0    0    -1  
$EndComp
$Comp
L Device:C C4
U 1 1 6179E1FF
P 8600 3550
F 0 "C4" V 8348 3550 50  0000 C CNN
F 1 "18p" V 8439 3550 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 8638 3400 50  0001 C CNN
F 3 "~" H 8600 3550 50  0001 C CNN
	1    8600 3550
	0    1    1    0   
$EndComp
Wire Wire Line
	7000 3550 7750 3550
Wire Wire Line
	8050 3550 8250 3550
Wire Wire Line
	8250 3700 8250 3550
Connection ~ 8250 3550
Wire Wire Line
	8250 3550 8450 3550
$Comp
L power:GND #PWR07
U 1 1 6179F2E3
P 8250 4100
F 0 "#PWR07" H 8250 3850 50  0001 C CNN
F 1 "GND" H 8255 3927 50  0000 C CNN
F 2 "" H 8250 4100 50  0001 C CNN
F 3 "" H 8250 4100 50  0001 C CNN
	1    8250 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	8250 4100 8250 4000
$Comp
L Connector:Conn_Coaxial J1
U 1 1 617A151D
P 3700 3250
F 0 "J1" H 3628 3488 50  0000 C CNN
F 1 "CLK_IN" H 3628 3397 50  0000 C CNN
F 2 "Connector_Coaxial:U.FL_Hirose_U.FL-R-SMT-1_Vertical" H 3700 3250 50  0001 C CNN
F 3 " ~" H 3700 3250 50  0001 C CNN
	1    3700 3250
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3900 3250 4300 3250
$Comp
L power:GND #PWR01
U 1 1 617A221F
P 3700 3650
F 0 "#PWR01" H 3700 3400 50  0001 C CNN
F 1 "GND" H 3705 3477 50  0000 C CNN
F 2 "" H 3700 3650 50  0001 C CNN
F 3 "" H 3700 3650 50  0001 C CNN
	1    3700 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	3700 3650 3700 3450
Wire Wire Line
	6200 3650 6050 3650
Wire Wire Line
	6050 3650 6050 3950
Wire Wire Line
	5600 3150 5600 4050
Wire Wire Line
	6200 3950 6050 3950
Connection ~ 6050 3950
Wire Wire Line
	6050 3950 6050 4550
Wire Wire Line
	5600 4100 5600 4050
Connection ~ 5600 4050
Wire Wire Line
	5600 4400 5600 4550
Wire Wire Line
	5600 4550 6050 4550
Connection ~ 6050 4550
Wire Wire Line
	6050 4550 6050 4650
$Comp
L Device:R R3
U 1 1 617AE367
P 7400 3750
F 0 "R3" V 7193 3750 50  0000 C CNN
F 1 "75" V 7284 3750 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 7330 3750 50  0001 C CNN
F 3 "~" H 7400 3750 50  0001 C CNN
	1    7400 3750
	0    1    1    0   
$EndComp
$Comp
L Device:R R4
U 1 1 617AEF0B
P 7850 4850
F 0 "R4" H 7920 4896 50  0000 L CNN
F 1 "100" H 7920 4805 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 7780 4850 50  0001 C CNN
F 3 "~" H 7850 4850 50  0001 C CNN
	1    7850 4850
	1    0    0    -1  
$EndComp
$Comp
L Device:C C3
U 1 1 617AF611
P 7850 5250
F 0 "C3" H 7965 5296 50  0000 L CNN
F 1 "0.01u" H 7965 5205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 7888 5100 50  0001 C CNN
F 3 "~" H 7850 5250 50  0001 C CNN
	1    7850 5250
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_Coaxial J2
U 1 1 617AF840
P 8750 4500
F 0 "J2" H 8850 4475 50  0000 L CNN
F 1 "CLK_OUT_2" H 8850 4384 50  0000 L CNN
F 2 "Connector_Coaxial:U.FL_Hirose_U.FL-R-SMT-1_Vertical" H 8750 4500 50  0001 C CNN
F 3 " ~" H 8750 4500 50  0001 C CNN
	1    8750 4500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR06
U 1 1 617B01E2
P 7850 5500
F 0 "#PWR06" H 7850 5250 50  0001 C CNN
F 1 "GND" H 7855 5327 50  0000 C CNN
F 2 "" H 7850 5500 50  0001 C CNN
F 3 "" H 7850 5500 50  0001 C CNN
	1    7850 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	7850 5500 7850 5400
Wire Wire Line
	7850 5100 7850 5000
Wire Wire Line
	7850 4700 7850 4500
Wire Wire Line
	7850 4500 8550 4500
Wire Wire Line
	7850 4500 7850 3750
Wire Wire Line
	7850 3750 7550 3750
Connection ~ 7850 4500
Wire Wire Line
	7250 3750 7000 3750
$Comp
L power:GND #PWR08
U 1 1 617B35F4
P 8750 4800
F 0 "#PWR08" H 8750 4550 50  0001 C CNN
F 1 "GND" H 8755 4627 50  0000 C CNN
F 2 "" H 8750 4800 50  0001 C CNN
F 3 "" H 8750 4800 50  0001 C CNN
	1    8750 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	8750 4800 8750 4700
$Comp
L Connector:Conn_01x01_Female J3
U 1 1 617B5FB7
P 9200 3550
F 0 "J3" H 9228 3576 50  0000 L CNN
F 1 "CLK_OUT_1" H 9228 3485 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H 9200 3550 50  0001 C CNN
F 3 "~" H 9200 3550 50  0001 C CNN
	1    9200 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	8750 3550 9000 3550
$Comp
L Connector:Conn_01x01_Female J4
U 1 1 617C2D79
P 4900 1550
F 0 "J4" H 4792 1325 50  0000 C CNN
F 1 "VIN+" H 4792 1416 50  0000 C CNN
F 2 "TestPoint:TestPoint_Pad_3.0x3.0mm" H 4900 1550 50  0001 C CNN
F 3 "~" H 4900 1550 50  0001 C CNN
	1    4900 1550
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x01_Female J5
U 1 1 617C30EA
P 7900 1900
F 0 "J5" H 7928 1926 50  0000 L CNN
F 1 "GND" H 7928 1835 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_3.0x3.0mm" H 7900 1900 50  0001 C CNN
F 3 "~" H 7900 1900 50  0001 C CNN
	1    7900 1900
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR09
U 1 1 617C3EE5
P 6850 1450
F 0 "#PWR09" H 6850 1300 50  0001 C CNN
F 1 "+3V3" H 6865 1623 50  0000 C CNN
F 2 "" H 6850 1450 50  0001 C CNN
F 3 "" H 6850 1450 50  0001 C CNN
	1    6850 1450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR010
U 1 1 617C4347
P 7450 2000
F 0 "#PWR010" H 7450 1750 50  0001 C CNN
F 1 "GND" H 7455 1827 50  0000 C CNN
F 2 "" H 7450 2000 50  0001 C CNN
F 3 "" H 7450 2000 50  0001 C CNN
	1    7450 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	7450 2000 7450 1900
Wire Wire Line
	7450 1900 7700 1900
$Comp
L Connector:Conn_01x01_Female J6
U 1 1 617C6E42
P 9200 3800
F 0 "J6" H 9228 3826 50  0000 L CNN
F 1 "GND" H 9228 3735 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H 9200 3800 50  0001 C CNN
F 3 "~" H 9200 3800 50  0001 C CNN
	1    9200 3800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 617C71E8
P 8900 3900
F 0 "#PWR0101" H 8900 3650 50  0001 C CNN
F 1 "GND" H 8905 3727 50  0000 C CNN
F 2 "" H 8900 3900 50  0001 C CNN
F 3 "" H 8900 3900 50  0001 C CNN
	1    8900 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	8900 3900 8900 3800
Wire Wire Line
	8900 3800 9000 3800
$Comp
L Device:R R7
U 1 1 617CF961
P 5600 4250
F 0 "R7" H 5670 4296 50  0000 L CNN
F 1 "0" H 5670 4205 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 5530 4250 50  0001 C CNN
F 3 "~" H 5600 4250 50  0001 C CNN
	1    5600 4250
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Linear:LDK130-33_SOT23_SOT353 U2
U 1 1 617E33EA
P 5900 1650
F 0 "U2" H 5900 1992 50  0000 C CNN
F 1 "LDK130-33_SOT23_SOT353" H 5900 1901 50  0000 C CNN
F 2 "Parts:SOT-23-5L" H 5900 1975 50  0001 C CNN
F 3 "http://www.st.com/content/ccc/resource/technical/document/datasheet/29/10/f7/87/2f/66/47/f4/DM00076097.pdf/files/DM00076097.pdf/jcr:content/translations/en.DM00076097.pdf" H 5900 1650 50  0001 C CNN
F 4 "511-LDK130M33RY" H 5900 1650 50  0001 C CNN "Mouser"
	1    5900 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	6200 1550 6600 1550
Wire Wire Line
	5100 1550 5200 1550
Wire Wire Line
	6850 1450 6850 1550
$Comp
L power:GND #PWR012
U 1 1 617EB1A9
P 5900 2100
F 0 "#PWR012" H 5900 1850 50  0001 C CNN
F 1 "GND" H 5905 1927 50  0000 C CNN
F 2 "" H 5900 2100 50  0001 C CNN
F 3 "" H 5900 2100 50  0001 C CNN
	1    5900 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	5900 2100 5900 1950
$Comp
L Device:C C5
U 1 1 617EC9F8
P 5200 1800
F 0 "C5" H 5315 1846 50  0000 L CNN
F 1 "1u" H 5315 1755 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 5238 1650 50  0001 C CNN
F 3 "~" H 5200 1800 50  0001 C CNN
	1    5200 1800
	1    0    0    -1  
$EndComp
$Comp
L Device:C C7
U 1 1 617ECE81
P 6600 1800
F 0 "C7" H 6715 1846 50  0000 L CNN
F 1 "1u" H 6715 1755 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 6638 1650 50  0001 C CNN
F 3 "~" H 6600 1800 50  0001 C CNN
	1    6600 1800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR014
U 1 1 617ED167
P 6600 2100
F 0 "#PWR014" H 6600 1850 50  0001 C CNN
F 1 "GND" H 6605 1927 50  0000 C CNN
F 2 "" H 6600 2100 50  0001 C CNN
F 3 "" H 6600 2100 50  0001 C CNN
	1    6600 2100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR011
U 1 1 617ED43C
P 5200 2100
F 0 "#PWR011" H 5200 1850 50  0001 C CNN
F 1 "GND" H 5205 1927 50  0000 C CNN
F 2 "" H 5200 2100 50  0001 C CNN
F 3 "" H 5200 2100 50  0001 C CNN
	1    5200 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 2100 5200 1950
Wire Wire Line
	5200 1650 5200 1550
Connection ~ 5200 1550
Wire Wire Line
	5200 1550 5450 1550
Wire Wire Line
	6600 2100 6600 1950
Wire Wire Line
	6600 1650 6600 1550
Connection ~ 6600 1550
Wire Wire Line
	6600 1550 6850 1550
Wire Wire Line
	5600 1650 5450 1650
Wire Wire Line
	5450 1650 5450 1550
Connection ~ 5450 1550
Wire Wire Line
	5450 1550 5600 1550
Wire Wire Line
	6300 1650 6200 1650
$Comp
L Connector:TestPoint_Alt TP1
U 1 1 6180E4C5
P 7450 1650
F 0 "TP1" H 7508 1768 50  0000 L CNN
F 1 "GND" H 7508 1677 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H 7650 1650 50  0001 C CNN
F 3 "~" H 7650 1650 50  0001 C CNN
	1    7450 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	7450 1650 7450 1800
Connection ~ 7450 1900
$Comp
L Connector:TestPoint_Alt TP2
U 1 1 6181059D
P 7700 1650
F 0 "TP2" H 7758 1768 50  0000 L CNN
F 1 "GND" H 7758 1677 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H 7900 1650 50  0001 C CNN
F 3 "~" H 7900 1650 50  0001 C CNN
	1    7700 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	7700 1650 7700 1800
Wire Wire Line
	7700 1800 7450 1800
Connection ~ 7450 1800
Wire Wire Line
	7450 1800 7450 1900
$Comp
L Connector:TestPoint_Alt TP3
U 1 1 6185B395
P 6600 1100
F 0 "TP3" H 6658 1218 50  0000 L CNN
F 1 "3v3" H 6658 1127 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H 6800 1100 50  0001 C CNN
F 3 "~" H 6800 1100 50  0001 C CNN
	1    6600 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 1550 6600 1100
$EndSCHEMATC
