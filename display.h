#ifndef __ADC1_H
#define __ADC1_H

#include "stm32f4xx.h"
#include "delay.h"

void initDMA();
void start();
void ledOFF();
void ledON(uint32_t);

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

void timerLED(uint32_t,uint16_t);
void timerReset();
void blink(uint32_t,uint16_t);
void DotCircle(uint32_t,uint16_t);
void Circle(uint16_t);
void animation1(uint32_t,uint16_t);
void snake(uint16_t);
void pwmBlue(uint16_t);
void animation2(uint32_t,uint16_t);
void animation3(uint32_t,uint16_t);


//RESET
void DotCircleReset();
void snakeReset();
void animation1Reset();
void animation2Reset();
void animation3Reset();
void CircleReset();




void CircleStart(uint16_t);
void pushButtonCounter(uint32_t, uint8_t);

#endif
