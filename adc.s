	.cpu cortex-m4
	.eabi_attribute 27, 1
	.eabi_attribute 28, 1
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"adc.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	1
	.p2align 2,,3
	.global	pwm_start
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	pwm_start, %function
pwm_start:
.LFB113:
	.file 1 "adc.c"
	.loc 1 9 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 96
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL0:
	push	{r4, r5, lr}
	.cfi_def_cfa_offset 12
	.cfi_offset 4, -12
	.cfi_offset 5, -8
	.cfi_offset 14, -4
	sub	sp, sp, #100
	.cfi_def_cfa_offset 112
	.loc 1 9 0
	mov	r4, r1
	.loc 1 14 0
	mov	r0, sp
.LVL1:
	movs	r1, #0
.LVL2:
	movs	r2, #96
	bl	memset
.LVL3:
.LBB2:
	.loc 1 24 0
	movs	r5, #34
	.loc 1 19 0
	movs	r3, #23
	.loc 1 21 0
	movs	r1, #1
	.loc 1 22 0
	movs	r0, #71
.LVL4:
.L4:
	.loc 1 21 0
	lsl	r2, r1, r3
	tst	r2, #16711680
	.loc 1 22 0
	ite	ne
	strne	r0, [sp, r3, lsl #2]
	.loc 1 24 0
	streq	r5, [sp, r3, lsl #2]
	.loc 1 19 0
	adds	r3, r3, #-1
.LVL5:
	bcs	.L4
	addw	r1, r4, #2408
	add	r5, r4, #200
.LBE2:
	.loc 1 27 0
	movs	r2, #23
.LVL6:
.L6:
.LBB3:
	.loc 1 30 0
	cmp	r2, #0
	add	r0, r2, #-1
	itet	ge
	movge	r3, r2
	movlt	r3, #23
	sxtbge	r2, r0
	.loc 1 33 0
	add	r0, sp, #96
	add	r3, r0, r3, lsl #2
	it	lt
	movlt	r2, #22
	ldr	r3, [r3, #-96]
	str	r3, [r1, #-4]!
.LVL7:
	.loc 1 29 0
	cmp	r5, r1
	bne	.L6
	subs	r3, r4, #4
.LBE3:
	.loc 1 41 0
	movs	r2, #34
	adds	r4, r4, #196
.LVL8:
.L7:
	.loc 1 41 0 is_stmt 0 discriminator 3
	str	r2, [r3, #4]!
	.loc 1 40 0 is_stmt 1 discriminator 3
	cmp	r3, r4
	bne	.L7
	.loc 1 45 0
	add	sp, sp, #100
	.cfi_def_cfa_offset 12
	@ sp needed
	pop	{r4, r5, pc}
	.cfi_endproc
.LFE113:
	.size	pwm_start, .-pwm_start
	.align	1
	.p2align 2,,3
	.global	initADC1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	initADC1, %function
initADC1:
.LFB114:
	.loc 1 49 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 54 0
	ldr	r1, .L16
	.loc 1 56 0
	ldr	r2, .L16+4
	.loc 1 54 0
	ldr	r0, [r1, #48]
	.loc 1 59 0
	ldr	r3, .L16+8
	.loc 1 54 0
	orr	r0, r0, #1
	.loc 1 49 0
	push	{r4, r5, r6}
	.cfi_def_cfa_offset 12
	.cfi_offset 4, -12
	.cfi_offset 5, -8
	.cfi_offset 6, -4
	.loc 1 54 0
	str	r0, [r1, #48]
	.loc 1 55 0
	ldr	r0, [r1, #68]
	.loc 1 66 0
	ldr	r4, .L16+12
	.loc 1 55 0
	orr	r0, r0, #256
	str	r0, [r1, #68]
	.loc 1 56 0
	ldr	r1, [r2]
	orr	r1, r1, #12
	str	r1, [r2]
	.loc 1 57 0
	ldr	r1, [r2, #12]
	bic	r1, r1, #12
	str	r1, [r2, #12]
	.loc 1 59 0
	mov	r6, #2048
	.loc 1 62 0
	movs	r0, #0
	.loc 1 64 0
	movs	r5, #1
	.loc 1 65 0
	mov	r1, #512
	.loc 1 66 0
	mov	r2, #196608
	.loc 1 59 0
	str	r6, [r3, #4]
	.loc 1 62 0
	str	r0, [r3, #12]
	.loc 1 63 0
	str	r0, [r3, #44]
	.loc 1 64 0
	str	r5, [r3, #52]
	.loc 1 65 0
	str	r1, [r3, #8]
	.loc 1 66 0
	str	r2, [r4, #4]
	.loc 1 67 0
	pop	{r4, r5, r6}
	.cfi_restore 6
	.cfi_restore 5
	.cfi_restore 4
	.cfi_def_cfa_offset 0
	bx	lr
.L17:
	.align	2
.L16:
	.word	1073887232
	.word	1073872896
	.word	1073815552
	.word	1073816320
	.cfi_endproc
.LFE114:
	.size	initADC1, .-initADC1
	.align	1
	.p2align 2,,3
	.global	getADC1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	getADC1, %function
getADC1:
.LFB115:
	.loc 1 70 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 73 0
	ldr	r3, .L22
	ldr	r2, [r3, #8]
	orr	r2, r2, #1
	str	r2, [r3, #8]
	.loc 1 74 0
	ldr	r2, [r3, #8]
	orr	r2, r2, #1073741824
	str	r2, [r3, #8]
.L19:
	.loc 1 76 0 discriminator 1
	ldr	r2, [r3]
	lsls	r2, r2, #30
	bpl	.L19
	.loc 1 78 0
	ldr	r0, [r3, #76]
.LVL9:
	.loc 1 80 0
	ldr	r2, [r3, #8]
	bic	r2, r2, #1
	.loc 1 82 0
	uxth	r0, r0
	.loc 1 80 0
	str	r2, [r3, #8]
	.loc 1 82 0
	bx	lr
.L23:
	.align	2
.L22:
	.word	1073815552
	.cfi_endproc
.LFE115:
	.size	getADC1, .-getADC1
	.align	1
	.p2align 2,,3
	.global	initDmaADC1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	initDmaADC1, %function
initDmaADC1:
.LFB116:
	.loc 1 85 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL10:
	.loc 1 92 0
	ldr	r2, .L28
.LVL11:
	.loc 1 101 0
	ldr	r0, .L28+4
.LVL12:
	.loc 1 108 0
	ldr	r1, .L28+8
.LVL13:
	.loc 1 114 0
	ldr	r3, .L28+12
	.loc 1 85 0
	push	{r4, r5, r6, lr}
	.cfi_def_cfa_offset 16
	.cfi_offset 4, -16
	.cfi_offset 5, -12
	.cfi_offset 6, -8
	.cfi_offset 14, -4
	.loc 1 92 0
	ldr	r4, [r2, #64]
	.loc 1 135 0
	ldr	r6, .L28+16
	.loc 1 152 0
	ldr	r5, .L28+20
	.loc 1 92 0
	orr	r4, r4, #2
	str	r4, [r2, #64]
	.loc 1 101 0
	ldrh	r4, [r0, #12]
	orr	r4, r4, #256
	strh	r4, [r0, #12]	@ movhi
	.loc 1 103 0
	ldrh	r4, [r0, #20]
	orr	r4, r4, #1
	strh	r4, [r0, #20]	@ movhi
	.loc 1 104 0
	ldrh	r4, [r0]
	orr	r4, r4, #1
	strh	r4, [r0]	@ movhi
	.loc 1 107 0
	ldr	r0, [r2, #48]
	orr	r0, r0, #8
	str	r0, [r2, #48]
	.loc 1 108 0
	ldr	r0, [r1]
	orr	r0, r0, #-1442840576
	str	r0, [r1]
	.loc 1 109 0
	ldr	r0, [r1, #4]
	str	r0, [r1, #4]
	.loc 1 110 0
	ldr	r0, [r1, #36]
	orr	r0, r0, #570425344
	orr	r0, r0, #2228224
	str	r0, [r1, #36]
	.loc 1 113 0
	ldr	r1, [r2, #64]
	orr	r1, r1, #4
	str	r1, [r2, #64]
	.loc 1 114 0
	movs	r4, #0
	.loc 1 117 0
	movs	r1, #105
	.loc 1 114 0
	strh	r4, [r3, #40]	@ movhi
	.loc 1 117 0
	str	r1, [r3, #44]
	.loc 1 119 0
	movs	r1, #100
	str	r1, [r3, #52]
	.loc 1 121 0
	movs	r1, #86
	.loc 1 120 0
	str	r4, [r3, #56]
	.loc 1 121 0
	str	r1, [r3, #60]
	.loc 1 123 0
	movs	r1, #70
	str	r1, [r3, #64]
	.loc 1 125 0
	ldrh	r1, [r3, #12]
	orr	r1, r1, #256
	strh	r1, [r3, #12]	@ movhi
	.loc 1 128 0
	ldrh	r1, [r3, #24]
	orr	r1, r1, #104
	strh	r1, [r3, #24]	@ movhi
	.loc 1 129 0
	ldrh	r1, [r3, #24]
	orr	r1, r1, #26624
	strh	r1, [r3, #24]	@ movhi
	.loc 1 130 0
	ldrh	r1, [r3, #28]
	orr	r1, r1, #104
	strh	r1, [r3, #28]	@ movhi
	.loc 1 131 0
	ldrh	r1, [r3, #28]
	orr	r1, r1, #26624
	strh	r1, [r3, #28]	@ movhi
	.loc 1 135 0
	ldrh	r1, [r3, #32]
	ands	r1, r1, r6
	strh	r1, [r3, #32]	@ movhi
	.loc 1 136 0
	ldrh	r0, [r3]
	.loc 1 153 0
	ldr	r1, .L28+24
	.loc 1 136 0
	orr	r0, r0, #132
	strh	r0, [r3]	@ movhi
	.loc 1 139 0
	ldrh	r0, [r3, #20]
	orr	r0, r0, #1
	strh	r0, [r3, #20]	@ movhi
	.loc 1 142 0
	ldrh	r0, [r3, #32]
	orr	r0, r0, #4352
	orr	r0, r0, #17
	strh	r0, [r3, #32]	@ movhi
	.loc 1 144 0
	ldrh	r0, [r3]
	orr	r0, r0, #1
	strh	r0, [r3]	@ movhi
	.loc 1 150 0
	ldr	r3, [r2, #48]
	orr	r3, r3, #2097152
	str	r3, [r2, #48]
	.loc 1 152 0
	str	r4, [r5]
.L25:
	.loc 1 153 0 discriminator 1
	ldr	r3, [r1]
	ands	r3, r3, #1
	bne	.L25
	.loc 1 155 0
	ldr	r2, .L28+28
	.loc 1 158 0
	ldr	r4, .L28+32
	.loc 1 155 0
	str	r3, [r2]
	.loc 1 158 0
	mov	r1, r4
	.loc 1 156 0
	str	r3, [r2, #4]
	.loc 1 158 0
	movs	r0, #10
	bl	pwm_start
.LVL14:
	.loc 1 160 0
	ldr	r3, .L28+20
	ldr	r2, .L28+36
	str	r2, [r3, #8]
	.loc 1 163 0
	movw	r2, #602
	.loc 1 161 0
	str	r4, [r3, #12]
	.loc 1 163 0
	str	r2, [r3, #4]
	.loc 1 167 0
	ldr	r2, [r3]
	orr	r2, r2, #67108864
	str	r2, [r3]
	.loc 1 169 0
	ldr	r2, [r3]
	orr	r2, r2, #196608
	str	r2, [r3]
	.loc 1 172 0
	ldr	r2, [r3]
	orr	r2, r2, #1024
	str	r2, [r3]
	.loc 1 174 0
	ldr	r2, [r3]
	orr	r2, r2, #256
	str	r2, [r3]
	.loc 1 176 0
	ldr	r2, [r3]
	orr	r2, r2, #2048
	str	r2, [r3]
	.loc 1 178 0
	ldr	r2, [r3]
	orr	r2, r2, #8192
	str	r2, [r3]
	.loc 1 180 0
	ldr	r2, [r3]
	orr	r2, r2, #64
	str	r2, [r3]
	.loc 1 182 0
	ldr	r2, [r3]
	orr	r2, r2, #1
	str	r2, [r3]
	.loc 1 183 0
	pop	{r4, r5, r6, pc}
.L29:
	.align	2
.L28:
	.word	1073887232
	.word	1073742848
	.word	1073875968
	.word	1073743872
	.word	-8739
	.word	1073897560
	.word	1073897536
	.word	1073897472
	.word	.LANCHOR0
	.word	1073743928
	.cfi_endproc
.LFE116:
	.size	initDmaADC1, .-initDmaADC1
	.global	pwm_niz
	.global	pwm2
	.global	pwm1
	.data
	.align	2
	.type	pwm2, %object
	.size	pwm2, 20
pwm2:
	.short	999
	.short	509
	.short	235
	.short	109
	.short	50
	.short	23
	.short	11
	.short	5
	.short	2
	.short	0
	.type	pwm1, %object
	.size	pwm1, 20
pwm1:
	.short	0
	.short	2
	.short	5
	.short	11
	.short	23
	.short	50
	.short	109
	.short	235
	.short	509
	.short	999
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	pwm_niz, %object
	.size	pwm_niz, 2408
pwm_niz:
	.space	2408
	.text
.Letext0:
	.file 2 "/home/pinky/msut/gcc-arm-none-eabi/arm-none-eabi/include/machine/_default_types.h"
	.file 3 "/home/pinky/msut/gcc-arm-none-eabi/arm-none-eabi/include/sys/_stdint.h"
	.file 4 "../sdk/core_cm4.h"
	.file 5 "../sdk/system_stm32f4xx.h"
	.file 6 "../sdk/stm32f4xx.h"
	.file 7 "/home/pinky/msut/gcc-arm-none-eabi/arm-none-eabi/include/sys/lock.h"
	.file 8 "/home/pinky/msut/gcc-arm-none-eabi/arm-none-eabi/include/sys/_types.h"
	.file 9 "/home/pinky/msut/gcc-arm-none-eabi/lib/gcc/arm-none-eabi/7.3.1/include/stddef.h"
	.file 10 "/home/pinky/msut/gcc-arm-none-eabi/arm-none-eabi/include/sys/reent.h"
	.file 11 "usart.h"
	.file 12 "<built-in>"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x11a0
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF235
	.byte	0xc
	.4byte	.LASF236
	.4byte	.LASF237
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF2
	.uleb128 0x3
	.4byte	.LASF0
	.byte	0x2
	.byte	0x29
	.4byte	0x25
	.uleb128 0x3
	.4byte	.LASF1
	.byte	0x2
	.byte	0x2b
	.4byte	0x42
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF3
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF4
	.uleb128 0x3
	.4byte	.LASF5
	.byte	0x2
	.byte	0x39
	.4byte	0x5b
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF6
	.uleb128 0x3
	.4byte	.LASF7
	.byte	0x2
	.byte	0x4d
	.4byte	0x6d
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.4byte	.LASF8
	.uleb128 0x3
	.4byte	.LASF9
	.byte	0x2
	.byte	0x4f
	.4byte	0x7f
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF10
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF11
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF12
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF13
	.uleb128 0x3
	.4byte	.LASF14
	.byte	0x3
	.byte	0x14
	.4byte	0x2c
	.uleb128 0x3
	.4byte	.LASF15
	.byte	0x3
	.byte	0x18
	.4byte	0x37
	.uleb128 0x5
	.4byte	0xad
	.uleb128 0x3
	.4byte	.LASF16
	.byte	0x3
	.byte	0x24
	.4byte	0x50
	.uleb128 0x5
	.4byte	0xbd
	.uleb128 0x3
	.4byte	.LASF17
	.byte	0x3
	.byte	0x2c
	.4byte	0x62
	.uleb128 0x5
	.4byte	0xcd
	.uleb128 0x3
	.4byte	.LASF18
	.byte	0x3
	.byte	0x30
	.4byte	0x74
	.uleb128 0x5
	.4byte	0xdd
	.uleb128 0x6
	.4byte	0xdd
	.4byte	0xfd
	.uleb128 0x7
	.4byte	0x9b
	.byte	0x17
	.byte	0
	.uleb128 0x8
	.4byte	.LASF19
	.byte	0x4
	.2byte	0x51b
	.4byte	0xd8
	.uleb128 0x9
	.4byte	.LASF20
	.byte	0x5
	.byte	0x35
	.4byte	0xdd
	.uleb128 0xa
	.byte	0x50
	.byte	0x6
	.2byte	0x130
	.4byte	0x220
	.uleb128 0xb
	.ascii	"SR\000"
	.byte	0x6
	.2byte	0x132
	.4byte	0xe8
	.byte	0
	.uleb128 0xb
	.ascii	"CR1\000"
	.byte	0x6
	.2byte	0x133
	.4byte	0xe8
	.byte	0x4
	.uleb128 0xb
	.ascii	"CR2\000"
	.byte	0x6
	.2byte	0x134
	.4byte	0xe8
	.byte	0x8
	.uleb128 0xc
	.4byte	.LASF21
	.byte	0x6
	.2byte	0x135
	.4byte	0xe8
	.byte	0xc
	.uleb128 0xc
	.4byte	.LASF22
	.byte	0x6
	.2byte	0x136
	.4byte	0xe8
	.byte	0x10
	.uleb128 0xc
	.4byte	.LASF23
	.byte	0x6
	.2byte	0x137
	.4byte	0xe8
	.byte	0x14
	.uleb128 0xc
	.4byte	.LASF24
	.byte	0x6
	.2byte	0x138
	.4byte	0xe8
	.byte	0x18
	.uleb128 0xc
	.4byte	.LASF25
	.byte	0x6
	.2byte	0x139
	.4byte	0xe8
	.byte	0x1c
	.uleb128 0xc
	.4byte	.LASF26
	.byte	0x6
	.2byte	0x13a
	.4byte	0xe8
	.byte	0x20
	.uleb128 0xb
	.ascii	"HTR\000"
	.byte	0x6
	.2byte	0x13b
	.4byte	0xe8
	.byte	0x24
	.uleb128 0xb
	.ascii	"LTR\000"
	.byte	0x6
	.2byte	0x13c
	.4byte	0xe8
	.byte	0x28
	.uleb128 0xc
	.4byte	.LASF27
	.byte	0x6
	.2byte	0x13d
	.4byte	0xe8
	.byte	0x2c
	.uleb128 0xc
	.4byte	.LASF28
	.byte	0x6
	.2byte	0x13e
	.4byte	0xe8
	.byte	0x30
	.uleb128 0xc
	.4byte	.LASF29
	.byte	0x6
	.2byte	0x13f
	.4byte	0xe8
	.byte	0x34
	.uleb128 0xc
	.4byte	.LASF30
	.byte	0x6
	.2byte	0x140
	.4byte	0xe8
	.byte	0x38
	.uleb128 0xc
	.4byte	.LASF31
	.byte	0x6
	.2byte	0x141
	.4byte	0xe8
	.byte	0x3c
	.uleb128 0xc
	.4byte	.LASF32
	.byte	0x6
	.2byte	0x142
	.4byte	0xe8
	.byte	0x40
	.uleb128 0xc
	.4byte	.LASF33
	.byte	0x6
	.2byte	0x143
	.4byte	0xe8
	.byte	0x44
	.uleb128 0xc
	.4byte	.LASF34
	.byte	0x6
	.2byte	0x144
	.4byte	0xe8
	.byte	0x48
	.uleb128 0xb
	.ascii	"DR\000"
	.byte	0x6
	.2byte	0x145
	.4byte	0xe8
	.byte	0x4c
	.byte	0
	.uleb128 0xd
	.4byte	.LASF35
	.byte	0x6
	.2byte	0x146
	.4byte	0x114
	.uleb128 0xa
	.byte	0xc
	.byte	0x6
	.2byte	0x148
	.4byte	0x25d
	.uleb128 0xb
	.ascii	"CSR\000"
	.byte	0x6
	.2byte	0x14a
	.4byte	0xe8
	.byte	0
	.uleb128 0xb
	.ascii	"CCR\000"
	.byte	0x6
	.2byte	0x14b
	.4byte	0xe8
	.byte	0x4
	.uleb128 0xb
	.ascii	"CDR\000"
	.byte	0x6
	.2byte	0x14c
	.4byte	0xe8
	.byte	0x8
	.byte	0
	.uleb128 0xd
	.4byte	.LASF36
	.byte	0x6
	.2byte	0x14e
	.4byte	0x22c
	.uleb128 0xa
	.byte	0x18
	.byte	0x6
	.2byte	0x1d7
	.4byte	0x2c0
	.uleb128 0xb
	.ascii	"CR\000"
	.byte	0x6
	.2byte	0x1d9
	.4byte	0xe8
	.byte	0
	.uleb128 0xc
	.4byte	.LASF37
	.byte	0x6
	.2byte	0x1da
	.4byte	0xe8
	.byte	0x4
	.uleb128 0xb
	.ascii	"PAR\000"
	.byte	0x6
	.2byte	0x1db
	.4byte	0xe8
	.byte	0x8
	.uleb128 0xc
	.4byte	.LASF38
	.byte	0x6
	.2byte	0x1dc
	.4byte	0xe8
	.byte	0xc
	.uleb128 0xc
	.4byte	.LASF39
	.byte	0x6
	.2byte	0x1dd
	.4byte	0xe8
	.byte	0x10
	.uleb128 0xb
	.ascii	"FCR\000"
	.byte	0x6
	.2byte	0x1de
	.4byte	0xe8
	.byte	0x14
	.byte	0
	.uleb128 0xd
	.4byte	.LASF40
	.byte	0x6
	.2byte	0x1df
	.4byte	0x269
	.uleb128 0xa
	.byte	0x10
	.byte	0x6
	.2byte	0x1e1
	.4byte	0x30a
	.uleb128 0xc
	.4byte	.LASF41
	.byte	0x6
	.2byte	0x1e3
	.4byte	0xe8
	.byte	0
	.uleb128 0xc
	.4byte	.LASF42
	.byte	0x6
	.2byte	0x1e4
	.4byte	0xe8
	.byte	0x4
	.uleb128 0xc
	.4byte	.LASF43
	.byte	0x6
	.2byte	0x1e5
	.4byte	0xe8
	.byte	0x8
	.uleb128 0xc
	.4byte	.LASF44
	.byte	0x6
	.2byte	0x1e6
	.4byte	0xe8
	.byte	0xc
	.byte	0
	.uleb128 0xd
	.4byte	.LASF45
	.byte	0x6
	.2byte	0x1e7
	.4byte	0x2cc
	.uleb128 0x6
	.4byte	0xdd
	.4byte	0x326
	.uleb128 0x7
	.4byte	0x9b
	.byte	0x1
	.byte	0
	.uleb128 0xa
	.byte	0x28
	.byte	0x6
	.2byte	0x28e
	.4byte	0x3b2
	.uleb128 0xc
	.4byte	.LASF46
	.byte	0x6
	.2byte	0x290
	.4byte	0xe8
	.byte	0
	.uleb128 0xc
	.4byte	.LASF47
	.byte	0x6
	.2byte	0x291
	.4byte	0xe8
	.byte	0x4
	.uleb128 0xc
	.4byte	.LASF48
	.byte	0x6
	.2byte	0x292
	.4byte	0xe8
	.byte	0x8
	.uleb128 0xc
	.4byte	.LASF49
	.byte	0x6
	.2byte	0x293
	.4byte	0xe8
	.byte	0xc
	.uleb128 0xb
	.ascii	"IDR\000"
	.byte	0x6
	.2byte	0x294
	.4byte	0xe8
	.byte	0x10
	.uleb128 0xb
	.ascii	"ODR\000"
	.byte	0x6
	.2byte	0x295
	.4byte	0xe8
	.byte	0x14
	.uleb128 0xc
	.4byte	.LASF50
	.byte	0x6
	.2byte	0x296
	.4byte	0xc8
	.byte	0x18
	.uleb128 0xc
	.4byte	.LASF51
	.byte	0x6
	.2byte	0x297
	.4byte	0xc8
	.byte	0x1a
	.uleb128 0xc
	.4byte	.LASF52
	.byte	0x6
	.2byte	0x298
	.4byte	0xe8
	.byte	0x1c
	.uleb128 0xb
	.ascii	"AFR\000"
	.byte	0x6
	.2byte	0x299
	.4byte	0x3c2
	.byte	0x20
	.byte	0
	.uleb128 0x6
	.4byte	0xe8
	.4byte	0x3c2
	.uleb128 0x7
	.4byte	0x9b
	.byte	0x1
	.byte	0
	.uleb128 0x5
	.4byte	0x3b2
	.uleb128 0xd
	.4byte	.LASF53
	.byte	0x6
	.2byte	0x29a
	.4byte	0x326
	.uleb128 0xa
	.byte	0x88
	.byte	0x6
	.2byte	0x2dd
	.4byte	0x562
	.uleb128 0xb
	.ascii	"CR\000"
	.byte	0x6
	.2byte	0x2df
	.4byte	0xe8
	.byte	0
	.uleb128 0xc
	.4byte	.LASF54
	.byte	0x6
	.2byte	0x2e0
	.4byte	0xe8
	.byte	0x4
	.uleb128 0xc
	.4byte	.LASF55
	.byte	0x6
	.2byte	0x2e1
	.4byte	0xe8
	.byte	0x8
	.uleb128 0xb
	.ascii	"CIR\000"
	.byte	0x6
	.2byte	0x2e2
	.4byte	0xe8
	.byte	0xc
	.uleb128 0xc
	.4byte	.LASF56
	.byte	0x6
	.2byte	0x2e3
	.4byte	0xe8
	.byte	0x10
	.uleb128 0xc
	.4byte	.LASF57
	.byte	0x6
	.2byte	0x2e4
	.4byte	0xe8
	.byte	0x14
	.uleb128 0xc
	.4byte	.LASF58
	.byte	0x6
	.2byte	0x2e5
	.4byte	0xe8
	.byte	0x18
	.uleb128 0xc
	.4byte	.LASF59
	.byte	0x6
	.2byte	0x2e6
	.4byte	0xdd
	.byte	0x1c
	.uleb128 0xc
	.4byte	.LASF60
	.byte	0x6
	.2byte	0x2e7
	.4byte	0xe8
	.byte	0x20
	.uleb128 0xc
	.4byte	.LASF61
	.byte	0x6
	.2byte	0x2e8
	.4byte	0xe8
	.byte	0x24
	.uleb128 0xc
	.4byte	.LASF62
	.byte	0x6
	.2byte	0x2e9
	.4byte	0x316
	.byte	0x28
	.uleb128 0xc
	.4byte	.LASF63
	.byte	0x6
	.2byte	0x2ea
	.4byte	0xe8
	.byte	0x30
	.uleb128 0xc
	.4byte	.LASF64
	.byte	0x6
	.2byte	0x2eb
	.4byte	0xe8
	.byte	0x34
	.uleb128 0xc
	.4byte	.LASF65
	.byte	0x6
	.2byte	0x2ec
	.4byte	0xe8
	.byte	0x38
	.uleb128 0xc
	.4byte	.LASF66
	.byte	0x6
	.2byte	0x2ed
	.4byte	0xdd
	.byte	0x3c
	.uleb128 0xc
	.4byte	.LASF67
	.byte	0x6
	.2byte	0x2ee
	.4byte	0xe8
	.byte	0x40
	.uleb128 0xc
	.4byte	.LASF68
	.byte	0x6
	.2byte	0x2ef
	.4byte	0xe8
	.byte	0x44
	.uleb128 0xc
	.4byte	.LASF69
	.byte	0x6
	.2byte	0x2f0
	.4byte	0x316
	.byte	0x48
	.uleb128 0xc
	.4byte	.LASF70
	.byte	0x6
	.2byte	0x2f1
	.4byte	0xe8
	.byte	0x50
	.uleb128 0xc
	.4byte	.LASF71
	.byte	0x6
	.2byte	0x2f2
	.4byte	0xe8
	.byte	0x54
	.uleb128 0xc
	.4byte	.LASF72
	.byte	0x6
	.2byte	0x2f3
	.4byte	0xe8
	.byte	0x58
	.uleb128 0xc
	.4byte	.LASF73
	.byte	0x6
	.2byte	0x2f4
	.4byte	0xdd
	.byte	0x5c
	.uleb128 0xc
	.4byte	.LASF74
	.byte	0x6
	.2byte	0x2f5
	.4byte	0xe8
	.byte	0x60
	.uleb128 0xc
	.4byte	.LASF75
	.byte	0x6
	.2byte	0x2f6
	.4byte	0xe8
	.byte	0x64
	.uleb128 0xc
	.4byte	.LASF76
	.byte	0x6
	.2byte	0x2f7
	.4byte	0x316
	.byte	0x68
	.uleb128 0xc
	.4byte	.LASF77
	.byte	0x6
	.2byte	0x2f8
	.4byte	0xe8
	.byte	0x70
	.uleb128 0xb
	.ascii	"CSR\000"
	.byte	0x6
	.2byte	0x2f9
	.4byte	0xe8
	.byte	0x74
	.uleb128 0xc
	.4byte	.LASF78
	.byte	0x6
	.2byte	0x2fa
	.4byte	0x316
	.byte	0x78
	.uleb128 0xc
	.4byte	.LASF79
	.byte	0x6
	.2byte	0x2fb
	.4byte	0xe8
	.byte	0x80
	.uleb128 0xc
	.4byte	.LASF80
	.byte	0x6
	.2byte	0x2fc
	.4byte	0xe8
	.byte	0x84
	.byte	0
	.uleb128 0xd
	.4byte	.LASF81
	.byte	0x6
	.2byte	0x2fd
	.4byte	0x3d3
	.uleb128 0xa
	.byte	0x54
	.byte	0x6
	.2byte	0x369
	.4byte	0x74a
	.uleb128 0xb
	.ascii	"CR1\000"
	.byte	0x6
	.2byte	0x36b
	.4byte	0xc8
	.byte	0
	.uleb128 0xc
	.4byte	.LASF59
	.byte	0x6
	.2byte	0x36c
	.4byte	0xbd
	.byte	0x2
	.uleb128 0xb
	.ascii	"CR2\000"
	.byte	0x6
	.2byte	0x36d
	.4byte	0xc8
	.byte	0x4
	.uleb128 0xc
	.4byte	.LASF62
	.byte	0x6
	.2byte	0x36e
	.4byte	0xbd
	.byte	0x6
	.uleb128 0xc
	.4byte	.LASF82
	.byte	0x6
	.2byte	0x36f
	.4byte	0xc8
	.byte	0x8
	.uleb128 0xc
	.4byte	.LASF66
	.byte	0x6
	.2byte	0x370
	.4byte	0xbd
	.byte	0xa
	.uleb128 0xc
	.4byte	.LASF83
	.byte	0x6
	.2byte	0x371
	.4byte	0xc8
	.byte	0xc
	.uleb128 0xc
	.4byte	.LASF69
	.byte	0x6
	.2byte	0x372
	.4byte	0xbd
	.byte	0xe
	.uleb128 0xb
	.ascii	"SR\000"
	.byte	0x6
	.2byte	0x373
	.4byte	0xc8
	.byte	0x10
	.uleb128 0xc
	.4byte	.LASF73
	.byte	0x6
	.2byte	0x374
	.4byte	0xbd
	.byte	0x12
	.uleb128 0xb
	.ascii	"EGR\000"
	.byte	0x6
	.2byte	0x375
	.4byte	0xc8
	.byte	0x14
	.uleb128 0xc
	.4byte	.LASF76
	.byte	0x6
	.2byte	0x376
	.4byte	0xbd
	.byte	0x16
	.uleb128 0xc
	.4byte	.LASF84
	.byte	0x6
	.2byte	0x377
	.4byte	0xc8
	.byte	0x18
	.uleb128 0xc
	.4byte	.LASF78
	.byte	0x6
	.2byte	0x378
	.4byte	0xbd
	.byte	0x1a
	.uleb128 0xc
	.4byte	.LASF85
	.byte	0x6
	.2byte	0x379
	.4byte	0xc8
	.byte	0x1c
	.uleb128 0xc
	.4byte	.LASF86
	.byte	0x6
	.2byte	0x37a
	.4byte	0xbd
	.byte	0x1e
	.uleb128 0xc
	.4byte	.LASF87
	.byte	0x6
	.2byte	0x37b
	.4byte	0xc8
	.byte	0x20
	.uleb128 0xc
	.4byte	.LASF88
	.byte	0x6
	.2byte	0x37c
	.4byte	0xbd
	.byte	0x22
	.uleb128 0xb
	.ascii	"CNT\000"
	.byte	0x6
	.2byte	0x37d
	.4byte	0xe8
	.byte	0x24
	.uleb128 0xb
	.ascii	"PSC\000"
	.byte	0x6
	.2byte	0x37e
	.4byte	0xc8
	.byte	0x28
	.uleb128 0xc
	.4byte	.LASF89
	.byte	0x6
	.2byte	0x37f
	.4byte	0xbd
	.byte	0x2a
	.uleb128 0xb
	.ascii	"ARR\000"
	.byte	0x6
	.2byte	0x380
	.4byte	0xe8
	.byte	0x2c
	.uleb128 0xb
	.ascii	"RCR\000"
	.byte	0x6
	.2byte	0x381
	.4byte	0xc8
	.byte	0x30
	.uleb128 0xc
	.4byte	.LASF90
	.byte	0x6
	.2byte	0x382
	.4byte	0xbd
	.byte	0x32
	.uleb128 0xc
	.4byte	.LASF91
	.byte	0x6
	.2byte	0x383
	.4byte	0xe8
	.byte	0x34
	.uleb128 0xc
	.4byte	.LASF92
	.byte	0x6
	.2byte	0x384
	.4byte	0xe8
	.byte	0x38
	.uleb128 0xc
	.4byte	.LASF93
	.byte	0x6
	.2byte	0x385
	.4byte	0xe8
	.byte	0x3c
	.uleb128 0xc
	.4byte	.LASF94
	.byte	0x6
	.2byte	0x386
	.4byte	0xe8
	.byte	0x40
	.uleb128 0xc
	.4byte	.LASF95
	.byte	0x6
	.2byte	0x387
	.4byte	0xc8
	.byte	0x44
	.uleb128 0xc
	.4byte	.LASF96
	.byte	0x6
	.2byte	0x388
	.4byte	0xbd
	.byte	0x46
	.uleb128 0xb
	.ascii	"DCR\000"
	.byte	0x6
	.2byte	0x389
	.4byte	0xc8
	.byte	0x48
	.uleb128 0xc
	.4byte	.LASF97
	.byte	0x6
	.2byte	0x38a
	.4byte	0xbd
	.byte	0x4a
	.uleb128 0xc
	.4byte	.LASF98
	.byte	0x6
	.2byte	0x38b
	.4byte	0xc8
	.byte	0x4c
	.uleb128 0xc
	.4byte	.LASF99
	.byte	0x6
	.2byte	0x38c
	.4byte	0xbd
	.byte	0x4e
	.uleb128 0xb
	.ascii	"OR\000"
	.byte	0x6
	.2byte	0x38d
	.4byte	0xc8
	.byte	0x50
	.uleb128 0xc
	.4byte	.LASF100
	.byte	0x6
	.2byte	0x38e
	.4byte	0xbd
	.byte	0x52
	.byte	0
	.uleb128 0xd
	.4byte	.LASF101
	.byte	0x6
	.2byte	0x38f
	.4byte	0x56e
	.uleb128 0x2
	.byte	0x8
	.byte	0x4
	.4byte	.LASF102
	.uleb128 0xe
	.byte	0x4
	.uleb128 0x3
	.4byte	.LASF103
	.byte	0x7
	.byte	0x22
	.4byte	0x76a
	.uleb128 0xf
	.byte	0x4
	.4byte	0x770
	.uleb128 0x10
	.4byte	.LASF210
	.uleb128 0x3
	.4byte	.LASF104
	.byte	0x8
	.byte	0x2c
	.4byte	0x6d
	.uleb128 0x3
	.4byte	.LASF105
	.byte	0x8
	.byte	0x72
	.4byte	0x6d
	.uleb128 0xd
	.4byte	.LASF106
	.byte	0x9
	.2byte	0x165
	.4byte	0x9b
	.uleb128 0x11
	.byte	0x4
	.byte	0x8
	.byte	0xa6
	.4byte	0x7b6
	.uleb128 0x12
	.4byte	.LASF107
	.byte	0x8
	.byte	0xa8
	.4byte	0x78b
	.uleb128 0x12
	.4byte	.LASF108
	.byte	0x8
	.byte	0xa9
	.4byte	0x7b6
	.byte	0
	.uleb128 0x6
	.4byte	0x42
	.4byte	0x7c6
	.uleb128 0x7
	.4byte	0x9b
	.byte	0x3
	.byte	0
	.uleb128 0x13
	.byte	0x8
	.byte	0x8
	.byte	0xa3
	.4byte	0x7e7
	.uleb128 0x14
	.4byte	.LASF109
	.byte	0x8
	.byte	0xa5
	.4byte	0x94
	.byte	0
	.uleb128 0x14
	.4byte	.LASF110
	.byte	0x8
	.byte	0xaa
	.4byte	0x797
	.byte	0x4
	.byte	0
	.uleb128 0x3
	.4byte	.LASF111
	.byte	0x8
	.byte	0xab
	.4byte	0x7c6
	.uleb128 0x3
	.4byte	.LASF112
	.byte	0x8
	.byte	0xaf
	.4byte	0x75f
	.uleb128 0x3
	.4byte	.LASF113
	.byte	0xa
	.byte	0x16
	.4byte	0x7f
	.uleb128 0x15
	.4byte	.LASF118
	.byte	0x18
	.byte	0xa
	.byte	0x2f
	.4byte	0x85b
	.uleb128 0x14
	.4byte	.LASF114
	.byte	0xa
	.byte	0x31
	.4byte	0x85b
	.byte	0
	.uleb128 0x16
	.ascii	"_k\000"
	.byte	0xa
	.byte	0x32
	.4byte	0x94
	.byte	0x4
	.uleb128 0x14
	.4byte	.LASF115
	.byte	0xa
	.byte	0x32
	.4byte	0x94
	.byte	0x8
	.uleb128 0x14
	.4byte	.LASF116
	.byte	0xa
	.byte	0x32
	.4byte	0x94
	.byte	0xc
	.uleb128 0x14
	.4byte	.LASF117
	.byte	0xa
	.byte	0x32
	.4byte	0x94
	.byte	0x10
	.uleb128 0x16
	.ascii	"_x\000"
	.byte	0xa
	.byte	0x33
	.4byte	0x861
	.byte	0x14
	.byte	0
	.uleb128 0xf
	.byte	0x4
	.4byte	0x808
	.uleb128 0x6
	.4byte	0x7fd
	.4byte	0x871
	.uleb128 0x7
	.4byte	0x9b
	.byte	0
	.byte	0
	.uleb128 0x15
	.4byte	.LASF119
	.byte	0x24
	.byte	0xa
	.byte	0x37
	.4byte	0x8ea
	.uleb128 0x14
	.4byte	.LASF120
	.byte	0xa
	.byte	0x39
	.4byte	0x94
	.byte	0
	.uleb128 0x14
	.4byte	.LASF121
	.byte	0xa
	.byte	0x3a
	.4byte	0x94
	.byte	0x4
	.uleb128 0x14
	.4byte	.LASF122
	.byte	0xa
	.byte	0x3b
	.4byte	0x94
	.byte	0x8
	.uleb128 0x14
	.4byte	.LASF123
	.byte	0xa
	.byte	0x3c
	.4byte	0x94
	.byte	0xc
	.uleb128 0x14
	.4byte	.LASF124
	.byte	0xa
	.byte	0x3d
	.4byte	0x94
	.byte	0x10
	.uleb128 0x14
	.4byte	.LASF125
	.byte	0xa
	.byte	0x3e
	.4byte	0x94
	.byte	0x14
	.uleb128 0x14
	.4byte	.LASF126
	.byte	0xa
	.byte	0x3f
	.4byte	0x94
	.byte	0x18
	.uleb128 0x14
	.4byte	.LASF127
	.byte	0xa
	.byte	0x40
	.4byte	0x94
	.byte	0x1c
	.uleb128 0x14
	.4byte	.LASF128
	.byte	0xa
	.byte	0x41
	.4byte	0x94
	.byte	0x20
	.byte	0
	.uleb128 0x17
	.4byte	.LASF129
	.2byte	0x108
	.byte	0xa
	.byte	0x4a
	.4byte	0x92a
	.uleb128 0x14
	.4byte	.LASF130
	.byte	0xa
	.byte	0x4b
	.4byte	0x92a
	.byte	0
	.uleb128 0x14
	.4byte	.LASF131
	.byte	0xa
	.byte	0x4c
	.4byte	0x92a
	.byte	0x80
	.uleb128 0x18
	.4byte	.LASF132
	.byte	0xa
	.byte	0x4e
	.4byte	0x7fd
	.2byte	0x100
	.uleb128 0x18
	.4byte	.LASF133
	.byte	0xa
	.byte	0x51
	.4byte	0x7fd
	.2byte	0x104
	.byte	0
	.uleb128 0x6
	.4byte	0x75d
	.4byte	0x93a
	.uleb128 0x7
	.4byte	0x9b
	.byte	0x1f
	.byte	0
	.uleb128 0x17
	.4byte	.LASF134
	.2byte	0x190
	.byte	0xa
	.byte	0x5d
	.4byte	0x978
	.uleb128 0x14
	.4byte	.LASF114
	.byte	0xa
	.byte	0x5e
	.4byte	0x978
	.byte	0
	.uleb128 0x14
	.4byte	.LASF135
	.byte	0xa
	.byte	0x5f
	.4byte	0x94
	.byte	0x4
	.uleb128 0x14
	.4byte	.LASF136
	.byte	0xa
	.byte	0x61
	.4byte	0x97e
	.byte	0x8
	.uleb128 0x14
	.4byte	.LASF129
	.byte	0xa
	.byte	0x62
	.4byte	0x8ea
	.byte	0x88
	.byte	0
	.uleb128 0xf
	.byte	0x4
	.4byte	0x93a
	.uleb128 0x6
	.4byte	0x98e
	.4byte	0x98e
	.uleb128 0x7
	.4byte	0x9b
	.byte	0x1f
	.byte	0
	.uleb128 0xf
	.byte	0x4
	.4byte	0x994
	.uleb128 0x19
	.uleb128 0x15
	.4byte	.LASF137
	.byte	0x8
	.byte	0xa
	.byte	0x75
	.4byte	0x9ba
	.uleb128 0x14
	.4byte	.LASF138
	.byte	0xa
	.byte	0x76
	.4byte	0x9ba
	.byte	0
	.uleb128 0x14
	.4byte	.LASF139
	.byte	0xa
	.byte	0x77
	.4byte	0x94
	.byte	0x4
	.byte	0
	.uleb128 0xf
	.byte	0x4
	.4byte	0x42
	.uleb128 0x15
	.4byte	.LASF140
	.byte	0x68
	.byte	0xa
	.byte	0xb5
	.4byte	0xaea
	.uleb128 0x16
	.ascii	"_p\000"
	.byte	0xa
	.byte	0xb6
	.4byte	0x9ba
	.byte	0
	.uleb128 0x16
	.ascii	"_r\000"
	.byte	0xa
	.byte	0xb7
	.4byte	0x94
	.byte	0x4
	.uleb128 0x16
	.ascii	"_w\000"
	.byte	0xa
	.byte	0xb8
	.4byte	0x94
	.byte	0x8
	.uleb128 0x14
	.4byte	.LASF141
	.byte	0xa
	.byte	0xb9
	.4byte	0x49
	.byte	0xc
	.uleb128 0x14
	.4byte	.LASF142
	.byte	0xa
	.byte	0xba
	.4byte	0x49
	.byte	0xe
	.uleb128 0x16
	.ascii	"_bf\000"
	.byte	0xa
	.byte	0xbb
	.4byte	0x995
	.byte	0x10
	.uleb128 0x14
	.4byte	.LASF143
	.byte	0xa
	.byte	0xbc
	.4byte	0x94
	.byte	0x18
	.uleb128 0x14
	.4byte	.LASF144
	.byte	0xa
	.byte	0xc3
	.4byte	0x75d
	.byte	0x1c
	.uleb128 0x14
	.4byte	.LASF145
	.byte	0xa
	.byte	0xc5
	.4byte	0xc57
	.byte	0x20
	.uleb128 0x14
	.4byte	.LASF146
	.byte	0xa
	.byte	0xc7
	.4byte	0xc81
	.byte	0x24
	.uleb128 0x14
	.4byte	.LASF147
	.byte	0xa
	.byte	0xca
	.4byte	0xca5
	.byte	0x28
	.uleb128 0x14
	.4byte	.LASF148
	.byte	0xa
	.byte	0xcb
	.4byte	0xcbf
	.byte	0x2c
	.uleb128 0x16
	.ascii	"_ub\000"
	.byte	0xa
	.byte	0xce
	.4byte	0x995
	.byte	0x30
	.uleb128 0x16
	.ascii	"_up\000"
	.byte	0xa
	.byte	0xcf
	.4byte	0x9ba
	.byte	0x38
	.uleb128 0x16
	.ascii	"_ur\000"
	.byte	0xa
	.byte	0xd0
	.4byte	0x94
	.byte	0x3c
	.uleb128 0x14
	.4byte	.LASF149
	.byte	0xa
	.byte	0xd3
	.4byte	0xcc5
	.byte	0x40
	.uleb128 0x14
	.4byte	.LASF150
	.byte	0xa
	.byte	0xd4
	.4byte	0xcd5
	.byte	0x43
	.uleb128 0x16
	.ascii	"_lb\000"
	.byte	0xa
	.byte	0xd7
	.4byte	0x995
	.byte	0x44
	.uleb128 0x14
	.4byte	.LASF151
	.byte	0xa
	.byte	0xda
	.4byte	0x94
	.byte	0x4c
	.uleb128 0x14
	.4byte	.LASF152
	.byte	0xa
	.byte	0xdb
	.4byte	0x775
	.byte	0x50
	.uleb128 0x14
	.4byte	.LASF153
	.byte	0xa
	.byte	0xde
	.4byte	0xb08
	.byte	0x54
	.uleb128 0x14
	.4byte	.LASF154
	.byte	0xa
	.byte	0xe2
	.4byte	0x7f2
	.byte	0x58
	.uleb128 0x14
	.4byte	.LASF155
	.byte	0xa
	.byte	0xe4
	.4byte	0x7e7
	.byte	0x5c
	.uleb128 0x14
	.4byte	.LASF156
	.byte	0xa
	.byte	0xe5
	.4byte	0x94
	.byte	0x64
	.byte	0
	.uleb128 0x1a
	.4byte	0x94
	.4byte	0xb08
	.uleb128 0x1b
	.4byte	0xb08
	.uleb128 0x1b
	.4byte	0x75d
	.uleb128 0x1b
	.4byte	0xc45
	.uleb128 0x1b
	.4byte	0x94
	.byte	0
	.uleb128 0xf
	.byte	0x4
	.4byte	0xb13
	.uleb128 0x1c
	.4byte	0xb08
	.uleb128 0x1d
	.4byte	.LASF157
	.2byte	0x428
	.byte	0xa
	.2byte	0x260
	.4byte	0xc45
	.uleb128 0xc
	.4byte	.LASF158
	.byte	0xa
	.2byte	0x262
	.4byte	0x94
	.byte	0
	.uleb128 0xc
	.4byte	.LASF159
	.byte	0xa
	.2byte	0x267
	.4byte	0xd2c
	.byte	0x4
	.uleb128 0xc
	.4byte	.LASF160
	.byte	0xa
	.2byte	0x267
	.4byte	0xd2c
	.byte	0x8
	.uleb128 0xc
	.4byte	.LASF161
	.byte	0xa
	.2byte	0x267
	.4byte	0xd2c
	.byte	0xc
	.uleb128 0xc
	.4byte	.LASF162
	.byte	0xa
	.2byte	0x269
	.4byte	0x94
	.byte	0x10
	.uleb128 0xc
	.4byte	.LASF163
	.byte	0xa
	.2byte	0x26a
	.4byte	0xf0e
	.byte	0x14
	.uleb128 0xc
	.4byte	.LASF164
	.byte	0xa
	.2byte	0x26d
	.4byte	0x94
	.byte	0x30
	.uleb128 0xc
	.4byte	.LASF165
	.byte	0xa
	.2byte	0x26e
	.4byte	0xf23
	.byte	0x34
	.uleb128 0xc
	.4byte	.LASF166
	.byte	0xa
	.2byte	0x270
	.4byte	0x94
	.byte	0x38
	.uleb128 0xc
	.4byte	.LASF167
	.byte	0xa
	.2byte	0x272
	.4byte	0xf34
	.byte	0x3c
	.uleb128 0xc
	.4byte	.LASF168
	.byte	0xa
	.2byte	0x275
	.4byte	0x85b
	.byte	0x40
	.uleb128 0xc
	.4byte	.LASF169
	.byte	0xa
	.2byte	0x276
	.4byte	0x94
	.byte	0x44
	.uleb128 0xc
	.4byte	.LASF170
	.byte	0xa
	.2byte	0x277
	.4byte	0x85b
	.byte	0x48
	.uleb128 0xc
	.4byte	.LASF171
	.byte	0xa
	.2byte	0x278
	.4byte	0xf3a
	.byte	0x4c
	.uleb128 0xc
	.4byte	.LASF172
	.byte	0xa
	.2byte	0x27b
	.4byte	0x94
	.byte	0x50
	.uleb128 0xc
	.4byte	.LASF173
	.byte	0xa
	.2byte	0x27c
	.4byte	0xc45
	.byte	0x54
	.uleb128 0xc
	.4byte	.LASF174
	.byte	0xa
	.2byte	0x29f
	.4byte	0xeec
	.byte	0x58
	.uleb128 0x1e
	.4byte	.LASF134
	.byte	0xa
	.2byte	0x2a3
	.4byte	0x978
	.2byte	0x148
	.uleb128 0x1e
	.4byte	.LASF175
	.byte	0xa
	.2byte	0x2a4
	.4byte	0x93a
	.2byte	0x14c
	.uleb128 0x1e
	.4byte	.LASF176
	.byte	0xa
	.2byte	0x2a8
	.4byte	0xf4b
	.2byte	0x2dc
	.uleb128 0x1e
	.4byte	.LASF177
	.byte	0xa
	.2byte	0x2ad
	.4byte	0xcf1
	.2byte	0x2e0
	.uleb128 0x1e
	.4byte	.LASF178
	.byte	0xa
	.2byte	0x2af
	.4byte	0xf57
	.2byte	0x2ec
	.byte	0
	.uleb128 0xf
	.byte	0x4
	.4byte	0xc4b
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF179
	.uleb128 0x1c
	.4byte	0xc4b
	.uleb128 0xf
	.byte	0x4
	.4byte	0xaea
	.uleb128 0x1a
	.4byte	0x94
	.4byte	0xc7b
	.uleb128 0x1b
	.4byte	0xb08
	.uleb128 0x1b
	.4byte	0x75d
	.uleb128 0x1b
	.4byte	0xc7b
	.uleb128 0x1b
	.4byte	0x94
	.byte	0
	.uleb128 0xf
	.byte	0x4
	.4byte	0xc52
	.uleb128 0xf
	.byte	0x4
	.4byte	0xc5d
	.uleb128 0x1a
	.4byte	0x780
	.4byte	0xca5
	.uleb128 0x1b
	.4byte	0xb08
	.uleb128 0x1b
	.4byte	0x75d
	.uleb128 0x1b
	.4byte	0x780
	.uleb128 0x1b
	.4byte	0x94
	.byte	0
	.uleb128 0xf
	.byte	0x4
	.4byte	0xc87
	.uleb128 0x1a
	.4byte	0x94
	.4byte	0xcbf
	.uleb128 0x1b
	.4byte	0xb08
	.uleb128 0x1b
	.4byte	0x75d
	.byte	0
	.uleb128 0xf
	.byte	0x4
	.4byte	0xcab
	.uleb128 0x6
	.4byte	0x42
	.4byte	0xcd5
	.uleb128 0x7
	.4byte	0x9b
	.byte	0x2
	.byte	0
	.uleb128 0x6
	.4byte	0x42
	.4byte	0xce5
	.uleb128 0x7
	.4byte	0x9b
	.byte	0
	.byte	0
	.uleb128 0xd
	.4byte	.LASF180
	.byte	0xa
	.2byte	0x11f
	.4byte	0x9c0
	.uleb128 0x1f
	.4byte	.LASF181
	.byte	0xc
	.byte	0xa
	.2byte	0x123
	.4byte	0xd26
	.uleb128 0xc
	.4byte	.LASF114
	.byte	0xa
	.2byte	0x125
	.4byte	0xd26
	.byte	0
	.uleb128 0xc
	.4byte	.LASF182
	.byte	0xa
	.2byte	0x126
	.4byte	0x94
	.byte	0x4
	.uleb128 0xc
	.4byte	.LASF183
	.byte	0xa
	.2byte	0x127
	.4byte	0xd2c
	.byte	0x8
	.byte	0
	.uleb128 0xf
	.byte	0x4
	.4byte	0xcf1
	.uleb128 0xf
	.byte	0x4
	.4byte	0xce5
	.uleb128 0x1f
	.4byte	.LASF184
	.byte	0xe
	.byte	0xa
	.2byte	0x13f
	.4byte	0xd67
	.uleb128 0xc
	.4byte	.LASF185
	.byte	0xa
	.2byte	0x140
	.4byte	0xd67
	.byte	0
	.uleb128 0xc
	.4byte	.LASF186
	.byte	0xa
	.2byte	0x141
	.4byte	0xd67
	.byte	0x6
	.uleb128 0xc
	.4byte	.LASF187
	.byte	0xa
	.2byte	0x142
	.4byte	0x5b
	.byte	0xc
	.byte	0
	.uleb128 0x6
	.4byte	0x5b
	.4byte	0xd77
	.uleb128 0x7
	.4byte	0x9b
	.byte	0x2
	.byte	0
	.uleb128 0xa
	.byte	0xd0
	.byte	0xa
	.2byte	0x280
	.4byte	0xe78
	.uleb128 0xc
	.4byte	.LASF188
	.byte	0xa
	.2byte	0x282
	.4byte	0x9b
	.byte	0
	.uleb128 0xc
	.4byte	.LASF189
	.byte	0xa
	.2byte	0x283
	.4byte	0xc45
	.byte	0x4
	.uleb128 0xc
	.4byte	.LASF190
	.byte	0xa
	.2byte	0x284
	.4byte	0xe78
	.byte	0x8
	.uleb128 0xc
	.4byte	.LASF191
	.byte	0xa
	.2byte	0x285
	.4byte	0x871
	.byte	0x24
	.uleb128 0xc
	.4byte	.LASF192
	.byte	0xa
	.2byte	0x286
	.4byte	0x94
	.byte	0x48
	.uleb128 0xc
	.4byte	.LASF193
	.byte	0xa
	.2byte	0x287
	.4byte	0x8d
	.byte	0x50
	.uleb128 0xc
	.4byte	.LASF194
	.byte	0xa
	.2byte	0x288
	.4byte	0xd32
	.byte	0x58
	.uleb128 0xc
	.4byte	.LASF195
	.byte	0xa
	.2byte	0x289
	.4byte	0x7e7
	.byte	0x68
	.uleb128 0xc
	.4byte	.LASF196
	.byte	0xa
	.2byte	0x28a
	.4byte	0x7e7
	.byte	0x70
	.uleb128 0xc
	.4byte	.LASF197
	.byte	0xa
	.2byte	0x28b
	.4byte	0x7e7
	.byte	0x78
	.uleb128 0xc
	.4byte	.LASF198
	.byte	0xa
	.2byte	0x28c
	.4byte	0xe88
	.byte	0x80
	.uleb128 0xc
	.4byte	.LASF199
	.byte	0xa
	.2byte	0x28d
	.4byte	0xe98
	.byte	0x88
	.uleb128 0xc
	.4byte	.LASF200
	.byte	0xa
	.2byte	0x28e
	.4byte	0x94
	.byte	0xa0
	.uleb128 0xc
	.4byte	.LASF201
	.byte	0xa
	.2byte	0x28f
	.4byte	0x7e7
	.byte	0xa4
	.uleb128 0xc
	.4byte	.LASF202
	.byte	0xa
	.2byte	0x290
	.4byte	0x7e7
	.byte	0xac
	.uleb128 0xc
	.4byte	.LASF203
	.byte	0xa
	.2byte	0x291
	.4byte	0x7e7
	.byte	0xb4
	.uleb128 0xc
	.4byte	.LASF204
	.byte	0xa
	.2byte	0x292
	.4byte	0x7e7
	.byte	0xbc
	.uleb128 0xc
	.4byte	.LASF205
	.byte	0xa
	.2byte	0x293
	.4byte	0x7e7
	.byte	0xc4
	.uleb128 0xc
	.4byte	.LASF206
	.byte	0xa
	.2byte	0x294
	.4byte	0x94
	.byte	0xcc
	.byte	0
	.uleb128 0x6
	.4byte	0xc4b
	.4byte	0xe88
	.uleb128 0x7
	.4byte	0x9b
	.byte	0x19
	.byte	0
	.uleb128 0x6
	.4byte	0xc4b
	.4byte	0xe98
	.uleb128 0x7
	.4byte	0x9b
	.byte	0x7
	.byte	0
	.uleb128 0x6
	.4byte	0xc4b
	.4byte	0xea8
	.uleb128 0x7
	.4byte	0x9b
	.byte	0x17
	.byte	0
	.uleb128 0xa
	.byte	0xf0
	.byte	0xa
	.2byte	0x299
	.4byte	0xecc
	.uleb128 0xc
	.4byte	.LASF207
	.byte	0xa
	.2byte	0x29c
	.4byte	0xecc
	.byte	0
	.uleb128 0xc
	.4byte	.LASF208
	.byte	0xa
	.2byte	0x29d
	.4byte	0xedc
	.byte	0x78
	.byte	0
	.uleb128 0x6
	.4byte	0x9ba
	.4byte	0xedc
	.uleb128 0x7
	.4byte	0x9b
	.byte	0x1d
	.byte	0
	.uleb128 0x6
	.4byte	0x9b
	.4byte	0xeec
	.uleb128 0x7
	.4byte	0x9b
	.byte	0x1d
	.byte	0
	.uleb128 0x20
	.byte	0xf0
	.byte	0xa
	.2byte	0x27e
	.4byte	0xf0e
	.uleb128 0x21
	.4byte	.LASF157
	.byte	0xa
	.2byte	0x295
	.4byte	0xd77
	.uleb128 0x21
	.4byte	.LASF209
	.byte	0xa
	.2byte	0x29e
	.4byte	0xea8
	.byte	0
	.uleb128 0x6
	.4byte	0xc4b
	.4byte	0xf1e
	.uleb128 0x7
	.4byte	0x9b
	.byte	0x18
	.byte	0
	.uleb128 0x10
	.4byte	.LASF211
	.uleb128 0xf
	.byte	0x4
	.4byte	0xf1e
	.uleb128 0x22
	.4byte	0xf34
	.uleb128 0x1b
	.4byte	0xb08
	.byte	0
	.uleb128 0xf
	.byte	0x4
	.4byte	0xf29
	.uleb128 0xf
	.byte	0x4
	.4byte	0x85b
	.uleb128 0x22
	.4byte	0xf4b
	.uleb128 0x1b
	.4byte	0x94
	.byte	0
	.uleb128 0xf
	.byte	0x4
	.4byte	0xf51
	.uleb128 0xf
	.byte	0x4
	.4byte	0xf40
	.uleb128 0x6
	.4byte	0xce5
	.4byte	0xf67
	.uleb128 0x7
	.4byte	0x9b
	.byte	0x2
	.byte	0
	.uleb128 0x8
	.4byte	.LASF212
	.byte	0xa
	.2byte	0x32e
	.4byte	0xb08
	.uleb128 0x8
	.4byte	.LASF213
	.byte	0xa
	.2byte	0x32f
	.4byte	0xb0e
	.uleb128 0x6
	.4byte	0xb8
	.4byte	0xf90
	.uleb128 0x23
	.4byte	0x9b
	.2byte	0x1ff
	.byte	0
	.uleb128 0x5
	.4byte	0xf7f
	.uleb128 0x9
	.4byte	.LASF214
	.byte	0xb
	.byte	0x25
	.4byte	0xf90
	.uleb128 0x9
	.4byte	.LASF215
	.byte	0xb
	.byte	0x26
	.4byte	0xc8
	.uleb128 0x9
	.4byte	.LASF216
	.byte	0xb
	.byte	0x27
	.4byte	0xc8
	.uleb128 0x9
	.4byte	.LASF217
	.byte	0xb
	.byte	0x28
	.4byte	0xb8
	.uleb128 0x9
	.4byte	.LASF218
	.byte	0xb
	.byte	0x29
	.4byte	0xb8
	.uleb128 0x9
	.4byte	.LASF219
	.byte	0xb
	.byte	0x36
	.4byte	0xf90
	.uleb128 0x9
	.4byte	.LASF220
	.byte	0xb
	.byte	0x37
	.4byte	0xc8
	.uleb128 0x9
	.4byte	.LASF221
	.byte	0xb
	.byte	0x38
	.4byte	0xc8
	.uleb128 0x9
	.4byte	.LASF222
	.byte	0xb
	.byte	0x39
	.4byte	0xb8
	.uleb128 0x6
	.4byte	0xbd
	.4byte	0x1008
	.uleb128 0x7
	.4byte	0x9b
	.byte	0x9
	.byte	0
	.uleb128 0x24
	.4byte	.LASF223
	.byte	0x1
	.byte	0x5
	.4byte	0xff8
	.uleb128 0x5
	.byte	0x3
	.4byte	pwm1
	.uleb128 0x24
	.4byte	.LASF224
	.byte	0x1
	.byte	0x6
	.4byte	0xff8
	.uleb128 0x5
	.byte	0x3
	.4byte	pwm2
	.uleb128 0x6
	.4byte	0xdd
	.4byte	0x103b
	.uleb128 0x23
	.4byte	0x9b
	.2byte	0x259
	.byte	0
	.uleb128 0x24
	.4byte	.LASF225
	.byte	0x1
	.byte	0x7
	.4byte	0x102a
	.uleb128 0x5
	.byte	0x3
	.4byte	pwm_niz
	.uleb128 0x25
	.4byte	.LASF229
	.byte	0x1
	.byte	0x54
	.4byte	.LFB116
	.4byte	.LFE116-.LFB116
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x10a4
	.uleb128 0x26
	.4byte	.LASF226
	.byte	0x1
	.byte	0x54
	.4byte	0x10a4
	.4byte	.LLST4
	.uleb128 0x26
	.4byte	.LASF227
	.byte	0x1
	.byte	0x54
	.4byte	0x10a4
	.4byte	.LLST5
	.uleb128 0x26
	.4byte	.LASF228
	.byte	0x1
	.byte	0x54
	.4byte	0xbd
	.4byte	.LLST6
	.uleb128 0x27
	.4byte	.LVL14
	.4byte	0x10e2
	.uleb128 0x28
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x3a
	.uleb128 0x28
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0xf
	.byte	0x4
	.4byte	0xbd
	.uleb128 0x29
	.4byte	.LASF238
	.byte	0x1
	.byte	0x45
	.4byte	0xbd
	.4byte	.LFB115
	.4byte	.LFE115-.LFB115
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x10d1
	.uleb128 0x2a
	.4byte	.LASF233
	.byte	0x1
	.byte	0x47
	.4byte	0xbd
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x2b
	.4byte	.LASF239
	.byte	0x1
	.byte	0x30
	.4byte	.LFB114
	.4byte	.LFE114-.LFB114
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x25
	.4byte	.LASF230
	.byte	0x1
	.byte	0x9
	.4byte	.LFB113
	.4byte	.LFE113-.LFB113
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x118e
	.uleb128 0x26
	.4byte	.LASF231
	.byte	0x1
	.byte	0x9
	.4byte	0xdd
	.4byte	.LLST0
	.uleb128 0x26
	.4byte	.LASF232
	.byte	0x1
	.byte	0x9
	.4byte	0x118e
	.4byte	.LLST1
	.uleb128 0x2c
	.4byte	.LASF234
	.byte	0x1
	.byte	0xc
	.4byte	0xdd
	.4byte	0xff0000
	.uleb128 0x2d
	.ascii	"tmp\000"
	.byte	0x1
	.byte	0xe
	.4byte	0xed
	.uleb128 0x3
	.byte	0x91
	.sleb128 -112
	.uleb128 0x2e
	.ascii	"i\000"
	.byte	0x1
	.byte	0xf
	.4byte	0xa2
	.4byte	.LLST2
	.uleb128 0x2f
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.4byte	0x115b
	.uleb128 0x2e
	.ascii	"i\000"
	.byte	0x1
	.byte	0x13
	.4byte	0x94
	.4byte	.LLST3
	.byte	0
	.uleb128 0x2f
	.4byte	.LBB3
	.4byte	.LBE3-.LBB3
	.4byte	0x1172
	.uleb128 0x30
	.ascii	"j\000"
	.byte	0x1
	.byte	0x1d
	.4byte	0x94
	.byte	0
	.uleb128 0x27
	.4byte	.LVL3
	.4byte	0x1194
	.uleb128 0x28
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x28
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x28
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x8
	.byte	0x60
	.byte	0
	.byte	0
	.uleb128 0xf
	.byte	0x4
	.4byte	0xdd
	.uleb128 0x31
	.4byte	.LASF240
	.4byte	.LASF241
	.byte	0xc
	.byte	0
	.4byte	.LASF240
	.byte	0
	.section	.debug_abbrev,"",%progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x17
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0x5
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x15
	.byte	0
	.uleb128 0x27
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0x5
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x17
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x22
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x24
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x25
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x26
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x27
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x28
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x2111
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x29
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2a
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x2b
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x2c
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x2d
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x2e
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x30
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x31
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x6e
	.uleb128 0xe
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",%progbits
.Ldebug_loc0:
.LLST4:
	.4byte	.LVL10-.Ltext0
	.4byte	.LVL12-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL12-.Ltext0
	.4byte	.LFE116-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST5:
	.4byte	.LVL10-.Ltext0
	.4byte	.LVL13-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL13-.Ltext0
	.4byte	.LFE116-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST6:
	.4byte	.LVL10-.Ltext0
	.4byte	.LVL11-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL11-.Ltext0
	.4byte	.LFE116-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST0:
	.4byte	.LVL0-.Ltext0
	.4byte	.LVL1-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL1-.Ltext0
	.4byte	.LFE113-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL0-.Ltext0
	.4byte	.LVL2-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL2-.Ltext0
	.4byte	.LVL8-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL8-.Ltext0
	.4byte	.LFE113-.Ltext0
	.2byte	0x4
	.byte	0x75
	.sleb128 -200
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL3-.Ltext0
	.4byte	.LVL6-.Ltext0
	.2byte	0x2
	.byte	0x47
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST3:
	.4byte	.LVL3-.Ltext0
	.4byte	.LVL4-.Ltext0
	.2byte	0x2
	.byte	0x47
	.byte	0x9f
	.4byte	.LVL4-.Ltext0
	.4byte	.LVL5-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL5-.Ltext0
	.4byte	.LVL6-.Ltext0
	.2byte	0x3
	.byte	0x73
	.sleb128 1
	.byte	0x9f
	.4byte	0
	.4byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x1c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF39:
	.ascii	"M1AR\000"
.LASF14:
	.ascii	"int8_t\000"
.LASF222:
	.ascii	"usart3_state\000"
.LASF43:
	.ascii	"LIFCR\000"
.LASF211:
	.ascii	"__locale_t\000"
.LASF110:
	.ascii	"__value\000"
.LASF178:
	.ascii	"__sf\000"
.LASF80:
	.ascii	"PLLI2SCFGR\000"
.LASF145:
	.ascii	"_read\000"
.LASF27:
	.ascii	"SQR1\000"
.LASF28:
	.ascii	"SQR2\000"
.LASF29:
	.ascii	"SQR3\000"
.LASF167:
	.ascii	"__cleanup\000"
.LASF235:
	.ascii	"GNU C11 7.3.1 20180622 (release) [ARM/embedded-7-br"
	.ascii	"anch revision 261907] -mlittle-endian -mthumb -mcpu"
	.ascii	"=cortex-m4 -mthumb-interwork -mfloat-abi=hard -mfpu"
	.ascii	"=fpv4-sp-d16 -g -O2 -fsingle-precision-constant\000"
.LASF146:
	.ascii	"_write\000"
.LASF17:
	.ascii	"int32_t\000"
.LASF190:
	.ascii	"_asctime_buf\000"
.LASF172:
	.ascii	"_cvtlen\000"
.LASF209:
	.ascii	"_unused\000"
.LASF119:
	.ascii	"__tm\000"
.LASF205:
	.ascii	"_wcsrtombs_state\000"
.LASF150:
	.ascii	"_nbuf\000"
.LASF120:
	.ascii	"__tm_sec\000"
.LASF198:
	.ascii	"_l64a_buf\000"
.LASF166:
	.ascii	"__sdidinit\000"
.LASF217:
	.ascii	"state\000"
.LASF226:
	.ascii	"dBuff1\000"
.LASF227:
	.ascii	"dBuff2\000"
.LASF154:
	.ascii	"_lock\000"
.LASF186:
	.ascii	"_mult\000"
.LASF98:
	.ascii	"DMAR\000"
.LASF91:
	.ascii	"CCR1\000"
.LASF92:
	.ascii	"CCR2\000"
.LASF93:
	.ascii	"CCR3\000"
.LASF94:
	.ascii	"CCR4\000"
.LASF1:
	.ascii	"__uint8_t\000"
.LASF71:
	.ascii	"AHB2LPENR\000"
.LASF129:
	.ascii	"_on_exit_args\000"
.LASF107:
	.ascii	"__wch\000"
.LASF142:
	.ascii	"_file\000"
.LASF231:
	.ascii	"color1\000"
.LASF201:
	.ascii	"_mbrlen_state\000"
.LASF8:
	.ascii	"long int\000"
.LASF212:
	.ascii	"_impure_ptr\000"
.LASF169:
	.ascii	"_result_k\000"
.LASF139:
	.ascii	"_size\000"
.LASF241:
	.ascii	"__builtin_memset\000"
.LASF191:
	.ascii	"_localtime_buf\000"
.LASF112:
	.ascii	"_flock_t\000"
.LASF216:
	.ascii	"g_usart2_ridx\000"
.LASF238:
	.ascii	"getADC1\000"
.LASF124:
	.ascii	"__tm_mon\000"
.LASF68:
	.ascii	"APB2ENR\000"
.LASF70:
	.ascii	"AHB1LPENR\000"
.LASF188:
	.ascii	"_unused_rand\000"
.LASF2:
	.ascii	"signed char\000"
.LASF15:
	.ascii	"uint8_t\000"
.LASF239:
	.ascii	"initADC1\000"
.LASF160:
	.ascii	"_stdout\000"
.LASF223:
	.ascii	"pwm1\000"
.LASF224:
	.ascii	"pwm2\000"
.LASF101:
	.ascii	"TIM_TypeDef\000"
.LASF59:
	.ascii	"RESERVED0\000"
.LASF62:
	.ascii	"RESERVED1\000"
.LASF3:
	.ascii	"unsigned char\000"
.LASF69:
	.ascii	"RESERVED3\000"
.LASF73:
	.ascii	"RESERVED4\000"
.LASF76:
	.ascii	"RESERVED5\000"
.LASF78:
	.ascii	"RESERVED6\000"
.LASF86:
	.ascii	"RESERVED7\000"
.LASF88:
	.ascii	"RESERVED8\000"
.LASF89:
	.ascii	"RESERVED9\000"
.LASF233:
	.ascii	"r_val\000"
.LASF45:
	.ascii	"DMA_TypeDef\000"
.LASF164:
	.ascii	"_unspecified_locale_info\000"
.LASF157:
	.ascii	"_reent\000"
.LASF213:
	.ascii	"_global_impure_ptr\000"
.LASF66:
	.ascii	"RESERVED2\000"
.LASF84:
	.ascii	"CCMR1\000"
.LASF85:
	.ascii	"CCMR2\000"
.LASF179:
	.ascii	"char\000"
.LASF240:
	.ascii	"memset\000"
.LASF136:
	.ascii	"_fns\000"
.LASF148:
	.ascii	"_close\000"
.LASF56:
	.ascii	"AHB1RSTR\000"
.LASF5:
	.ascii	"__uint16_t\000"
.LASF64:
	.ascii	"AHB2ENR\000"
.LASF159:
	.ascii	"_stdin\000"
.LASF220:
	.ascii	"g_usart3_widx\000"
.LASF133:
	.ascii	"_is_cxa\000"
.LASF77:
	.ascii	"BDCR\000"
.LASF35:
	.ascii	"ADC_TypeDef\000"
.LASF219:
	.ascii	"g_usart3_buffer\000"
.LASF144:
	.ascii	"_cookie\000"
.LASF117:
	.ascii	"_wds\000"
.LASF210:
	.ascii	"__lock\000"
.LASF176:
	.ascii	"_sig_func\000"
.LASF55:
	.ascii	"CFGR\000"
.LASF152:
	.ascii	"_offset\000"
.LASF173:
	.ascii	"_cvtbuf\000"
.LASF230:
	.ascii	"pwm_start\000"
.LASF170:
	.ascii	"_p5s\000"
.LASF10:
	.ascii	"long unsigned int\000"
.LASF67:
	.ascii	"APB1ENR\000"
.LASF140:
	.ascii	"__sFILE\000"
.LASF83:
	.ascii	"DIER\000"
.LASF156:
	.ascii	"_flags2\000"
.LASF20:
	.ascii	"SystemCoreClock\000"
.LASF21:
	.ascii	"SMPR1\000"
.LASF22:
	.ascii	"SMPR2\000"
.LASF158:
	.ascii	"_errno\000"
.LASF199:
	.ascii	"_signal_buf\000"
.LASF52:
	.ascii	"LCKR\000"
.LASF118:
	.ascii	"_Bigint\000"
.LASF115:
	.ascii	"_maxwds\000"
.LASF48:
	.ascii	"OSPEEDR\000"
.LASF54:
	.ascii	"PLLCFGR\000"
.LASF9:
	.ascii	"__uint32_t\000"
.LASF163:
	.ascii	"_emergency\000"
.LASF11:
	.ascii	"long long int\000"
.LASF49:
	.ascii	"PUPDR\000"
.LASF182:
	.ascii	"_niobs\000"
.LASF79:
	.ascii	"SSCGR\000"
.LASF177:
	.ascii	"__sglue\000"
.LASF208:
	.ascii	"_nmalloc\000"
.LASF232:
	.ascii	"pwmData\000"
.LASF192:
	.ascii	"_gamma_signgam\000"
.LASF61:
	.ascii	"APB2RSTR\000"
.LASF51:
	.ascii	"BSRRH\000"
.LASF50:
	.ascii	"BSRRL\000"
.LASF171:
	.ascii	"_freelist\000"
.LASF183:
	.ascii	"_iobs\000"
.LASF181:
	.ascii	"_glue\000"
.LASF19:
	.ascii	"ITM_RxBuffer\000"
.LASF116:
	.ascii	"_sign\000"
.LASF75:
	.ascii	"APB2LPENR\000"
.LASF175:
	.ascii	"_atexit0\000"
.LASF46:
	.ascii	"MODER\000"
.LASF13:
	.ascii	"unsigned int\000"
.LASF236:
	.ascii	"adc.c\000"
.LASF206:
	.ascii	"_h_errno\000"
.LASF204:
	.ascii	"_wcrtomb_state\000"
.LASF123:
	.ascii	"__tm_mday\000"
.LASF174:
	.ascii	"_new\000"
.LASF149:
	.ascii	"_ubuf\000"
.LASF161:
	.ascii	"_stderr\000"
.LASF197:
	.ascii	"_wctomb_state\000"
.LASF155:
	.ascii	"_mbstate\000"
.LASF193:
	.ascii	"_rand_next\000"
.LASF141:
	.ascii	"_flags\000"
.LASF74:
	.ascii	"APB1LPENR\000"
.LASF134:
	.ascii	"_atexit\000"
.LASF40:
	.ascii	"DMA_Stream_TypeDef\000"
.LASF109:
	.ascii	"__count\000"
.LASF44:
	.ascii	"HIFCR\000"
.LASF225:
	.ascii	"pwm_niz\000"
.LASF126:
	.ascii	"__tm_wday\000"
.LASF58:
	.ascii	"AHB3RSTR\000"
.LASF102:
	.ascii	"long double\000"
.LASF127:
	.ascii	"__tm_yday\000"
.LASF185:
	.ascii	"_seed\000"
.LASF147:
	.ascii	"_seek\000"
.LASF105:
	.ascii	"_fpos_t\000"
.LASF108:
	.ascii	"__wchb\000"
.LASF60:
	.ascii	"APB1RSTR\000"
.LASF196:
	.ascii	"_mbtowc_state\000"
.LASF0:
	.ascii	"__int8_t\000"
.LASF228:
	.ascii	"size\000"
.LASF12:
	.ascii	"long long unsigned int\000"
.LASF215:
	.ascii	"g_usart2_widx\000"
.LASF16:
	.ascii	"uint16_t\000"
.LASF131:
	.ascii	"_dso_handle\000"
.LASF184:
	.ascii	"_rand48\000"
.LASF90:
	.ascii	"RESERVED10\000"
.LASF87:
	.ascii	"CCER\000"
.LASF97:
	.ascii	"RESERVED12\000"
.LASF99:
	.ascii	"RESERVED13\000"
.LASF100:
	.ascii	"RESERVED14\000"
.LASF151:
	.ascii	"_blksize\000"
.LASF214:
	.ascii	"g_usart2_buffer\000"
.LASF138:
	.ascii	"_base\000"
.LASF189:
	.ascii	"_strtok_last\000"
.LASF202:
	.ascii	"_mbrtowc_state\000"
.LASF82:
	.ascii	"SMCR\000"
.LASF180:
	.ascii	"__FILE\000"
.LASF72:
	.ascii	"AHB3LPENR\000"
.LASF111:
	.ascii	"_mbstate_t\000"
.LASF194:
	.ascii	"_r48\000"
.LASF106:
	.ascii	"wint_t\000"
.LASF47:
	.ascii	"OTYPER\000"
.LASF234:
	.ascii	"color\000"
.LASF114:
	.ascii	"_next\000"
.LASF237:
	.ascii	"/home/pinky/msut/MSUT-controlling-ws2812b-diodes\000"
.LASF153:
	.ascii	"_data\000"
.LASF63:
	.ascii	"AHB1ENR\000"
.LASF221:
	.ascii	"g_usart3_ridx\000"
.LASF65:
	.ascii	"AHB3ENR\000"
.LASF57:
	.ascii	"AHB2RSTR\000"
.LASF38:
	.ascii	"M0AR\000"
.LASF218:
	.ascii	"arrow\000"
.LASF81:
	.ascii	"RCC_TypeDef\000"
.LASF229:
	.ascii	"initDmaADC1\000"
.LASF195:
	.ascii	"_mblen_state\000"
.LASF4:
	.ascii	"short int\000"
.LASF23:
	.ascii	"JOFR1\000"
.LASF24:
	.ascii	"JOFR2\000"
.LASF25:
	.ascii	"JOFR3\000"
.LASF26:
	.ascii	"JOFR4\000"
.LASF132:
	.ascii	"_fntypes\000"
.LASF125:
	.ascii	"__tm_year\000"
.LASF31:
	.ascii	"JDR1\000"
.LASF32:
	.ascii	"JDR2\000"
.LASF33:
	.ascii	"JDR3\000"
.LASF34:
	.ascii	"JDR4\000"
.LASF30:
	.ascii	"JSQR\000"
.LASF53:
	.ascii	"GPIO_TypeDef\000"
.LASF143:
	.ascii	"_lbfsize\000"
.LASF162:
	.ascii	"_inc\000"
.LASF135:
	.ascii	"_ind\000"
.LASF137:
	.ascii	"__sbuf\000"
.LASF103:
	.ascii	"_LOCK_T\000"
.LASF207:
	.ascii	"_nextf\000"
.LASF165:
	.ascii	"_locale\000"
.LASF113:
	.ascii	"__ULong\000"
.LASF95:
	.ascii	"BDTR\000"
.LASF37:
	.ascii	"NDTR\000"
.LASF18:
	.ascii	"uint32_t\000"
.LASF42:
	.ascii	"HISR\000"
.LASF168:
	.ascii	"_result\000"
.LASF104:
	.ascii	"_off_t\000"
.LASF41:
	.ascii	"LISR\000"
.LASF187:
	.ascii	"_add\000"
.LASF6:
	.ascii	"short unsigned int\000"
.LASF122:
	.ascii	"__tm_hour\000"
.LASF96:
	.ascii	"RESERVED11\000"
.LASF203:
	.ascii	"_mbsrtowcs_state\000"
.LASF7:
	.ascii	"__int32_t\000"
.LASF36:
	.ascii	"ADC_Common_TypeDef\000"
.LASF130:
	.ascii	"_fnargs\000"
.LASF128:
	.ascii	"__tm_isdst\000"
.LASF121:
	.ascii	"__tm_min\000"
.LASF200:
	.ascii	"_getdate_err\000"
	.ident	"GCC: (GNU Tools for Arm Embedded Processors 7-2018-q2-update) 7.3.1 20180622 (release) [ARM/embedded-7-branch revision 261907]"
