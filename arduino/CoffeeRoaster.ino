// Basic coffee roaster code
// Ben Pacheco 5/9/23

#include "max6675.h"

uint8_t thermoDO = 19;
uint8_t thermoCS = 5;
uint8_t thermoCLK = 18;
uint8_t button = 16;
uint8_t heater = 4;
uint8_t IN1 = 27;
uint8_t IN2 = 26;
uint8_t bs = 1;
unsigned long startTime = 0;
unsigned long endTime = 0;
unsigned long timeNow = 0;
uint8_t hs = 0;
float lastTemp = 0;
uint8_t ms = 0;
float currentTemp = 0;

MAX6675 thermocouple(thermoCLK, thermoCS, thermoDO);

void setup() {

  pinMode(button, INPUT_PULLDOWN);
  pinMode(IN1, OUTPUT);
  pinMode(IN2, OUTPUT);
  pinMode(heater, OUTPUT);

  Serial.begin(9600);
  delay(500);
  Serial.println("Coffee Roaster Test. Push button to begin.");
  delay(500);

}

void loop() {
  bs = 0;
  while(bs!=1){
    bs = digitalRead(button);
  }
  Serial.println("Ramping fan.");
  digitalWrite(IN1, LOW);
  for (int i=0; i<255; i++) {
    analogWrite(IN2, i);
    delay(10);
  }
  delay(1000);
  Serial.println("Turning on heater");
  startTime = millis();
  hs = 1;
  digitalWrite(heater, HIGH);
  bs = 0;
  currentTemp = thermocouple.readCelsius();
  while(currentTemp<120 || currentTemp>230){
    Serial.println(currentTemp);
    delay(500);
    currentTemp = thermocouple.readCelsius();
  }
  Serial.println("Entering soak");
  hs = 0;
  digitalWrite(heater, LOW);
  timeNow = millis();
  while(millis() < timeNow + 120000){
    currentTemp = thermocouple.readCelsius();
    Serial.println(currentTemp);
    if(hs == 0 && currentTemp < 120){
      hs = 1;
      digitalWrite(heater, HIGH);
    } else if (hs == 1 && currentTemp>125){
      hs = 0;
      digitalWrite(heater, LOW);
    }
    delay(500);
  }
  Serial.println("Beginning ramp phase");
  hs = 1;
  digitalWrite(heater, HIGH);
  ms = 254;
  currentTemp = thermocouple.readCelsius();
  while(currentTemp < 175 || currentTemp > 200){
    lastTemp = thermocouple.readCelsius();
    delay(3000);
    currentTemp = thermocouple.readCelsius();
    Serial.println(currentTemp);
    if ( currentTemp > lastTemp+0.75){
      if(ms<225){
        ms = ms+20;
        analogWrite(IN2, ms);
      }
    } else if (currentTemp < lastTemp+0.3){
      if (ms > 50){
        ms = ms - 20;
        analogWrite(IN2, ms);
      }else{
        ms = 254;
        analogWrite(IN2, ms);
      }
      
    }
  }
  Serial.println("Beginning cooldown");
  digitalWrite(heater, LOW);
  hs = 0;
  while(currentTemp>45 || currentTemp<20){
    currentTemp = thermocouple.readCelsius();
    Serial.println(currentTemp);
    delay(500);
  }
  analogWrite(IN2, 0);
  Serial.println("Cooldown complete, Press button to begin roasting again");
  

}
