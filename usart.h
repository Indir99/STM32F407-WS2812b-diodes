#ifndef __USART2_H_
#define __USART2_H_

#include <stdio.h>
#include <stdarg.h>
#include "stm32f4xx.h"
#include "misc.h"

// #define USART_ECHO
#define USART2_BUFFER_SIZE 512
#define USART3_BUFFER_SIZE 512

#define USART2_BAUDRATE_921600 0x0000002D
#define USART2_BAUDRATE_460800 0x0000005B
#define USART2_BAUDRATE_115200 0x0000016C
#define USART2_BAUDRATE_9600 0x00001117

#define USART3_BAUDRATE_921600 0x0000002D
#define USART3_BAUDRATE_460800 0x0000005B
#define USART3_BAUDRATE_115200 0x0000016C
#define USART3_BAUDRATE_9600 0x00001117

void initUSART2(uint32_t baudrate);
void putcharUSART2(uint8_t data);
void printUSART2(char *str, ...);
void sprintUSART2(uint8_t *str);
uint8_t getcharUSART2();

// Handling arrows on usart2
uint32_t *chkRxBuffUSART2(void);
void enIrqUSART2(void);

// Function for text printing in terminal
// row number, column number, background color, letters colors, text
void printFunction(uint8_t row, uint8_t col, uint8_t bckc, uint8_t letcol, char *str, ...);

extern volatile uint8_t g_usart2_buffer[USART2_BUFFER_SIZE];
extern volatile uint16_t g_usart2_widx;
extern volatile uint16_t g_usart2_ridx;
extern volatile uint8_t state;
extern volatile uint8_t arrow;

// Usart 3

void initUSART3(uint32_t baudrate);
void putcharUSART3(uint8_t data);
void printUSART3(char *str, ...);
// void sprintUSART3(uint8_t *str);
uint8_t getcharUSART3(void);

void chkRxBuffUSART3(void);
void enIrqUSART3(void);

extern volatile uint8_t g_usart3_buffer[USART3_BUFFER_SIZE];
extern volatile uint16_t g_usart3_widx;
extern volatile uint16_t g_usart3_ridx;
extern volatile uint8_t usart3_state;

#endif