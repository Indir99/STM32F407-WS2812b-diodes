#include "stm32f4xx.h"
#include "delay.h"
#include "usart.h"
#include "misc.h"
#include "gui.h"
#include "adc.h"

#define ADC_BUFF_SIZE 1024
static uint16_t adc_buff0[ADC_BUFF_SIZE];
static uint16_t adc_buff1[ADC_BUFF_SIZE];

int main()
{
	// init functions
	initUSART2(USART2_BAUDRATE_921600);
	initDmaADC1(adc_buff0, adc_buff1, ADC_BUFF_SIZE);
	//	enIrqUSART2();
	// gui printing
	// writeGUI();

	while (1)
	{
		printUSART2("%d \n", (uint32_t *)DMA1_Stream6->NDTR);
		delay_ms(1000);
		//#ifndef USART_ECHO
		//		chkRxBuffUSART2();
		//#endif
		//		delay_ms(100);
	}
	return 0;
}
