#include "stm32f4xx.h"
#include "delay.h"
#include "usart.h"
#include "misc.h"
#include "gui.h"
#include "display.h"

#define IRQ_IDLE 0
#define IRQ_DETECTED 1
#define IRQ_WAIT4LOW 2
#define IRQ_DEBOUNCE 3
#define IRQ_CNT

volatile uint32_t g_irq_cnt = 0;
volatile uint8_t g_gpioa_irq_state = (IRQ_IDLE);
volatile uint32_t g_irq_timer = 0;
volatile uint8_t pbstate = 0;
volatile uint8_t pushButtonState = 0;
volatile uint8_t pushButtonCoutingWay = 0;
volatile uint32_t* indicator = 0;

void serviceIRQA(void);

int main()
{
	// init functions
	initUSART2(USART2_BAUDRATE_921600);
	initDMA();
	enIrqUSART2();
	initSYSTIMER();
	// gui printing
	 writeGUI();
	
	RCC->APB2ENR |= RCC_APB2ENR_SYSCFGEN;		 // enable clock on SYSCFG register
	SYSCFG->EXTICR[0] = SYSCFG_EXTICR1_EXTI0_PA; // select PA 0 as interrupt source p259
	EXTI->IMR = EXTI_IMR_MR0;					 // enable interrupt on EXTI_Line0
	EXTI->EMR &= ~EXTI_EMR_MR0;					 // disable event on EXTI_Line0
	EXTI->RTSR = EXTI_RTSR_TR0;
	EXTI->FTSR = 0x00000000;

	NVIC_EnableIRQ(EXTI0_IRQn);

	RCC->AHB1ENR |= RCC_AHB1ENR_GPIOAEN;
	GPIOA->MODER &= ~(0x00000001);
	GPIOA->OSPEEDR |= 0xFFFFFFFF;
	GPIOA->OTYPER |= 0x00000000;

	while (1)
	{
		
		serviceIRQA();
		if (indicator[0] == 1){
			pushButtonCounter(indicator[1], pushButtonState);
		}
		else
		{
			pbstate = 0;
			pushButtonState = 0;
			pushButtonCoutingWay = 0;
		}
				
		#ifndef USART_ECHO
			indicator = chkRxBuffUSART2();
		#endif
		 
		 delay_ms(50);
	 
	}
	return 0;
}

#ifdef IRQ_CNT
void EXTI0_IRQHandler(void)
{

	if ((EXTI->PR & EXTI_PR_PR0) == EXTI_PR_PR0) // EXTI_Line0 interrupt pending?
	{
		
		if (g_gpioa_irq_state == (IRQ_IDLE))
		{
			// GPIOD->ODR ^= 0x5000; // Toggle the pin
			g_gpioa_irq_state = (IRQ_DETECTED);
		}
		EXTI->PR = EXTI_PR_PR0; // clear EXTI_Line0 interrupt flag
	}
}
#endif

void serviceIRQA(void)
{
	switch (g_gpioa_irq_state)
	{
	case (IRQ_IDLE):
	{
		break;
	}
	case (IRQ_DETECTED):
	{
		if (pushButtonState == 0)
		{
			pushButtonCoutingWay = 0;
		}
		if (pushButtonState == 9)
		{
			pushButtonCoutingWay = 1;
		}
		if (pushButtonCoutingWay == 0)
		{
			g_irq_cnt++;
			pushButtonState++;
		}
		if (pushButtonCoutingWay == 1)
		{
			g_irq_cnt++;
			pushButtonState--;
		}
		g_gpioa_irq_state = (IRQ_WAIT4LOW);
		break;
	}
	case (IRQ_WAIT4LOW):
	{
		if ((GPIOA->IDR & 0x0001) == 0x0000)
		{
			g_gpioa_irq_state = (IRQ_DEBOUNCE);
			g_irq_timer = getSYSTIMER();
		}
		break;
	}
	case (IRQ_DEBOUNCE):
	{
		if (chk4TimeoutSYSTIMER(g_irq_timer, 50000) == (SYSTIMER_TIMEOUT))
		{
			g_gpioa_irq_state = (IRQ_IDLE);
		}
	}
	default:
	{
		break;
	}
	}
}
