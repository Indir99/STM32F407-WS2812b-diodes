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
		
	RCC->AHB1ENR |= RCC_AHB1ENR_GPIOAEN;
	GPIOA->MODER &= ~(0x00000001);
	GPIOA->OSPEEDR |= 0xFFFFFFFF;
	GPIOA->OTYPER |= 0x00000000;
	while (1)
	{
		timerLED(0xFF0000);
		//blink(0xFF00FF);
	
		//#ifndef USART_ECHO
		//		chkRxBuffUSART2();
		//	#endif
		// delay_ms(100);
	}
	return 0;
}
