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
	.file	"usart.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.global	initUSART2
	.thumb
	.thumb_func
	.type	initUSART2, %function
initUSART2:
.LFB110:
	.file 1 "usart.c"
	.loc 1 4 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL0:
	.loc 1 9 0
	ldr	r2, .L3
	.loc 1 11 0
	ldr	r3, .L3+4
	.loc 1 9 0
	ldr	r1, [r2, #48]
	orr	r1, r1, #1
	.loc 1 4 0
	push	{r4}
	.cfi_def_cfa_offset 4
	.cfi_offset 4, -4
	.loc 1 9 0
	str	r1, [r2, #48]
	.loc 1 10 0
	ldr	r1, [r2, #64]
	.loc 1 17 0
	ldr	r4, .L3+8
	.loc 1 10 0
	orr	r1, r1, #131072
	str	r1, [r2, #64]
	.loc 1 11 0
	ldr	r2, [r3]
	orr	r2, r2, #160
	str	r2, [r3]
	.loc 1 12 0
	ldr	r2, [r3, #32]
	orr	r2, r2, #30464
	str	r2, [r3, #32]
	.loc 1 14 0
	ldr	r2, [r3, #8]
	orr	r2, r2, #32
	str	r2, [r3, #8]
	.loc 1 15 0
	ldr	r2, [r3, #8]
	.loc 1 17 0
	uxth	r0, r0
.LVL1:
	.loc 1 15 0
	orr	r2, r2, #128
	.loc 1 18 0
	movw	r1, #8204
	.loc 1 15 0
	str	r2, [r3, #8]
	.loc 1 17 0
	strh	r0, [r4, #8]	@ movhi
	.loc 1 18 0
	strh	r1, [r4, #12]	@ movhi
	.loc 1 19 0
	ldr	r4, [sp], #4
	.cfi_restore 4
	.cfi_def_cfa_offset 0
	bx	lr
.L4:
	.align	2
.L3:
	.word	1073887232
	.word	1073872896
	.word	1073759232
	.cfi_endproc
.LFE110:
	.size	initUSART2, .-initUSART2
	.align	2
	.global	putcharUSART2
	.thumb
	.thumb_func
	.type	putcharUSART2, %function
putcharUSART2:
.LFB111:
	.loc 1 22 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL2:
	.loc 1 23 0
	ldr	r1, .L10
.L6:
	.loc 1 23 0 is_stmt 0 discriminator 1
	ldrh	r3, [r1]
	ldr	r2, .L10
	lsls	r3, r3, #25
	bpl	.L6
	.loc 1 25 0 is_stmt 1
	uxth	r0, r0
.LVL3:
	strh	r0, [r2, #4]	@ movhi
	bx	lr
.L11:
	.align	2
.L10:
	.word	1073759232
	.cfi_endproc
.LFE111:
	.size	putcharUSART2, .-putcharUSART2
	.align	2
	.global	sprintUSART2
	.thumb
	.thumb_func
	.type	sprintUSART2, %function
sprintUSART2:
.LFB113:
	.loc 1 199 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL4:
.LBB14:
.LBB15:
	.loc 1 23 0
	ldr	r2, .L25
.LBE15:
.LBE14:
	.loc 1 199 0
	push	{r4, r5, r6}
	.cfi_def_cfa_offset 12
	.cfi_offset 4, -12
	.cfi_offset 5, -8
	.cfi_offset 6, -4
	subs	r4, r0, #1
	addw	r5, r0, #1023
.LBB18:
.LBB19:
	.loc 1 25 0
	movs	r6, #13
.LBE19:
.LBE18:
.LBB21:
.LBB16:
	.loc 1 23 0
	mov	r0, r2
.LVL5:
.L13:
.LBE16:
.LBE21:
	.loc 1 202 0
	ldrb	r1, [r4, #1]!	@ zero_extendqisi2
.LVL6:
	cbz	r1, .L12
.L21:
.LBB22:
.LBB17:
	.loc 1 23 0
	ldrh	r3, [r2]
	lsls	r3, r3, #25
	bpl	.L21
	.loc 1 25 0
	uxth	r1, r1
	strh	r1, [r0, #4]	@ movhi
.LBE17:
.LBE22:
	.loc 1 205 0
	ldrb	r3, [r4]	@ zero_extendqisi2
	cmp	r3, #10
	beq	.L16
.L15:
.LVL7:
	.loc 1 209 0
	cmp	r4, r5
	bne	.L13
.LVL8:
.L12:
	.loc 1 212 0
	pop	{r4, r5, r6}
	.cfi_remember_state
	.cfi_restore 6
	.cfi_restore 5
	.cfi_restore 4
	.cfi_def_cfa_offset 0
.LVL9:
	bx	lr
.L16:
	.cfi_restore_state
.LBB23:
.LBB20:
	.loc 1 23 0
	ldrh	r3, [r2]
	lsls	r3, r3, #25
	bpl	.L16
	.loc 1 25 0
	strh	r6, [r0, #4]	@ movhi
	b	.L15
.L26:
	.align	2
.L25:
	.word	1073759232
.LBE20:
.LBE23:
	.cfi_endproc
.LFE113:
	.size	sprintUSART2, .-sprintUSART2
	.align	2
	.global	printUSART2
	.thumb
	.thumb_func
	.type	printUSART2, %function
printUSART2:
.LFB112:
	.loc 1 29 0
	.cfi_startproc
	@ args = 4, pretend = 16, frame = 48
	@ frame_needed = 0, uses_anonymous_args = 1
.LVL10:
	push	{r0, r1, r2, r3}
	.cfi_def_cfa_offset 16
	.cfi_offset 0, -16
	.cfi_offset 1, -12
	.cfi_offset 2, -8
	.cfi_offset 3, -4
	push	{r4, r5, r6, r7, r8, lr}
	.cfi_def_cfa_offset 40
	.cfi_offset 4, -40
	.cfi_offset 5, -36
	.cfi_offset 6, -32
	.cfi_offset 7, -28
	.cfi_offset 8, -24
	.cfi_offset 14, -20
	sub	sp, sp, #48
	.cfi_def_cfa_offset 88
	.loc 1 29 0
	add	r3, sp, #72
	ldr	r6, [r3], #4
	.loc 1 39 0
	str	r3, [sp, #4]
.LVL11:
	.loc 1 40 0
	ldrb	r2, [r6]	@ zero_extendqisi2
	cbz	r2, .L27
.LBB24:
.LBB25:
	.loc 1 23 0
	ldr	r4, .L89
.LBE25:
.LBE24:
	.loc 1 40 0
	movs	r3, #0
.LBB28:
.LBB26:
	.loc 1 23 0
	mov	r7, r4
.LBE26:
.LBE28:
	.loc 1 40 0
	mov	r5, r3
	mov	r1, r6
.LBB29:
.LBB30:
	.loc 1 25 0
	mov	r8, #13
.LVL12:
.L58:
.LBE30:
.LBE29:
	.loc 1 42 0
	cmp	r2, #37
	beq	.L78
.L70:
.LBB32:
.LBB27:
	.loc 1 23 0
	ldrh	r3, [r4]
	lsls	r0, r3, #25
	bpl	.L70
	.loc 1 25 0
	uxth	r2, r2
	strh	r2, [r7, #4]	@ movhi
.LBE27:
.LBE32:
	.loc 1 188 0
	ldrb	r3, [r1]	@ zero_extendqisi2
	cmp	r3, #10
	beq	.L57
.L30:
	.loc 1 191 0
	adds	r5, r5, #1
.LVL13:
	uxth	r5, r5
.LVL14:
	.loc 1 40 0
	mov	r3, r5
	ldrb	r2, [r6, r5]	@ zero_extendqisi2
	adds	r1, r6, r5
	cmp	r2, #0
	bne	.L58
.LVL15:
.L27:
	.loc 1 196 0
	add	sp, sp, #48
	.cfi_remember_state
	.cfi_def_cfa_offset 40
.LVL16:
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	.cfi_restore 14
	.cfi_restore 8
	.cfi_restore 7
	.cfi_restore 6
	.cfi_restore 5
	.cfi_restore 4
	.cfi_def_cfa_offset 16
	add	sp, sp, #16
	.cfi_restore 3
	.cfi_restore 2
	.cfi_restore 1
	.cfi_restore 0
	.cfi_def_cfa_offset 0
	bx	lr
.LVL17:
.L57:
	.cfi_restore_state
.LBB33:
.LBB31:
	.loc 1 23 0
	ldrh	r3, [r4]
	lsls	r3, r3, #25
	bpl	.L57
	.loc 1 25 0
	strh	r8, [r7, #4]	@ movhi
	b	.L30
.L78:
.LBE31:
.LBE33:
	.loc 1 44 0
	add	r3, r3, r6
	ldrb	r2, [r3, #1]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L30
	.loc 1 46 0
	subs	r2, r2, #98
	cmp	r2, #22
	bhi	.L31
	tbb	[pc, r2]
.L33:
	.byte	(.L32-.L33)/2
	.byte	(.L34-.L33)/2
	.byte	(.L35-.L33)/2
	.byte	(.L31-.L33)/2
	.byte	(.L36-.L33)/2
	.byte	(.L31-.L33)/2
	.byte	(.L31-.L33)/2
	.byte	(.L31-.L33)/2
	.byte	(.L31-.L33)/2
	.byte	(.L31-.L33)/2
	.byte	(.L31-.L33)/2
	.byte	(.L31-.L33)/2
	.byte	(.L31-.L33)/2
	.byte	(.L31-.L33)/2
	.byte	(.L31-.L33)/2
	.byte	(.L31-.L33)/2
	.byte	(.L31-.L33)/2
	.byte	(.L37-.L33)/2
	.byte	(.L31-.L33)/2
	.byte	(.L31-.L33)/2
	.byte	(.L31-.L33)/2
	.byte	(.L31-.L33)/2
	.byte	(.L38-.L33)/2
	.p2align 1
.L38:
	.loc 1 142 0
	ldrb	r3, [r3, #2]	@ zero_extendqisi2
	cmp	r3, #98
	beq	.L79
	.loc 1 147 0
	cmp	r3, #104
	beq	.L80
	.loc 1 152 0
	cmp	r3, #119
	.loc 1 154 0
	ldr	r3, [sp, #4]
	.loc 1 152 0
	beq	.L81
	.loc 1 159 0
	adds	r2, r3, #4
	.loc 1 161 0
	subs	r5, r5, #1
.LVL18:
	.loc 1 159 0
	ldr	r3, [r3]
	str	r2, [sp, #4]
	.loc 1 161 0
	uxth	r5, r5
	.loc 1 159 0
	str	r3, [sp]
.LVL19:
	.loc 1 160 0
	mov	r0, #2048
	b	.L54
.LVL20:
.L37:
	.loc 1 113 0
	ldr	r3, [sp, #4]
	adds	r2, r3, #4
	.loc 1 114 0
	ldr	r0, [r3]
	.loc 1 113 0
	str	r2, [sp, #4]
.LVL21:
	.loc 1 114 0
	bl	sprintUSART2
.LVL22:
.L61:
	.loc 1 182 0
	adds	r5, r5, #1
.LVL23:
	uxth	r5, r5
.LVL24:
	b	.L30
.L36:
.LBB34:
	.loc 1 120 0
	ldr	r3, [sp, #4]
	adds	r3, r3, #7
	bic	r3, r3, #7
	ldrd	r0, [r3]
.LVL25:
	adds	r3, r3, #8
	.loc 1 122 0
	lsrs	r2, r0, #29
.LVL26:
	.loc 1 124 0
	bic	lr, r1, #-134217728
	.loc 1 127 0
	cmp	r0, #0
	.loc 1 120 0
	str	r3, [sp, #4]
	.loc 1 126 0
	orr	r3, r2, lr, lsl #3
	.loc 1 127 0
	sbcs	r2, r1, #0
.LVL27:
	.loc 1 128 0
	it	lt
	orrlt	r3, r3, #-2147483648
	.loc 1 130 0
	movs	r0, #0
.LVL28:
	and	r1, r1, #1073741824
	.loc 1 128 0
	str	r3, [sp]
	.loc 1 130 0
	orrs	r3, r0, r1
	bne	.L82
.L52:
.LVL29:
.LBE34:
	.loc 1 160 0
	mov	r0, #256
.LVL30:
.L60:
	.loc 1 179 0
	add	r2, sp, #8
	mov	r1, sp
	bl	getStr4NumMISC
.LVL31:
	.loc 1 180 0
	add	r0, sp, #8
	bl	sprintUSART2
.LVL32:
	b	.L61
.L35:
	.loc 1 78 0
	ldrb	r3, [r3, #2]	@ zero_extendqisi2
	cmp	r3, #98
	beq	.L83
	.loc 1 83 0
	cmp	r3, #104
	beq	.L84
	.loc 1 88 0
	cmp	r3, #119
	.loc 1 90 0
	ldr	r3, [sp, #4]
	.loc 1 88 0
	beq	.L85
	.loc 1 95 0
	adds	r2, r3, #4
	.loc 1 97 0
	subs	r5, r5, #1
.LVL33:
	.loc 1 95 0
	ldr	r3, [r3]
	str	r2, [sp, #4]
	.loc 1 97 0
	uxth	r5, r5
	.loc 1 95 0
	str	r3, [sp]
.LVL34:
	.loc 1 96 0
	movs	r0, #32
.LVL35:
	b	.L54
.LVL36:
.L32:
	.loc 1 50 0
	ldrb	r3, [r3, #2]	@ zero_extendqisi2
	cmp	r3, #98
	beq	.L86
	.loc 1 55 0
	cmp	r3, #104
	beq	.L87
	.loc 1 60 0
	cmp	r3, #119
	.loc 1 62 0
	ldr	r3, [sp, #4]
	.loc 1 60 0
	beq	.L88
	.loc 1 67 0
	adds	r2, r3, #4
	.loc 1 69 0
	subs	r5, r5, #1
.LVL37:
	.loc 1 67 0
	ldr	r3, [r3]
	str	r2, [sp, #4]
	.loc 1 69 0
	uxth	r5, r5
	.loc 1 67 0
	str	r3, [sp]
.LVL38:
	.loc 1 68 0
	movs	r0, #4
.LVL39:
.L54:
	.loc 1 164 0
	adds	r5, r5, #1
.LVL40:
	uxth	r5, r5
.LVL41:
	.loc 1 166 0
	b	.L60
.LVL42:
.L34:
.LBB35:
	.loc 1 106 0
	ldr	r3, [sp, #4]
	adds	r1, r3, #4
	ldrb	r2, [r3]	@ zero_extendqisi2
.LVL43:
	str	r1, [sp, #4]
.L48:
.LBB36:
.LBB37:
	.loc 1 23 0
	ldrh	r3, [r4]
	lsls	r3, r3, #25
	bpl	.L48
	.loc 1 25 0
	uxth	r3, r2
	strh	r3, [r7, #4]	@ movhi
.LVL44:
.LBE37:
.LBE36:
	.loc 1 109 0
	b	.L61
.LVL45:
.L31:
.LBE35:
	.loc 1 170 0
	movs	r3, #0
	str	r3, [sp]
.LVL46:
	.loc 1 173 0
	b	.L61
.LVL47:
.L82:
.LBB38:
	.loc 1 131 0
	ldr	r3, [sp]
	orr	r3, r3, #1073741824
	str	r3, [sp]
	b	.L52
.LVL48:
.L83:
.LBE38:
	.loc 1 80 0
	ldr	r3, [sp, #4]
	adds	r2, r3, #4
	ldr	r3, [r3]
	str	r2, [sp, #4]
	str	r3, [sp]
.LVL49:
	.loc 1 81 0
	movs	r0, #8
	b	.L54
.LVL50:
.L86:
	.loc 1 52 0
	ldr	r3, [sp, #4]
	adds	r2, r3, #4
	ldr	r3, [r3]
	str	r2, [sp, #4]
	str	r3, [sp]
.LVL51:
	.loc 1 53 0
	movs	r0, #1
	b	.L54
.LVL52:
.L79:
	.loc 1 144 0
	ldr	r3, [sp, #4]
	adds	r2, r3, #4
	ldr	r3, [r3]
	str	r2, [sp, #4]
	str	r3, [sp]
.LVL53:
	.loc 1 145 0
	mov	r0, #512
	b	.L54
.LVL54:
.L87:
	.loc 1 57 0
	ldr	r3, [sp, #4]
	adds	r2, r3, #4
	ldr	r3, [r3]
	str	r2, [sp, #4]
	str	r3, [sp]
.LVL55:
	.loc 1 58 0
	movs	r0, #2
	b	.L54
.LVL56:
.L80:
	.loc 1 149 0
	ldr	r3, [sp, #4]
	adds	r2, r3, #4
	ldr	r3, [r3]
	str	r2, [sp, #4]
	str	r3, [sp]
.LVL57:
	.loc 1 150 0
	mov	r0, #1024
	b	.L54
.LVL58:
.L84:
	.loc 1 85 0
	ldr	r3, [sp, #4]
	adds	r2, r3, #4
	ldr	r3, [r3]
	str	r2, [sp, #4]
	str	r3, [sp]
.LVL59:
	.loc 1 86 0
	movs	r0, #16
	b	.L54
.LVL60:
.L88:
	.loc 1 62 0
	adds	r2, r3, #4
	ldr	r3, [r3]
	str	r2, [sp, #4]
	str	r3, [sp]
.LVL61:
	.loc 1 63 0
	movs	r0, #4
	b	.L54
.LVL62:
.L81:
	.loc 1 154 0
	adds	r2, r3, #4
	ldr	r3, [r3]
	str	r2, [sp, #4]
	str	r3, [sp]
.LVL63:
	.loc 1 155 0
	mov	r0, #2048
	b	.L54
.LVL64:
.L85:
	.loc 1 90 0
	adds	r2, r3, #4
	ldr	r3, [r3]
	str	r2, [sp, #4]
	str	r3, [sp]
.LVL65:
	.loc 1 91 0
	movs	r0, #32
	b	.L54
.L90:
	.align	2
.L89:
	.word	1073759232
	.cfi_endproc
.LFE112:
	.size	printUSART2, .-printUSART2
	.align	2
	.global	getcharUSART2
	.thumb
	.thumb_func
	.type	getcharUSART2, %function
getcharUSART2:
.LFB114:
	.loc 1 215 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 217 0
	ldr	r1, .L95
	ldrh	r3, [r1, #12]
	uxth	r3, r3
	orr	r3, r3, #8192
	orr	r3, r3, #4
	strh	r3, [r1, #12]	@ movhi
.L92:
	.loc 1 218 0 discriminator 1
	ldrh	r3, [r1]
	ldr	r2, .L95
	lsls	r3, r3, #26
	bpl	.L92
	.loc 1 220 0
	ldrh	r0, [r2, #4]
.LVL66:
	.loc 1 221 0
	ldrh	r3, [r2]
	bic	r3, r3, #32
	lsls	r3, r3, #16
	lsrs	r3, r3, #16
	strh	r3, [r2]	@ movhi
	.loc 1 222 0
	ldrh	r3, [r2, #12]
	bic	r3, r3, #4
	lsls	r3, r3, #16
	lsrs	r3, r3, #16
	.loc 1 224 0
	uxtb	r0, r0
	.loc 1 222 0
	strh	r3, [r2, #12]	@ movhi
	.loc 1 224 0
	bx	lr
.L96:
	.align	2
.L95:
	.word	1073759232
	.cfi_endproc
.LFE114:
	.size	getcharUSART2, .-getcharUSART2
.Letext0:
	.file 2 "/home/wubuntu/msut/STM32F407/gcc-arm-none-eabi/arm-none-eabi/include/machine/_default_types.h"
	.file 3 "/home/wubuntu/msut/STM32F407/gcc-arm-none-eabi/lib/gcc/arm-none-eabi/4.9.3/include/stdarg.h"
	.file 4 "/home/wubuntu/msut/STM32F407/gcc-arm-none-eabi/arm-none-eabi/include/stdint.h"
	.file 5 "../../../../STM32F407/Libraries/CMSIS/ST/STM32F4xx/Include/stm32f4xx.h"
	.file 6 "<built-in>"
	.file 7 "../../../../STM32F407/Libraries/CMSIS/Include/core_cm4.h"
	.file 8 "misc.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x6aa
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF74
	.byte	0x1
	.4byte	.LASF75
	.4byte	.LASF76
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF0
	.uleb128 0x3
	.4byte	.LASF3
	.byte	0x2
	.byte	0x1d
	.4byte	0x37
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF1
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF2
	.uleb128 0x3
	.4byte	.LASF4
	.byte	0x2
	.byte	0x2b
	.4byte	0x50
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF5
	.uleb128 0x3
	.4byte	.LASF6
	.byte	0x2
	.byte	0x3f
	.4byte	0x62
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.4byte	.LASF7
	.uleb128 0x3
	.4byte	.LASF8
	.byte	0x2
	.byte	0x41
	.4byte	0x74
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF9
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF10
	.uleb128 0x3
	.4byte	.LASF11
	.byte	0x2
	.byte	0x5b
	.4byte	0x8d
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
	.byte	0x28
	.4byte	0xad
	.uleb128 0x5
	.4byte	.LASF77
	.byte	0x4
	.byte	0x6
	.byte	0
	.4byte	0xc4
	.uleb128 0x6
	.4byte	.LASF78
	.4byte	0xc4
	.byte	0
	.byte	0
	.uleb128 0x7
	.byte	0x4
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF15
	.uleb128 0x8
	.byte	0x4
	.4byte	0xd3
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF16
	.uleb128 0x3
	.4byte	.LASF17
	.byte	0x3
	.byte	0x62
	.4byte	0xa2
	.uleb128 0x3
	.4byte	.LASF18
	.byte	0x4
	.byte	0x15
	.4byte	0x2c
	.uleb128 0x3
	.4byte	.LASF19
	.byte	0x4
	.byte	0x21
	.4byte	0x45
	.uleb128 0x3
	.4byte	.LASF20
	.byte	0x4
	.byte	0x2c
	.4byte	0x57
	.uleb128 0x3
	.4byte	.LASF21
	.byte	0x4
	.byte	0x2d
	.4byte	0x69
	.uleb128 0x3
	.4byte	.LASF22
	.byte	0x4
	.byte	0x39
	.4byte	0x82
	.uleb128 0x9
	.4byte	0x106
	.uleb128 0xa
	.4byte	0x106
	.4byte	0x131
	.uleb128 0xb
	.4byte	0xc6
	.byte	0x1
	.byte	0
	.uleb128 0x9
	.4byte	0xf0
	.uleb128 0x9
	.4byte	0xfb
	.uleb128 0xc
	.byte	0x28
	.byte	0x5
	.2byte	0x28e
	.4byte	0x1c7
	.uleb128 0xd
	.4byte	.LASF23
	.byte	0x5
	.2byte	0x290
	.4byte	0x11c
	.byte	0
	.uleb128 0xd
	.4byte	.LASF24
	.byte	0x5
	.2byte	0x291
	.4byte	0x11c
	.byte	0x4
	.uleb128 0xd
	.4byte	.LASF25
	.byte	0x5
	.2byte	0x292
	.4byte	0x11c
	.byte	0x8
	.uleb128 0xd
	.4byte	.LASF26
	.byte	0x5
	.2byte	0x293
	.4byte	0x11c
	.byte	0xc
	.uleb128 0xe
	.ascii	"IDR\000"
	.byte	0x5
	.2byte	0x294
	.4byte	0x11c
	.byte	0x10
	.uleb128 0xe
	.ascii	"ODR\000"
	.byte	0x5
	.2byte	0x295
	.4byte	0x11c
	.byte	0x14
	.uleb128 0xd
	.4byte	.LASF27
	.byte	0x5
	.2byte	0x296
	.4byte	0x131
	.byte	0x18
	.uleb128 0xd
	.4byte	.LASF28
	.byte	0x5
	.2byte	0x297
	.4byte	0x131
	.byte	0x1a
	.uleb128 0xd
	.4byte	.LASF29
	.byte	0x5
	.2byte	0x298
	.4byte	0x11c
	.byte	0x1c
	.uleb128 0xe
	.ascii	"AFR\000"
	.byte	0x5
	.2byte	0x299
	.4byte	0x1c7
	.byte	0x20
	.byte	0
	.uleb128 0x9
	.4byte	0x121
	.uleb128 0xf
	.4byte	.LASF30
	.byte	0x5
	.2byte	0x29a
	.4byte	0x13b
	.uleb128 0xc
	.byte	0x88
	.byte	0x5
	.2byte	0x2dd
	.4byte	0x367
	.uleb128 0xe
	.ascii	"CR\000"
	.byte	0x5
	.2byte	0x2df
	.4byte	0x11c
	.byte	0
	.uleb128 0xd
	.4byte	.LASF31
	.byte	0x5
	.2byte	0x2e0
	.4byte	0x11c
	.byte	0x4
	.uleb128 0xd
	.4byte	.LASF32
	.byte	0x5
	.2byte	0x2e1
	.4byte	0x11c
	.byte	0x8
	.uleb128 0xe
	.ascii	"CIR\000"
	.byte	0x5
	.2byte	0x2e2
	.4byte	0x11c
	.byte	0xc
	.uleb128 0xd
	.4byte	.LASF33
	.byte	0x5
	.2byte	0x2e3
	.4byte	0x11c
	.byte	0x10
	.uleb128 0xd
	.4byte	.LASF34
	.byte	0x5
	.2byte	0x2e4
	.4byte	0x11c
	.byte	0x14
	.uleb128 0xd
	.4byte	.LASF35
	.byte	0x5
	.2byte	0x2e5
	.4byte	0x11c
	.byte	0x18
	.uleb128 0xd
	.4byte	.LASF36
	.byte	0x5
	.2byte	0x2e6
	.4byte	0x106
	.byte	0x1c
	.uleb128 0xd
	.4byte	.LASF37
	.byte	0x5
	.2byte	0x2e7
	.4byte	0x11c
	.byte	0x20
	.uleb128 0xd
	.4byte	.LASF38
	.byte	0x5
	.2byte	0x2e8
	.4byte	0x11c
	.byte	0x24
	.uleb128 0xd
	.4byte	.LASF39
	.byte	0x5
	.2byte	0x2e9
	.4byte	0x121
	.byte	0x28
	.uleb128 0xd
	.4byte	.LASF40
	.byte	0x5
	.2byte	0x2ea
	.4byte	0x11c
	.byte	0x30
	.uleb128 0xd
	.4byte	.LASF41
	.byte	0x5
	.2byte	0x2eb
	.4byte	0x11c
	.byte	0x34
	.uleb128 0xd
	.4byte	.LASF42
	.byte	0x5
	.2byte	0x2ec
	.4byte	0x11c
	.byte	0x38
	.uleb128 0xd
	.4byte	.LASF43
	.byte	0x5
	.2byte	0x2ed
	.4byte	0x106
	.byte	0x3c
	.uleb128 0xd
	.4byte	.LASF44
	.byte	0x5
	.2byte	0x2ee
	.4byte	0x11c
	.byte	0x40
	.uleb128 0xd
	.4byte	.LASF45
	.byte	0x5
	.2byte	0x2ef
	.4byte	0x11c
	.byte	0x44
	.uleb128 0xd
	.4byte	.LASF46
	.byte	0x5
	.2byte	0x2f0
	.4byte	0x121
	.byte	0x48
	.uleb128 0xd
	.4byte	.LASF47
	.byte	0x5
	.2byte	0x2f1
	.4byte	0x11c
	.byte	0x50
	.uleb128 0xd
	.4byte	.LASF48
	.byte	0x5
	.2byte	0x2f2
	.4byte	0x11c
	.byte	0x54
	.uleb128 0xd
	.4byte	.LASF49
	.byte	0x5
	.2byte	0x2f3
	.4byte	0x11c
	.byte	0x58
	.uleb128 0xd
	.4byte	.LASF50
	.byte	0x5
	.2byte	0x2f4
	.4byte	0x106
	.byte	0x5c
	.uleb128 0xd
	.4byte	.LASF51
	.byte	0x5
	.2byte	0x2f5
	.4byte	0x11c
	.byte	0x60
	.uleb128 0xd
	.4byte	.LASF52
	.byte	0x5
	.2byte	0x2f6
	.4byte	0x11c
	.byte	0x64
	.uleb128 0xd
	.4byte	.LASF53
	.byte	0x5
	.2byte	0x2f7
	.4byte	0x121
	.byte	0x68
	.uleb128 0xd
	.4byte	.LASF54
	.byte	0x5
	.2byte	0x2f8
	.4byte	0x11c
	.byte	0x70
	.uleb128 0xe
	.ascii	"CSR\000"
	.byte	0x5
	.2byte	0x2f9
	.4byte	0x11c
	.byte	0x74
	.uleb128 0xd
	.4byte	.LASF55
	.byte	0x5
	.2byte	0x2fa
	.4byte	0x121
	.byte	0x78
	.uleb128 0xd
	.4byte	.LASF56
	.byte	0x5
	.2byte	0x2fb
	.4byte	0x11c
	.byte	0x80
	.uleb128 0xd
	.4byte	.LASF57
	.byte	0x5
	.2byte	0x2fc
	.4byte	0x11c
	.byte	0x84
	.byte	0
	.uleb128 0xf
	.4byte	.LASF58
	.byte	0x5
	.2byte	0x2fd
	.4byte	0x1d8
	.uleb128 0xc
	.byte	0x1c
	.byte	0x5
	.2byte	0x395
	.4byte	0x431
	.uleb128 0xe
	.ascii	"SR\000"
	.byte	0x5
	.2byte	0x397
	.4byte	0x131
	.byte	0
	.uleb128 0xd
	.4byte	.LASF36
	.byte	0x5
	.2byte	0x398
	.4byte	0xf0
	.byte	0x2
	.uleb128 0xe
	.ascii	"DR\000"
	.byte	0x5
	.2byte	0x399
	.4byte	0x131
	.byte	0x4
	.uleb128 0xd
	.4byte	.LASF39
	.byte	0x5
	.2byte	0x39a
	.4byte	0xf0
	.byte	0x6
	.uleb128 0xe
	.ascii	"BRR\000"
	.byte	0x5
	.2byte	0x39b
	.4byte	0x131
	.byte	0x8
	.uleb128 0xd
	.4byte	.LASF43
	.byte	0x5
	.2byte	0x39c
	.4byte	0xf0
	.byte	0xa
	.uleb128 0xe
	.ascii	"CR1\000"
	.byte	0x5
	.2byte	0x39d
	.4byte	0x131
	.byte	0xc
	.uleb128 0xd
	.4byte	.LASF46
	.byte	0x5
	.2byte	0x39e
	.4byte	0xf0
	.byte	0xe
	.uleb128 0xe
	.ascii	"CR2\000"
	.byte	0x5
	.2byte	0x39f
	.4byte	0x131
	.byte	0x10
	.uleb128 0xd
	.4byte	.LASF50
	.byte	0x5
	.2byte	0x3a0
	.4byte	0xf0
	.byte	0x12
	.uleb128 0xe
	.ascii	"CR3\000"
	.byte	0x5
	.2byte	0x3a1
	.4byte	0x131
	.byte	0x14
	.uleb128 0xd
	.4byte	.LASF53
	.byte	0x5
	.2byte	0x3a2
	.4byte	0xf0
	.byte	0x16
	.uleb128 0xd
	.4byte	.LASF59
	.byte	0x5
	.2byte	0x3a3
	.4byte	0x131
	.byte	0x18
	.uleb128 0xd
	.4byte	.LASF55
	.byte	0x5
	.2byte	0x3a4
	.4byte	0xf0
	.byte	0x1a
	.byte	0
	.uleb128 0xf
	.4byte	.LASF60
	.byte	0x5
	.2byte	0x3a5
	.4byte	0x373
	.uleb128 0x10
	.4byte	.LASF79
	.byte	0x1
	.byte	0x15
	.byte	0x1
	.4byte	0x455
	.uleb128 0x11
	.4byte	.LASF73
	.byte	0x1
	.byte	0x15
	.4byte	0xe5
	.byte	0
	.uleb128 0x12
	.4byte	.LASF61
	.byte	0x1
	.byte	0x3
	.4byte	.LFB110
	.4byte	.LFE110-.LFB110
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x47a
	.uleb128 0x13
	.4byte	.LASF63
	.byte	0x1
	.byte	0x3
	.4byte	0x106
	.4byte	.LLST0
	.byte	0
	.uleb128 0x14
	.4byte	0x43d
	.4byte	.LFB111
	.4byte	.LFE111-.LFB111
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x497
	.uleb128 0x15
	.4byte	0x449
	.4byte	.LLST1
	.byte	0
	.uleb128 0x12
	.4byte	.LASF62
	.byte	0x1
	.byte	0xc6
	.4byte	.LFB113
	.4byte	.LFE113-.LFB113
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x4f7
	.uleb128 0x16
	.ascii	"str\000"
	.byte	0x1
	.byte	0xc6
	.4byte	0x4f7
	.4byte	.LLST2
	.uleb128 0x17
	.ascii	"k\000"
	.byte	0x1
	.byte	0xc8
	.4byte	0xf0
	.4byte	.LLST3
	.uleb128 0x18
	.4byte	0x43d
	.4byte	.LBB14
	.4byte	.Ldebug_ranges0+0
	.byte	0x1
	.byte	0xcc
	.4byte	0x4e1
	.uleb128 0x19
	.4byte	0x449
	.byte	0
	.uleb128 0x1a
	.4byte	0x43d
	.4byte	.LBB18
	.4byte	.Ldebug_ranges0+0x20
	.byte	0x1
	.byte	0xce
	.uleb128 0x19
	.4byte	0x449
	.byte	0
	.byte	0
	.uleb128 0x8
	.byte	0x4
	.4byte	0xe5
	.uleb128 0x12
	.4byte	.LASF64
	.byte	0x1
	.byte	0x1c
	.4byte	.LFB112
	.4byte	.LFE112-.LFB112
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x64d
	.uleb128 0x1b
	.ascii	"str\000"
	.byte	0x1
	.byte	0x1c
	.4byte	0xcd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x1c
	.uleb128 0x1d
	.4byte	.LASF65
	.byte	0x1
	.byte	0x1e
	.4byte	0x64d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x17
	.ascii	"k\000"
	.byte	0x1
	.byte	0x1f
	.4byte	0xf0
	.4byte	.LLST4
	.uleb128 0x1e
	.4byte	.LASF66
	.byte	0x1
	.byte	0x20
	.4byte	0xf0
	.4byte	.LLST5
	.uleb128 0x1d
	.4byte	.LASF67
	.byte	0x1
	.byte	0x21
	.4byte	0x106
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x1e
	.4byte	.LASF68
	.byte	0x1
	.byte	0x22
	.4byte	0x65d
	.4byte	.LLST6
	.uleb128 0x1e
	.4byte	.LASF69
	.byte	0x1
	.byte	0x23
	.4byte	0xcd
	.4byte	.LLST7
	.uleb128 0x1f
	.ascii	"vl\000"
	.byte	0x1
	.byte	0x24
	.4byte	0xda
	.uleb128 0x3
	.byte	0x91
	.sleb128 -84
	.uleb128 0x18
	.4byte	0x43d
	.4byte	.LBB24
	.4byte	.Ldebug_ranges0+0x38
	.byte	0x1
	.byte	0xbb
	.4byte	0x5a0
	.uleb128 0x19
	.4byte	0x449
	.byte	0
	.uleb128 0x18
	.4byte	0x43d
	.4byte	.LBB29
	.4byte	.Ldebug_ranges0+0x58
	.byte	0x1
	.byte	0xbd
	.4byte	0x5b9
	.uleb128 0x19
	.4byte	0x449
	.byte	0
	.uleb128 0x20
	.4byte	.Ldebug_ranges0+0x70
	.4byte	0x5e1
	.uleb128 0x1e
	.4byte	.LASF70
	.byte	0x1
	.byte	0x78
	.4byte	0x111
	.4byte	.LLST8
	.uleb128 0x1e
	.4byte	.LASF71
	.byte	0x1
	.byte	0x79
	.4byte	0x106
	.4byte	.LLST9
	.byte	0
	.uleb128 0x21
	.4byte	.LBB35
	.4byte	.LBE35-.LBB35
	.4byte	0x617
	.uleb128 0x1e
	.4byte	.LASF72
	.byte	0x1
	.byte	0x6a
	.4byte	0xd3
	.4byte	.LLST10
	.uleb128 0x22
	.4byte	0x43d
	.4byte	.LBB36
	.4byte	.LBE36-.LBB36
	.byte	0x1
	.byte	0x6b
	.uleb128 0x15
	.4byte	0x449
	.4byte	.LLST10
	.byte	0
	.byte	0
	.uleb128 0x23
	.4byte	.LVL22
	.4byte	0x497
	.uleb128 0x24
	.4byte	.LVL31
	.4byte	0x696
	.4byte	0x63b
	.uleb128 0x25
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x3
	.byte	0x91
	.sleb128 -112
	.uleb128 0x25
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.uleb128 0x26
	.4byte	.LVL32
	.4byte	0x497
	.uleb128 0x25
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x3
	.byte	0x91
	.sleb128 -112
	.byte	0
	.byte	0
	.uleb128 0xa
	.4byte	0xe5
	.4byte	0x65d
	.uleb128 0xb
	.4byte	0xc6
	.byte	0x27
	.byte	0
	.uleb128 0x8
	.byte	0x4
	.4byte	0x106
	.uleb128 0x27
	.4byte	.LASF80
	.byte	0x1
	.byte	0xd6
	.4byte	0xe5
	.4byte	.LFB114
	.4byte	.LFE114-.LFB114
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x68a
	.uleb128 0x1d
	.4byte	.LASF73
	.byte	0x1
	.byte	0xd8
	.4byte	0xe5
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x28
	.4byte	.LASF81
	.byte	0x7
	.2byte	0x51b
	.4byte	0x136
	.uleb128 0x29
	.4byte	.LASF82
	.byte	0x8
	.byte	0x1b
	.uleb128 0x2a
	.4byte	0xf0
	.uleb128 0x2a
	.4byte	0x65d
	.uleb128 0x2a
	.4byte	0x4f7
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
	.uleb128 0x6
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.uleb128 0x34
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xc
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
	.uleb128 0xd
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
	.uleb128 0xe
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
	.uleb128 0xf
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
	.uleb128 0x10
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
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
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
	.byte	0
	.byte	0
	.uleb128 0x12
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
	.uleb128 0x13
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
	.uleb128 0x14
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x31
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
	.uleb128 0x15
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x16
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
	.uleb128 0x17
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
	.uleb128 0x18
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1b
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
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1d
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
	.uleb128 0x1e
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
	.uleb128 0x1f
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
	.uleb128 0x20
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x21
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
	.uleb128 0x22
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x24
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
	.uleb128 0x25
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x2111
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x26
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x27
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
	.uleb128 0x28
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
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x2a
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",%progbits
.Ldebug_loc0:
.LLST0:
	.4byte	.LVL0-.Ltext0
	.4byte	.LVL1-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL1-.Ltext0
	.4byte	.LFE110-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL2-.Ltext0
	.4byte	.LVL3-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL3-.Ltext0
	.4byte	.LFE111-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL4-.Ltext0
	.4byte	.LVL5-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL5-.Ltext0
	.4byte	.LVL9-.Ltext0
	.2byte	0x4
	.byte	0x75
	.sleb128 -1023
	.byte	0x9f
	.4byte	.LVL9-.Ltext0
	.4byte	.LFE113-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST3:
	.4byte	.LVL4-.Ltext0
	.4byte	.LVL5-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL5-.Ltext0
	.4byte	.LVL6-.Ltext0
	.2byte	0x7
	.byte	0x74
	.sleb128 0
	.byte	0x75
	.sleb128 -1024
	.byte	0x1c
	.byte	0x9f
	.4byte	.LVL7-.Ltext0
	.4byte	.LVL8-.Ltext0
	.2byte	0x7
	.byte	0x74
	.sleb128 0
	.byte	0x75
	.sleb128 -1024
	.byte	0x1c
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST4:
	.4byte	.LVL10-.Ltext0
	.4byte	.LVL12-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL12-.Ltext0
	.4byte	.LVL13-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL14-.Ltext0
	.4byte	.LVL15-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL17-.Ltext0
	.4byte	.LVL18-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL19-.Ltext0
	.4byte	.LVL23-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL24-.Ltext0
	.4byte	.LVL33-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL34-.Ltext0
	.4byte	.LVL37-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL38-.Ltext0
	.4byte	.LVL40-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL41-.Ltext0
	.4byte	.LFE112-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	0
	.4byte	0
.LLST5:
	.4byte	.LVL19-.Ltext0
	.4byte	.LVL20-.Ltext0
	.2byte	0x4
	.byte	0xa
	.2byte	0x800
	.byte	0x9f
	.4byte	.LVL29-.Ltext0
	.4byte	.LVL30-.Ltext0
	.2byte	0x4
	.byte	0xa
	.2byte	0x100
	.byte	0x9f
	.4byte	.LVL30-.Ltext0
	.4byte	.LVL31-1-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL34-.Ltext0
	.4byte	.LVL35-.Ltext0
	.2byte	0x3
	.byte	0x8
	.byte	0x20
	.byte	0x9f
	.4byte	.LVL35-.Ltext0
	.4byte	.LVL36-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL38-.Ltext0
	.4byte	.LVL39-.Ltext0
	.2byte	0x2
	.byte	0x34
	.byte	0x9f
	.4byte	.LVL39-.Ltext0
	.4byte	.LVL42-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL44-.Ltext0
	.4byte	.LVL45-.Ltext0
	.2byte	0x3
	.byte	0x8
	.byte	0x40
	.byte	0x9f
	.4byte	.LVL46-.Ltext0
	.4byte	.LVL47-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL49-.Ltext0
	.4byte	.LVL50-.Ltext0
	.2byte	0x2
	.byte	0x38
	.byte	0x9f
	.4byte	.LVL51-.Ltext0
	.4byte	.LVL52-.Ltext0
	.2byte	0x2
	.byte	0x31
	.byte	0x9f
	.4byte	.LVL53-.Ltext0
	.4byte	.LVL54-.Ltext0
	.2byte	0x4
	.byte	0xa
	.2byte	0x200
	.byte	0x9f
	.4byte	.LVL55-.Ltext0
	.4byte	.LVL56-.Ltext0
	.2byte	0x2
	.byte	0x32
	.byte	0x9f
	.4byte	.LVL57-.Ltext0
	.4byte	.LVL58-.Ltext0
	.2byte	0x4
	.byte	0xa
	.2byte	0x400
	.byte	0x9f
	.4byte	.LVL59-.Ltext0
	.4byte	.LVL60-.Ltext0
	.2byte	0x2
	.byte	0x40
	.byte	0x9f
	.4byte	.LVL61-.Ltext0
	.4byte	.LVL62-.Ltext0
	.2byte	0x2
	.byte	0x34
	.byte	0x9f
	.4byte	.LVL63-.Ltext0
	.4byte	.LVL64-.Ltext0
	.2byte	0x4
	.byte	0xa
	.2byte	0x800
	.byte	0x9f
	.4byte	.LVL65-.Ltext0
	.4byte	.LFE112-.Ltext0
	.2byte	0x3
	.byte	0x8
	.byte	0x20
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST6:
	.4byte	.LVL11-.Ltext0
	.4byte	.LVL16-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.4byte	.LVL16-.Ltext0
	.4byte	.LVL17-.Ltext0
	.2byte	0x4
	.byte	0x91
	.sleb128 -120
	.byte	0x9f
	.4byte	.LVL17-.Ltext0
	.4byte	.LFE112-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.4byte	0
	.4byte	0
.LLST7:
	.4byte	.LVL21-.Ltext0
	.4byte	.LVL22-1-.Ltext0
	.2byte	0x2
	.byte	0x73
	.sleb128 0
	.4byte	0
	.4byte	0
.LLST8:
	.4byte	.LVL25-.Ltext0
	.4byte	.LVL28-.Ltext0
	.2byte	0x6
	.byte	0x50
	.byte	0x93
	.uleb128 0x4
	.byte	0x51
	.byte	0x93
	.uleb128 0x4
	.4byte	.LVL28-.Ltext0
	.4byte	.LVL30-.Ltext0
	.2byte	0x6
	.byte	0x91
	.sleb128 -116
	.byte	0x6
	.byte	0x38
	.byte	0x1c
	.4byte	.LVL47-.Ltext0
	.4byte	.LVL48-.Ltext0
	.2byte	0x6
	.byte	0x91
	.sleb128 -116
	.byte	0x6
	.byte	0x38
	.byte	0x1c
	.4byte	0
	.4byte	0
.LLST9:
	.4byte	.LVL25-.Ltext0
	.4byte	.LVL26-.Ltext0
	.2byte	0x5
	.byte	0x70
	.sleb128 0
	.byte	0x4d
	.byte	0x25
	.byte	0x9f
	.4byte	.LVL26-.Ltext0
	.4byte	.LVL27-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL27-.Ltext0
	.4byte	.LVL28-.Ltext0
	.2byte	0x5
	.byte	0x70
	.sleb128 0
	.byte	0x4d
	.byte	0x25
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST10:
	.4byte	.LVL43-.Ltext0
	.4byte	.LVL45-.Ltext0
	.2byte	0x1
	.byte	0x52
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
	.4byte	.LBB14-.Ltext0
	.4byte	.LBE14-.Ltext0
	.4byte	.LBB21-.Ltext0
	.4byte	.LBE21-.Ltext0
	.4byte	.LBB22-.Ltext0
	.4byte	.LBE22-.Ltext0
	.4byte	0
	.4byte	0
	.4byte	.LBB18-.Ltext0
	.4byte	.LBE18-.Ltext0
	.4byte	.LBB23-.Ltext0
	.4byte	.LBE23-.Ltext0
	.4byte	0
	.4byte	0
	.4byte	.LBB24-.Ltext0
	.4byte	.LBE24-.Ltext0
	.4byte	.LBB28-.Ltext0
	.4byte	.LBE28-.Ltext0
	.4byte	.LBB32-.Ltext0
	.4byte	.LBE32-.Ltext0
	.4byte	0
	.4byte	0
	.4byte	.LBB29-.Ltext0
	.4byte	.LBE29-.Ltext0
	.4byte	.LBB33-.Ltext0
	.4byte	.LBE33-.Ltext0
	.4byte	0
	.4byte	0
	.4byte	.LBB34-.Ltext0
	.4byte	.LBE34-.Ltext0
	.4byte	.LBB38-.Ltext0
	.4byte	.LBE38-.Ltext0
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF47:
	.ascii	"AHB1LPENR\000"
.LASF25:
	.ascii	"OSPEEDR\000"
.LASF37:
	.ascii	"APB1RSTR\000"
.LASF41:
	.ascii	"AHB2ENR\000"
.LASF73:
	.ascii	"data\000"
.LASF22:
	.ascii	"uint64_t\000"
.LASF2:
	.ascii	"short int\000"
.LASF15:
	.ascii	"sizetype\000"
.LASF54:
	.ascii	"BDCR\000"
.LASF57:
	.ascii	"PLLI2SCFGR\000"
.LASF8:
	.ascii	"__uint32_t\000"
.LASF76:
	.ascii	"/home/wubuntu/msut/STM32F407/projects/p6/PROJEKAT_R"
	.ascii	"ADI_PRENOS_ZVUKA\000"
.LASF4:
	.ascii	"__uint16_t\000"
.LASF60:
	.ascii	"USART_TypeDef\000"
.LASF34:
	.ascii	"AHB2RSTR\000"
.LASF72:
	.ascii	"tchar\000"
.LASF33:
	.ascii	"AHB1RSTR\000"
.LASF32:
	.ascii	"CFGR\000"
.LASF49:
	.ascii	"AHB3LPENR\000"
.LASF17:
	.ascii	"va_list\000"
.LASF18:
	.ascii	"uint8_t\000"
.LASF44:
	.ascii	"APB1ENR\000"
.LASF62:
	.ascii	"sprintUSART2\000"
.LASF74:
	.ascii	"GNU C 4.9.3 20141119 (release) [ARM/embedded-4_9-br"
	.ascii	"anch revision 218278] -mlittle-endian -mthumb -mcpu"
	.ascii	"=cortex-m4 -mthumb-interwork -mfloat-abi=hard -mfpu"
	.ascii	"=fpv4-sp-d16 -g -O2 -fsingle-precision-constant\000"
.LASF24:
	.ascii	"OTYPER\000"
.LASF0:
	.ascii	"signed char\000"
.LASF66:
	.ascii	"arg_type\000"
.LASF10:
	.ascii	"long long int\000"
.LASF26:
	.ascii	"PUPDR\000"
.LASF77:
	.ascii	"__va_list\000"
.LASF7:
	.ascii	"long int\000"
.LASF61:
	.ascii	"initUSART2\000"
.LASF58:
	.ascii	"RCC_TypeDef\000"
.LASF28:
	.ascii	"BSRRH\000"
.LASF23:
	.ascii	"MODER\000"
.LASF38:
	.ascii	"APB2RSTR\000"
.LASF3:
	.ascii	"__uint8_t\000"
.LASF79:
	.ascii	"putcharUSART2\000"
.LASF42:
	.ascii	"AHB3ENR\000"
.LASF59:
	.ascii	"GTPR\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF45:
	.ascii	"APB2ENR\000"
.LASF75:
	.ascii	"usart.c\000"
.LASF12:
	.ascii	"long long unsigned int\000"
.LASF21:
	.ascii	"uint32_t\000"
.LASF13:
	.ascii	"unsigned int\000"
.LASF78:
	.ascii	"__ap\000"
.LASF19:
	.ascii	"uint16_t\000"
.LASF63:
	.ascii	"baudrate\000"
.LASF80:
	.ascii	"getcharUSART2\000"
.LASF9:
	.ascii	"long unsigned int\000"
.LASF31:
	.ascii	"PLLCFGR\000"
.LASF70:
	.ascii	"utmp64\000"
.LASF51:
	.ascii	"APB1LPENR\000"
.LASF68:
	.ascii	"p_uint32\000"
.LASF64:
	.ascii	"printUSART2\000"
.LASF16:
	.ascii	"char\000"
.LASF20:
	.ascii	"int32_t\000"
.LASF5:
	.ascii	"short unsigned int\000"
.LASF56:
	.ascii	"SSCGR\000"
.LASF11:
	.ascii	"__uint64_t\000"
.LASF82:
	.ascii	"getStr4NumMISC\000"
.LASF48:
	.ascii	"AHB2LPENR\000"
.LASF71:
	.ascii	"tmp1\000"
.LASF36:
	.ascii	"RESERVED0\000"
.LASF39:
	.ascii	"RESERVED1\000"
.LASF43:
	.ascii	"RESERVED2\000"
.LASF46:
	.ascii	"RESERVED3\000"
.LASF50:
	.ascii	"RESERVED4\000"
.LASF53:
	.ascii	"RESERVED5\000"
.LASF55:
	.ascii	"RESERVED6\000"
.LASF81:
	.ascii	"ITM_RxBuffer\000"
.LASF40:
	.ascii	"AHB1ENR\000"
.LASF67:
	.ascii	"utmp32\000"
.LASF6:
	.ascii	"__int32_t\000"
.LASF65:
	.ascii	"rstr\000"
.LASF69:
	.ascii	"p_char\000"
.LASF14:
	.ascii	"__gnuc_va_list\000"
.LASF30:
	.ascii	"GPIO_TypeDef\000"
.LASF35:
	.ascii	"AHB3RSTR\000"
.LASF27:
	.ascii	"BSRRL\000"
.LASF29:
	.ascii	"LCKR\000"
.LASF52:
	.ascii	"APB2LPENR\000"
	.ident	"GCC: (GNU Tools for ARM Embedded Processors) 4.9.3 20141119 (release) [ARM/embedded-4_9-branch revision 218278]"
