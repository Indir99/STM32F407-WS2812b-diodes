# MSUT-controlling-ws2812b-diodes

Microprocessor systems in telecommunications / Faculty of Electrical Engineering (University in Tuzla)

# Specifikacija

Cilj ovog projekta jeste upravljanje WS2182B pametnim led diodama pomocu STM32F407G-DISC ploce. Za ovaj projekat smo koristili sljedece:

1. USART2 za komunikaciju sa terminalom
2. TIM4 & DMA za slanje podataka na asembliranu plocu sa navedenim diodama.

Aplikacija sa WS2812B diodama nam omogucava sljedece funkcionalnosti:

1. ukljucivanje i iskljucivanje dioda
2. Odabir jedne od 6 osnovnih boja (red,green,blue,yellow,purple,cyan)
3. timer (ispisuje vrijednosti od 0 do 9 sa periodom koji zadaje korisnik pomocu aplikacije)
4. counter (pritiskom na push button koji se nalazi na ploci se mijenja vrijednost na plocici (od 0 do 9))
5. Animacije: realiovano je nekoliko animacija

```
-BLINK(diode blinkaju)
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
-Authors (ispisuje prvo slovo imena autora)
```
