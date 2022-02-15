#ifndef __ADC1_H
#define __ADC1_H

#include "stm32f4xx.h"
#include "delay.h"

void initDMA();
void start();
void ledOFF();

void numberZero(uint32_t);
void numberOne(uint32_t);
void numberTwo(uint32_t);
void numberThree(uint32_t);
void numberFour(uint32_t);
void numberFive(uint32_t);
void numberSix(uint32_t);
void numberSeven(uint32_t);
void numberEight(uint32_t);
void numberNine(uint32_t);

void timerLED(uint32_t);
void timerReset();
void blink(uint32_t);

void pushButtonCounter(uint32_t, uint8_t);

#endif
