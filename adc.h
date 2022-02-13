#ifndef __ADC1_H
#define __ADC1_H

#include "stm32f4xx.h"
#include "delay.h"
void Ablue();
void initADC1(void);
void initDmaADC1(uint32_t *);
uint16_t getADC1(void);
void pwm_start();
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

#endif