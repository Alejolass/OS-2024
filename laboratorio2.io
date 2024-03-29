//Jairo Alejandro Lasso Miramag
const int led = 13;
const int ntcPin = 0;
const int motor = 10;

int temperature;

void setup() {
  Serial.begin(9600);
  pinMode(led, OUTPUT);
  pinMode(motor, OUTPUT);
}

void loop() {
  temperature = readTemperature();
  Serial.print("La emperatura es de :........... ");
  Serial.print(temperature);
  Serial.println(" °C");

  if (temperature < 5) {
    
//Jairo Alejandro Lasso Miramag
digitalWrite(led, HIGH);
    delay(500);
    digitalWrite(led, LOW);
    delay(500);
  } else if (temperature <= 25) { // Change to <= 25
    digitalWrite(led, LOW);
    digitalWrite(motor, LOW);
  } else {
    digitalWrite(led, HIGH);
    digitalWrite(motor, HIGH);
  }
}

int readTemperature() {
  // Lectura analógica del sensor NTC
  int sensorValue = analogRead(ntcPin);

  // Conversión del valor analógico a voltaje
  float voltage = sensorValue * (5.0 / 1023.0);

  // Cálculo de la temperatura
  float temperature = (voltage - 0.5) * 100;

  // Retorno del valor de la temperatura
  return temperature;
}
  