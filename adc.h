#ifndef __ADC1_H
#define __ADC1_H

#include "stm32f4xx.h"
#include "delay.h"

void initADC1(void);
void initDmaADC1(uint16_t *dBuff1, uint16_t *dBuff2, uint16_t size);
uint16_t getADC1(void);
void pwm_start();
void fillGreen();

#endif
