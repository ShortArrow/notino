const int ledPin = 13;
bool notification = false;

unsigned long previousMillis = 0;
const long interval = 100;
int ledState = LOW;

void setup() {
  pinMode(ledPin, OUTPUT);
  Serial.begin(9600);
}

void loop() {
  if (Serial.available() > 0) {
    char command = Serial.read();
    if (command == 'H') {
      notification = true;
      Serial.println("HIGH");
      previousMillis = millis(); // Reset the timer when notification starts
    } else if (command == 'L') {
      notification = false;
      Serial.println("LOW");
    }
  }

  if (notification) {
    unsigned long currentMillis = millis();
    if (currentMillis - previousMillis >= interval) {
      previousMillis = currentMillis;
      // Toggle the LED state
      if (ledState == LOW) {
        ledState = HIGH;
      } else {
        ledState = LOW;
      }
    }
  }
  else {
    // Off notification, turn off the LED
    ledState = LOW;
  }

  digitalWrite(ledPin, ledState);
}