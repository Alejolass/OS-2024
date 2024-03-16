//Jairo Alejandro Lasso Miramag
int led1 = 11;
int led2 = 12;
int led3 = 13;

int estadoLuces = 0; 

void setup() {
  pinMode(led1, OUTPUT);
  pinMode(led2, OUTPUT);
  pinMode(led3, OUTPUT);

  apagarTodasLuces();

  Serial.begin(9600);
}

void loop() {
  if (Serial.available() > 0) {
    char comando = Serial.read();

    switch (comando) {
      case '1':
        encenderLuz(led1);
        break;
      case '2':
        apagarLuz(led1);
        break;
      case '3':
        encenderLuz(led2);
        break;
      case '4':
        apagarLuz(led2);
        break;
      case '5':
        encenderLuz(led3);
        break;
      case '6':
        apagarLuz(led3);
        break;
      case '7':
        encenderTodasLuces();
        break;
      case '8':
        apagarTodasLuces();
        break;
      case '9':
        estadoLuces = 2;
        break;
      default:
        Serial.println("Comando no reconocido");
    }
  }

  if (estadoLuces == 2) {
    intermitente();
  }
}

void encenderLuz(int pinLed) {
  digitalWrite(pinLed, HIGH);
  estadoLuces = 1;
  mensaje(pinLed, true);
}

void apagarLuz(int pinLed) {
  digitalWrite(pinLed, LOW);
  estadoLuces = 0;
  mensaje(pinLed, false);
}

void encenderTodasLuces() {
  digitalWrite(led1, HIGH);
  digitalWrite(led2, HIGH);
  digitalWrite(led3, HIGH);
  estadoLuces = 1;
  mensaje(led1, true);
  mensaje(led2, true);
  mensaje(led3, true);
}

void apagarTodasLuces() {
  digitalWrite(led1, LOW);
  digitalWrite(led2, LOW);
  digitalWrite(led3, LOW);
  estadoLuces = 0;
  mensaje(led1, false);
  mensaje(led2, false);
  mensaje(led3, false);
}

void mensaje(int pinLed, bool estado) {
  Serial.print("Luz ");
  Serial.print(pinLed == led1 ? "verde" : pinLed == led2 ? "roja" : "amarilla");
  Serial.print(estado ? " encendida" : " apagada");
  Serial.println();
}

void intermitente() {
  static unsigned long tiempoAnterior = 0;
  const unsigned long tiempoIntermitente = 200;

  if (millis() - tiempoAnterior >= tiempoIntermitente) {
    tiempoAnterior = millis();

    digitalWrite(led1, !digitalRead(led1));
    digitalWrite(led2, !digitalRead(led2));
    digitalWrite(led3, !digitalRead(led3));
  }
}