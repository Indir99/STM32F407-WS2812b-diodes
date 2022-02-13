#include "gui.h"


void setStartPosition(){
    printUSART2("\033[2J\r \e[?25l");
	printUSART2("\033[;H");
}

void writeFrameOne(){
    for(int i=0;i<102;i++)
        printFunction(0,i+5,0,35,"-");
    
    printFunction(2,5,0,35,"|");
    printFunction(2,106,0,35,"|");
    printFunction(3,5,0,35,"|");
    printFunction(3,106,0,35,"|");
    printFunction(4,5,0,35,"|");
    printFunction(4,106,0,35,"|");
    printFunction(5,5,0,35,"|");
    printFunction(5,106,0,35,"|");
    
    printFunction(3,33,0,35,"Mikroprocesorski sistemi u telekomunikacijama");
    printFunction(4,33,0,35,"Projekat");
    printFunction(4,74,0,35,"2022");
    
    for(int i=0;i<102;i++)
        printFunction(6,i+5,0,35,"-"); 
}

void writeFrameTwo(uint8_t color){
    for(int i=0;i<102;i++)
        printFunction(8,i+5,0,color,"-");
    
    printFunction(9,5,0,color,"|");
    printFunction(9,106,0,color,"|");
    printFunction(10,5,0,color,"|");
    printFunction(10,106,0,color,"|");
    printFunction(11,5,0,color,"|");
    printFunction(11,106,0,color,"|");

    printFunction(10,50,0,color,"SET COLOR : ");

    
    for(int i=0;i<102;i++)
        printFunction(12,i+5,0,color,"-");  
}

void writeFrameThree(){
	for(int i=0;i<102;i++)
		printFunction(13,i+5,0,0,"-");
		
	printFunction(14,5,0,0,"|");
    printFunction(14,106,0,0,"|");
    printFunction(15,5,0,0,"|");
    printFunction(15,106,0,0,"|");
    printFunction(16,5,0,0,"|");
    printFunction(16,106,0,0,"|");
    
    printFunction(15,53,0,0,"MODE :");
       
    for(int i=0;i<102;i++)
		printFunction(17,i+5,0,0,"-");
}

void writeFrameFour(){
	for(int i=0;i<102;i++)
		printFunction(19,i+5,0,0,"-");
		
	printFunction(20,5,0,0,"|");
    printFunction(20,60,0,0,"|");
    printFunction(20,106,0,0,"|");
    printFunction(21,5,0,0,"|");
    printFunction(21,60,0,0,"|");
    printFunction(21,106,0,0,"|");
    printFunction(22,5,0,0,"|");
    printFunction(22,60,0,0,"|");    
    printFunction(22,106,0,0,"|");
    
    printFunction(21,23,0,0,"ANIMATIONS :");
    printFunction(21,75,0,0,"TIMER/COUNTER :");
  
    for(int i=0;i<102;i++)
		printFunction(23,i+5,0,0,"-");
}

void writeFrameFive(){
	for(int i=0;i<30;i++)
		printFunction(25,i+5,0,31,"*");
	
	printFunction(26,5,0,31,"*");
	printFunction(26,34,0,31,"*");
	printFunction(27,5,0,31,"*");
	printFunction(27,34,0,31,"*");
	printFunction(28,5,0,31,"*");
	printFunction(28,34,0,31,"*");
	
	printFunction(26,7,0,34,"AUTHORS :");
	printFunction(27,16,0,34,"Indir Karabegovic");
	printFunction(28,16,0,34,"Ernad Kovacevic");
	
	for(int i=0;i<30;i++)
		printFunction(29,i+5,0,31,"*");
}


void writeGUI(){
    setStartPosition();
    writeFrameOne();
    writeFrameTwo(31);
    writeFrameThree();
    writeFrameFour();
    writeFrameFive();
}

