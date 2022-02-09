#include "stm32f4xx.h"
#include "delay.h"
#include "usart.h"
#include "misc.h"
#include "gui.h"



int main()
{
//init functions
	initUSART2(USART2_BAUDRATE_921600);
	enIrqUSART2();

//gui printing
    writeGUI();
    
    while(1){
	#ifndef USART_ECHO
		chkRxBuffUSART2();
	#endif
		delay_ms(100);
    }
    return 0;
}
