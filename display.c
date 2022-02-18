#include "display.h"
#include "usart.h"

#define DMA_ARRAY_SIZE 602

void (*number_buffer[10])(uint32_t) = {numberZero, numberOne, numberTwo, numberThree, numberFour, numberFive, numberSix,
									   numberSeven, numberEight, numberNine};

uint16_t pwmArray[DMA_ARRAY_SIZE] = {};

//VARIABLES

// TIMER
uint8_t counter = 0;
uint8_t timer_flag = 0;

// DOTCircle
uint8_t cnt_dc=0;

// SNAKE
uint8_t led_cntS = 0;
uint16_t indxS=0;
uint16_t indx1S=24*1;
uint16_t indx2S=24*2;
uint16_t indx3S=24*3;
uint8_t flagS = 0;

// ANIMATION1
uint8_t cnt_anim1 = 0;
uint8_t numLed = 0;
uint8_t led_left = 4;
uint8_t led_right = 15;
uint8_t flag = 0;
int indxFirst = 24*5;
int indxLast =24*15;
int indxR=24*6;
int indxL=24*4;

// CIRCLE
int indx_red = 0;
int indx_blue=120;
int indx_green=240;
int indx_yellow=360;
uint32_t color_red[5]={0x003200,0x006400,0x009600,0x00C800,0x00FF00};
uint32_t color_blue[5]={0x000032,0x000064,0x000096,0x0000C8,0x0000FF};
uint32_t color_green[5]={0x320000,0x640000,0x960000,0xC80000,0xFF0000};
uint32_t color_yellow[5]={0x323200,0x646400,0x969600,0xC8C800,0xFFC800};
uint32_t arraytmp[DMA_ARRAY_SIZE]={};

// ANIMATION 2
uint8_t cnt_anim2=0;
int8_t max=22;
uint8_t flagAnim2=0;
int indx2 = 528;

// ANIMATION3
int indAnim3=0;


void ledOFF()
{
	for (int i = 0; i < DMA_ARRAY_SIZE; i++)
		pwmArray[i] = 34;
}

void ledON(uint32_t color)
{
	numberEight(color);
}
// NUMBERS DESIGN
void numberZero(uint32_t color)
{

	uint32_t colors[23] = {};

	for (int i = 0; i < 23; i++)
		colors[i] = color;

	int indx = 0;

	for (int i = 0; i < 23; i++)
	{
		for (int j = 23; j >= 0; j--)
		{
			if (!(i >= 20))
			{
				if (colors[i] & (1 << j))
					pwmArray[indx] = 71;
				else
					pwmArray[indx] = 34;
			}
			else
				pwmArray[indx] = 34;

			indx++;
		}
	}

	for (int i = 552; i < 602; i++)
		pwmArray[i] = 34;

	delay_ms(10);
}

void numberOne(uint32_t color)
{

	uint32_t colors[23] = {};

	for (int i = 0; i < 23; i++)
		colors[i] = color;

	int indx = 0;

	for (int i = 0; i < 23; i++)
	{
		for (int j = 23; j >= 0; j--)
		{
			if ((i >= 0 && i <= 3) || (i >= 17 && i <= 19))
			{
				if (colors[i] & (1 << j))
					pwmArray[indx] = 71;
				else
					pwmArray[indx] = 34;
			}
			else
				pwmArray[indx] = 34;

			indx++;
		}
	}

	for (int i = 552; i < 602; i++)
		pwmArray[i] = 34;

	delay_ms(10);
}

void numberTwo(uint32_t color)
{
	uint32_t colors[23] = {};

	for (int i = 0; i < 23; i++)
		colors[i] = color;

	int indx = 0;

	for (int i = 0; i < 23; i++)
	{
		for (int j = 23; j >= 0; j--)
		{
			if (!((i >= 1 && i <= 2) || (i >= 11 && i <= 12)))
			{
				if (colors[i] & (1 << j))
					pwmArray[indx] = 71;
				else
					pwmArray[indx] = 34;
			}
			else
				pwmArray[indx] = 34;

			indx++;
		}
	}

	for (int i = 552; i < 602; i++)
		pwmArray[i] = 34;

	delay_ms(10);
}

void numberThree(uint32_t color)
{
	uint32_t colors[23] = {};

	for (int i = 0; i < 23; i++)
		colors[i] = color;

	int indx = 0;

	for (int i = 0; i < 23; i++)
	{
		for (int j = 23; j >= 0; j--)
		{
			if (!((i >= 1 && i <= 2) || (i >= 18 && i <= 19)))
			{
				if (colors[i] & (1 << j))
					pwmArray[indx] = 71;
				else
					pwmArray[indx] = 34;
			}
			else
				pwmArray[indx] = 34;

			indx++;
		}
	}

	for (int i = 552; i < 602; i++)
		pwmArray[i] = 34;

	delay_ms(10);
}

void numberFour(uint32_t color)
{
	uint32_t colors[23] = {};

	for (int i = 0; i < 23; i++)
		colors[i] = color;

	int indx = 0;

	for (int i = 0; i < 23; i++)
	{
		for (int j = 23; j >= 0; j--)
		{
			if (!((i >= 4 && i <= 6) || (i >= 14 && i <= 19)))
			{
				if (colors[i] & (1 << j))
					pwmArray[indx] = 71;
				else
					pwmArray[indx] = 34;
			}
			else
				pwmArray[indx] = 34;

			indx++;
		}
	}

	for (int i = 552; i < 602; i++)
		pwmArray[i] = 34;

	delay_ms(10);
}

void numberFive(uint32_t color)
{
	uint32_t colors[23] = {};

	for (int i = 0; i < 23; i++)
		colors[i] = color;

	int indx = 0;

	for (int i = 0; i < 23; i++)
	{
		for (int j = 23; j >= 0; j--)
		{
			if (!((i >= 8 && i <= 9) || (i >= 18 && i <= 19)))
			{
				if (colors[i] & (1 << j))
					pwmArray[indx] = 71;
				else
					pwmArray[indx] = 34;
			}
			else
				pwmArray[indx] = 34;

			indx++;
		}
	}

	for (int i = 552; i < 602; i++)
		pwmArray[i] = 34;

	delay_ms(10);
}

void numberSix(uint32_t color)
{
	uint32_t colors[23] = {};

	for (int i = 0; i < 23; i++)
		colors[i] = color;

	int indx = 0;

	for (int i = 0; i < 23; i++)
	{
		for (int j = 23; j >= 0; j--)
		{
			if (!(i == 8 || i == 9))
			{
				if (colors[i] & (1 << j))
					pwmArray[indx] = 71;
				else
					pwmArray[indx] = 34;
			}
			else
				pwmArray[indx] = 34;

			indx++;
		}
	}

	for (int i = 552; i < 602; i++)
		pwmArray[i] = 34;

	delay_ms(10);
}

void numberSeven(uint32_t color)
{
	uint32_t colors[23] = {};

	for (int i = 0; i < 23; i++)
		colors[i] = color;

	int indx = 0;

	for (int i = 0; i < 23; i++)
	{
		for (int j = 23; j >= 0; j--)
		{
			if (!((i >= 0 && i <= 2) || (i >= 14 && i <= 22)))
			{
				if (colors[i] & (1 << j))
					pwmArray[indx] = 71;
				else
					pwmArray[indx] = 34;
			}
			else
				pwmArray[indx] = 34;

			indx++;
		}
	}

	for (int i = 552; i < 602; i++)
		pwmArray[i] = 34;

	delay_ms(10);
}

void numberEight(uint32_t color)
{
	uint32_t colors[23] = {};

	for (int i = 0; i < 23; i++)
		colors[i] = color;

	int indx = 0;

	for (int i = 0; i < 23; i++)
	{
		for (int j = 23; j >= 0; j--)
		{
			if (colors[i] & (1 << j))
				pwmArray[indx] = 71;
			else
				pwmArray[indx] = 34;

			indx++;
		}
	}

	for (int i = 552; i < 602; i++)
		pwmArray[i] = 34;

	delay_ms(10);
}

void numberNine(uint32_t color)
{
	uint32_t colors[23] = {};

	for (int i = 0; i < 23; i++)
		colors[i] = color;

	int indx = 0;

	for (int i = 0; i < 23; i++)
	{
		for (int j = 23; j >= 0; j--)
		{
			if (!(i == 18 || i == 19))
			{
				if (colors[i] & (1 << j))
					pwmArray[indx] = 71;
				else
					pwmArray[indx] = 34;
			}
			else
				pwmArray[indx] = 34;

			indx++;
		}
	}

	for (int i = 552; i < 602; i++)
		pwmArray[i] = 34;

	delay_ms(10);
}

void pushButtonCounter(uint32_t color, uint8_t buttonState)
{
	switch (buttonState)
	{
	case (0):
	{
		numberZero(color);
		start();
		break;
	}
	case (1):
	{
		numberOne(color);
		start();
		break;
	}
	case (2):
	{
		numberTwo(color);
		start();
		break;
	}
	case (3):
	{
		numberThree(color);
		start();
		break;
	}
	case (4):
	{
		numberFour(color);
		start();
		break;
	}
	case (5):
	{
		numberFive(color);
		start();
		break;
	}
	case (6):
	{
		numberSix(color);
		start();
		break;
	}
	case (7):
	{
		numberSeven(color);
		start();
		break;
	}
	case (8):
	{
		numberEight(color);
		start();
		break;
	}
	case (9):
	{
		numberNine(color);
		start();
		break;
	}

	default:
		break;
	}
}

void start()
{
	TIM4->CR1 |= TIM_CR1_CEN;
	TIM4->EGR &= ~TIM_EGR_UG;
	//	printUSART2("%d \n",DMA1_Stream6->NDTR);
	// DMA1_Stream6->NDTR = DMA_ARRAY_SIZE;
	DMA1_Stream6->CR |= DMA_SxCR_EN;
	while (DMA1_Stream6->NDTR){}

	// DMA DISABLE
	TIM4->CR1 &= ~(0x0001);
	TIM4->CCR2 = 0x0000;
	DMA1->HIFCR |= 0x00200000;
	DMA1_Stream6->CR &= ~(0x0000001);
	TIM4->EGR |= TIM_EGR_UG;
	DMA1_Stream6->NDTR = DMA_ARRAY_SIZE;
}

void initDMA()
{
	// Initialize PWM
	RCC->AHB1ENR |= RCC_AHB1ENR_GPIODEN;
	GPIOD->MODER |= 0xAA000000;
	GPIOD->OTYPER |= 0x00000000;
	GPIOD->AFR[1] |= 0x22220000;

	{
		RCC->APB1ENR |= RCC_APB1ENR_TIM4EN; // enable TIM4 on APB1
		TIM4->PSC = 0;						// set TIM4 counting prescaler
											// 84MHz/84 = 1MHz -> count each 1us
		/* TIM4->ARR = 0x03E8;											// period of the PWM 1ms */
		TIM4->ARR = 105; // period of the PWM 1ms

		TIM4->CCR1 = 100; // duty cycle for the PWM set to 0%
		TIM4->CCR2 = 0x0000;
		TIM4->CCR3 = 0x0056;
		// TIM4->CCR4 = 0x0056;
		TIM4->CCR4 = 105;

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

		// activate capture cmpare mode
		TIM4->CCER |= (TIM_CCER_CC1E) | (TIM_CCER_CC2E) | (TIM_CCER_CC3E) | (TIM_CCER_CC4E);
		// start counter
		// TIM4->CR1 |= TIM_CR1_CEN;
	}

	/// wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww
	///  Setup DMA1 controller for ADC1 p179
	/// wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww
	RCC->AHB1ENR |= RCC_AHB1ENR_DMA1EN; // enable DMA1 clock

	DMA1_Stream6->CR = 0x00000000; // disable stream 0 (ADC1)
	while ((DMA1_Stream6->CR & DMA_SxCR_EN) == DMA_SxCR_EN)
	{
	}; // wait until the DMA transfer is completed
	DMA1->LISR = 0x00000000;
	DMA1->HISR = 0x00000000;

	DMA1_Stream6->PAR = (uint32_t)&TIM4->CCR2; // peripheral port register address (ADC1)
	DMA1_Stream6->M0AR = (uint32_t)pwmArray;   // memory address of first buffer
	// DMA1_Stream2->M1AR = (uint32_t)pwmArray;  						// memory address of first buffer
	DMA1_Stream6->NDTR = DMA_ARRAY_SIZE; // number of samples to write

	/* DMA1_Stream2->CR &= ~DMA_SxCR_CHSEL;								// select channel 0 for ADC1 */
	// DMA1_Stream2->CR |= DMA_SxCR_CHSEL_2 | DMA_SxCR_CHSEL_0; 		// select channel 0 for ADC1
	DMA1_Stream6->CR |= DMA_SxCR_CHSEL_1;
	/* DMA1_Stream2->CR |= 0x0a000000;									// select channel 0 for ADC1 */
	DMA1_Stream6->CR |= DMA_SxCR_PL;   // select stream priority to very high
									   // select stream priority to very high
									   // - DMA is flow controller
									   // - Peripheral address pointer is fixed
	DMA1_Stream6->CR |= DMA_SxCR_MINC; // Memory address pointer is incremented
									   // in accordance with the memory data size
	// DMA1_Stream6->CR |= DMA_SxCR_PBURST_0;
	//  DMA1_Stream6->CR |= DMA_SxCR_CIRC; // Memory address pointer is incremented
	//   DMA1_Stream2->CR |= DMA_SxCR_DBM;	 							// Double buffer mode
	DMA1_Stream6->CR |= DMA_SxCR_PSIZE_0; // Peripheral data size:
										  // - Half Word 16-bit
	DMA1_Stream6->CR |= DMA_SxCR_MSIZE_0; // Memory data size:
										  // - Half Word 16-bit
	DMA1_Stream6->CR |= DMA_SxCR_DIR_0;	  // Data transfer direction:
}

void timerLED(uint32_t color,uint16_t delay)
{
	// uint8_t number = 0;
	if (counter == 0)
		timer_flag = 1;
	else if (counter == 10)
	{
		timer_flag = 0;
		counter = 8;
	}

	if (counter < 10 && timer_flag == 1)
	{
		number_buffer[counter](color);
		counter++;
	}
	else if (counter > 0 && timer_flag == 0)
	{
		number_buffer[counter](color);
		counter--;
	}

	start();
	delay_ms(delay);
}

void blink(uint32_t color,uint16_t delay)
{
	numberEight(color);
	delay_ms(delay);
	start();
	ledOFF();
	delay_ms(delay);
	start();
	
}

void DotCircle(uint32_t color,uint16_t delay){
	uint32_t colors[1]={color};
	
		if (cnt_dc > 19){ 
			cnt_dc = 0;
			DotCircleReset();
		}
		int indx = 0;

		for (int i = 0; i < 23; i++)
		{
			for (int j = 23; j >= 0; j--)
			{
				if (i == cnt_dc)
				{
					if (colors[i] & (1 << j))
						pwmArray[indx] = 71;
					else
						pwmArray[indx] = 34;
				}
				else
					pwmArray[indx] = 34;
					
				indx++;
			}
		}
		
	for (int i = 552; i < 602; i++)
		pwmArray[i] = 34;

	delay_ms(delay);
	start();
	cnt_dc++;	
}

void animation1(uint32_t color,uint16_t delay){
	uint32_t colors[1]={color};
	if (numLed>10 && flag == 0){
		indxLast =24*15;
		indxL = 24*16;
		indxR = 24*led_right;
		flag = 1;	
	}
		
	if (numLed <=0 && flag == 1){
		numLed = 0;
		led_left = 4;
		led_right = 15;
		indxFirst = 24*5;
		indxLast =24*15;
		indxR=24*6;
		indxL=24*led_left;
		flag = 0;	
	}
		
	if (flag == 0){
		if (numLed == 0){
			for (int j = 23; j >= 0; j--){
				if (colors[0] & (1 << j))
					pwmArray[indxFirst++] = 71;
				else
					pwmArray[indxFirst++] = 34;
			}
		}
		else if (numLed > 0 && numLed < 10){
			for (int j = 23; j >= 0; j--){
				if (colors[0] & (1 << j)){
					pwmArray[indxR++] = 71;
					pwmArray[indxL++] = 71;
				}
				else{
					pwmArray[indxR++] = 34;
					pwmArray[indxL++] = 34;
				}
			}
			if (led_left == 0)
				led_left = 19;
			else
				led_left --;
		}
		else{
			for (int j = 23; j >= 0; j--){
				if (colors[0] & (1 << j))
					pwmArray[indxLast++] = 71;
				else
					pwmArray[indxLast++] = 34;
			}
		}
	}
	
	if (flag == 1) {
		if (numLed == 11){	
			for (int j = 23; j >= 0; j--){
				pwmArray[indxLast++] = 33;	
			}
		}
		else{
			for (int j = 23; j >= 0; j--){
				pwmArray[indxLast++] = 33;	
				pwmArray[indxR++] = 33;
			}
		}
		
		if (indxLast == (24*20))
			indxLast=0;
				
		led_right--;
				
	}
		
	if (flag == 0){
		indxL=24*led_left;
		numLed++;
	}
	else{
		numLed--;
		indxR=24*led_right;
	}
		
	delay_ms(delay);
	start();	
}
	
void snake(uint16_t delay){
	uint32_t colors[3]={0x0F0000,0x000F00,0x00000F};
	//ledOFF();
	if (led_cntS == 25){
		snakeReset();
	}
						
	if (led_cntS == 0){
		for (int j = 23; j >= 0; j--)
		{
			if (colors[0] & (1 << j))
				pwmArray[indxS++] = 71;
			else
				pwmArray[indxS++] = 34;
		}
	}
	else if (led_cntS == 1){
		for (int j = 23; j >= 0; j--){
			if (colors[1] & (1 << j))
				pwmArray[indxS++] = 71;
			else
				pwmArray[indxS++] = 34;
		}
			
		for (int j = 23; j >= 0; j--){
				if (colors[0] & (1 << j))
					pwmArray[indxS++] = 71;
				else
					pwmArray[indxS++] = 34;
			}	
		}
		else if (led_cntS == 2){
			for (int j = 23; j >= 0; j--)
			{
				if (colors[2] & (1 << j))
					pwmArray[indxS++] = 71;
				else
					pwmArray[indxS++] = 34;
			}
			
		for (int j = 23; j >= 0; j--){
			if (colors[1] & (1 << j))
				pwmArray[indxS++] = 71;
			else
				pwmArray[indxS++] = 34;
		}	
			
		for (int j = 23; j >= 0; j--){
			if (colors[0] & (1 << j))
				pwmArray[indxS++] = 71;
			else
				pwmArray[indxS++] = 34;
		}
	}	
	else{
		flagS = 1;
	}
		
	if(flagS == 1){
		ledOFF();	
		for (int j = 23; j >= 0; j--){
			if (colors[2] & (1 << j))
				pwmArray[indx1S++] = 71;
			else
				pwmArray[indx1S++] = 34;
		}
			
		for (int j = 23; j >= 0; j--)
		{
			if (colors[1] & (1 << j))
				pwmArray[indx2S++] = 71;
			else
				pwmArray[indx2S++] = 34;
		}	
			
		for (int j = 23; j >= 0; j--)
		{
			if (colors[0] & (1 << j))
				pwmArray[indx3S++] = 71;
			else
				pwmArray[indx3S++] = 34;
		}	
	}
		
	indxS=0;
	led_cntS++;
	delay_ms(delay);
	start();
}

void pwmBlue(uint16_t delay){
	uint32_t colors[1]={0x0000FF};
	float values[11]={0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1};
	uint32_t up[10]={};
	uint32_t down[10]={};
	ledOFF();	
	for (int i=0,j=9; i<10,j>=0;i++,j--){
		up[i]=colors[0]*values[i];
		down[i]=colors[0]*values[j+1];
	}
	for(int i=0;i<10;i++){
		numberEight(up[i]);
		start();
		delay_ms(delay);
	}
		
	for(int i=0;i<10;i++){
		numberEight(down[i]);
		start();
		delay_ms(delay);
	}
		
}

void Circle(uint16_t period){
	
	for(int i=0;i<DMA_ARRAY_SIZE;i++){
		arraytmp[i]=pwmArray[i];
	}
		
	for(int i=456,j=0;i<480,j<24;i++,j++){
		pwmArray[j]=arraytmp[i];
	}
	for(int i=24,j=0; i<480,j<456; i++,j++){
		pwmArray[i]=arraytmp[j];
	}
		
	delay_ms(period);		
	start();
}	

void animation2(uint32_t color,uint16_t delay){
	
	uint32_t colors[1]={color};
	if (max < 0){
		max=22;
	}
	
	if (cnt_anim2 >= max){ 
		cnt_anim2 = 0;
		max--;
		flagAnim2 = 1;
	}
	else{
		flagAnim2 = 0;
	}
	int indx2 = 528;
	int indx1 = 0;
	
	for (int i = 0; i < 23; i++){
		for (int j = 23; j >= 0; j--){
			if (i == cnt_anim2){
				if (colors[0] & (1 << j))
					pwmArray[indx1] = 71;
				else
					pwmArray[indx1] = 34;
			}
			else
				pwmArray[indx1] = 34;
					
			indx1++;
		}
	}
	
	indx2=24*(max+1);
	
	for (int i =(max+1);i<23; i++){
		for (int j = 23; j >= 0; j--){
			if (colors[0] & (1 << j))
				pwmArray[indx2++] = 71;
			else
				pwmArray[indx2++] = 34;
		}
	}	
		
	start();
	cnt_anim2++;
	delay_ms(delay);
}

void animation3(uint32_t color,uint16_t delay){
	uint32_t colors[1]={color};
	int indx=0;
	if (indAnim3==0){
		for(int i=0;i<23;i++){
			indx=i*24;
			for (int j = 23; j >= 0; j--){
				if (i%2==0){
					if (colors[0] & (1 << j))
						pwmArray[indx++] = 71;
					else
						pwmArray[indx++] = 34;
				}
				else
					pwmArray[indx++] = 34;
			}	
		}
		indAnim3=1;
	}
	else{
		for(int i=0;i<23;i++){
			indx=i*24;
			for (int j = 23; j >= 0; j--){
				if (i%2!=0){
					if (colors[0] & (1 << j))
						pwmArray[indx++] = 71;
					else
						pwmArray[indx++] = 34;
				}
				else
					pwmArray[indx++] = 34;
			}	
		}
		indAnim3=0;
	}
			
	delay_ms(delay);
	start();
}

// RESET FUNCTIONS

void timerReset()
{
	counter = 0;
	timer_flag = 0;
	ledOFF();
	start();
}

void DotCircleReset(){
	cnt_dc= 0;
	ledOFF();
}

void snakeReset(){
	led_cntS = 0;
	indxS=0;
	indx1S=24*1;
	indx2S=24*2;
	indx3S=24*3;
	flagS = 0;
	ledOFF();
}

void animation1Reset(){
	
	cnt_anim1 = 0;
	numLed = 0;
	led_left = 4;
	led_right = 15;
	flag = 0;
	indxFirst = 24*5;
	indxLast =24*15;
	indxR=24*6;
	indxL=24*led_left;
	ledOFF();
}

void CircleReset(){
	indx_red = 0;
	indx_blue=120;
	indx_green=240;
	indx_yellow=360;
	ledOFF();
}

void animation2Reset(){
	cnt_anim2=0;
	max=22;
	flagAnim2=0;
	indx2 = 528;
	ledOFF();
}

void animation3Reset(){
	indAnim3=0;
	ledOFF();
}

// START FUNCTIONS

void CircleStart(uint16_t period){
	for (int i=0; i<5; i++){
		for (int j = 23; j >= 0; j--){
			if (color_red[i] & (1 << j))
				pwmArray[indx_red++] = 71;
			else
				pwmArray[indx_red++] = 34;
				
			if (color_blue[i] & (1 << j))
				pwmArray[indx_blue++] = 71;
			else
				pwmArray[indx_blue++] = 34;
				
			if (color_green[i] & (1 << j))
				pwmArray[indx_green++] = 71;
			else
				pwmArray[indx_green++] = 34;	
			
			if (color_yellow[i] & (1 << j))
				pwmArray[indx_yellow++] = 71;
			else
				pwmArray[indx_yellow++] = 34;	
		}	
	}
	start();
	delay_ms(period);		
}





