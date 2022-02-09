#include "stm32f4xx.h"
#include "delay.h"
#include "usart.h"
#include "misc.h"
#include "gui.h"




int main()
{
//init functions
initUSART2(USART2_BAUDRATE_921600);

//gui printing
    writeGUI();
    
    while(1){
        
        //printUSART2("Indir test \n");
        printFunction(15,15,0,34,"Indir print function testing \n");
        delay_ms(1000);
    }
    return 0;
}
