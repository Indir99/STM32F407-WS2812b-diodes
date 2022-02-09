#ifndef __GUI_H
#define __GUI_H

#include "stm32f4xx.h"
#include "usart.h"


void setStartPosition();
void writeFrameOne();
void writeFrameTwo(uint8_t);
void writeFrameThree();
void writeFrameFour();
void writeFrameFive();


void writeGUI();


#endif 
