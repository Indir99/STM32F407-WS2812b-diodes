#include "stm32f4xx.h"
#include "delay.h"
#include "usart.h"
#include "misc.h"




int main()
{
//init functions
initUSART2(USART2_BAUDRATE_921600);

//gui printing
	printUSART2("\033[2J\r");
	printUSART2("\033[;H");
    
    while(1){
        printUSART2("Indir test \n");
        delay_ms(1000);
    }
    return 0;
}
