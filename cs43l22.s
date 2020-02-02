	.syntax unified
	.cpu cortex-m4
	.eabi_attribute 27, 3
	.eabi_attribute 28, 1
	.fpu fpv4-sp-d16
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.thumb
	.file	"cs43l22.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.global	initCS43L22
	.thumb
	.thumb_func
	.type	initCS43L22, %function
initCS43L22:
.LFB110:
	.file 1 "cs43l22.c"
	.loc 1 4 0
	.cfi_startproc
	@ args = 4, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL0:
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.cfi_def_cfa_offset 36
	.cfi_offset 4, -36
	.cfi_offset 5, -32
	.cfi_offset 6, -28
	.cfi_offset 7, -24
	.cfi_offset 8, -20
	.cfi_offset 9, -16
	.cfi_offset 10, -12
	.cfi_offset 11, -8
	.cfi_offset 14, -4
	.loc 1 19 0
	ldr	r5, .L8
	.loc 1 18 0
	ldr	r0, .L8+4
	.loc 1 20 0
	ldr	r4, .L8+8
	.loc 1 4 0
	sub	sp, sp, #12
	.cfi_def_cfa_offset 48
	.loc 1 4 0
	mov	r10, r1
	mov	r7, r2
	mov	r8, r3
	ldrh	r6, [sp, #48]
	.loc 1 18 0
	bl	printUSART2
.LVL1:
	.loc 1 19 0
	ldr	r2, [r5, #48]
	.loc 1 24 0
	ldr	r3, .L8+12
	.loc 1 29 0
	ldr	r0, .L8+16
	.loc 1 19 0
	orr	r2, r2, #8
	str	r2, [r5, #48]
	.loc 1 20 0
	ldr	r2, [r4]
	orr	r2, r2, #256
	str	r2, [r4]
	.loc 1 21 0
	ldr	r2, [r4, #8]
	orr	r2, r2, #512
	str	r2, [r4, #8]
	.loc 1 23 0
	ldr	r2, [r5, #48]
	orr	r2, r2, #4
	str	r2, [r5, #48]
	.loc 1 24 0
	ldr	r2, [r3]
	orr	r2, r2, #35651584
	orr	r2, r2, #32768
	str	r2, [r3]
	.loc 1 25 0
	ldr	r2, [r3, #32]
	orr	r2, r2, #1610612736
	str	r2, [r3, #32]
	.loc 1 26 0
	ldr	r2, [r3, #36]
	orr	r2, r2, #393216
	orr	r2, r2, #1536
	str	r2, [r3, #36]
	.loc 1 29 0
	bl	printUSART2
.LVL2:
	.loc 1 30 0
	ldr	r2, [r5, #48]
	.loc 1 31 0
	ldr	r3, .L8+20
	.loc 1 30 0
	orr	r2, r2, #1
	str	r2, [r5, #48]
	.loc 1 31 0
	ldr	r2, [r3]
	bic	r2, r2, #768
	str	r2, [r3]
	.loc 1 32 0
	ldr	r2, [r3]
	orr	r2, r2, #512
	str	r2, [r3]
	.loc 1 33 0
	ldr	r2, [r3, #32]
	orr	r2, r2, #393216
	str	r2, [r3, #32]
	.loc 1 41 0
	movs	r0, #148
	bl	initI2C
.LVL3:
	.loc 1 44 0
	ldr	r3, [r4, #20]
	bic	r3, r3, #16
	str	r3, [r4, #20]
	.loc 1 45 0
	movs	r0, #50
	bl	delay_ms
.LVL4:
	.loc 1 46 0
	ldr	r3, [r4, #20]
	orr	r3, r3, #16
	str	r3, [r4, #20]
	.loc 1 47 0
	movs	r0, #50
	bl	delay_ms
.LVL5:
	.loc 1 49 0
	movs	r0, #1
	mov	r2, r0
	add	r1, sp, #4
	.loc 1 53 0
	movs	r4, #1
	.loc 1 49 0
	bl	readI2C
.LVL6:
	.loc 1 50 0
	ldr	r0, .L8+24
	ldrb	r1, [sp, #4]	@ zero_extendqisi2
	bl	printUSART2
.LVL7:
	.loc 1 54 0
	mov	r2, r4
	add	r1, sp, #4
	movs	r0, #2
	.loc 1 53 0
	strb	r4, [sp, #4]
	.loc 1 54 0
	bl	writeI2C
.LVL8:
	.loc 1 57 0
	movs	r3, #175
	.loc 1 58 0
	mov	r2, r4
	add	r1, sp, #4
	movs	r0, #4
	.loc 1 57 0
	strb	r3, [sp, #4]
	.loc 1 61 0
	mov	fp, #128
	.loc 1 58 0
	bl	writeI2C
.LVL9:
	.loc 1 63 0
	mov	r2, r4
	add	r1, sp, #4
	movs	r0, #5
	.loc 1 61 0
	strb	fp, [sp, #4]
	.loc 1 63 0
	bl	writeI2C
.LVL10:
	.loc 1 68 0
	mov	r2, r4
	.loc 1 67 0
	movs	r3, #3
	.loc 1 68 0
	add	r1, sp, #4
	movs	r0, #6
	.loc 1 67 0
	strb	r3, [sp, #4]
	.loc 1 68 0
	bl	writeI2C
.LVL11:
	.loc 1 72 0
	movs	r3, #48
	.loc 1 73 0
	mov	r2, r4
	add	r1, sp, #4
	movs	r0, #14
	.loc 1 76 0
	mov	r9, #0
	.loc 1 72 0
	strb	r3, [sp, #4]
	.loc 1 73 0
	bl	writeI2C
.LVL12:
	.loc 1 77 0
	mov	r2, r4
	add	r1, sp, #4
	movs	r0, #15
	.loc 1 76 0
	strb	r9, [sp, #4]
	.loc 1 77 0
	bl	writeI2C
.LVL13:
	.loc 1 82 0
	mov	r2, r4
	add	r1, sp, #4
	movs	r0, #26
	.loc 1 81 0
	strb	r9, [sp, #4]
	.loc 1 82 0
	bl	writeI2C
.LVL14:
	.loc 1 84 0
	mov	r2, r4
	add	r1, sp, #4
	movs	r0, #27
	.loc 1 83 0
	strb	r9, [sp, #4]
	.loc 1 84 0
	bl	writeI2C
.LVL15:
	.loc 1 92 0
	movs	r3, #153
	.loc 1 93 0
	mov	r0, r9
	mov	r2, r4
	add	r1, sp, #4
	.loc 1 92 0
	strb	r3, [sp, #4]
	.loc 1 93 0
	bl	writeI2C
.LVL16:
	.loc 1 96 0
	mov	r2, r4
	add	r1, sp, #4
	movs	r0, #71
	.loc 1 95 0
	strb	fp, [sp, #4]
	.loc 1 96 0
	bl	writeI2C
.LVL17:
	.loc 1 99 0
	mov	r2, r4
	add	r1, sp, #4
	movs	r0, #50
	.loc 1 98 0
	strb	fp, [sp, #4]
	.loc 1 99 0
	bl	writeI2C
.LVL18:
	.loc 1 102 0
	mov	r2, r4
	add	r1, sp, #4
	movs	r0, #50
	.loc 1 101 0
	strb	r9, [sp, #4]
	.loc 1 102 0
	bl	writeI2C
.LVL19:
	.loc 1 105 0
	mov	r0, r9
	mov	r2, r4
	add	r1, sp, #4
	.loc 1 104 0
	strb	r9, [sp, #4]
	.loc 1 105 0
	bl	writeI2C
.LVL20:
	.loc 1 108 0
	mov	r2, r4
	.loc 1 107 0
	movs	r3, #158
	.loc 1 108 0
	add	r1, sp, #4
	movs	r0, #2
	.loc 1 107 0
	strb	r3, [sp, #4]
	.loc 1 108 0
	bl	writeI2C
.LVL21:
	.loc 1 111 0
	mov	r0, #500
	bl	delay_ms
.LVL22:
	.loc 1 115 0
	ldr	r2, [r5, #64]
	.loc 1 124 0
	ldr	r3, .L8+28
	.loc 1 128 0
	ldr	r0, .L8+32
	.loc 1 115 0
	orr	r2, r2, #32768
	str	r2, [r5, #64]
	.loc 1 116 0
	ldr	r2, [r5, #48]
	.loc 1 125 0
	add	r4, r4, #-858993460
	.loc 1 124 0
	lsl	r10, r10, #8
.LVL23:
	udiv	r3, r3, r10
	.loc 1 125 0
	adds	r3, r3, #5
	umull	r3, r4, r4, r3
	lsr	r9, r4, #3
	.loc 1 116 0
	orr	r3, r2, #4096
	str	r3, [r5, #48]
.LVL24:
	.loc 1 128 0
	mov	r1, r9
	bl	printUSART2
.LVL25:
	.loc 1 129 0
	tst	r9, #1
	beq	.L2
	.loc 1 131 0
	add	r3, r9, #-1
.LVL26:
	.loc 1 132 0
	lsrs	r3, r3, #1
.LVL27:
	.loc 1 133 0
	orr	r3, r3, #256
.LVL28:
	ldr	r2, .L8+36
	uxth	r3, r3
	strh	r3, [r2, #32]	@ movhi
.LVL29:
.L3:
	.loc 1 140 0
	ldr	r2, .L8+36
	.loc 1 152 0
	ldr	r0, .L8
	.loc 1 140 0
	ldrh	r1, [r2, #32]
	.loc 1 153 0
	ldr	r3, .L8+40
	.loc 1 171 0
	ldr	r4, .L8+44
	.loc 1 140 0
	uxth	r1, r1
	orr	r1, r1, #512
	strh	r1, [r2, #32]	@ movhi
	.loc 1 141 0
	ldrh	r1, [r2, #4]
	uxth	r1, r1
	orr	r1, r1, #2
	.loc 1 143 0
	movw	r5, #3608
	.loc 1 141 0
	strh	r1, [r2, #4]	@ movhi
	.loc 1 143 0
	strh	r5, [r2, #28]	@ movhi
	.loc 1 152 0
	ldr	r2, [r0, #64]
	.loc 1 153 0
	mov	ip, #6
	.loc 1 152 0
	orr	r2, r2, #16
	.loc 1 157 0
	movw	lr, #750
	.loc 1 158 0
	movs	r5, #132
	.loc 1 160 0
	movs	r1, #32
	.loc 1 152 0
	str	r2, [r0, #64]
	.loc 1 153 0
	strh	ip, [r3, #40]	@ movhi
	.loc 1 157 0
	str	lr, [r3, #44]
	.loc 1 158 0
	strh	r5, [r3]	@ movhi
	.loc 1 160 0
	strh	r1, [r3, #4]	@ movhi
	.loc 1 162 0
	ldrh	r2, [r3, #20]
	uxth	r2, r2
	orr	r2, r2, #1
	strh	r2, [r3, #20]	@ movhi
	.loc 1 163 0
	ldrh	r2, [r3]
	uxth	r2, r2
	orr	r2, r2, #1
	strh	r2, [r3]	@ movhi
	.loc 1 169 0
	ldr	r3, [r0, #48]
	.loc 1 171 0
	movs	r2, #0
	.loc 1 169 0
	orr	r3, r3, #2097152
	str	r3, [r0, #48]
	.loc 1 172 0
	mov	r0, r4
	.loc 1 171 0
	str	r2, [r4]
.L4:
	.loc 1 172 0 discriminator 1
	ldr	r1, [r0]
	ldr	r2, .L8+44
	lsls	r3, r1, #31
	bmi	.L4
	.loc 1 174 0
	ldr	r3, .L8+48
	.loc 1 177 0
	ldr	r0, .L8+52
	.loc 1 174 0
	mov	r1, #-1
	str	r1, [r3, #8]
	.loc 1 175 0
	str	r1, [r3, #12]
	.loc 1 177 0
	str	r0, [r2, #8]
	.loc 1 178 0
	str	r7, [r2, #12]
	.loc 1 179 0
	str	r8, [r2, #16]
	.loc 1 180 0
	str	r6, [r2, #4]
	.loc 1 183 0
	ldr	r3, [r2]
	orr	r3, r3, #196608
	str	r3, [r2]
	.loc 1 186 0
	ldr	r3, [r2]
	orr	r3, r3, #1024
	str	r3, [r2]
	.loc 1 189 0
	ldr	r3, [r2]
	orr	r3, r3, #262144
	str	r3, [r2]
	.loc 1 192 0
	ldr	r3, [r2]
	orr	r3, r3, #2048
	str	r3, [r2]
	.loc 1 194 0
	ldr	r3, [r2]
	orr	r3, r3, #8192
	str	r3, [r2]
	.loc 1 196 0
	ldr	r3, [r2]
	orr	r3, r3, #64
	str	r3, [r2]
	.loc 1 198 0
	ldr	r3, [r2]
	orr	r3, r3, #1
	str	r3, [r2]
	.loc 1 201 0
	add	sp, sp, #12
	.cfi_remember_state
	.cfi_def_cfa_offset 36
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.LVL30:
.L2:
	.cfi_restore_state
	.loc 1 137 0
	ldr	r3, .L8+36
	ubfx	r4, r4, #4, #16
	strh	r4, [r3, #32]	@ movhi
	b	.L3
.L9:
	.align	2
.L8:
	.word	1073887232
	.word	.LC0
	.word	1073875968
	.word	1073874944
	.word	.LC1
	.word	1073872896
	.word	.LC2
	.word	860000000
	.word	.LC3
	.word	1073757184
	.word	1073745920
	.word	1073897608
	.word	1073897472
	.word	1073757196
	.cfi_endproc
.LFE110:
	.size	initCS43L22, .-initCS43L22
	.comm	dev_addr,1,1
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"-> P1\012\000"
	.space	1
.LC1:
	.ascii	"-> P2\012\000"
	.space	1
.LC2:
	.ascii	"-> CS43L22: ID [%xb]\012\000"
	.space	2
.LC3:
	.ascii	"SPI3->I2SPR: %x\012\000"
	.text
.Letext0:
	.file 2 "/home/wubuntu/msut/STM32F407/gcc-arm-none-eabi/arm-none-eabi/include/machine/_default_types.h"
	.file 3 "/home/wubuntu/msut/STM32F407/gcc-arm-none-eabi/arm-none-eabi/include/stdint.h"
	.file 4 "../../../../STM32F407/Libraries/CMSIS/ST/STM32F4xx/Include/stm32f4xx.h"
	.file 5 "../../../../STM32F407/Libraries/CMSIS/Include/core_cm4.h"
	.file 6 "i2c.h"
	.file 7 "usart.h"
	.file 8 "delay.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0xa66
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF102
	.byte	0x1
	.4byte	.LASF103
	.4byte	.LASF104
	.4byte	.Ldebug_ranges0+0
	.4byte	0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF1
	.uleb128 0x3
	.4byte	.LASF4
	.byte	0x2
	.byte	0x1d
	.4byte	0x3e
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF2
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF3
	.uleb128 0x3
	.4byte	.LASF5
	.byte	0x2
	.byte	0x2b
	.4byte	0x57
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF6
	.uleb128 0x3
	.4byte	.LASF7
	.byte	0x2
	.byte	0x3f
	.4byte	0x69
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.4byte	.LASF8
	.uleb128 0x3
	.4byte	.LASF9
	.byte	0x2
	.byte	0x41
	.4byte	0x7b
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
	.uleb128 0x3
	.4byte	.LASF13
	.byte	0x3
	.byte	0x15
	.4byte	0x33
	.uleb128 0x3
	.4byte	.LASF14
	.byte	0x3
	.byte	0x21
	.4byte	0x4c
	.uleb128 0x3
	.4byte	.LASF15
	.byte	0x3
	.byte	0x2c
	.4byte	0x5e
	.uleb128 0x3
	.4byte	.LASF16
	.byte	0x3
	.byte	0x2d
	.4byte	0x70
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF17
	.uleb128 0x5
	.4byte	0xb8
	.uleb128 0x6
	.4byte	0xb8
	.4byte	0xdf
	.uleb128 0x7
	.4byte	0xc3
	.byte	0x1
	.byte	0
	.uleb128 0x5
	.4byte	0x97
	.uleb128 0x5
	.4byte	0xa2
	.uleb128 0x5
	.4byte	0xad
	.uleb128 0x8
	.byte	0x18
	.byte	0x4
	.2byte	0x1d7
	.4byte	0x145
	.uleb128 0x9
	.ascii	"CR\000"
	.byte	0x4
	.2byte	0x1d9
	.4byte	0xca
	.byte	0
	.uleb128 0xa
	.4byte	.LASF18
	.byte	0x4
	.2byte	0x1da
	.4byte	0xca
	.byte	0x4
	.uleb128 0x9
	.ascii	"PAR\000"
	.byte	0x4
	.2byte	0x1db
	.4byte	0xca
	.byte	0x8
	.uleb128 0xa
	.4byte	.LASF19
	.byte	0x4
	.2byte	0x1dc
	.4byte	0xca
	.byte	0xc
	.uleb128 0xa
	.4byte	.LASF20
	.byte	0x4
	.2byte	0x1dd
	.4byte	0xca
	.byte	0x10
	.uleb128 0x9
	.ascii	"FCR\000"
	.byte	0x4
	.2byte	0x1de
	.4byte	0xca
	.byte	0x14
	.byte	0
	.uleb128 0xb
	.4byte	.LASF21
	.byte	0x4
	.2byte	0x1df
	.4byte	0xee
	.uleb128 0x8
	.byte	0x10
	.byte	0x4
	.2byte	0x1e1
	.4byte	0x18f
	.uleb128 0xa
	.4byte	.LASF22
	.byte	0x4
	.2byte	0x1e3
	.4byte	0xca
	.byte	0
	.uleb128 0xa
	.4byte	.LASF23
	.byte	0x4
	.2byte	0x1e4
	.4byte	0xca
	.byte	0x4
	.uleb128 0xa
	.4byte	.LASF24
	.byte	0x4
	.2byte	0x1e5
	.4byte	0xca
	.byte	0x8
	.uleb128 0xa
	.4byte	.LASF25
	.byte	0x4
	.2byte	0x1e6
	.4byte	0xca
	.byte	0xc
	.byte	0
	.uleb128 0xb
	.4byte	.LASF26
	.byte	0x4
	.2byte	0x1e7
	.4byte	0x151
	.uleb128 0x8
	.byte	0x28
	.byte	0x4
	.2byte	0x28e
	.4byte	0x227
	.uleb128 0xa
	.4byte	.LASF27
	.byte	0x4
	.2byte	0x290
	.4byte	0xca
	.byte	0
	.uleb128 0xa
	.4byte	.LASF28
	.byte	0x4
	.2byte	0x291
	.4byte	0xca
	.byte	0x4
	.uleb128 0xa
	.4byte	.LASF29
	.byte	0x4
	.2byte	0x292
	.4byte	0xca
	.byte	0x8
	.uleb128 0xa
	.4byte	.LASF30
	.byte	0x4
	.2byte	0x293
	.4byte	0xca
	.byte	0xc
	.uleb128 0x9
	.ascii	"IDR\000"
	.byte	0x4
	.2byte	0x294
	.4byte	0xca
	.byte	0x10
	.uleb128 0x9
	.ascii	"ODR\000"
	.byte	0x4
	.2byte	0x295
	.4byte	0xca
	.byte	0x14
	.uleb128 0xa
	.4byte	.LASF31
	.byte	0x4
	.2byte	0x296
	.4byte	0xe4
	.byte	0x18
	.uleb128 0xa
	.4byte	.LASF32
	.byte	0x4
	.2byte	0x297
	.4byte	0xe4
	.byte	0x1a
	.uleb128 0xa
	.4byte	.LASF33
	.byte	0x4
	.2byte	0x298
	.4byte	0xca
	.byte	0x1c
	.uleb128 0x9
	.ascii	"AFR\000"
	.byte	0x4
	.2byte	0x299
	.4byte	0x227
	.byte	0x20
	.byte	0
	.uleb128 0x5
	.4byte	0xcf
	.uleb128 0xb
	.4byte	.LASF34
	.byte	0x4
	.2byte	0x29a
	.4byte	0x19b
	.uleb128 0x8
	.byte	0x88
	.byte	0x4
	.2byte	0x2dd
	.4byte	0x3c7
	.uleb128 0x9
	.ascii	"CR\000"
	.byte	0x4
	.2byte	0x2df
	.4byte	0xca
	.byte	0
	.uleb128 0xa
	.4byte	.LASF35
	.byte	0x4
	.2byte	0x2e0
	.4byte	0xca
	.byte	0x4
	.uleb128 0xa
	.4byte	.LASF36
	.byte	0x4
	.2byte	0x2e1
	.4byte	0xca
	.byte	0x8
	.uleb128 0x9
	.ascii	"CIR\000"
	.byte	0x4
	.2byte	0x2e2
	.4byte	0xca
	.byte	0xc
	.uleb128 0xa
	.4byte	.LASF37
	.byte	0x4
	.2byte	0x2e3
	.4byte	0xca
	.byte	0x10
	.uleb128 0xa
	.4byte	.LASF38
	.byte	0x4
	.2byte	0x2e4
	.4byte	0xca
	.byte	0x14
	.uleb128 0xa
	.4byte	.LASF39
	.byte	0x4
	.2byte	0x2e5
	.4byte	0xca
	.byte	0x18
	.uleb128 0xa
	.4byte	.LASF40
	.byte	0x4
	.2byte	0x2e6
	.4byte	0xb8
	.byte	0x1c
	.uleb128 0xa
	.4byte	.LASF41
	.byte	0x4
	.2byte	0x2e7
	.4byte	0xca
	.byte	0x20
	.uleb128 0xa
	.4byte	.LASF42
	.byte	0x4
	.2byte	0x2e8
	.4byte	0xca
	.byte	0x24
	.uleb128 0xa
	.4byte	.LASF43
	.byte	0x4
	.2byte	0x2e9
	.4byte	0xcf
	.byte	0x28
	.uleb128 0xa
	.4byte	.LASF44
	.byte	0x4
	.2byte	0x2ea
	.4byte	0xca
	.byte	0x30
	.uleb128 0xa
	.4byte	.LASF45
	.byte	0x4
	.2byte	0x2eb
	.4byte	0xca
	.byte	0x34
	.uleb128 0xa
	.4byte	.LASF46
	.byte	0x4
	.2byte	0x2ec
	.4byte	0xca
	.byte	0x38
	.uleb128 0xa
	.4byte	.LASF47
	.byte	0x4
	.2byte	0x2ed
	.4byte	0xb8
	.byte	0x3c
	.uleb128 0xa
	.4byte	.LASF48
	.byte	0x4
	.2byte	0x2ee
	.4byte	0xca
	.byte	0x40
	.uleb128 0xa
	.4byte	.LASF49
	.byte	0x4
	.2byte	0x2ef
	.4byte	0xca
	.byte	0x44
	.uleb128 0xa
	.4byte	.LASF50
	.byte	0x4
	.2byte	0x2f0
	.4byte	0xcf
	.byte	0x48
	.uleb128 0xa
	.4byte	.LASF51
	.byte	0x4
	.2byte	0x2f1
	.4byte	0xca
	.byte	0x50
	.uleb128 0xa
	.4byte	.LASF52
	.byte	0x4
	.2byte	0x2f2
	.4byte	0xca
	.byte	0x54
	.uleb128 0xa
	.4byte	.LASF53
	.byte	0x4
	.2byte	0x2f3
	.4byte	0xca
	.byte	0x58
	.uleb128 0xa
	.4byte	.LASF54
	.byte	0x4
	.2byte	0x2f4
	.4byte	0xb8
	.byte	0x5c
	.uleb128 0xa
	.4byte	.LASF55
	.byte	0x4
	.2byte	0x2f5
	.4byte	0xca
	.byte	0x60
	.uleb128 0xa
	.4byte	.LASF56
	.byte	0x4
	.2byte	0x2f6
	.4byte	0xca
	.byte	0x64
	.uleb128 0xa
	.4byte	.LASF57
	.byte	0x4
	.2byte	0x2f7
	.4byte	0xcf
	.byte	0x68
	.uleb128 0xa
	.4byte	.LASF58
	.byte	0x4
	.2byte	0x2f8
	.4byte	0xca
	.byte	0x70
	.uleb128 0x9
	.ascii	"CSR\000"
	.byte	0x4
	.2byte	0x2f9
	.4byte	0xca
	.byte	0x74
	.uleb128 0xa
	.4byte	.LASF59
	.byte	0x4
	.2byte	0x2fa
	.4byte	0xcf
	.byte	0x78
	.uleb128 0xa
	.4byte	.LASF60
	.byte	0x4
	.2byte	0x2fb
	.4byte	0xca
	.byte	0x80
	.uleb128 0xa
	.4byte	.LASF61
	.byte	0x4
	.2byte	0x2fc
	.4byte	0xca
	.byte	0x84
	.byte	0
	.uleb128 0xb
	.4byte	.LASF62
	.byte	0x4
	.2byte	0x2fd
	.4byte	0x238
	.uleb128 0x8
	.byte	0x24
	.byte	0x4
	.2byte	0x34f
	.4byte	0x4c5
	.uleb128 0x9
	.ascii	"CR1\000"
	.byte	0x4
	.2byte	0x351
	.4byte	0xe4
	.byte	0
	.uleb128 0xa
	.4byte	.LASF40
	.byte	0x4
	.2byte	0x352
	.4byte	0xa2
	.byte	0x2
	.uleb128 0x9
	.ascii	"CR2\000"
	.byte	0x4
	.2byte	0x353
	.4byte	0xe4
	.byte	0x4
	.uleb128 0xa
	.4byte	.LASF43
	.byte	0x4
	.2byte	0x354
	.4byte	0xa2
	.byte	0x6
	.uleb128 0x9
	.ascii	"SR\000"
	.byte	0x4
	.2byte	0x355
	.4byte	0xe4
	.byte	0x8
	.uleb128 0xa
	.4byte	.LASF47
	.byte	0x4
	.2byte	0x356
	.4byte	0xa2
	.byte	0xa
	.uleb128 0x9
	.ascii	"DR\000"
	.byte	0x4
	.2byte	0x357
	.4byte	0xe4
	.byte	0xc
	.uleb128 0xa
	.4byte	.LASF50
	.byte	0x4
	.2byte	0x358
	.4byte	0xa2
	.byte	0xe
	.uleb128 0xa
	.4byte	.LASF63
	.byte	0x4
	.2byte	0x359
	.4byte	0xe4
	.byte	0x10
	.uleb128 0xa
	.4byte	.LASF54
	.byte	0x4
	.2byte	0x35a
	.4byte	0xa2
	.byte	0x12
	.uleb128 0xa
	.4byte	.LASF64
	.byte	0x4
	.2byte	0x35b
	.4byte	0xe4
	.byte	0x14
	.uleb128 0xa
	.4byte	.LASF57
	.byte	0x4
	.2byte	0x35c
	.4byte	0xa2
	.byte	0x16
	.uleb128 0xa
	.4byte	.LASF65
	.byte	0x4
	.2byte	0x35d
	.4byte	0xe4
	.byte	0x18
	.uleb128 0xa
	.4byte	.LASF59
	.byte	0x4
	.2byte	0x35e
	.4byte	0xa2
	.byte	0x1a
	.uleb128 0xa
	.4byte	.LASF66
	.byte	0x4
	.2byte	0x35f
	.4byte	0xe4
	.byte	0x1c
	.uleb128 0xa
	.4byte	.LASF67
	.byte	0x4
	.2byte	0x360
	.4byte	0xa2
	.byte	0x1e
	.uleb128 0xa
	.4byte	.LASF68
	.byte	0x4
	.2byte	0x361
	.4byte	0xe4
	.byte	0x20
	.uleb128 0xa
	.4byte	.LASF69
	.byte	0x4
	.2byte	0x362
	.4byte	0xa2
	.byte	0x22
	.byte	0
	.uleb128 0xb
	.4byte	.LASF70
	.byte	0x4
	.2byte	0x363
	.4byte	0x3d3
	.uleb128 0x8
	.byte	0x54
	.byte	0x4
	.2byte	0x369
	.4byte	0x6ad
	.uleb128 0x9
	.ascii	"CR1\000"
	.byte	0x4
	.2byte	0x36b
	.4byte	0xe4
	.byte	0
	.uleb128 0xa
	.4byte	.LASF40
	.byte	0x4
	.2byte	0x36c
	.4byte	0xa2
	.byte	0x2
	.uleb128 0x9
	.ascii	"CR2\000"
	.byte	0x4
	.2byte	0x36d
	.4byte	0xe4
	.byte	0x4
	.uleb128 0xa
	.4byte	.LASF43
	.byte	0x4
	.2byte	0x36e
	.4byte	0xa2
	.byte	0x6
	.uleb128 0xa
	.4byte	.LASF71
	.byte	0x4
	.2byte	0x36f
	.4byte	0xe4
	.byte	0x8
	.uleb128 0xa
	.4byte	.LASF47
	.byte	0x4
	.2byte	0x370
	.4byte	0xa2
	.byte	0xa
	.uleb128 0xa
	.4byte	.LASF72
	.byte	0x4
	.2byte	0x371
	.4byte	0xe4
	.byte	0xc
	.uleb128 0xa
	.4byte	.LASF50
	.byte	0x4
	.2byte	0x372
	.4byte	0xa2
	.byte	0xe
	.uleb128 0x9
	.ascii	"SR\000"
	.byte	0x4
	.2byte	0x373
	.4byte	0xe4
	.byte	0x10
	.uleb128 0xa
	.4byte	.LASF54
	.byte	0x4
	.2byte	0x374
	.4byte	0xa2
	.byte	0x12
	.uleb128 0x9
	.ascii	"EGR\000"
	.byte	0x4
	.2byte	0x375
	.4byte	0xe4
	.byte	0x14
	.uleb128 0xa
	.4byte	.LASF57
	.byte	0x4
	.2byte	0x376
	.4byte	0xa2
	.byte	0x16
	.uleb128 0xa
	.4byte	.LASF73
	.byte	0x4
	.2byte	0x377
	.4byte	0xe4
	.byte	0x18
	.uleb128 0xa
	.4byte	.LASF59
	.byte	0x4
	.2byte	0x378
	.4byte	0xa2
	.byte	0x1a
	.uleb128 0xa
	.4byte	.LASF74
	.byte	0x4
	.2byte	0x379
	.4byte	0xe4
	.byte	0x1c
	.uleb128 0xa
	.4byte	.LASF67
	.byte	0x4
	.2byte	0x37a
	.4byte	0xa2
	.byte	0x1e
	.uleb128 0xa
	.4byte	.LASF75
	.byte	0x4
	.2byte	0x37b
	.4byte	0xe4
	.byte	0x20
	.uleb128 0xa
	.4byte	.LASF69
	.byte	0x4
	.2byte	0x37c
	.4byte	0xa2
	.byte	0x22
	.uleb128 0x9
	.ascii	"CNT\000"
	.byte	0x4
	.2byte	0x37d
	.4byte	0xca
	.byte	0x24
	.uleb128 0x9
	.ascii	"PSC\000"
	.byte	0x4
	.2byte	0x37e
	.4byte	0xe4
	.byte	0x28
	.uleb128 0xa
	.4byte	.LASF76
	.byte	0x4
	.2byte	0x37f
	.4byte	0xa2
	.byte	0x2a
	.uleb128 0x9
	.ascii	"ARR\000"
	.byte	0x4
	.2byte	0x380
	.4byte	0xca
	.byte	0x2c
	.uleb128 0x9
	.ascii	"RCR\000"
	.byte	0x4
	.2byte	0x381
	.4byte	0xe4
	.byte	0x30
	.uleb128 0xa
	.4byte	.LASF77
	.byte	0x4
	.2byte	0x382
	.4byte	0xa2
	.byte	0x32
	.uleb128 0xa
	.4byte	.LASF78
	.byte	0x4
	.2byte	0x383
	.4byte	0xca
	.byte	0x34
	.uleb128 0xa
	.4byte	.LASF79
	.byte	0x4
	.2byte	0x384
	.4byte	0xca
	.byte	0x38
	.uleb128 0xa
	.4byte	.LASF80
	.byte	0x4
	.2byte	0x385
	.4byte	0xca
	.byte	0x3c
	.uleb128 0xa
	.4byte	.LASF81
	.byte	0x4
	.2byte	0x386
	.4byte	0xca
	.byte	0x40
	.uleb128 0xa
	.4byte	.LASF82
	.byte	0x4
	.2byte	0x387
	.4byte	0xe4
	.byte	0x44
	.uleb128 0xa
	.4byte	.LASF83
	.byte	0x4
	.2byte	0x388
	.4byte	0xa2
	.byte	0x46
	.uleb128 0x9
	.ascii	"DCR\000"
	.byte	0x4
	.2byte	0x389
	.4byte	0xe4
	.byte	0x48
	.uleb128 0xa
	.4byte	.LASF84
	.byte	0x4
	.2byte	0x38a
	.4byte	0xa2
	.byte	0x4a
	.uleb128 0xa
	.4byte	.LASF85
	.byte	0x4
	.2byte	0x38b
	.4byte	0xe4
	.byte	0x4c
	.uleb128 0xa
	.4byte	.LASF86
	.byte	0x4
	.2byte	0x38c
	.4byte	0xa2
	.byte	0x4e
	.uleb128 0x9
	.ascii	"OR\000"
	.byte	0x4
	.2byte	0x38d
	.4byte	0xe4
	.byte	0x50
	.uleb128 0xa
	.4byte	.LASF87
	.byte	0x4
	.2byte	0x38e
	.4byte	0xa2
	.byte	0x52
	.byte	0
	.uleb128 0xb
	.4byte	.LASF88
	.byte	0x4
	.2byte	0x38f
	.4byte	0x4d1
	.uleb128 0xc
	.byte	0x4
	.4byte	0x6bf
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF89
	.uleb128 0xd
	.4byte	.LASF105
	.byte	0x1
	.byte	0x3
	.4byte	.LFB110
	.4byte	.LFE110-.LFB110
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x9ca
	.uleb128 0xe
	.4byte	.LASF90
	.byte	0x1
	.byte	0x3
	.4byte	0x97
	.4byte	.LLST0
	.uleb128 0xe
	.4byte	.LASF91
	.byte	0x1
	.byte	0x3
	.4byte	0xb8
	.4byte	.LLST1
	.uleb128 0xf
	.ascii	"ptr\000"
	.byte	0x1
	.byte	0x3
	.4byte	0x9ca
	.4byte	.LLST2
	.uleb128 0xe
	.4byte	.LASF92
	.byte	0x1
	.byte	0x3
	.4byte	0x9ca
	.4byte	.LLST3
	.uleb128 0xe
	.4byte	.LASF93
	.byte	0x1
	.byte	0x3
	.4byte	0xa2
	.4byte	.LLST4
	.uleb128 0x10
	.4byte	.LASF94
	.byte	0x1
	.byte	0x5
	.4byte	0x9d0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x11
	.4byte	.LASF95
	.byte	0x1
	.byte	0x6
	.4byte	0xb8
	.4byte	.LLST5
	.uleb128 0x12
	.4byte	.LVL1
	.4byte	0x9fd
	.4byte	0x75a
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC0
	.byte	0
	.uleb128 0x12
	.4byte	.LVL2
	.4byte	0x9fd
	.4byte	0x771
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC1
	.byte	0
	.uleb128 0x12
	.4byte	.LVL3
	.4byte	0xa0f
	.4byte	0x785
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x9
	.byte	0x94
	.byte	0
	.uleb128 0x12
	.4byte	.LVL4
	.4byte	0xa20
	.4byte	0x799
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x8
	.byte	0x32
	.byte	0
	.uleb128 0x12
	.4byte	.LVL5
	.4byte	0xa20
	.4byte	0x7ad
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x8
	.byte	0x32
	.byte	0
	.uleb128 0x12
	.4byte	.LVL6
	.4byte	0xa31
	.4byte	0x7cd
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x12
	.4byte	.LVL7
	.4byte	0x9fd
	.4byte	0x7e4
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC2
	.byte	0
	.uleb128 0x12
	.4byte	.LVL8
	.4byte	0xa52
	.4byte	0x803
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x32
	.byte	0
	.uleb128 0x12
	.4byte	.LVL9
	.4byte	0xa52
	.4byte	0x822
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x34
	.byte	0
	.uleb128 0x12
	.4byte	.LVL10
	.4byte	0xa52
	.4byte	0x841
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x35
	.byte	0
	.uleb128 0x12
	.4byte	.LVL11
	.4byte	0xa52
	.4byte	0x860
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x36
	.byte	0
	.uleb128 0x12
	.4byte	.LVL12
	.4byte	0xa52
	.4byte	0x87f
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x3e
	.byte	0
	.uleb128 0x12
	.4byte	.LVL13
	.4byte	0xa52
	.4byte	0x89e
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x3f
	.byte	0
	.uleb128 0x12
	.4byte	.LVL14
	.4byte	0xa52
	.4byte	0x8bd
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x4a
	.byte	0
	.uleb128 0x12
	.4byte	.LVL15
	.4byte	0xa52
	.4byte	0x8dc
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x4b
	.byte	0
	.uleb128 0x12
	.4byte	.LVL16
	.4byte	0xa52
	.4byte	0x8fc
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x79
	.sleb128 0
	.byte	0
	.uleb128 0x12
	.4byte	.LVL17
	.4byte	0xa52
	.4byte	0x91c
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x8
	.byte	0x47
	.byte	0
	.uleb128 0x12
	.4byte	.LVL18
	.4byte	0xa52
	.4byte	0x93c
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x8
	.byte	0x32
	.byte	0
	.uleb128 0x12
	.4byte	.LVL19
	.4byte	0xa52
	.4byte	0x95c
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x8
	.byte	0x32
	.byte	0
	.uleb128 0x12
	.4byte	.LVL20
	.4byte	0xa52
	.4byte	0x97c
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x79
	.sleb128 0
	.byte	0
	.uleb128 0x12
	.4byte	.LVL21
	.4byte	0xa52
	.4byte	0x99b
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x32
	.byte	0
	.uleb128 0x12
	.4byte	.LVL22
	.4byte	0xa20
	.4byte	0x9b0
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x3
	.byte	0xa
	.2byte	0x1f4
	.byte	0
	.uleb128 0x14
	.4byte	.LVL25
	.4byte	0x9fd
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x79
	.sleb128 0
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC3
	.byte	0
	.byte	0
	.uleb128 0xc
	.byte	0x4
	.4byte	0xa2
	.uleb128 0x6
	.4byte	0x97
	.4byte	0x9e0
	.uleb128 0x7
	.4byte	0xc3
	.byte	0x3
	.byte	0
	.uleb128 0x15
	.4byte	.LASF96
	.byte	0x5
	.2byte	0x51b
	.4byte	0xe9
	.uleb128 0x16
	.4byte	.LASF97
	.byte	0x6
	.byte	0x14
	.4byte	0xdf
	.uleb128 0x5
	.byte	0x3
	.4byte	dev_addr
	.uleb128 0x17
	.4byte	.LASF98
	.byte	0x7
	.byte	0x10
	.4byte	0xa0f
	.uleb128 0x18
	.4byte	0x6b9
	.uleb128 0x19
	.byte	0
	.uleb128 0x17
	.4byte	.LASF99
	.byte	0x6
	.byte	0x15
	.4byte	0xa20
	.uleb128 0x18
	.4byte	0x97
	.byte	0
	.uleb128 0x17
	.4byte	.LASF100
	.byte	0x8
	.byte	0xb
	.4byte	0xa31
	.uleb128 0x18
	.4byte	0xb8
	.byte	0
	.uleb128 0x17
	.4byte	.LASF101
	.byte	0x6
	.byte	0x16
	.4byte	0xa4c
	.uleb128 0x18
	.4byte	0x97
	.uleb128 0x18
	.4byte	0xa4c
	.uleb128 0x18
	.4byte	0xa2
	.byte	0
	.uleb128 0xc
	.byte	0x4
	.4byte	0x97
	.uleb128 0x1a
	.4byte	.LASF106
	.byte	0x6
	.byte	0x17
	.uleb128 0x18
	.4byte	0x97
	.uleb128 0x18
	.4byte	0xa4c
	.uleb128 0x18
	.4byte	0xa2
	.byte	0
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
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x11
	.uleb128 0x1
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
	.uleb128 0x9
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
	.uleb128 0xa
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
	.uleb128 0xb
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
	.uleb128 0xc
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
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
	.uleb128 0xe
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
	.uleb128 0xf
	.uleb128 0x5
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
	.uleb128 0x10
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
	.uleb128 0x11
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
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x2111
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
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
	.uleb128 0x16
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
	.uleb128 0x17
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
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1a
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
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",%progbits
.Ldebug_loc0:
.LLST0:
	.4byte	.LVL0
	.4byte	.LVL0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL0
	.4byte	.LFE110
	.2byte	0x13
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x8
	.byte	0xff
	.byte	0x1e
	.byte	0xf7
	.uleb128 0x25
	.byte	0x8
	.byte	0x64
	.byte	0xf7
	.uleb128 0x25
	.byte	0x1b
	.byte	0xf7
	.uleb128 0
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL0
	.4byte	.LVL1-1
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL1-1
	.4byte	.LVL23
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL23
	.4byte	.LFE110
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL0
	.4byte	.LVL1-1
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL1-1
	.4byte	.LFE110
	.2byte	0x1
	.byte	0x57
	.4byte	0
	.4byte	0
.LLST3:
	.4byte	.LVL0
	.4byte	.LVL1-1
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL1-1
	.4byte	.LFE110
	.2byte	0x1
	.byte	0x58
	.4byte	0
	.4byte	0
.LLST4:
	.4byte	.LVL0
	.4byte	.LVL30
	.2byte	0x2
	.byte	0x91
	.sleb128 0
	.4byte	.LVL30
	.4byte	.LFE110
	.2byte	0x2
	.byte	0x91
	.sleb128 0
	.4byte	0
	.4byte	0
.LLST5:
	.4byte	.LVL0
	.4byte	.LVL24
	.2byte	0x7
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x9f
	.4byte	.LVL24
	.4byte	.LVL26
	.2byte	0x1
	.byte	0x59
	.4byte	.LVL26
	.4byte	.LVL27
	.2byte	0x5
	.byte	0x73
	.sleb128 0
	.byte	0x31
	.byte	0x25
	.byte	0x9f
	.4byte	.LVL27
	.4byte	.LVL28
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL28
	.4byte	.LVL29
	.2byte	0x5
	.byte	0x79
	.sleb128 -1
	.byte	0x31
	.byte	0x25
	.byte	0x9f
	.4byte	.LVL30
	.4byte	.LFE110
	.2byte	0x1
	.byte	0x59
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
	.section	.debug_ranges,"",%progbits
.Ldebug_ranges0:
	.4byte	.Ltext0
	.4byte	.Letext0
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF95:
	.ascii	"utmp32\000"
.LASF33:
	.ascii	"LCKR\000"
.LASF72:
	.ascii	"DIER\000"
.LASF19:
	.ascii	"M0AR\000"
.LASF64:
	.ascii	"RXCRCR\000"
.LASF28:
	.ascii	"OTYPER\000"
.LASF4:
	.ascii	"__uint8_t\000"
.LASF101:
	.ascii	"readI2C\000"
.LASF88:
	.ascii	"TIM_TypeDef\000"
.LASF27:
	.ascii	"MODER\000"
.LASF12:
	.ascii	"long long unsigned int\000"
.LASF63:
	.ascii	"CRCPR\000"
.LASF30:
	.ascii	"PUPDR\000"
.LASF96:
	.ascii	"ITM_RxBuffer\000"
.LASF82:
	.ascii	"BDTR\000"
.LASF51:
	.ascii	"AHB1LPENR\000"
.LASF73:
	.ascii	"CCMR1\000"
.LASF74:
	.ascii	"CCMR2\000"
.LASF11:
	.ascii	"long long int\000"
.LASF1:
	.ascii	"signed char\000"
.LASF97:
	.ascii	"dev_addr\000"
.LASF37:
	.ascii	"AHB1RSTR\000"
.LASF106:
	.ascii	"writeI2C\000"
.LASF105:
	.ascii	"initCS43L22\000"
.LASF84:
	.ascii	"RESERVED12\000"
.LASF86:
	.ascii	"RESERVED13\000"
.LASF87:
	.ascii	"RESERVED14\000"
.LASF8:
	.ascii	"long int\000"
.LASF42:
	.ascii	"APB2RSTR\000"
.LASF55:
	.ascii	"APB1LPENR\000"
.LASF75:
	.ascii	"CCER\000"
.LASF14:
	.ascii	"uint16_t\000"
.LASF35:
	.ascii	"PLLCFGR\000"
.LASF34:
	.ascii	"GPIO_TypeDef\000"
.LASF5:
	.ascii	"__uint16_t\000"
.LASF65:
	.ascii	"TXCRCR\000"
.LASF29:
	.ascii	"OSPEEDR\000"
.LASF9:
	.ascii	"__uint32_t\000"
.LASF26:
	.ascii	"DMA_TypeDef\000"
.LASF0:
	.ascii	"unsigned int\000"
.LASF102:
	.ascii	"GNU C 4.9.3 20141119 (release) [ARM/embedded-4_9-br"
	.ascii	"anch revision 218278] -mlittle-endian -mthumb -mcpu"
	.ascii	"=cortex-m4 -mthumb-interwork -mfloat-abi=hard -mfpu"
	.ascii	"=fpv4-sp-d16 -g -O2 -fsingle-precision-constant\000"
.LASF10:
	.ascii	"long unsigned int\000"
.LASF62:
	.ascii	"RCC_TypeDef\000"
.LASF94:
	.ascii	"data\000"
.LASF93:
	.ascii	"size\000"
.LASF71:
	.ascii	"SMCR\000"
.LASF61:
	.ascii	"PLLI2SCFGR\000"
.LASF39:
	.ascii	"AHB3RSTR\000"
.LASF99:
	.ascii	"initI2C\000"
.LASF103:
	.ascii	"cs43l22.c\000"
.LASF23:
	.ascii	"HISR\000"
.LASF91:
	.ascii	"sample_rate\000"
.LASF56:
	.ascii	"APB2LPENR\000"
.LASF98:
	.ascii	"printUSART2\000"
.LASF24:
	.ascii	"LIFCR\000"
.LASF68:
	.ascii	"I2SPR\000"
.LASF17:
	.ascii	"sizetype\000"
.LASF92:
	.ascii	"ptr2\000"
.LASF66:
	.ascii	"I2SCFGR\000"
.LASF46:
	.ascii	"AHB3ENR\000"
.LASF52:
	.ascii	"AHB2LPENR\000"
.LASF41:
	.ascii	"APB1RSTR\000"
.LASF40:
	.ascii	"RESERVED0\000"
.LASF43:
	.ascii	"RESERVED1\000"
.LASF47:
	.ascii	"RESERVED2\000"
.LASF50:
	.ascii	"RESERVED3\000"
.LASF54:
	.ascii	"RESERVED4\000"
.LASF57:
	.ascii	"RESERVED5\000"
.LASF59:
	.ascii	"RESERVED6\000"
.LASF69:
	.ascii	"RESERVED8\000"
.LASF76:
	.ascii	"RESERVED9\000"
.LASF15:
	.ascii	"int32_t\000"
.LASF2:
	.ascii	"unsigned char\000"
.LASF3:
	.ascii	"short int\000"
.LASF53:
	.ascii	"AHB3LPENR\000"
.LASF49:
	.ascii	"APB2ENR\000"
.LASF100:
	.ascii	"delay_ms\000"
.LASF16:
	.ascii	"uint32_t\000"
.LASF104:
	.ascii	"/home/wubuntu/msut/STM32F407/projects/p6/PROJEKAT_R"
	.ascii	"ADI_PRENOS_ZVUKA\000"
.LASF48:
	.ascii	"APB1ENR\000"
.LASF70:
	.ascii	"SPI_TypeDef\000"
.LASF89:
	.ascii	"char\000"
.LASF85:
	.ascii	"DMAR\000"
.LASF38:
	.ascii	"AHB2RSTR\000"
.LASF7:
	.ascii	"__int32_t\000"
.LASF18:
	.ascii	"NDTR\000"
.LASF21:
	.ascii	"DMA_Stream_TypeDef\000"
.LASF45:
	.ascii	"AHB2ENR\000"
.LASF6:
	.ascii	"short unsigned int\000"
.LASF20:
	.ascii	"M1AR\000"
.LASF67:
	.ascii	"RESERVED7\000"
.LASF77:
	.ascii	"RESERVED10\000"
.LASF83:
	.ascii	"RESERVED11\000"
.LASF60:
	.ascii	"SSCGR\000"
.LASF78:
	.ascii	"CCR1\000"
.LASF79:
	.ascii	"CCR2\000"
.LASF80:
	.ascii	"CCR3\000"
.LASF81:
	.ascii	"CCR4\000"
.LASF31:
	.ascii	"BSRRL\000"
.LASF58:
	.ascii	"BDCR\000"
.LASF32:
	.ascii	"BSRRH\000"
.LASF13:
	.ascii	"uint8_t\000"
.LASF90:
	.ascii	"volume\000"
.LASF44:
	.ascii	"AHB1ENR\000"
.LASF36:
	.ascii	"CFGR\000"
.LASF25:
	.ascii	"HIFCR\000"
.LASF22:
	.ascii	"LISR\000"
	.ident	"GCC: (GNU Tools for ARM Embedded Processors) 4.9.3 20141119 (release) [ARM/embedded-4_9-branch revision 218278]"
