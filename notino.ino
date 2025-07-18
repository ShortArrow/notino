const int ledPin = 13;

void setup() {
  pinMode(ledPin, OUTPUT);
  Serial.begin(9600);
}

void loop() {
  if (Serial.available() > 0) {
    char command = Serial.read();

    if (command == 'H') {
      digitalWrite(ledPin, HIGH);
      Serial.println("LED ON");
    } else if (command == 'L') {
      digitalWrite(ledPin, LOW);
      Serial.println("LED OFF");
    }
  }
}
