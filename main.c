#include "stm32f4xx.h"
#include "delay.h"
#include "usart.h"
#include "misc.h"
#include "gui.h"
#include "display.h"

int main()
{
	// init functions
	initUSART2(USART2_BAUDRATE_921600);
	initDMA();
	enIrqUSART2();
	// gui printing
	// writeGUI();
	
	//start moguce radit u funckijama number ili u mainu ispod fje
	/*
	numberZero(0x0000FF);
	start();
	delay_ms(500);
	numberOne(0x00FF00);
	start();
	delay_ms(500);
	numberTwo(0xFF0000);
	start();
	delay_ms(500);
	numberThree(0xFF0000);
	start();
	delay_ms(500);
	numberFour(0xFF0000);
	start();
	delay_ms(500);
	numberFive(0x00FF00);
	delay_ms(500);
	numberSix(0xFF0000);
	delay_ms(500);
	numberSeven(0xFFFF00);
	delay_ms(500);
    numberEight(0xFFFFFF);
	delay_ms(500);
	numberNine(0xFF00FF);
	delay_ms(500);
	*/
	
	RCC->AHB1ENR |= RCC_AHB1ENR_GPIOAEN;
	GPIOA->MODER &= ~(0x00000001);
	GPIOA->OSPEEDR |= 0xFFFFFFFF;
	GPIOA->OTYPER |= 0x00000000;
	
	uint8_t tmp;
	uint8_t counter = 0;
	uint8_t pb_state = (GPIOA->IDR & 0x0001);
	while (1)
	{
	
		//#ifndef USART_ECHO
		//		chkRxBuffUSART2();
		//	#endif
		// delay_ms(100);
	}
	return 0;
}
