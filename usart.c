#include "usart.h"
volatile uint8_t g_usart2_buffer[USART2_BUFFER_SIZE];
volatile uint16_t g_usart2_widx = 0;
volatile uint16_t g_usart2_ridx = 0;
volatile uint8_t state = 0;
volatile uint8_t arrow = 0;
volatile uint32_t color=0xFFFFFF;

volatile uint8_t g_usart3_buffer[USART3_BUFFER_SIZE];
volatile uint16_t g_usart3_widx = 0;
volatile uint16_t g_usart3_ridx = 0;
volatile uint8_t usart3_state = 0;

// ARROWS 
volatile uint8_t position = 1; 
volatile char *led_color[]={"RED","GREEN","BLUE","YELLOW","PURPLE","CYAN"};
volatile char *mode[]={"OFF","ON","TIMER","COUNTER","ANIMATIONS"};
volatile char *animations[]={"BLINK","DotCircle","SNAKE","ANIM1","PWMBlue","CIRCLE"};
volatile char *timer[]={"OFF","ON"};
volatile uint16_t period=100;

volatile uint8_t ind_color=0;
volatile uint8_t ind_mode=0;
volatile uint8_t ind_anim=0;
volatile uint8_t ind_timer=0;


volatile uint8_t flag_color[]={1,0};
volatile uint8_t flag_mode[]={1,0};
volatile uint8_t flag_anim[]={1,0};
volatile uint8_t flag_timer[]={1,0};
volatile uint8_t flag_period[]={1,0};

// ARRAY SIZE - 1
volatile uint8_t numColor= 5;
volatile uint8_t numMode=4;
volatile uint8_t numAnim=5;
volatile uint8_t numTimer=1;


volatile uint32_t ret[2] = {};


// Super code:
// Up -> 8
// Down -> 2
// Left -> 4
// Right 6

void initUSART2(uint32_t baudrate)
{
	// wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww
	//  USART2: PA2 -> TX & PA3 -> RX
	//------------------------------------------------------------------

	RCC->AHB1ENR |= RCC_AHB1ENR_GPIOAEN;
	RCC->APB1ENR |= RCC_APB1ENR_USART2EN;
	GPIOA->MODER |= (GPIO_MODER_MODER2_1) | (GPIO_MODER_MODER3_1);
	GPIOA->AFR[0] |= 0x00007700;

	GPIOA->OSPEEDR |= GPIO_OSPEEDER_OSPEEDR2_1;
	GPIOA->OSPEEDR |= GPIO_OSPEEDER_OSPEEDR3_1;

	USART2->BRR = baudrate;
	USART2->CR1 = USART_CR1_UE | USART_CR1_TE;
}
uint8_t getcharUSART2()
{ /// print one character to USART2
	while (!(USART2->SR & USART_SR_RXNE))
		;
	return USART2->DR;
}

void enIrqUSART2(void)
{
	USART2->CR1 &= ~(USART_CR1_UE);

	NVIC_EnableIRQ(USART2_IRQn);
	USART2->CR1 |= (USART_CR1_UE) | (USART_CR1_RE) | (USART_CR1_RXNEIE);
}

void disIrqUSART2(void)
{
	USART2->CR1 &= ~((USART_CR1_UE) | (USART_CR1_RXNEIE));

	NVIC_DisableIRQ(USART2_IRQn);
	USART2->CR1 |= (USART_CR1_UE);
}

void putcharUSART2(uint8_t data)
{ /// print one character to USART2
	while (!(USART2->SR & USART_SR_TC))
		;

	USART2->DR = data;
}

void printUSART2(char *str, ...)
{					  /// print text and up to 10 arguments!
	uint8_t rstr[40]; // 33 max -> 32 ASCII for 32 bits and NULL
	uint16_t k = 0;
	uint16_t arg_type;
	uint32_t utmp32;
	uint32_t *p_uint32;
	char *p_char;
	va_list vl;

	// va_start(vl, 10);													// always pass the last named parameter to va_start, for compatibility with older compilers
	va_start(vl, str); // always pass the last named parameter to va_start, for compatibility with older compilers
	while (str[k] != 0x00)
	{
		if (str[k] == '%')
		{
			if (str[k + 1] != 0x00)
			{
				switch (str[k + 1])
				{
				case ('b'):
				{ // binary
					if (str[k + 2] == 'b')
					{ // byte
						utmp32 = va_arg(vl, int);
						arg_type = (PRINT_ARG_TYPE_BINARY_BYTE);
					}
					else if (str[k + 2] == 'h')
					{ // half word
						utmp32 = va_arg(vl, int);
						arg_type = (PRINT_ARG_TYPE_BINARY_HALFWORD);
					}
					else if (str[k + 2] == 'w')
					{ // word
						utmp32 = va_arg(vl, uint32_t);
						arg_type = (PRINT_ARG_TYPE_BINARY_WORD);
					}
					else
					{ // default word
						utmp32 = va_arg(vl, uint32_t);
						arg_type = (PRINT_ARG_TYPE_BINARY_WORD);
						k--;
					}

					k++;
					p_uint32 = &utmp32;
					break;
				}
				case ('d'):
				{ // decimal
					if (str[k + 2] == 'b')
					{ // byte
						utmp32 = va_arg(vl, int);
						arg_type = (PRINT_ARG_TYPE_DECIMAL_BYTE);
					}
					else if (str[k + 2] == 'h')
					{ // half word
						utmp32 = va_arg(vl, int);
						arg_type = (PRINT_ARG_TYPE_DECIMAL_HALFWORD);
					}
					else if (str[k + 2] == 'w')
					{ // word
						utmp32 = va_arg(vl, uint32_t);
						arg_type = (PRINT_ARG_TYPE_DECIMAL_WORD);
					}
					else
					{ // default word
						utmp32 = va_arg(vl, uint32_t);
						arg_type = (PRINT_ARG_TYPE_DECIMAL_WORD);
						k--;
					}

					k++;
					p_uint32 = &utmp32;
					break;
				}
				case ('c'):
				{ // character
					char tchar = va_arg(vl, int);
					putcharUSART2(tchar);
					arg_type = (PRINT_ARG_TYPE_CHARACTER);
					break;
				}
				case ('s'):
				{ // string
					p_char = va_arg(vl, char *);
					sprintUSART2((uint8_t *)p_char);
					arg_type = (PRINT_ARG_TYPE_STRING);
					break;
				}
				case ('f'):
				{											// float
					uint64_t utmp64 = va_arg(vl, uint64_t); // convert double to float representation IEEE 754
					uint32_t tmp1 = utmp64 & 0x00000000FFFFFFFF;
					tmp1 = tmp1 >> 29;
					utmp32 = utmp64 >> 32;
					utmp32 &= 0x07FFFFFF;
					utmp32 = utmp32 << 3;
					utmp32 |= tmp1;
					if (utmp64 & 0x8000000000000000)
						utmp32 |= 0x80000000;

					if (utmp64 & 0x4000000000000000)
						utmp32 |= 0x40000000;

					p_uint32 = &utmp32;

					arg_type = (PRINT_ARG_TYPE_FLOAT);
					// arg_type = (PRINT_ARG_TYPE_HEXADECIMAL_WORD);
					// arg_type = (PRINT_ARG_TYPE_BINARY_WORD);
					break;
				}
				case ('x'):
				{ // hexadecimal
					if (str[k + 2] == 'b')
					{ // byte
						utmp32 = (uint32_t)va_arg(vl, int);
						arg_type = (PRINT_ARG_TYPE_HEXADECIMAL_BYTE);
					}
					else if (str[k + 2] == 'h')
					{ // half word
						utmp32 = (uint32_t)va_arg(vl, int);
						arg_type = (PRINT_ARG_TYPE_HEXADECIMAL_HALFWORD);
					}
					else if (str[k + 2] == 'w')
					{ // word
						utmp32 = va_arg(vl, uint32_t);
						arg_type = (PRINT_ARG_TYPE_HEXADECIMAL_WORD);
					}
					else
					{
						utmp32 = va_arg(vl, uint32_t);
						arg_type = (PRINT_ARG_TYPE_HEXADECIMAL_WORD);
						k--;
					}

					k++;
					p_uint32 = &utmp32;
					break;
				}
				default:
				{
					utmp32 = 0;
					p_uint32 = &utmp32;
					arg_type = (PRINT_ARG_TYPE_UNKNOWN);
					break;
				}
				}

				if (arg_type & (PRINT_ARG_TYPE_MASK_CHAR_STRING))
				{
					getStr4NumMISC(arg_type, p_uint32, rstr);
					sprintUSART2(rstr);
				}
				k++;
			}
		}
		else
		{ // not a '%' char -> print the char
			putcharUSART2(str[k]);
			if (str[k] == '\n')
				putcharUSART2('\r');
		}
		k++;
	}

	va_end(vl);
	return;
}

void sprintUSART2(uint8_t *str)
{
	uint16_t k = 0;

	while (str[k] != '\0')
	{
		putcharUSART2(str[k]);
		if (str[k] == '\n')
			putcharUSART2('\r');
		k++;

		if (k == MAX_PRINT_STRING_SIZE)
			break;
	}
}

#ifdef USART_ECHO
void USART2_IRQHandler(void)
{
	uint8_t data;
	
	if(USART2->SR&(USART_SR_RXNE))
	{
		data = USART2->DR;
		//USART3->SR &= ~(USART_SR_RXNE);
		USART2->DR = data;
	}
}
#else

void USART2_IRQHandler(void)
{
	
	uint8_t data ;
	if(USART2->SR&(USART_SR_RXNE))
	{	
		g_usart2_buffer[g_usart2_widx] = USART2->DR;
		g_usart2_widx++;	
	}
	if(g_usart2_widx >= (USART2_BUFFER_SIZE))
	{
		g_usart2_widx = 0;
	}
}

#endif

uint32_t* chkRxBuffUSART2(void)
{
	if (g_usart2_ridx != g_usart2_widx)
	{
		if (g_usart2_buffer[g_usart2_ridx++] == 0x1B){
			if (g_usart2_buffer[g_usart2_ridx++] == '[')
			{
				if (g_usart2_buffer[g_usart2_ridx] == 'A'){
					// COLOR CHANGE UP 
						if (position == 1 && flag_color[0] == 1){
							++ind_color;
							flag_color[1] = 1;
							if (ind_color == numColor)
								flag_color[0] = 0;						
						}
					// MODE CHANGE UP
						if(position == 2 && flag_mode[0] == 1){
							++ind_mode;
							flag_mode[1] = 1;
							if(ind_mode == numMode)
								flag_mode[0] = 0;
						}					
					// ANIMATION CHANGE UP
					    if(position == 3 && flag_anim[0] == 1){
							++ind_anim;
							flag_anim[1] = 1;
							if(ind_anim == numAnim)
								flag_anim[0] = 0;
						}	
					// PERIOD CHANGE UP
						if(position == 4 && flag_period[0] == 1){
							period+=100;
							flag_period[1] = 1;
							if(period == 2000)
								flag_period[0] = 0;
						}
					// TIMER/COUNTER CHANGE UP
						if(position == 5 && flag_timer[0] == 1){
							++ind_timer;
							flag_timer[1] = 1;
							if(ind_timer == numTimer)
								flag_timer[0] = 0;
						}				
					}
				else if(g_usart2_buffer[g_usart2_ridx] == 'B'){
					    // COLOR CHANGE DOWN
						if (position == 1 && flag_color[1] == 1){
							--ind_color;
							flag_color[0] = 1;
							if (ind_color == 0)
								flag_color[1] = 0;		
						}
						//MODE CHANGE DOWN
						if (position == 2 && flag_mode[1] == 1){
							--ind_mode;
							flag_mode[0] = 1;
							if (ind_mode == 0)
								flag_mode[1] = 0;
						}						
						// ANIMATION CHANGE DOWN
						if (position == 3 && flag_anim[1] == 1){
							--ind_anim;
							flag_anim[0] = 1;
							if (ind_anim == 0)
								flag_anim[1] = 0;
						}
						// PERIOD CHANGE DOWN
						if (position == 4 && flag_period[1] == 1){
							period-=100;
							flag_period[0] = 1;
							if (period == 100)
								flag_period[1] = 0;
						}
						
						// TIMER/COUNTER CHANGE DOWN
						if (position == 5 && flag_timer[1] == 1){
							--ind_timer;
							flag_timer[0] = 1;
							if (ind_timer == 0)
								flag_timer[1] = 0;
						}							
					}
				else if (g_usart2_buffer[g_usart2_ridx] == 'C'){
						if (position != 5)
							++position;
					}
				else if (g_usart2_buffer[g_usart2_ridx] == 'D'){
						if ( position != 1)
							--position;			
					}	
				g_usart2_ridx++; 
			}
		}
	}
			
		
	if (ind_color == 0){
		writeFrameTwo(31);
		color = 0x00FF00;
	}
	else if (ind_color == 1){
		writeFrameTwo(32);
		color = 0xFF0000;
	}
	else if(ind_color == 2){
		writeFrameTwo(34);
		color = 0x0000FF;
	}
	else if(ind_color == 3){
		writeFrameTwo(33);
		color = 0xFFFF00;
	}
	else if(ind_color == 4){
		writeFrameTwo(35);
		color = 0x00FFFF;
	}
	else{
		writeFrameTwo(36);
		color = 0xFF00FF;
	}
	
	ret[1]= color;
	
	printFunction(10,62,0,0,"          ");
	printFunction(15,60,0,0,"          ");
	printFunction(21,23,0,0,"          ");
	printFunction(21,91,0,0,"          ");
	printFunction(21,49,0,0,"          ");
	
	
	switch(position){
		case 1:		
			printFunction(10,62,0,41,led_color[ind_color]);
			printFunction(15,60,0,0,mode[ind_mode]);
			printFunction(21,23,0,0,animations[ind_anim]);
			printUSART2("\e[21;49f%d ms",period);
			printFunction(21,91,0,0,timer[ind_timer]);		
			break;
			
		case 2:
			printFunction(10,62,0,0,led_color[ind_color]);
			printFunction(15,60,0,41,mode[ind_mode]);
			printFunction(21,23,0,0,animations[ind_anim]);
			printUSART2("\e[21;49f%d ms",period);
			printFunction(21,91,0,0,timer[ind_timer]);
			break;
		case 3:
			printFunction(10,62,0,0,led_color[ind_color]);
			printFunction(15,60,0,0,mode[ind_mode]);
			printFunction(21,23,0,41,animations[ind_anim]);
			printUSART2("\e[21;49f%d ms",period);
			printFunction(21,91,0,0,timer[ind_timer]);
			break;
		case 4:	
			printFunction(10,62,0,0,led_color[ind_color]);
			printFunction(15,60,0,0,mode[ind_mode]);
			printFunction(21,23,0,0,animations[ind_anim]);
			printUSART2("\e[21;49f\e[41m%d ms\e[0m",period);
			printFunction(21,91,0,0,timer[ind_timer]);
			break;
		case 5:
			printFunction(10,62,0,0,led_color[ind_color]);
			printFunction(15,60,0,0,mode[ind_mode]);
			printFunction(21,23,0,0,animations[ind_anim]);
			printUSART2("\e[21;49f%d ms",period);
			printFunction(21,91,0,41,timer[ind_timer]);
	}	
	
	if (ind_mode == 0){
		ledOFF();
		start();
	}
	else if (ind_mode == 1){
		numberEight(color);
		start();
	}
	else if (ind_mode == 2){
		if (ind_timer == 1){
			timerLED(color,period);
			start();
		}
		else{
			timerReset();
		}

	}
	else if (ind_mode == 3){
		if (ind_timer == 1)
			ret[0] = 1;	
		else{
			ret[0] = 0;
			timerReset();
		}
	}
	else{
		if (ind_anim == 0){
			blink(color,period);
			DotCircleReset();
		}
		else if (ind_anim == 1){
			DotCircle(color,period);
			snakeReset();
		}
		else if (ind_anim == 2){
			snake(period);
			DotCircleReset();
		}
		else if (ind_anim == 3)
			animation1(color,period);
		else if (ind_anim == 4)
			pwmBlue(period);
		else
			Circle(period);

	}
	
	if (ind_mode == 3){
		if (ind_timer == 1)
			ret[0] = 1;	
		else
			ret[0] = 0;
	}
	else
	{
		ret[0] = 0;
	}
	
	
	
		if (g_usart2_ridx >= (USART2_BUFFER_SIZE))
		{
			g_usart2_ridx = 0;
		}
	
	return ret;
}



void printFunction(uint8_t row, uint8_t col, uint8_t bckc, uint8_t letcol, char *str, ...)
{
	printUSART2("\033[%d;%df\e[%dm\e[%dm", row, col, bckc, letcol);
	uint8_t rstr[40]; // 33 max -> 32 ASCII for 32 bits and NULL
	uint16_t k = 0;
	uint16_t arg_type;
	uint32_t utmp32;
	uint32_t *p_uint32;
	char *p_char;
	va_list vl;

	// va_start(vl, 10);
	// always pass the last named parameter to va_start, for compatibility with older compilers
	va_start(vl, str); // always pass the last named parameter to va_start, for compatibility with older compilers
	while (str[k] != 0x00)
	{
		if (str[k] == '%')
		{
			if (str[k + 1] != 0x00)
			{
				switch (str[k + 1])
				{
				case ('b'):
				{ // binary
					if (str[k + 2] == 'b')
					{ // byte
						utmp32 = va_arg(vl, int);
						arg_type = (PRINT_ARG_TYPE_BINARY_BYTE);
					}
					else if (str[k + 2] == 'h')
					{ // half word
						utmp32 = va_arg(vl, int);
						arg_type = (PRINT_ARG_TYPE_BINARY_HALFWORD);
					}
					else if (str[k + 2] == 'w')
					{ // word
						utmp32 = va_arg(vl, uint32_t);
						arg_type = (PRINT_ARG_TYPE_BINARY_WORD);
					}
					else
					{ // default word
						utmp32 = va_arg(vl, uint32_t);
						arg_type = (PRINT_ARG_TYPE_BINARY_WORD);
						k--;
					}

					k++;
					p_uint32 = &utmp32;
					break;
				}
				case ('d'):
				{ // decimal
					if (str[k + 2] == 'b')
					{ // byte
						utmp32 = va_arg(vl, int);
						arg_type = (PRINT_ARG_TYPE_DECIMAL_BYTE);
					}
					else if (str[k + 2] == 'h')
					{ // half word
						utmp32 = va_arg(vl, int);
						arg_type = (PRINT_ARG_TYPE_DECIMAL_HALFWORD);
					}
					else if (str[k + 2] == 'w')
					{ // word
						utmp32 = va_arg(vl, uint32_t);
						arg_type = (PRINT_ARG_TYPE_DECIMAL_WORD);
					}
					else
					{ // default word
						utmp32 = va_arg(vl, uint32_t);
						arg_type = (PRINT_ARG_TYPE_DECIMAL_WORD);
						k--;
					}

					k++;
					p_uint32 = &utmp32;
					break;
				}
				case ('c'):
				{ // character
					char tchar = va_arg(vl, int);
					putcharUSART2(tchar);
					arg_type = (PRINT_ARG_TYPE_CHARACTER);
					break;
				}
				case ('s'):
				{ // string
					p_char = va_arg(vl, char *);
					sprintUSART2((uint8_t *)p_char);
					arg_type = (PRINT_ARG_TYPE_STRING);
					break;
				}
				case ('f'):
				{											// float
					uint64_t utmp64 = va_arg(vl, uint64_t); // convert double to float representation IEEE 754
					uint32_t tmp1 = utmp64 & 0x00000000FFFFFFFF;
					tmp1 = tmp1 >> 29;
					utmp32 = utmp64 >> 32;
					utmp32 &= 0x07FFFFFF;
					utmp32 = utmp32 << 3;
					utmp32 |= tmp1;
					if (utmp64 & 0x8000000000000000)
						utmp32 |= 0x80000000;

					if (utmp64 & 0x4000000000000000)
						utmp32 |= 0x40000000;

					p_uint32 = &utmp32;

					arg_type = (PRINT_ARG_TYPE_FLOAT);
					// arg_type = (PRINT_ARG_TYPE_HEXADECIMAL_WORD);
					// arg_type = (PRINT_ARG_TYPE_BINARY_WORD);
					break;
				}
				case ('x'):
				{ // hexadecimal
					if (str[k + 2] == 'b')
					{ // byte
						utmp32 = (uint32_t)va_arg(vl, int);
						arg_type = (PRINT_ARG_TYPE_HEXADECIMAL_BYTE);
					}
					else if (str[k + 2] == 'h')
					{ // half word
						utmp32 = (uint32_t)va_arg(vl, int);
						arg_type = (PRINT_ARG_TYPE_HEXADECIMAL_HALFWORD);
					}
					else if (str[k + 2] == 'w')
					{ // word
						utmp32 = va_arg(vl, uint32_t);
						arg_type = (PRINT_ARG_TYPE_HEXADECIMAL_WORD);
					}
					else
					{
						utmp32 = va_arg(vl, uint32_t);
						arg_type = (PRINT_ARG_TYPE_HEXADECIMAL_WORD);
						k--;
					}

					k++;
					p_uint32 = &utmp32;
					break;
				}
				default:
				{
					utmp32 = 0;
					p_uint32 = &utmp32;
					arg_type = (PRINT_ARG_TYPE_UNKNOWN);
					break;
				}
				}

				if (arg_type & (PRINT_ARG_TYPE_MASK_CHAR_STRING))
				{
					getStr4NumMISC(arg_type, p_uint32, rstr);
					sprintUSART2(rstr);
				}
				k++;
			}
		}
		else
		{ // not a '%' char -> print the char
			putcharUSART2(str[k]);
			if (str[k] == '\n')
				putcharUSART2('\r');
		}
		k++;
	}

	va_end(vl);
	printUSART2("\e[49m\e[39m");
	return;
}

void initUSART3(uint32_t baudrate)
{

	// wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww
	//  USART3: PD8 -> TX & PD9 -> RX
	//------------------------------------------------------------------

	RCC->AHB1ENR |= RCC_AHB1ENR_GPIODEN;
	RCC->APB1ENR |= RCC_APB1ENR_USART3EN;
	GPIOD->MODER |= (GPIO_MODER_MODER8_1) | (GPIO_MODER_MODER9_1);
	GPIOD->AFR[1] |= 0x00000077;

	GPIOA->OSPEEDR |= GPIO_OSPEEDER_OSPEEDR2_1;
	GPIOA->OSPEEDR |= GPIO_OSPEEDER_OSPEEDR3_1;

	USART3->BRR = baudrate;
	USART3->CR1 = (USART_CR1_UE) | (USART_CR1_TE) | (USART_CR1_RE);
}

void putcharUSART3(uint8_t data)
{ /// print one character to USART3
	while (!(USART3->SR & USART_SR_TC))
		;

	USART3->DR = data;
}

uint8_t getcharUSART3(void)
{ /// get one character from USART3
	uint8_t data;
	USART3->CR1 |= USART_CR1_UE | USART_CR1_RE; // enable usart	and Rx
	while ((USART3->SR & USART_SR_RXNE) != USART_SR_RXNE)
		; // wait until data ready

	data = USART3->DR;				// send data
	USART3->SR &= ~(USART_SR_RXNE); // clear Rx data ready flag
	USART3->CR1 &= ~(USART_CR1_RE);
	return data;
}

void enIrqUSART3(void)
{
	USART3->CR1 &= ~(USART_CR1_UE);

	NVIC_EnableIRQ(USART3_IRQn);
	USART3->CR1 |= (USART_CR1_UE) | (USART_CR1_RE) | (USART_CR1_RXNEIE);
}

void disIrqUSART3(void)
{
	USART3->CR1 &= ~((USART_CR1_UE) | (USART_CR1_RXNEIE));

	NVIC_DisableIRQ(USART2_IRQn);
	USART3->CR1 |= (USART_CR1_UE);
}

#ifdef USART_ECHO
void USART3_IRQHandler(void)
{
	uint8_t data;

	if (USART3->SR & (USART_SR_RXNE))
	{
		data = USART3->DR;
		// USART3->SR &= ~(USART_SR_RXNE);
		USART3->DR = data;
	}
}
#else

void USART3_IRQHandler(void)
{
	// usart3_state = 0;

	if (USART3->SR & (USART_SR_RXNE))
	{
		g_usart3_buffer[g_usart3_widx] = USART3->DR;
		g_usart3_widx++;
		if (g_usart3_widx >= (USART3_BUFFER_SIZE))
		{
			// g_usart3_ridx = 0;
			g_usart3_widx = 0;
			// usart3_state = 0;
		}
		if (g_usart3_ridx >= (USART3_BUFFER_SIZE))
		{
			g_usart3_ridx = 0;
			// g_usart3_widx = 0;
			//  usart3_state = 0;
		}
	}
}

#endif
void chkRxBuffUSART3(void)
{

	if (g_usart3_ridx != g_usart3_widx)
	{
		usart3_state = 1;
		g_usart3_ridx++;
	}
	else
	{
		usart3_state = 0;
	}
}








