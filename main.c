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
	numberZero(0x0000FF);
	delay_ms(1000);
	numberOne(0x00FF00);
	delay_ms(2000);
	numberTwo(0x000FFF);

	while (1)
	{

		//#ifndef USART_ECHO
		//		chkRxBuffUSART2();
		//	#endif
		// delay_ms(100);
	}
	return 0;
}
