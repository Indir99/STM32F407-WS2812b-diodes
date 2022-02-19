#ifndef __ADC1_H
#define __ADC1_H

#include "stm32f4xx.h"
#include "delay.h"

void initDMA();       // DMA1 and TIM4 init
void start();         // send data on disp board
void ledOFF();        // Turn off leds
void ledON(uint32_t); // Turn on leds

// numbers for disp borard
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

// animations and timer
void timerLED(uint32_t, uint16_t);
void timerReset();
void blink(uint32_t, uint16_t);
void DotCircle(uint32_t, uint16_t);
void Circle(uint16_t);
void animation1(uint32_t, uint16_t);
void snake(uint16_t);
void pwmBlue(uint16_t);
void animation2(uint32_t, uint16_t);
void animation3(uint32_t, uint16_t);
void animation4(uint32_t, uint16_t);

// reset animation
void DotCircleReset();
void snakeReset();
void animation1Reset();
void animation2Reset();
void animation3Reset();
void animation4Reset();
void CircleReset();
void authorsReset();

void CircleStart(uint16_t);
void pushButtonCounter(uint32_t, uint8_t);

#endif
