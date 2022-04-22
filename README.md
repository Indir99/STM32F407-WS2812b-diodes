# MSUT-controlling-ws2812b-diodes

Microprocessor systems in telecommunications / Faculty of Electrical Engineering (University in Tuzla)

# Specification

The aim of the project is to control the WS2182B smart LEDs using the STM32F407G-DISC board.
Required peripherals:

1. USART2 -> Communication with Linux terminal
2. TIM2 -> SYSTEM TIMER
3. TIM12 -> DELAY
4. TIM5 -> STOPWATCH
5. TIM4 & DMA1 -> Sending data to the assembled board
6. GPIO -> Push button on disco board

Application functionality:

1. switching the WS diodes on/off
2. color selection for WS diodes (red,green,blue,yellow,purple,cyan)
3. Timer (values from 0 to 9 with specific time period - the period is chosen by the user)
4. Counter (when the push button is pressed (on the discovery board), the numerical value on the assembled board changes)
5. Animations designed by the authors

```
-BLINK
```

```
-dotCircle
```

```
-snake
```

```
-circle
```

```
-pwmBlue
```

```
-ANIM1
```

```
-ANIM2
```

```
-ANIM3
```

```
-ANIM4
```

```
-Authors
```
