# QO100 SDR Transceiver Projekt für narrowband Betrieb

## Info

In diesem Github Repo sind die Infos zum OE9 QO-100 Transceiver Project aus dem Jahr 2021/22. Weiter Infos sind auch im QSP 9/22, 10/22 und 11/22 zu finden.

Die Teile des Projekts welche vom Team selbst erstellt wurden sind Open-Source. Sollten diese Teile des Projekts weiter verwendet werden erfolgt das [as-is und ohne Gewähr](/LICENSE).
Für die Fertig-Komponenten die verwendet wurden gelten die entsprechenden Lizenzen und Terms.

## Ziel des Projekts

Ziel ist der Aufbau eines kompakten und einfachen Transceivers für den narrowband (NB) SSB Betrieb über den Amateurfunksatelliten QO-100. Der Aufbau sollte verständlich sein und anderen OMs ermöglichen einfach zu einem Gerät zu kommen. Das Design sollte getestet und möglichst stabil sein, damit ein einfacher Aufbau und eine einfache Bedienung möglich ist.

## Design Kriterien

- Kompakter Aufbau - Formfaktor eines ICOM 7300 (H/B/T 90 / 240 / 238 mm)
- Zentrale Komponente für den Transceiver ist der Adalm PlutoSDR Rev D (Clock Einspeisung ohne Umbau)
- 2400MHz TX über db4um 1W pre-amp und SG-Labs AMP2400 Version 2 20W PA - Es wurde bewusst die V2 Variante gewählt, da die Version 3 Variante: (a) 40mW (16 dBm) Eingangssignal braucht, was zuviel output für den Pluto ist; und (b) es (scheinbar) Probleme mit der Stabilität gibt
- LNBP sollte kurzschlussfest sein; Schutz des Bias-T bei Kurzschluss 
- Anschluss des Systems über USB zum Laptop
- Verwendung der [SDR-Console](https://www.sdr-radio.com/download) von Simon Brown 
- Nur  narrowband (NB) Betrieb - wideband (WB) würde zu viele Änderungen brauchen (Filter, PA,...); der Aufbau wird dann zu komplex
- System sollte von Standard 13.8V DC betrieben werden können (ein Betrieb bis 24V DC wäre gut) (Anschluss Anderson PowerPole)
- Anzeige der wichtigsten Betriebsparameter über ein 4x20 LCD display (Leistung, SWR,...)
- PTT Steuerung - sowohl Betrieb über Fußschalter mit Rückmeldung an die SDR-Console und Betrieb über die SDR-Console mit Aktivierung remote PTT
- PA Abschaltung bei schlechtem SWR - Blockierung der PTT
- Keine remote Bedienelemente im Gehäuse selbst (SDR-Console unterstützt MIDI basierte remote Steuerung); wenn benötigt als abgesetztes eigenständiges Gerät

## Blockschaltbild

![Blockschaltbild](/dokumentation/qo100-pluto.png)

## Adalm Pluto

Der Analog Devices [Adalm PlutoSDR](https://wiki.analog.com/university/tools/pluto) ist die Zentrale Komponente für den SDR Transceiver - er ermöglicht das Empfang und Senden von 325Mhz - 3.8GHz; mit 200kHz - 20MHz Bandbreite. Damit wird ermöglicht dass 739-740MHz downlink QO-100 IF Signal vom LNB zu empfangen und das 2400MHz uplink Signal direkt zu erzeugen

Hardware Details können unter [Analog Wiki](https://wiki.analog.com/university/tools/pluto/hacking/hardware) gefunden werden

### Firmware

Update firmware auf letzten Stand (May 2021 -> V0.33) sollte gemacht werden. Details können auf im [Analog Wiki](https://wiki.analog.com/university/tools/nopluto/users/firmware) gefunden werden.

Der Update wird über das emulierte USB Drive des Plutos gemacht.

[Firmware Sourcecode](https://github.com/analogdevicesinc/plutosdr-fw) und [HDL Code](https://github.com/analogdevicesinc/hdl/tree/hdl_2016_r2/projects/pluto) kann auf github gefunden werden 


Eine Firmware Variante die im DATV Bereich verwendet ist bekommt man von F5OEO - dies hat auch noch ein paar extra Features wie PTT über die GPIO pins am Pluto - für den NB SSB Betrieb ist diese PTT Variante aber zu langsam - [github F5OEO](https://github.com/F5OEO/plutosdr-fw)

### Treiber

Treiber für den Adalm PlutoSDR können auch vom [Analog Wiki](https://wiki.analog.com/university/tools/pluto/drivers/windows) heruntergeladen werden

Die Treiber werden für die COM und RNDIS Schnittstellen gebraucht - da der Pluto Ethernet over USB macht.

Wenn die Treiber installiert sind kann man per Putty (oder anderem SSH client) auf den Pluto zugreifen

Zugriff auf die Konsole wird gebraucht um die verschiedenen Parameter (e.g. externe Clock) einzustellen.

Die SDR Console verwendet auch die RNDIS Ethernet Schnittstelle für die Verbindung.

## Externer Clock

### Pluto Rev D

Mit der Rev D des PlutoSDR kann dieser ohne Umbau direkt mit einem externen Clock signal versorgt werden; bei den älteren Revisionen musst durch Umbau entweder ein stabilerer (+/- 0.2 ppm) TCXO oder ein externer GPSDO Anschluss eingebaut werden (auslöten des TCXO am Pluto und Einbau einer SMA Buchse).

Das Einspeisen eines externen Clocks ist nötig um die benötigte Frequenzstabilität zu erreichen; um NB SSB Betrieb fahren zu können, da mit Sprachkanälen im kHZ bandbreiten Bereich gearbeitet wird; und ein ständiges nachjustieren der Frequenz extrem mühsam ist. 

Der primäre Fokus beim Clock des PlutoSDR ist die TX Frequenz Mischer stabilisierung - der downlink Mischer im LNB wird über modifizieren des LNB (Einbau TCXO) oder die PSK Bake stabilisiert.

Für unseren Einsatz wird die Einspeisung eines 40MHZ clocks angewendet welcher von einem Leo Bodnar GPSDO erzeugt wird; wie im Blockschaltbild dargestellt

Zum Anschluss muss ein u.FL auf SMA pigtail verwendet werden das am CLK_IN Eingang angeschlossen wird und am GPSDO - uU muss ein Dämpfungsglied zwischen GPSDO und Pluto verwendet werden damit die **max +10dBm** Eingangsleistung (an 50Ohm) nicht überschritten werden.

Die Aktivierung des CLK_IN erfolgt über einen GPIO Pin des FPGAs und wird über eine Umgebungsvariable im Linux des Plutos aktiviert

Unter https://wiki.analog.com/university/tools/pluto/devs/booting ist die entsprechende Information zu finden bzgl den Umgebungsvariablen für den clock

Umgebungsvariablen werden zB so gesetzt (siehe https://wiki.analog.com/university/tools/pluto/users/customizing) 

Die Standardwerte beim Pluto sind die Nutzung des internen clocks; und die Werkskalibierung des TXCO

Folgendes muss ausgeführt werden um den refclk auf die externe 40MHz source zu stellen

```
fw_setenv refclk_source external
fw_printenv refclk_source
#
fw_setenv ad936x_ext_refclk_override "<40000000>"
fw_printenv ad936x_ext_refclk_override
#
fw_setenv ad936x_skip_ext_refclk 1
fw_printenv ad936x_skip_ext_refclk
#
pluto_reboot reset
#
```

Werte können mit folgendem Kommando überprüft werden

```
# fw_printenv | grep refclk | grep -v setenv
```

### Umbau Rev B Pluto

*TODO infos einfuegen*

## Transceiver System Clock Erzeugung

Für den Betrieb mit QO-100 müssen die System Frequenzen stabilisiert werden. Grundsätzlich gibt es zwei Bereiche für welche ein stabiler Clock wichtig ist:

1. **PlutoSDR 40MHz Clock** - hier ist der Fokus nicht primär auf der absoluten Frequenz selbst - jedoch muss diese “langzeit” stabil sein i.e. kein driften und möglichst kleines Phasenrauschen. Ein driften und/oder wobbeln der Frequenz führt dazu das die Ausgangs Frequenz schwankt - da die 40MHz System Frequenz auf 2400MHz hoch gemischt werden; der standardmäßig verbaute TCXO ist im Bereich von  ±25ppm - was nicht ausreicht um einen stabilen Betrieb zu machen.
2. **LNB downconvert auf IF** - im LNB wird durch einen Mischer das 9.75GHz Eingangssignal auf 740MHz (für QO-100) herunter gemischt - dafür wird je nach LNB ein 25MHz oder 27MHz Quarz verwendet (DRO Varianten können nicht verwendet werden) welche die 9.75GHz Mischer Frequenz erzeugt - im regulären TV SAT betrieb wird der Träger vom Satelliten Software technisch gelocked - dadurch ist ein Frequenzdrift durch Temperatur oder andere Einflüsse nicht weiter tragisch. Diese Methode kann auch für QO-100 (PSK baken synchronisation) angewendet werden, ist jedoch nicht immer zuverlässig; es kann aber auch das LNB umgebaut werden und entsprechen per TCXO oder GPSDO mit einem stabilen CLK versorgt werden.

Für die Versorgung des Systems mit einem stabilen Clock wurde die GPSDO Variante gewählt. Der PlutoSDR und das LNB werden mit einem GPSDO von Leo Bodnar versorgt.

## GPSDO Clock Leo Bodnar

Der [zwei Kanal GSPDO von Leo Bodnar](http://www.leobodnar.com/shop/index.php?main_page=product_info&cPath=107&products_id=234) ist ein GPS disziplinierter TCXO auf der Basis eines UBLOX GPS Modules und einer Clock PLL (Si5328C) mit TCXO.

Der UBLOX kann einen stabilen Puls mit der Frequenz von 1Hz bis 10MHz liefern. Der SI5328C kann dann durch die entsprechende Parameter die Ausgänge beschalten. Der TCXO am SI5328C wird als basis verwendet und entsprechend dem GPS puls gezogen. Dadurch entsteht eine sehr genau, stabile und low-jitter Ausgangs Frequenz.

*TODO blockschaltbild einfügen*

Der GPSDO kann mittels eine einfachen Software konfiguriert werden und entsprechende eingestellt werden das er 40MHz und 25MHz liefert. Die entsprechende Parameter müssen selbst eingegeben werden - da die SW selbst nur bestimmt Frequnz kombination Standardmäßig zulässt.

Beim startup des GPSDO liefert dieser den entsprechende Clock sofort; fix und lock des systems auf GPS und PLL dauert ca 30 Sek bei Kaltstart des GPS.

### Parameter für 40MHz / 25MHz

OE6MUE hat im [Amsat Forum](https://forum.amsat-dl.org/index.php?thread/2823-gpsdo-dual-channel-from-leo-bodnar-how-to-configure/&postID=8896#post8896) folgende Parameter beschrieben:

```
40mhz+25mhz einstellungen nochmal korrigiert da der jitter nicht gepasst hat, jetzt ok!!)
CKIN1: 1750000
N31: 15
N2_HS: 4
N2_LS: 12000
N1_HS: 7
NC1_LS: 20
NC2_LS: 32
"update" drücken, soft schließen und erneut öffnen, fertig
vy 73 de oe6mue, mike aus graz
```
Die verschiedenen Parameter erzeugen unterschiedlich F3 (PLL Vergleichs-) Frequenzen; laut dem Datenblatt sollte F3 möglichst hoch sein - damit der Jitter besser ist. (Daher verwende ich die Parameter welche DSPLLsim ermittelt hat 250kHz F3). 

Mit diesen Parameters wird am Output1 40MHz ausgegeben und am Output2 25MHz

### Firmware Upgrade Leo Bodnar GPSDO

**Achtung** .. Firmware Upgrade GPSDO setzt alle Werte Retour! AUCH DIE LEISTUNG AM AUSGANG! Nicht bei angeschlossenem Pluto und LNB upgraden

### Clock Einspeisung Pluto 40MHz

Mit einem Rev.D PlutoSDR kann der Systemclock direkt eingespeist werden (**max +10dBM an 50 Ohm**). Die Konfiguration zur Aktivierung des externen Clocks muss entsprechende gemacht werden.

Mit der Einstellung von 8mA Treiber Strom beim GPSDO ergibt 7.7 dBm an 50 Ohm; uU muss aber ein Dämpfungsglied eingesetzt werden wenn die Leistung des GPSDO zum LNB nicht ausreichend ist.

### Clock Einspeisung LNB 25MHz

Das LNB wird mit 25MHz Clock versorgt. Dafür muss das LNB entsprechend Umgebaut werden (siehe LNB )

Der Treiber Strom muss uU angepasst werden je nach Distanz zum LNB

## TX Pfad

Der TX Pfad besteht primär aus Filterung und Verstärkung; die 20W PA bietet genug Leistung um eine gute Strecke zwischen Transceiver und Antenne zu ermögliche. Das verwendete Kabel zur 2.4GHz Antenne sollte low-loss / 2.4GHz ausgelegt sein. Das Signal wird dann über eine POTY Antenne (am Feed des Spiegels) oder per Helix Antenne Richtung Satellit geschickt.

### Pluto TX RF Ausgang

Ausgang sollte nicht mit voller Leistung betrieben werden. Im oberen Leistungsbereich ist der PlutoSDR nicht linear.

[ADALM Pluto TX output power rev1.pdf (dd1us.de)](http://dd1us.de/Downloads/ADALM%20Pluto%20TX%20output%20power%20rev1.pdf)

>Einstellung an der Ausgangsleistung - sdr-console  'Drive' and 'OP Power' controls

### 2.4GHz SAW Filter

Filter für 2.4 GHz um Nebenaussendungen und/oder Mischprodukte zu filtern. Filterung erfolgt gleich nach dem PlutoSDR um mögliche Produkte nicht in weitere folge zu Verstärken und ggf auszusenden 

### 2.4GHz Vor-Verstärker - db4um 2.5W

[db4um 2.5W PA (SKY66292-11)](https://github.com/db4um/PA_13cm_2W)

### 2.4GHz Power Verstärker - SG-Labs 20W Version 2

Als Power PA wird der [SG-Labs 20W Version 2](https://www.sg-lab.com/AMP2400/amp2400.html) Verstärker verwendet. Es wurde bewusst die Version 2 gewählt; da die Version 3 in Kombination mit dem Pluto sub-optional ist durch die input Power Anforderungen der V3 PA (40mW / 16dBM); der Pluto würde dann mit max power laufen und damit uU nicht-linear

Die Ausgangsleistung kann über die Spannungsversorgung (24 - 28 V DC) geregelt werden.

Umbau bzgl VSWR Messung siehe *TODO infos einfuegen*

Achtung Jumper setting auf Position 1 .. PTT on wenn PTT input auf GND *TODO infos einfuegen*

### POTY Antenne

#### Aufbau Poty

[POTY G0MJW / PA3FYM / M0EYT](http://www.hybridpretender.nl/poty.html) -- [PDF](http://www.hybridpretender.nl/patch.pdf)

[Infos von OE7WPA bzgl Patch fuer QO100](https://oe7wpa.com/index.php/projekte/antennen/patchantennen/patchantenne-fuer-qo-100)

#### Dielektrische (RF) Linse für Poty-Feed

*TODO infos einfuegen*

## RX Pfad

### Bias-T

*TODO infos Messung/Simulation einfuegen*

### LNB Spannungsversorgung

Zum Empfang muss das LNB mit Spannungs versorgt werden. Je nach Spannung (13V oder 18V) wird die polarisation des LNB’s eingestellt. 

Für den narrowband Empfang muss das LNB vertikal polarisiert arbeiten - es muss daher mit 13V versorgt werden.

Die 13V werden aus der 5V System Versorgung mittels eines Step-Up Converters erzeugt 

### LNB

#### Funktionsweise

LNBs haben eine PLL für die Erzeugung der Oszillatorfrequenz von 9750 MHz welche für den Mischer gebraucht wird. Das ergibt zunächst eine ausreichende Stabilität für Schmalband Empfang. Die Referenz der PLL ist ein 25 MHz Quarz. Die Satelliten Ausgabe im X-Band ergibt eine ZF von 739,500 bis 740 MHz. Durch die Ungenauigkeit der 25 MHz Quarze kann die Oszillator- und damit die ZF-Frequenz bis zu einigen hundert KHz abweichen.

Für den NB (narrownband) Betrieb wird die Vertical Polarisation (13V) verwendet; für WB (wideband) Horizontale Polarisation.

Für den SDR Transceiver Aufbau haben wir uns narrowband festgelegt.

Diese Ungenauigkeit kann sich durch (a) ersetzen des Quarzes durch einen TCXO oder (b) die Einspeisung des Clocks über einen GPSDO stabilisieren. Die genaue Offset Frequenz muss dann entsprechend in der SDR-Console eingestellt werden (siehe …)

Für den Aufbau des SDR Transceivers wurde die Einspeisung des Clocks von einem Leo Bodnar GPSDO gewählt

#### Umbau LNB

*TODO infos einfuegen*

## USB Verteilung

Die verschiedenen Komponenten im Transceiver werden über USB angebunden. Aus diesem Grund wurden ein USB 2.0 HUB im Transceiver verbaut welcher die verschieden Komponenten zusammenfasst

[Zero4U UUGear](https://www.digikey.at/product-detail/de/adafruit-industries-llc/3298/1528-2083-ND/6834072)

*TODO info 0R Widerstand*

## Spannungsversorgung
Anforderungen der verschiedenen Verbraucher

```
PlutoSDR 5v / 1A
-- plutosdr ist auf 1A limitiert (schematic Seite 8 LTC4415)
USB Hub 5v / 2A
Leo Bodnar 5v / 250mA (über USB Hub)
db4um_PA 5v / 1A
PTT Steuerung & Arduino 5v / 500mA
LNBP_13V 5v / 800mA
SG-Labs PA 24-28v / 1.5A
```

### System Spannung 5V/28V

Die Variante mit den Meanwell DC/DC Wandlern wurde gewählt damit der Formfaktor des Gehäuses auf ein IC7300/IC9700 erreicht werden kann. Da die der Platzverbrauch bei der Variante mit den Meanwell Wandlern sehr gering ist.

*TODO infos einfuegen*

### LNB 13V Spannungsversorgung

Variante mit [LT1372](https://www.analog.com/en/products/lt1372.html)

*TODO infos einfuegen*

## Display und Controller für System Parameter

Das Display und der Controller basieren auf dem design von DC5ZM [Infos siehe](https://hf5l.pl/en/monitor-for-sg-lab-power-amplifier/) - das ursprüngliche Design war primär für die Messung der SG-Labs Parameter (Power DRV, REF, FWD, Spannung) - wurde aber erweitert um noch zusätzlich System Parameter des SDR Transceivers erfassen zu können. Eine Möglichkeit für das abschalten der PA PTT über einen OC Ausgang wurde auch vorgesehen für ein spätere Version, damit bei zu hohem VSWR die PA ausgeschaltet wird .Um das System erweitern zu können wurde ein I2C Port vorgesehen. Das Display wird zur Anzeige der Parameter verwendet und über einen Rotary Encoder kann der Controller gesteuert werden. Als CPU wird ein Arduino Nano verwendet.

### VSWR Messung SG-Labs 20W PA
Die SG-Labs Endstufe hat lamba/4 microstrip direct coupler am Eingang und Ausgang um die Leistung zu messen welche in die PA gehen (DRV) und was zur Antenne und von der Antenne kommt (FWD/REV).

Die verschiedenen Anschlüsse (FWD, REV, DRV) müssen über durchführungs Filter aus dem Alu Gehäuse der 20W PA herausgeführt werden.

*TODO bild einfuegen*

### GPSDO lock Anzeige
Mittels eine Photo-Transistors (OP505W) wird die LED des Leo Bodnar GPSDO an den Controller “gekoppelt” und im Display der entsprechende GPSDO status angezeigt

*TODO infos einfuegen*

## PTT Aktivierung von der SDR Console zum Transceiver

Ein USB Relais kann verwendet werden um das Transmit Signal von der [SDR Console in ein PTT Signal](https://www.sdr-radio.com/relays) umzuwandeln

Es sind einige USB Relais varianten über ebay beziehbar. Wir haben uns jedoch für den Aufbau einer eigenen Variante entschieden. 

Dies hat einen besseren Formfaktor ermöglicht und die Erweiterung für eine besser PTT Anzeige am Gehäuse.

## Gehäuse
Der Formfaktor des ICOM 7300 mit (B × H × T) 240 mm × 94 mm × 238 mm (ohne vorstehende Teile) wurde im Projekt gewählt, da dieser sehr Kompakt und portable ist.

Das Gehäuse wurde komplett aus Alumium Profil-Komponenten aufgebaut. Die verwenden [Eckprofile](https://www.heavymetal-aluminium.de/shop/aluminium/aluminiumprofile/aluminium-eloxiert-aluminiumprofile/gehaeuseprofil-1-natur-eloxiert/gehaeuseprofil-1-natur-eloxiert/) sind standard im Industrie-Gehäusebau und können auf Mass zugeschnitten werden.

## Empfangs Software (PC / Linux)

### Download und installation

Download der software von [https://www.sdr-radio.com/download](https://www.sdr-radio.com/download)

### Einrichtung

*TODO infos einfuegen*


