** muss noch schöner gemacht werden **


mit dem Library Manager die Libraries installieren (OneWire, DallasTempertur, LiquidCrystal_i2C) ... für die I2C gibt es verschiedene -  verwendet wird die von "Frank de Brabander v1.1.2)

sollte nach dem kompilieren und uploaded das Display dunkel bleiben -  muss uU die I2C adresse des Displays angepasst werdem (hängt von der version des I2C -> parallel chips ab)

LiquidCrystal_I2C lcd(0x38,20,4);  // pcf8754at 0x38 -- pcf8574t 0x20  
