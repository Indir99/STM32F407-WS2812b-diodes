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
	GPIOA->MODER &= ~0x00000003;  										// 
	
	RCC->APB2ENR |= RCC_APB2ENR_SYSCFGEN;								// 
	SYSCFG->EXTICR[0] = SYSCFG_EXTICR1_EXTI0_PA;						// 
	EXTI->IMR = EXTI_IMR_MR0;											
	EXTI->EMR &= ~EXTI_EMR_MR0;											
	EXTI->RTSR = EXTI_RTSR_TR0;	
	EXTI->FTSR = 0x00000000;	
	NVIC_EnableIRQ(EXTI0_IRQn);

	numberSix(0xFF00FF);

	while (1)
	{
		/*
		enable();
		while(DMA1_Stream6->NDTR != 0){printUSART2("%d \n",DMA1_Stream6->NDTR); delay_ms(200);};
		printUSART2("%d \n",DMA1_Stream6->NDTR);
		delay_ms(500); 	
		disable();
		delay_ms(500);
		numberThree(0x00FF00);
		*/
		enable();
		while(DMA1_Stream6->NDTR != 0){printUSART2("%d prva petlja \n",DMA1_Stream6->NDTR); delay_ms(200);};
		
	TIM4->CR1 &= ~(0x0001);
	TIM4->CCR4 = 0;
	DMA1_Stream6->CR &= ~(0x0000001);
	delay_ms(2000);
	
	numberOne(0xFF00FF);
	enable();
	//TIM4->CCR4 = 105;
	while(DMA1_Stream6->NDTR != 0){printUSART2("%d druga petlja \n",DMA1_Stream6->NDTR); delay_ms(200);};
		
	TIM4->CR1 &= ~(0x0001);
	
	DMA1_Stream6->CR &= ~(0x0000001);
	delay_ms(500);
	
	
	
	
	
	
	
	
	
		
		
		
		
		
		
		
		
		
		//#ifndef USART_ECHO
		//		chkRxBuffUSART2();
	//	#endif
		//delay_ms(100);
	}
	return 0;
}

void EXTI0_IRQHandler(void)
{// with 
	if((EXTI->PR & EXTI_PR_PR0) == EXTI_PR_PR0)							// EXTI_Line0 interrupt pending?
	{
		
		EXTI->PR = EXTI_PR_PR0;											// clear EXTI_Line0 interrupt flag
	}
}




