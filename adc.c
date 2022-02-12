#include "adc.h"
#include "usart.h"

#define PWM_CNT_ARRAY_SIZE 10
uint16_t pwm1[PWM_CNT_ARRAY_SIZE] = {0, 2, 5, 11, 23, 50, 109, 235, 509, 999};
uint16_t pwm2[PWM_CNT_ARRAY_SIZE] = {999, 509, 235, 109, 50, 23, 11, 5, 2, 0};

#define DMA_ARRAY_SIZE 602

uint16_t pwmArray[DMA_ARRAY_SIZE] = {};
// uint16_t pwmArray2[DMA_ARRAY_SIZE] = {};

void fillGreen()
{
	uint32_t color = 0x0000FF;
	uint32_t colors[23] = {};
	for (int i = 0; i < 23; i++)
	{
		colors[i] = color;
	}
	int indx = 0;
	for (int i = 0; i < 23; i++)
	{
		for (int j = 23; j >= 0; j--)
		{
			if (colors[i] & (1 << j))
			{
				pwmArray[indx] = 71;
			}
			else
			{
				pwmArray[indx] = 34;
			}
			indx++;
		}
	}
	for (int i = 552; i < 602; i++)
	{
		pwmArray[i] = 34;
	}
}

void pwm_start()
{

	uint32_t color = 0x000FFF;
	// uint32_t tmp[24] = {};

	// kreira pwm za BOJU
	for (int i = 23; i >= 0; i--)
	{
		if (color & (1 << i))
			pwmArray[i] = 71;
		else
			pwmArray[i] = 34;
	}

	// UBACUJE PWM DOBIJEN U PETLJI IZNAD ZA SVAKU DIODU
	for (int j = 24; j < 552; j++)
	{
		pwmArray[j] = 34;
	}
	// PAUZA
	for (int i = 552; i < 602; i++)
	{
		pwmArray[i] = 34;
	}
}

void initDmaADC1(uint16_t *dBuff1, uint16_t *dBuff2, uint16_t size)
{

	// Initialize TIMER
	/// wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww
	///  setup TIM3
	/// wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww
	// RCC->APB1ENR |= RCC_APB1ENR_TIM3EN; // enable TIM3
	TIM3->PSC = 0;		// set TIM3 counting prescaler to 42 (p406)
						// set TIM3 counting prescaler to 42 (p406)
						// 84MHz/100 = 840kHz
	TIM3->ARR = 105;	// reload value set to 10 kHz!
	TIM3->CR1 = 0x0084; // ARPE On, CMS disable, Up counting
						// UEV disable, TIM3 enable(p392)
	/* TIM3->CCMR2 |= (TIM_CCMR2_OC4PE)|(TIM_CCMR2_OC4M_2)|(TIM_CCMR2_OC4M_1); */
	/* TIM3->CCMR1 |= (TIM_CCMR1_OC1PE)|(TIM_CCMR1_OC1M_2)|(TIM_CCMR1_OC1M_1); */
	/* TIM3->CR1 = 2500; */
	TIM3->DIER |= TIM_DIER_UDE;

	TIM3->EGR |= TIM_EGR_UG; // update event, reload all config p363
	TIM3->CR1 |= TIM_CR1_CEN;

	// Initialize PWM
	RCC->AHB1ENR |= RCC_AHB1ENR_GPIODEN; //
	GPIOD->MODER |= 0xAA000000;			 //
	GPIOD->OTYPER |= 0x00000000;		 //
	GPIOD->AFR[1] |= 0x22220000;		 //

	{
		RCC->APB1ENR |= RCC_APB1ENR_TIM4EN; // enable TIM4 on APB1
		TIM4->PSC = 0;						// set TIM4 counting prescaler
											// 84MHz/84 = 1MHz -> count each 1us
		/* TIM4->ARR = 0x03E8;												// period of the PWM 1ms */
		TIM4->ARR = 104; // period of the PWM 1ms

		TIM4->CCR1 = 100; // duty cycle for the PWM set to 0%
		TIM4->CCR2 = 0x0000;
		TIM4->CCR3 = 0x0056;
		// TIM4->CCR4 = 0x0056;
		TIM4->CCR4 = 70;

		TIM4->DIER |= TIM_DIER_UDE;

		TIM4->CCMR1 |= (TIM_CCMR1_OC1PE) | (TIM_CCMR1_OC1M_2) | (TIM_CCMR1_OC1M_1);
		TIM4->CCMR1 |= (TIM_CCMR1_OC2PE) | (TIM_CCMR1_OC2M_2) | (TIM_CCMR1_OC2M_1);
		TIM4->CCMR2 |= (TIM_CCMR2_OC3PE) | (TIM_CCMR2_OC3M_2) | (TIM_CCMR2_OC3M_1);
		TIM4->CCMR2 |= (TIM_CCMR2_OC4PE) | (TIM_CCMR2_OC4M_2) | (TIM_CCMR2_OC4M_1);
		// set PWM 1 mod, enable OC1PE preload mode

		// set active mode high for pulse polarity
		TIM4->CCER &= ~((TIM_CCER_CC1P) | (TIM_CCER_CC2P) | (TIM_CCER_CC3P) | (TIM_CCER_CC4P));
		TIM4->CR1 |= (TIM_CR1_ARPE) | (TIM_CR1_URS);

		// update event, reload all config
		TIM4->EGR |= TIM_EGR_UG;

		// activate capture compare mode
		TIM4->CCER |= (TIM_CCER_CC1E) | (TIM_CCER_CC2E) | (TIM_CCER_CC3E) | (TIM_CCER_CC4E);
		// start counter
		TIM4->CR1 |= TIM_CR1_CEN;
	}

	fillGreen();
	// pwm_start();

	/// wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww
	///  Setup DMA2 controller for ADC1 p179
	/// wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww
	RCC->AHB1ENR |= RCC_AHB1ENR_DMA1EN; // enable DMA2 clock

	DMA1_Stream6->CR = 0x00000000; // disable stream 0 (ADC1)
	while ((DMA1_Stream6->CR & DMA_SxCR_EN) == DMA_SxCR_EN)
		; // wait until the DMA transfer is completed

	DMA1->LISR = 0x00000000;
	DMA1->HISR = 0x00000000;

	DMA1_Stream6->PAR = (uint32_t)&TIM4->CCR2; // peripheral port register address (ADC1)
	DMA1_Stream6->M0AR = (uint32_t)pwmArray;   // memory address of first buffer
	// DMA1_Stream2->M1AR = (uint32_t)pwmArray;   // memory address of first buffer
	DMA1_Stream6->NDTR = DMA_ARRAY_SIZE; // number of samples to write

	/* DMA1_Stream2->CR &= ~DMA_SxCR_CHSEL;								// select channel 0 for ADC1 */
	// DMA1_Stream2->CR |= DMA_SxCR_CHSEL_2 | DMA_SxCR_CHSEL_0; // select channel 0 for ADC1
	DMA1_Stream6->CR |= DMA_SxCR_CHSEL_1;
	/* DMA1_Stream2->CR |= 0x0a000000;								// select channel 0 for ADC1 */
	DMA1_Stream6->CR |= DMA_SxCR_PL;   // select stream priority to very high
									   // - DMA is flow controller
									   // - Peripheral address pointer is fixed
	DMA1_Stream6->CR |= DMA_SxCR_MINC; // Memory address pointer is incremented
									   // in accordance with the memory data size
	DMA1_Stream6->CR |= DMA_SxCR_CIRC; // Memory address pointer is incremented
	//  DMA1_Stream2->CR |= DMA_SxCR_DBM;	  // Double buffer mode
	DMA1_Stream6->CR |= DMA_SxCR_PSIZE_0; // Peripheral data size:
										  // - Half Word 16-bit
	DMA1_Stream6->CR |= DMA_SxCR_MSIZE_0; // Memory data size:
										  // - Half Word 16-bit
	DMA1_Stream6->CR |= DMA_SxCR_DIR_0;	  // Data transfer direction:
										  // - 00 -> Peripheral-to-memory
	printUSART2("%d \n", (uint32_t *)DMA1_Stream6->NDTR);
	DMA1_Stream6->CR |= DMA_SxCR_EN; // enable stream 0 (ADC1)
}