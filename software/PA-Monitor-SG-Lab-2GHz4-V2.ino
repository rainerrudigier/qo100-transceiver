// PA-Monitor-SG-Lab-2GHz4-V2.ino   ---------- c 2020 by DC5ZM -------------------------------------------------------
//
// ---------------------------------------------- include libraries --------------------------------------------------
#include <OneWire.h> 
#include <DallasTemperature.h>
#include <LiquidCrystal_I2C.h>  // 1.1.2 Frank de Brabander 
// ---------------------------------------------- define constants ---------------------------------------------------
LiquidCrystal_I2C lcd(0x38,20,4);  // pcf8754at 0x38 -- pcf8574t 0x20   

#define ONE_WIRE_BUS 11    //  Data wire is plugged into pin 12 on the Arduino 
#define TEMPERATURE_PRECISION 13
#define FAN_PIN 12
#define NO  0
#define YES 1

#define R_SW 9

#define GPSDO_LED_PIN 2


// ************************************************************** variables to be changed for calibration *********
// use   http://www.xuru.org/rt/PR.asp#CopyPaste   for calculation coefficients                                   *                                                                                                             *
//                                                                           formula used:   y = a +b*x + c*x*x   *
//                                                                                                                *
float    a_drv = 0 , b_drv = 0.227, c_drv = 2;                       // coefficients of polygon approximation DRV *
float    a_fwd = 0.0524, b_fwd = -1.726, c_fwd = 1.957;              //                                   ... FWD *      
float    a_ref = 0.0524, b_ref = -1.726, c_ref = 1.957;              //                                   ... REF *  
float    scc_drv = 1.0, scc_fwd = 1.0, scc_ref =  1.0 ;              // Shift_Calibration_Curve 0.93=7%> 1.07=7%< *
float    power_drv_min = 0.1;                                        // minimal power for calculation and display *
byte     power_fwd_min = 1, power_ref_min = 1 ,power_drv_max = 1;    // min. power for calc. and display          *
byte     temp_fan_on = 50, voltmeter_full_scale = 30;                // fan on at overtemperature, adjust att. R1 *
// ****************************************************************************************************************


unsigned long time;   
uint16_t temp_integer;    // uint16_t = 16 bit integer

char     temp_string[8], power_fwd_string[8], power_ref_string[8], power_drv_string[8], swr_string[8]; 
char     pa_voltage_string[8], temp_fan_on_string[8];

float    reflexion_coefficient, swr , power_fwd, power_ref, power_drv, voltage_fwd,voltage_ref, voltage_drv;
float    voltage_fwd_peak =0,voltage_ref_peak =0, voltage_drv_peak =0; 
float    temperature, tmp_old = 0, pa_voltage;

byte     temp_byte, temp_bar_max = 100, power_drv_int, iii=0;
byte     menu = 1, temp_fan_on_marker;
boolean  fwd_too_low = NO, ref_too_low = NO, fan_active = NO, error_fwd = NO, error_ref = NO, error_swr = NO;

OneWire oneWire(ONE_WIRE_BUS); // Setup a oneWire instance to communicate with any OneWire devices  
DallasTemperature sensors(&oneWire); // Pass oneWire reference to Dallas Temperature

// ###################################################################################################################
void setup(void) 
{ 
  Serial.begin(38400);
  lcd.init();                      // initialize the lcd 
  //lcd.init();
  sensors.begin();   // Start up the library 
  pinMode(FAN_PIN, OUTPUT);
  pinMode(R_SW, INPUT);
  digitalWrite(R_SW, true); // pull-up 

  pinMode(GPSDO_LED_PIN, INPUT);

  lcd.backlight();

  read_temperature();
  lcd.setCursor(0,0);
  lcd.print("PA M O N I T O R");
  lcd.setCursor(0,1);  // colum, line nr. 
  delay(500); 
  lcd.print("c 2020 by DC5ZM");
  delay(1500);
  lcd.clear();  
} 




// ###################################################################################################################
void loop(void) 
{ 

  int gpsdo_status = digitalRead(GPSDO_LED_PIN);

  if(gpsdo_status == HIGH)
  {
    lcd.setCursor(19,0);
    lcd.print("G");
  } else
  {
    lcd.setCursor(19,0);
    lcd.print(" ");    
  }
  
  select_menu();
  read_temperature(); 

//   read_ADC();
}


void read_ADC()
{
  
  Wire.beginTransmission(0x48);         //Address of ADC
  Wire.write(0x1);
  Wire.write(0x2);
  Wire.write(0x83);   
  Wire.write(0x0);                       
  int ack = Wire.endTransmission();       
  Serial.print("I2C = ");
  Serial.print(ack);                      
  Serial.println();
  delay(15); 
  
  Wire.requestFrom(0x48,2,1); //Requesting 4 bytes 
  while(Wire.available()){
    float RAW = Wire.read();
    float RAW_voltage = (RAW*4.096/32768.0);
    Serial.print("Raw ADC value = ");
    Serial.print(RAW);
    Serial.print("\tVoltage = ");
    Serial.print(RAW_voltage);
    Serial.println();
  }
  delay(500); 
}



// ###################################################################################################################
void select_menu()
{  

 menu_directional_couplers();
 menu_supply_fan();
 menu_temperature();
 /*
 if(!digitalRead(R_SW)) menu++;                        // if any of 5 keys pressed change menu
 if(menu  > 2) menu = 1;
 if(menu == 1) menu_temperature();
 if(menu == 2) menu_supply_fan(); 
  */
}
// -------------------------------------------------------------------------------------------------------------------
void menu_directional_couplers()
{   
  for(iii=0; iii<20; iii++)                                     // Take 20 samples and save the highest value
  { voltage_fwd = analogRead(A0);
    voltage_ref = analogRead(A1);
    voltage_drv = analogRead(A2);
    if(voltage_fwd > voltage_fwd_peak) voltage_fwd_peak = voltage_fwd;    // safe the peak of 10 measurements
    if(voltage_ref > voltage_ref_peak) voltage_ref_peak = voltage_ref;  
    if(voltage_drv > voltage_drv_peak) voltage_drv_peak = voltage_drv;
  }
  voltage_fwd = voltage_fwd_peak;                                         // use peak voltage for processing
  voltage_ref = voltage_ref_peak;
  voltage_drv = voltage_drv_peak;
// ---------------------------------------- calculate coupler values -------------------------------------------------
  voltage_fwd = voltage_fwd*5/1023*scc_fwd;                        // normalize measured value FWD to 5V x scc_fwd
  voltage_ref = voltage_ref*5/1023*scc_ref;                                             // ... REF to 5V x scc_ref
  voltage_drv = voltage_drv*5/1023*scc_drv;                                             //...  DRV to 5V x scc_drv

  power_fwd = a_fwd + b_fwd*voltage_fwd + c_fwd*voltage_fwd*voltage_fwd;    // polygon approximatiion equation fwd
    if(power_fwd < 0) power_fwd = 0;                                          // avoid negativ values    

  power_ref = a_ref + b_ref*voltage_ref + c_ref*voltage_ref*voltage_ref;    // polygon approximatiion equation ref
  if(power_ref < 0) power_ref = 0; 

  power_drv = a_drv + b_drv*voltage_drv + c_drv*voltage_drv*voltage_drv;   // polygon approximatiion equation drv
      if(power_drv < 0) power_drv = 0;

  if(power_fwd < power_fwd_min) error_fwd = YES;                            // check for errors
    else error_fwd = NO;
  if(power_ref < power_ref_min) error_ref = YES; 
    else error_ref = NO;
  if( (power_fwd <= power_ref) || (error_fwd == YES)  || (error_ref == YES)  ) error_swr = YES; 
    else error_swr = NO;
 
  display_coupler_values();    
  voltage_fwd_peak = 0;                                                      // set peak voltages back to 0
  voltage_ref_peak = 0;
  voltage_drv_peak = 0;       
}
// -------------------------------------------------------------------------------------------------------------------
void display_coupler_values()
{
  lcd.setCursor(0,0); 
  lcd.print("FWD   W  REF   W");

  lcd.setCursor(4,0);  
  if(error_fwd == NO)
  { dtostrf(power_fwd,2,0, power_fwd_string);            //  variable for converting float type numbers
    lcd.print(power_fwd_string); 
  } 
  else
  { lcd.print("<");
    lcd.print(power_fwd_min);
  }  

  lcd.setCursor(13,0);  
  if(error_ref == NO)
  { dtostrf(power_ref,2,0, power_ref_string);            //  variable for converting float type numbers
    lcd.print(power_ref_string); 
  } 
  else
  { lcd.print("<");
    lcd.print(power_ref_min);
  }  

// ....................................................  line 2 of lcd display  ......................................
  lcd.setCursor(0,1); 
  lcd.print("DRV   W  SWR    ");                                                         
      
  lcd.setCursor(2,1);
  if(   (power_drv < power_drv_max) && (power_drv >= power_drv_min)                            )
  { dtostrf(power_drv,3,2, power_drv_string);            //  variable for converting float type numbers
    lcd.print(power_drv_string); 
    lcd.setCursor(2,1); 
    lcd.print("V");
  } 

  if( power_drv < power_drv_min )    
  { lcd.setCursor(3,1); 
    lcd.print(power_drv_min);
    lcd.setCursor(3,1); 
    lcd.print("<");
    lcd.setCursor(6,1); 
    lcd.print("W  ");
  }   

  if( power_drv >= power_drv_max )    
  { lcd.setCursor(5,1); 
    lcd.print(power_drv_max);
    lcd.setCursor(4,1); 
    lcd.print(">");
  }     

  if( error_swr == NO )
  { lcd.setCursor(13,1);
    { reflexion_coefficient = sqrt(power_ref / power_fwd);                       // calculate SWR 
      if(reflexion_coefficient <= 0.8)
      { swr = (1+reflexion_coefficient)/(1-reflexion_coefficient);
        dtostrf(swr,2,1, swr_string);
        lcd.print(swr_string);                                                   // display SWR
      }
      else  lcd.print(">10");                                                    // SWR too high
    }
  }
  else                                             // display PA temperature
  { dtostrf(temperature,2,0, temp_string);
    lcd.setCursor(9,1);
    lcd.print("TMP   \xDF");
    lcd.setCursor(13,1);
    lcd.print(temp_string);
    if(fan_active == YES) {lcd.setCursor(15,1); delay(150); lcd.print(" "); delay(150);}  
  } 
delay(200);  
}
// -------------------------------------------------------------------------------------------------------------------
void menu_temperature() 
{ 
  dtostrf(temperature,4,1, temp_string);  //  variable for converting float type numbers
  lcd.setCursor(0,3);                                                        // colum, line nr.
  lcd.print("PA TEMP.: ");
  lcd.print(temp_string);
  lcd.print("\xDF");                                                         // character sign ° 
  lcd.print("C");
  
// ....................................................  line 2 of lcd display  ......................................
/*
  lcd.setCursor(0,3);
  lcd.print("0____________100");  
  lcd.setCursor(1,3);
  if(temperature<0) temperature=0; if(temperature>100) temperature=100;
  temp_byte = temperature;

  temp_byte /=7.14;                                              // 0 to 100 normalized to0 bis 14
  for(iii=0; iii <= temp_byte; iii++) lcd.print("\xFF");         // \xFF = special character black rectangle

  if(fan_active == YES) {lcd.setCursor(14,3); delay(150); lcd.print(" "); delay(150);}  
  delay(250);       // delay prevents flickering of the display
*/
} 
// -------------------------------------------------------------------------------------------------------------------
void menu_supply_fan()

{ pa_voltage = 0;
  for(iii=0; iii<10; iii++)
  pa_voltage = pa_voltage + analogRead(A3); 
  pa_voltage /= 10;                                               // average of 10 measurements      
                                                               
  pa_voltage = pa_voltage*voltmeter_full_scale/800;              // adjust R1 when changing voltmeter_full_scale   //1023

  lcd.setCursor(0,2); 
  lcd.print("PA  SUPPLY     V");  
  lcd.setCursor(11,2);
  dtostrf(pa_voltage,3,1, pa_voltage_string);                     //  variable for converting float type numbers
  
  lcd.print(pa_voltage_string); 

// ..........................................  line 2 of lcd display  ................................................

/*
  lcd.setCursor(0,3); 
  lcd.print("FAN ON TMP >"); 

  dtostrf(temp_fan_on,2,0, temp_fan_on_string);             //  variable for converting float type numbers to strings
  lcd.print(temp_fan_on_string);

  lcd.print("\xDF"); 
  lcd.print("C");

  if(fan_active == YES) 
  { lcd.setCursor(4,3); delay(300); lcd.print("  "); delay(300); }              // flash word "ON"     
 */
}
// -------------------------------------------------------------------------------------------------------------------
void read_temperature()
{
  if((millis() - time) > 5000)                                          // The sensor is only read out every 5s
  { sensors.requestTemperatures();                                      // because the process takes 750ms
    temperature = sensors.getTempCByIndex(0);                           // in high resolution mode.
    time = millis();
  } 
  
  if(temperature >= temp_fan_on)
  {  digitalWrite(FAN_PIN, HIGH); fan_active = YES; }
  else
  {  digitalWrite(FAN_PIN, LOW) ; fan_active =  NO; }      
}
// -------------------------------------------------------------------------------------------------------------------
