#include "gui.h"


void setStartPosition(){
    printUSART2("\033[2J\r");
	printUSART2("\033[;H");
}

void writeFrameOne(){
    for(int i=0;i<=100;i++){
        printFunction(0,i,0,34,"-");
    }
    //printFunction(1,0,0,34,"|");
    //printFunction(1,100,0,34,"|");
    printFunction(2,0,0,34,"|");
    printFunction(2,100,0,34,"|");
    printFunction(3,0,0,34,"|");
    printFunction(3,100,0,34,"|");
    printFunction(4,0,0,34,"|");
    printFunction(4,100,0,34,"|");
        for(int i=0;i<=100;i++){
        printFunction(5,i,0,34,"-");
    }
}

void writeFrameTwo(){
        for(int i=0;i<=100;i++){
        printFunction(6,i,0,33,"-");
    }
    printFunction(7,0,0,33,"|");
    printFunction(7,100,0,33,"|");
    printFunction(8,0,0,33,"|");
    printFunction(8,100,0,33,"|");
    printFunction(9,0,0,33,"|");
    printFunction(9,100,0,33,"|");
    printFunction(10,0,0,33,"|");
    printFunction(10,100,0,33,"|");
        for(int i=0;i<=100;i++){
        printFunction(11,i,0,33,"-");
    }
}

void writeGUI(){
    setStartPosition();
    writeFrameOne();
    writeFrameTwo();
}

