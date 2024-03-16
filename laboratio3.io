#include <LiquidCrystal.h>

const int led = 13; 
const int motor = 10;
const int temperatura = A0;

int segundos = 0;
float temperaturaC = 0.0;
LiquidCrystal lcd(12, 11, 5, 4, 3, 2);

void setup() {
  lcd.begin(16, 2);
  lcd.print("Temp: ");
  pinMode(led, OUTPUT);
  pinMode(motor, OUTPUT);
}

//Jairo Alejandro Lasso Miramag
void loop() {
  int lecturaTemperatura = analogRead(temperatura);
  temperaturaC = (lecturaTemperatura * 5.0 * 100.0) / 1024.0;

  if (temperaturaC <= 10.0) {
    digitalWrite(led, HIGH); 
    digitalWrite(motor, LOW); 
    delay(500);
    digitalWrite(led, LOW); 
    delay(500); 
  } else if (temperaturaC >= 11.0 && temperaturaC <= 25.0) {
    digitalWrite(led, LOW); 
    digitalWrite(motor, LOW); 
  } else {
    digitalWrite(led, HIGH); 
    digitalWrite(motor, HIGH); 
  }

  lcd.setCursor(6, 0); 
  lcd.print(temperaturaC); 
  lcd.print(" C"); 
  lcd.setCursor(0, 1); 
  lcd.print("Seg: ");
  lcd.print(segundos);
  delay(500);
  segundos++;
}