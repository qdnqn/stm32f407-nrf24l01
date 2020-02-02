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
	.file	"nrf24l01.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.global	setRegNRF24L01
	.thumb
	.thumb_func
	.type	setRegNRF24L01, %function
setRegNRF24L01:
.LFB112:
	.file 1 "nrf24l01.c"
	.loc 1 78 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL0:
	push	{r4, r5, r6, lr}
	.cfi_def_cfa_offset 16
	.cfi_offset 4, -16
	.cfi_offset 5, -12
	.cfi_offset 6, -8
	.cfi_offset 14, -4
	sub	sp, sp, #8
	.cfi_def_cfa_offset 24
	.loc 1 80 0
	and	r3, r0, #31
	.loc 1 81 0
	add	r0, sp, #8
.LVL1:
	orr	r3, r3, #32
	.loc 1 83 0
	ldr	r4, .L3
	.loc 1 81 0
	strb	r3, [r0, #-1]!
	.loc 1 83 0
	ldr	r3, [r4, #20]
	bic	r3, r3, #32768
	.loc 1 78 0
	mov	r5, r2
	.loc 1 83 0
	str	r3, [r4, #20]
	.loc 1 78 0
	mov	r6, r1
	.loc 1 84 0
	movs	r1, #1
.LVL2:
	bl	txSPI1
.LVL3:
	.loc 1 85 0
	mov	r0, r6
	mov	r1, r5
	bl	txSPI1
.LVL4:
	.loc 1 86 0
	ldr	r3, [r4, #20]
	orr	r3, r3, #32768
	str	r3, [r4, #20]
	.loc 1 87 0
	add	sp, sp, #8
	.cfi_def_cfa_offset 16
	@ sp needed
	pop	{r4, r5, r6, pc}
.LVL5:
.L4:
	.align	2
.L3:
	.word	1073872896
	.cfi_endproc
.LFE112:
	.size	setRegNRF24L01, .-setRegNRF24L01
	.align	2
	.global	setRxAddrNRF24L01
	.thumb
	.thumb_func
	.type	setRxAddrNRF24L01, %function
setRxAddrNRF24L01:
.LFB111:
	.loc 1 71 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL6:
	push	{r4, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 4, -8
	.cfi_offset 14, -4
	.loc 1 72 0
	ldr	r4, .L7
	ldr	r3, [r4, #20]
	.loc 1 71 0
	mov	r2, r0
	.loc 1 72 0
	bic	r3, r3, #2048
	.loc 1 73 0
	mov	r0, r1
.LVL7:
	.loc 1 72 0
	str	r3, [r4, #20]
	.loc 1 73 0
	mov	r1, r2
.LVL8:
	movs	r2, #5
.LVL9:
	bl	setRegNRF24L01
.LVL10:
	.loc 1 74 0
	ldr	r3, [r4, #20]
	orr	r3, r3, #2048
	str	r3, [r4, #20]
	pop	{r4, pc}
.L8:
	.align	2
.L7:
	.word	1073873920
	.cfi_endproc
.LFE111:
	.size	setRxAddrNRF24L01, .-setRxAddrNRF24L01
	.align	2
	.global	conRegNRF24L01
	.thumb
	.thumb_func
	.type	conRegNRF24L01, %function
conRegNRF24L01:
.LFB113:
	.loc 1 90 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL11:
	push	{r4, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 4, -8
	.cfi_offset 14, -4
	sub	sp, sp, #8
	.cfi_def_cfa_offset 16
	.loc 1 92 0
	and	r3, r0, #31
	.loc 1 93 0
	add	r0, sp, #8
.LVL12:
	orr	r3, r3, #32
	.loc 1 95 0
	ldr	r4, .L11
	.loc 1 93 0
	strb	r3, [r0, #-1]!
	.loc 1 90 0
	strb	r1, [sp, #6]
	.loc 1 95 0
	ldr	r3, [r4, #20]
	bic	r3, r3, #32768
	str	r3, [r4, #20]
	.loc 1 96 0
	movs	r1, #1
.LVL13:
	bl	txSPI1
.LVL14:
	.loc 1 97 0
	add	r0, sp, #6
	movs	r1, #1
	bl	txSPI1
.LVL15:
	.loc 1 98 0
	ldr	r3, [r4, #20]
	orr	r3, r3, #32768
	str	r3, [r4, #20]
	.loc 1 99 0
	add	sp, sp, #8
	.cfi_def_cfa_offset 8
	@ sp needed
	pop	{r4, pc}
.L12:
	.align	2
.L11:
	.word	1073872896
	.cfi_endproc
.LFE113:
	.size	conRegNRF24L01, .-conRegNRF24L01
	.align	2
	.global	setRxModeNRF24L01
	.thumb
	.thumb_func
	.type	setRxModeNRF24L01, %function
setRxModeNRF24L01:
.LFB114:
	.loc 1 102 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	.cfi_offset 14, -4
	.loc 1 103 0
	ldr	r2, .L15
	movs	r3, #0
	.loc 1 105 0
	mov	r0, r3
	movs	r1, #11
	.loc 1 103 0
	strb	r3, [r2]
	.loc 1 105 0
	bl	conRegNRF24L01
.LVL16:
	.loc 1 106 0
	ldr	r2, .L15+4
	ldr	r3, [r2, #20]
	orr	r3, r3, #2048
	str	r3, [r2, #20]
	.loc 1 107 0
	movs	r0, #130
	bl	delay_us
.LVL17:
	.loc 1 108 0
	movs	r0, #7
	movs	r1, #48
	.loc 1 109 0
	pop	{r3, lr}
	.cfi_restore 14
	.cfi_restore 3
	.cfi_def_cfa_offset 0
	.loc 1 108 0
	b	conRegNRF24L01
.LVL18:
.L16:
	.align	2
.L15:
	.word	nrf_mode
	.word	1073873920
	.cfi_endproc
.LFE114:
	.size	setRxModeNRF24L01, .-setRxModeNRF24L01
	.align	2
	.global	flushRxNRF24L01
	.thumb
	.thumb_func
	.type	flushRxNRF24L01, %function
flushRxNRF24L01:
.LFB115:
	.loc 1 112 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 4, -8
	.cfi_offset 14, -4
	.loc 1 113 0
	ldr	r4, .L19
	ldr	r3, [r4, #20]
	bic	r3, r3, #32768
	str	r3, [r4, #20]
	.loc 1 114 0
	movs	r0, #226
	bl	txByteSPI1
.LVL19:
	.loc 1 115 0
	ldr	r3, [r4, #20]
	orr	r3, r3, #32768
	str	r3, [r4, #20]
	pop	{r4, pc}
.L20:
	.align	2
.L19:
	.word	1073872896
	.cfi_endproc
.LFE115:
	.size	flushRxNRF24L01, .-flushRxNRF24L01
	.align	2
	.global	setTxAddrNRF24L01
	.thumb
	.thumb_func
	.type	setTxAddrNRF24L01, %function
setTxAddrNRF24L01:
.LFB116:
	.loc 1 119 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL20:
	push	{r4, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 4, -8
	.cfi_offset 14, -4
	.loc 1 120 0
	mov	r1, r0
	.loc 1 119 0
	mov	r4, r0
	.loc 1 120 0
	movs	r2, #5
	movs	r0, #10
.LVL21:
	bl	setRegNRF24L01
.LVL22:
	.loc 1 121 0
	mov	r1, r4
	movs	r0, #16
	movs	r2, #5
	.loc 1 122 0
	pop	{r4, lr}
	.cfi_restore 14
	.cfi_restore 4
	.cfi_def_cfa_offset 0
.LVL23:
	.loc 1 121 0
	b	setRegNRF24L01
.LVL24:
	.cfi_endproc
.LFE116:
	.size	setTxAddrNRF24L01, .-setTxAddrNRF24L01
	.align	2
	.global	getRegNRF24L01
	.thumb
	.thumb_func
	.type	getRegNRF24L01, %function
getRegNRF24L01:
.LFB119:
	.loc 1 192 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL25:
	push	{r4, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 4, -8
	.cfi_offset 14, -4
	sub	sp, sp, #16
	.cfi_def_cfa_offset 24
	.loc 1 194 0
	add	r2, sp, #16
	and	r0, r0, #31
.LVL26:
	strb	r0, [r2, #-9]!
	.loc 1 196 0
	ldr	r4, .L25
	ldr	r3, [r4, #20]
	bic	r3, r3, #32768
	.loc 1 197 0
	mov	r0, r2
	.loc 1 196 0
	str	r3, [r4, #20]
	.loc 1 197 0
	movs	r1, #1
	bl	txSPI1
.LVL27:
	.loc 1 198 0
	add	r0, sp, #15
	movs	r1, #1
	bl	rxSPI1
.LVL28:
	.loc 1 199 0
	ldr	r3, [r4, #20]
	orr	r3, r3, #32768
	str	r3, [r4, #20]
	.loc 1 201 0
	ldrb	r0, [sp, #15]	@ zero_extendqisi2
	add	sp, sp, #16
	.cfi_def_cfa_offset 8
	@ sp needed
	pop	{r4, pc}
.L26:
	.align	2
.L25:
	.word	1073872896
	.cfi_endproc
.LFE119:
	.size	getRegNRF24L01, .-getRegNRF24L01
	.align	2
	.global	initNRF24L01
	.thumb
	.thumb_func
	.type	initNRF24L01, %function
initNRF24L01:
.LFB110:
	.loc 1 12 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL29:
	push	{r4, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 4, -8
	.cfi_offset 14, -4
	.loc 1 22 0
	ldr	r3, .L34
	.loc 1 25 0
	ldr	r4, .L34+4
	.loc 1 22 0
	strb	r0, [r3]
	.loc 1 23 0
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L28
	.loc 1 25 0
	ldr	r3, .L34+8
	str	r3, [r4]
.L29:
	.loc 1 33 0
	movs	r0, #16
.LVL30:
	bl	initSPI1
.LVL31:
	.loc 1 36 0
	ldr	r3, .L34+12
	.loc 1 42 0
	ldr	r1, .L34+16
	.loc 1 36 0
	ldr	r2, [r3]
	bic	r2, r2, #12582912
	str	r2, [r3]
	.loc 1 37 0
	ldr	r2, [r3]
	orr	r2, r2, #4194304
	str	r2, [r3]
	.loc 1 38 0
	ldr	r2, [r3, #4]
	bic	r2, r2, #12582912
	str	r2, [r3, #4]
	.loc 1 39 0
	ldr	r2, [r3, #8]
	orr	r2, r2, #8388608
	str	r2, [r3, #8]
	.loc 1 41 0
	ldr	r2, [r3, #20]
	bic	r2, r2, #2048
	str	r2, [r3, #20]
	.loc 1 42 0
	ldr	r3, [r1, #20]
	orr	r3, r3, #32768
	str	r3, [r1, #20]
	.loc 1 43 0
	movs	r0, #100
	bl	delay_ms
.LVL32:
	.loc 1 45 0
	ldr	r0, [r4]
	movs	r1, #11
	bl	setRxAddrNRF24L01
.LVL33:
	.loc 1 47 0
	movs	r0, #5
	movs	r1, #1
	bl	conRegNRF24L01
.LVL34:
	.loc 1 49 0
	movs	r0, #17
	movs	r1, #32
	bl	conRegNRF24L01
.LVL35:
	.loc 1 50 0
	movs	r0, #18
	movs	r1, #32
	bl	conRegNRF24L01
.LVL36:
	.loc 1 54 0
	bl	setRxModeNRF24L01
.LVL37:
	.loc 1 55 0
	bl	flushRxNRF24L01
.LVL38:
.LBB10:
	.loc 1 59 0
	ldr	r0, .L34+20
	bl	printUSART2
.LVL39:
	movs	r4, #0
.LVL40:
.L30:
	.loc 1 61 0 discriminator 3
	uxtb	r0, r4
	bl	getRegNRF24L01
.LVL41:
	mov	r1, r4
	mov	r2, r0
	adds	r4, r4, #1
.LVL42:
	ldr	r0, .L34+24
	bl	printUSART2
.LVL43:
	.loc 1 60 0 discriminator 3
	cmp	r4, #30
	bne	.L30
	.loc 1 63 0
	movw	r0, #3000
.LBE10:
	.loc 1 65 0
	pop	{r4, lr}
	.cfi_remember_state
	.cfi_restore 14
	.cfi_restore 4
	.cfi_def_cfa_offset 0
.LBB11:
	.loc 1 63 0
	b	delay_ms
.LVL44:
.L28:
	.cfi_restore_state
.LBE11:
	.loc 1 29 0
	ldr	r3, .L34+28
	str	r3, [r4]
	b	.L29
.L35:
	.align	2
.L34:
	.word	g_nrf24l01_node_type
	.word	g_node_addr
	.word	.LANCHOR0
	.word	1073873920
	.word	1073872896
	.word	.LC0
	.word	.LC1
	.word	.LANCHOR0+8
	.cfi_endproc
.LFE110:
	.size	initNRF24L01, .-initNRF24L01
	.align	2
	.global	txOverNRF24L01
	.thumb
	.thumb_func
	.type	txOverNRF24L01, %function
txOverNRF24L01:
.LFB117:
	.loc 1 125 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 4, -8
	.cfi_offset 14, -4
	.loc 1 127 0
	ldr	r3, .L43
	ldrb	r4, [r3]	@ zero_extendqisi2
	uxtb	r4, r4
	cmp	r4, #1
	beq	.L41
	.loc 1 142 0
	movs	r0, #0
	pop	{r4, pc}
.L41:
.LBB14:
.LBB15:
	.loc 1 129 0
	movs	r0, #7
	bl	getRegNRF24L01
.LVL45:
	.loc 1 130 0
	tst	r0, #48
	bne	.L42
	.loc 1 137 0
	mov	r0, r4
.LVL46:
.LBE15:
.LBE14:
	.loc 1 146 0
	pop	{r4, pc}
.LVL47:
.L42:
.LBB17:
.LBB16:
	.loc 1 132 0
	bl	setRxModeNRF24L01
.LVL48:
	.loc 1 133 0
	movs	r0, #0
	pop	{r4, pc}
.L44:
	.align	2
.L43:
	.word	nrf_mode
.LBE16:
.LBE17:
	.cfi_endproc
.LFE117:
	.size	txOverNRF24L01, .-txOverNRF24L01
	.align	2
	.global	onNRF24L01
	.thumb
	.thumb_func
	.type	onNRF24L01, %function
onNRF24L01:
.LFB118:
	.loc 1 177 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
	.cfi_def_cfa_offset 4
	.cfi_offset 14, -4
	.loc 1 178 0
	movs	r0, #0
	.loc 1 177 0
	sub	sp, sp, #12
	.cfi_def_cfa_offset 16
	.loc 1 178 0
	bl	getRegNRF24L01
.LVL49:
	.loc 1 179 0
	add	r1, sp, #8
	orr	r0, r0, #2
	strb	r0, [r1, #-1]!
	.loc 1 180 0
	movs	r2, #1
	movs	r0, #0
	bl	setRegNRF24L01
.LVL50:
	.loc 1 181 0
	movs	r0, #130
	bl	delay_us
.LVL51:
	.loc 1 182 0
	add	sp, sp, #12
	.cfi_def_cfa_offset 4
	@ sp needed
	ldr	pc, [sp], #4
	.cfi_endproc
.LFE118:
	.size	onNRF24L01, .-onNRF24L01
	.align	2
	.global	flushTxNRF24L01
	.thumb
	.thumb_func
	.type	flushTxNRF24L01, %function
flushTxNRF24L01:
.LFB120:
	.loc 1 204 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 4, -8
	.cfi_offset 14, -4
	.loc 1 205 0
	ldr	r4, .L49
	ldr	r3, [r4, #20]
	bic	r3, r3, #32768
	str	r3, [r4, #20]
	.loc 1 206 0
	movs	r0, #225
	bl	txByteSPI1
.LVL52:
	.loc 1 207 0
	ldr	r3, [r4, #20]
	orr	r3, r3, #32768
	str	r3, [r4, #20]
	pop	{r4, pc}
.L50:
	.align	2
.L49:
	.word	1073872896
	.cfi_endproc
.LFE120:
	.size	flushTxNRF24L01, .-flushTxNRF24L01
	.align	2
	.global	setTxModeNRF24L01
	.thumb
	.thumb_func
	.type	setTxModeNRF24L01, %function
setTxModeNRF24L01:
.LFB121:
	.loc 1 211 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 212 0
	ldr	r3, .L52
	movs	r2, #1
	.loc 1 213 0
	movs	r0, #0
	movs	r1, #10
	.loc 1 212 0
	strb	r2, [r3]
	.loc 1 213 0
	b	conRegNRF24L01
.LVL53:
.L53:
	.align	2
.L52:
	.word	nrf_mode
	.cfi_endproc
.LFE121:
	.size	setTxModeNRF24L01, .-setTxModeNRF24L01
	.align	2
	.global	rxDataNRF24L01
	.thumb
	.thumb_func
	.type	rxDataNRF24L01, %function
rxDataNRF24L01:
.LFB122:
	.loc 1 236 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL54:
	push	{r4, r5, lr}
	.cfi_def_cfa_offset 12
	.cfi_offset 4, -12
	.cfi_offset 5, -8
	.cfi_offset 14, -4
	.loc 1 239 0
	ldr	r4, .L56
	.loc 1 236 0
	sub	sp, sp, #12
	.cfi_def_cfa_offset 24
	.loc 1 239 0
	ldr	r2, [r4, #20]
	.loc 1 240 0
	add	r3, sp, #8
	.loc 1 239 0
	bic	r2, r2, #32768
	.loc 1 240 0
	movs	r1, #97
	.loc 1 239 0
	str	r2, [r4, #20]
	.loc 1 240 0
	strb	r1, [r3, #-1]!
	.loc 1 236 0
	mov	r5, r0
	.loc 1 241 0
	movs	r1, #1
	mov	r0, r3
.LVL55:
	bl	txSPI1
.LVL56:
	.loc 1 242 0
	mov	r0, r5
	movs	r1, #32
	bl	rxSPI1
.LVL57:
	.loc 1 243 0
	ldr	r3, [r4, #20]
	orr	r3, r3, #32768
	str	r3, [r4, #20]
	.loc 1 245 0
	movs	r0, #7
	movs	r1, #64
	bl	conRegNRF24L01
.LVL58:
	.loc 1 247 0
	add	sp, sp, #12
	.cfi_def_cfa_offset 12
	@ sp needed
	pop	{r4, r5, pc}
.LVL59:
.L57:
	.align	2
.L56:
	.word	1073872896
	.cfi_endproc
.LFE122:
	.size	rxDataNRF24L01, .-rxDataNRF24L01
	.align	2
	.global	dataReadyNRF24L01
	.thumb
	.thumb_func
	.type	dataReadyNRF24L01, %function
dataReadyNRF24L01:
.LFB123:
	.loc 1 250 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	.cfi_offset 14, -4
	.loc 1 251 0
	movs	r0, #7
	bl	getRegNRF24L01
.LVL60:
	.loc 1 253 0
	lsls	r3, r0, #25
	bpl	.L62
	.loc 1 255 0
	movs	r0, #1
.LVL61:
	.loc 1 271 0
	pop	{r3, pc}
.L62:
	.loc 1 259 0
	movs	r0, #23
.LVL62:
	bl	getRegNRF24L01
.LVL63:
	.loc 1 260 0
	and	r0, r0, #1
.LVL64:
	.loc 1 255 0
	eor	r0, r0, #1
	pop	{r3, pc}
	.cfi_endproc
.LFE123:
	.size	dataReadyNRF24L01, .-dataReadyNRF24L01
	.align	2
	.global	txPacketNRF24L01
	.thumb
	.thumb_func
	.type	txPacketNRF24L01, %function
txPacketNRF24L01:
.LFB125:
	.loc 1 293 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL65:
	push	{r4, r5, r6, r7, r8, lr}
	.cfi_def_cfa_offset 24
	.cfi_offset 4, -24
	.cfi_offset 5, -20
	.cfi_offset 6, -16
	.cfi_offset 7, -12
	.cfi_offset 8, -8
	.cfi_offset 14, -4
	sub	sp, sp, #8
	.cfi_def_cfa_offset 32
	.loc 1 293 0
	mov	r7, r0
	.loc 1 295 0
	bl	getSYSTIM
.LVL66:
	ldr	r4, .L73
	mov	r5, r0
.LVL67:
	.loc 1 297 0
	b	.L64
.LVL68:
.L68:
	.loc 1 299 0
	bl	getRegNRF24L01
.LVL69:
	.loc 1 300 0
	tst	r0, #48
	.loc 1 306 0
	mov	r1, #1000
	mov	r0, r5
.LVL70:
	.loc 1 300 0
	bne	.L71
.LVL71:
	.loc 1 306 0
	bl	chk4TimeoutSYSTIM
.LVL72:
	cmp	r0, #0
	beq	.L72
.L64:
	.loc 1 297 0
	ldrb	r3, [r4]	@ zero_extendqisi2
	ldr	r6, .L73
	cmp	r3, #1
	.loc 1 299 0
	mov	r0, #7
	.loc 1 297 0
	beq	.L68
.L66:
.LVL73:
.LBB24:
.LBB25:
	.loc 1 313 0
	ldr	r5, .L73+4
.LVL74:
	.loc 1 318 0
	ldr	r6, .L73+8
	.loc 1 313 0
	ldr	r3, [r5, #20]
	bic	r3, r3, #2048
	str	r3, [r5, #20]
.LBB26:
.LBB27:
	.loc 1 212 0
	mov	r8, #1
	.loc 1 213 0
	movs	r0, #0
	movs	r1, #10
	.loc 1 212 0
	strb	r8, [r4]
	.loc 1 213 0
	bl	conRegNRF24L01
.LVL75:
.LBE27:
.LBE26:
	.loc 1 316 0
	bl	flushTxNRF24L01
.LVL76:
	.loc 1 318 0
	ldr	r3, [r6, #20]
	.loc 1 319 0
	add	r0, sp, #8
	movs	r2, #160
	.loc 1 318 0
	bic	r3, r3, #32768
	str	r3, [r6, #20]
	.loc 1 320 0
	mov	r1, r8
	.loc 1 319 0
	strb	r2, [r0, #-1]!
	.loc 1 320 0
	bl	txSPI1
.LVL77:
	.loc 1 321 0
	mov	r0, r7
	movs	r1, #32
	bl	txSPI1
.LVL78:
	.loc 1 322 0
	ldr	r3, [r6, #20]
	orr	r3, r3, #32768
	str	r3, [r6, #20]
	.loc 1 323 0
	ldr	r3, [r5, #20]
	orr	r3, r3, #2048
	str	r3, [r5, #20]
	.loc 1 324 0
	movs	r0, #130
	bl	delay_us
.LVL79:
.LBE25:
.LBE24:
	.loc 1 325 0
	add	sp, sp, #8
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	@ sp needed
	pop	{r4, r5, r6, r7, r8, pc}
.LVL80:
.L71:
	.cfi_restore_state
	.loc 1 302 0
	movs	r3, #0
	strb	r3, [r6]
	.loc 1 303 0
	b	.L66
.LVL81:
.L72:
.LBB28:
	.loc 1 308 0
	ldr	r0, .L73+12
	bl	printUSART2
.LVL82:
.LBE28:
	.loc 1 325 0
	add	sp, sp, #8
	.cfi_def_cfa_offset 24
	@ sp needed
	pop	{r4, r5, r6, r7, r8, pc}
.LVL83:
.L74:
	.align	2
.L73:
	.word	nrf_mode
	.word	1073873920
	.word	1073872896
	.word	.LC2
	.cfi_endproc
.LFE125:
	.size	txPacketNRF24L01, .-txPacketNRF24L01
	.align	2
	.global	txDataNRF24L01
	.thumb
	.thumb_func
	.type	txDataNRF24L01, %function
txDataNRF24L01:
.LFB124:
	.loc 1 274 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL84:
	push	{r4, r5, r6, lr}
	.cfi_def_cfa_offset 16
	.cfi_offset 4, -16
	.cfi_offset 5, -12
	.cfi_offset 6, -8
	.cfi_offset 14, -4
	.loc 1 274 0
	mov	r4, r1
	mov	r5, r0
	.loc 1 276 0
	bl	getSYSTIM
.LVL85:
	mov	r6, r0
.LVL86:
	.loc 1 278 0
	mov	r0, r5
.LVL87:
	bl	setTxAddrNRF24L01
.LVL88:
	.loc 1 279 0
	mov	r0, r4
	bl	txPacketNRF24L01
.LVL89:
	ldr	r5, .L83
.LVL90:
	.loc 1 280 0
	b	.L76
.LVL91:
.L79:
	.loc 1 282 0
	bl	chk4TimeoutSYSTIM
.LVL92:
	cbz	r0, .L80
.LVL93:
.L76:
.LBB33:
.LBB34:
	.loc 1 127 0
	ldrb	r4, [r5]	@ zero_extendqisi2
	uxtb	r4, r4
	cmp	r4, #1
.LBB35:
.LBB36:
	.loc 1 129 0
	mov	r0, #7
.LBE36:
.LBE35:
	.loc 1 127 0
	bne	.L78
.LBB39:
.LBB37:
	.loc 1 129 0
	bl	getRegNRF24L01
.LVL94:
	.loc 1 130 0
	tst	r0, #48
.LBE37:
.LBE39:
.LBE34:
.LBE33:
	.loc 1 282 0
	mov	r1, #100
	mov	r0, r6
.LVL95:
.LBB42:
.LBB41:
.LBB40:
.LBB38:
	.loc 1 130 0
	beq	.L79
.LVL96:
	.loc 1 132 0
	bl	setRxModeNRF24L01
.LVL97:
.L78:
.LBE38:
.LBE40:
.LBE41:
.LBE42:
	.loc 1 275 0
	movs	r0, #0
.LVL98:
	.loc 1 290 0
	pop	{r4, r5, r6, pc}
.LVL99:
.L80:
	.loc 1 284 0
	mov	r0, r4
	pop	{r4, r5, r6, pc}
.LVL100:
.L84:
	.align	2
.L83:
	.word	nrf_mode
	.cfi_endproc
.LFE124:
	.size	txDataNRF24L01, .-txDataNRF24L01
	.comm	nrf_mode,1,1
	.comm	g_node_addr,4,4
	.global	c_nrf_slave_addr
	.global	c_nrf_master_addr
	.comm	g_nrf24l01_node_type,1,1
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
	.type	c_nrf_slave_addr, %object
	.size	c_nrf_slave_addr, 6
c_nrf_slave_addr:
	.ascii	"SDR00\000"
	.space	2
	.type	c_nrf_master_addr, %object
	.size	c_nrf_master_addr, 6
c_nrf_master_addr:
	.ascii	"MDR01\000"
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"\012\000"
	.space	2
.LC1:
	.ascii	"REG[%xb]: %xb\012\000"
	.space	1
.LC2:
	.ascii	"TIMEOUT\012\000"
	.text
.Letext0:
	.file 2 "/home/wubuntu/msut/STM32F407/gcc-arm-none-eabi/arm-none-eabi/include/machine/_default_types.h"
	.file 3 "/home/wubuntu/msut/STM32F407/gcc-arm-none-eabi/arm-none-eabi/include/stdint.h"
	.file 4 "../../../../STM32F407/Libraries/CMSIS/ST/STM32F4xx/Include/stm32f4xx.h"
	.file 5 "../../../../STM32F407/Libraries/CMSIS/Include/core_cm4.h"
	.file 6 "spi.h"
	.file 7 "delay.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0xad6
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF64
	.byte	0x1
	.4byte	.LASF65
	.4byte	.LASF66
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
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF11
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF12
	.uleb128 0x3
	.4byte	.LASF13
	.byte	0x3
	.byte	0x15
	.4byte	0x2c
	.uleb128 0x3
	.4byte	.LASF14
	.byte	0x3
	.byte	0x21
	.4byte	0x45
	.uleb128 0x3
	.4byte	.LASF15
	.byte	0x3
	.byte	0x2c
	.4byte	0x57
	.uleb128 0x3
	.4byte	.LASF16
	.byte	0x3
	.byte	0x2d
	.4byte	0x69
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
	.byte	0x28
	.byte	0x4
	.2byte	0x28e
	.4byte	0x17a
	.uleb128 0x9
	.4byte	.LASF18
	.byte	0x4
	.2byte	0x290
	.4byte	0xca
	.byte	0
	.uleb128 0x9
	.4byte	.LASF19
	.byte	0x4
	.2byte	0x291
	.4byte	0xca
	.byte	0x4
	.uleb128 0x9
	.4byte	.LASF20
	.byte	0x4
	.2byte	0x292
	.4byte	0xca
	.byte	0x8
	.uleb128 0x9
	.4byte	.LASF21
	.byte	0x4
	.2byte	0x293
	.4byte	0xca
	.byte	0xc
	.uleb128 0xa
	.ascii	"IDR\000"
	.byte	0x4
	.2byte	0x294
	.4byte	0xca
	.byte	0x10
	.uleb128 0xa
	.ascii	"ODR\000"
	.byte	0x4
	.2byte	0x295
	.4byte	0xca
	.byte	0x14
	.uleb128 0x9
	.4byte	.LASF22
	.byte	0x4
	.2byte	0x296
	.4byte	0xe4
	.byte	0x18
	.uleb128 0x9
	.4byte	.LASF23
	.byte	0x4
	.2byte	0x297
	.4byte	0xe4
	.byte	0x1a
	.uleb128 0x9
	.4byte	.LASF24
	.byte	0x4
	.2byte	0x298
	.4byte	0xca
	.byte	0x1c
	.uleb128 0xa
	.ascii	"AFR\000"
	.byte	0x4
	.2byte	0x299
	.4byte	0x17a
	.byte	0x20
	.byte	0
	.uleb128 0x5
	.4byte	0xcf
	.uleb128 0xb
	.4byte	.LASF25
	.byte	0x4
	.2byte	0x29a
	.4byte	0xee
	.uleb128 0xc
	.4byte	.LASF58
	.byte	0x1
	.byte	0x7c
	.4byte	0x97
	.byte	0x1
	.4byte	0x1a7
	.uleb128 0xd
	.4byte	.LASF26
	.byte	0x1
	.byte	0x7e
	.4byte	0x97
	.byte	0
	.uleb128 0xe
	.4byte	.LASF67
	.byte	0x1
	.byte	0xd2
	.byte	0x1
	.uleb128 0xf
	.4byte	.LASF39
	.byte	0x1
	.2byte	0x124
	.byte	0x1
	.4byte	0x206
	.uleb128 0x10
	.4byte	.LASF44
	.byte	0x1
	.2byte	0x124
	.4byte	0x206
	.uleb128 0x11
	.4byte	.LASF26
	.byte	0x1
	.2byte	0x126
	.4byte	0x97
	.uleb128 0x12
	.ascii	"k\000"
	.byte	0x1
	.2byte	0x126
	.4byte	0x97
	.uleb128 0x12
	.ascii	"tmp\000"
	.byte	0x1
	.2byte	0x126
	.4byte	0x97
	.uleb128 0x11
	.4byte	.LASF27
	.byte	0x1
	.2byte	0x127
	.4byte	0xb8
	.uleb128 0x13
	.uleb128 0x14
	.4byte	.LASF40
	.byte	0x1
	.byte	0x3b
	.4byte	0x89
	.uleb128 0x15
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x16
	.byte	0x4
	.4byte	0x97
	.uleb128 0x17
	.4byte	.LASF30
	.byte	0x1
	.byte	0x4d
	.4byte	.LFB112
	.4byte	.LFE112-.LFB112
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x287
	.uleb128 0x18
	.ascii	"reg\000"
	.byte	0x1
	.byte	0x4d
	.4byte	0x97
	.4byte	.LLST0
	.uleb128 0x19
	.4byte	.LASF28
	.byte	0x1
	.byte	0x4d
	.4byte	0x206
	.4byte	.LLST1
	.uleb128 0x19
	.4byte	.LASF29
	.byte	0x1
	.byte	0x4d
	.4byte	0x97
	.4byte	.LLST2
	.uleb128 0x1a
	.ascii	"k\000"
	.byte	0x1
	.byte	0x4f
	.4byte	0x97
	.uleb128 0x1b
	.4byte	.LVL3
	.4byte	0xa33
	.4byte	0x270
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.byte	0
	.uleb128 0x1d
	.4byte	.LVL4
	.4byte	0xa33
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x75
	.sleb128 0
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x17
	.4byte	.LASF31
	.byte	0x1
	.byte	0x46
	.4byte	.LFB111
	.4byte	.LFE111-.LFB111
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2d1
	.uleb128 0x19
	.4byte	.LASF32
	.byte	0x1
	.byte	0x46
	.4byte	0x206
	.4byte	.LLST3
	.uleb128 0x18
	.ascii	"reg\000"
	.byte	0x1
	.byte	0x46
	.4byte	0x97
	.4byte	.LLST4
	.uleb128 0x1d
	.4byte	.LVL10
	.4byte	0x20c
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.byte	0x35
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x3
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.byte	0
	.uleb128 0x17
	.4byte	.LASF33
	.byte	0x1
	.byte	0x59
	.4byte	.LFB113
	.4byte	.LFE113-.LFB113
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x33c
	.uleb128 0x18
	.ascii	"reg\000"
	.byte	0x1
	.byte	0x59
	.4byte	0x97
	.4byte	.LLST5
	.uleb128 0x19
	.4byte	.LASF28
	.byte	0x1
	.byte	0x59
	.4byte	0x97
	.4byte	.LLST6
	.uleb128 0x1a
	.ascii	"k\000"
	.byte	0x1
	.byte	0x5b
	.4byte	0x97
	.uleb128 0x1b
	.4byte	.LVL14
	.4byte	0xa33
	.4byte	0x326
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0x1d
	.4byte	.LVL15
	.4byte	0xa33
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.byte	0
	.byte	0
	.uleb128 0x17
	.4byte	.LASF34
	.byte	0x1
	.byte	0x65
	.4byte	.LFB114
	.4byte	.LFE114-.LFB114
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x393
	.uleb128 0x1b
	.4byte	.LVL16
	.4byte	0x2d1
	.4byte	0x369
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x3b
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x1b
	.4byte	.LVL17
	.4byte	0xa49
	.4byte	0x37d
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x8
	.byte	0x82
	.byte	0
	.uleb128 0x1e
	.4byte	.LVL18
	.4byte	0x2d1
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x8
	.byte	0x30
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x37
	.byte	0
	.byte	0
	.uleb128 0x17
	.4byte	.LASF35
	.byte	0x1
	.byte	0x6f
	.4byte	.LFB115
	.4byte	.LFE115-.LFB115
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x3b9
	.uleb128 0x1d
	.4byte	.LVL19
	.4byte	0xa5a
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x9
	.byte	0xe2
	.byte	0
	.byte	0
	.uleb128 0x17
	.4byte	.LASF36
	.byte	0x1
	.byte	0x76
	.4byte	.LFB116
	.4byte	.LFE116-.LFB116
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x417
	.uleb128 0x19
	.4byte	.LASF32
	.byte	0x1
	.byte	0x76
	.4byte	0x206
	.4byte	.LLST7
	.uleb128 0x1b
	.4byte	.LVL22
	.4byte	0x20c
	.4byte	0x3fb
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.byte	0x35
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x3a
	.byte	0
	.uleb128 0x1e
	.4byte	.LVL24
	.4byte	0x20c
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.byte	0x35
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x3
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x40
	.byte	0
	.byte	0
	.uleb128 0x1f
	.4byte	.LASF45
	.byte	0x1
	.byte	0xbf
	.4byte	0x97
	.4byte	.LFB119
	.4byte	.LFE119-.LFB119
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x47b
	.uleb128 0x18
	.ascii	"reg\000"
	.byte	0x1
	.byte	0xbf
	.4byte	0x97
	.4byte	.LLST8
	.uleb128 0x20
	.ascii	"rx\000"
	.byte	0x1
	.byte	0xc1
	.4byte	0x97
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0x1b
	.4byte	.LVL27
	.4byte	0xa33
	.4byte	0x465
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.byte	0
	.uleb128 0x1d
	.4byte	.LVL28
	.4byte	0xa6f
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.byte	0
	.uleb128 0x17
	.4byte	.LASF37
	.byte	0x1
	.byte	0xb
	.4byte	.LFB110
	.4byte	.LFE110-.LFB110
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x5c2
	.uleb128 0x19
	.4byte	.LASF38
	.byte	0x1
	.byte	0xb
	.4byte	0x97
	.4byte	.LLST9
	.uleb128 0xd
	.4byte	.LASF28
	.byte	0x1
	.byte	0x14
	.4byte	0x97
	.uleb128 0x21
	.4byte	.Ldebug_ranges0+0
	.4byte	0x52b
	.uleb128 0x22
	.ascii	"k\000"
	.byte	0x1
	.byte	0x3a
	.4byte	0x97
	.4byte	.LLST10
	.uleb128 0x23
	.4byte	.LASF40
	.byte	0x1
	.byte	0x3b
	.4byte	0x89
	.4byte	0x4d1
	.uleb128 0x15
	.byte	0
	.uleb128 0x1b
	.4byte	.LVL39
	.4byte	0xa85
	.4byte	0x4e8
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC0
	.byte	0
	.uleb128 0x1b
	.4byte	.LVL41
	.4byte	0x417
	.4byte	0x4fc
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x1b
	.4byte	.LVL43
	.4byte	0xa85
	.4byte	0x519
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x74
	.sleb128 -1
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC1
	.byte	0
	.uleb128 0x1e
	.4byte	.LVL44
	.4byte	0xa96
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x3
	.byte	0xa
	.2byte	0xbb8
	.byte	0
	.byte	0
	.uleb128 0x1b
	.4byte	.LVL31
	.4byte	0xaa7
	.4byte	0x53e
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x40
	.byte	0
	.uleb128 0x1b
	.4byte	.LVL32
	.4byte	0xa96
	.4byte	0x552
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x8
	.byte	0x64
	.byte	0
	.uleb128 0x1b
	.4byte	.LVL33
	.4byte	0x287
	.4byte	0x565
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x3b
	.byte	0
	.uleb128 0x1b
	.4byte	.LVL34
	.4byte	0x2d1
	.4byte	0x57d
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x35
	.byte	0
	.uleb128 0x1b
	.4byte	.LVL35
	.4byte	0x2d1
	.4byte	0x596
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x8
	.byte	0x20
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x41
	.byte	0
	.uleb128 0x1b
	.4byte	.LVL36
	.4byte	0x2d1
	.4byte	0x5af
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x8
	.byte	0x20
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x42
	.byte	0
	.uleb128 0x24
	.4byte	.LVL37
	.4byte	0x33c
	.uleb128 0x24
	.4byte	.LVL38
	.4byte	0x393
	.byte	0
	.uleb128 0x25
	.4byte	0x18b
	.4byte	.LFB117
	.4byte	.LFE117-.LFB117
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x60a
	.uleb128 0x26
	.4byte	0x19b
	.4byte	.LLST11
	.uleb128 0x27
	.4byte	.Ldebug_ranges0+0x18
	.uleb128 0x26
	.4byte	0x19b
	.4byte	.LLST12
	.uleb128 0x1b
	.4byte	.LVL45
	.4byte	0x417
	.4byte	0x5ff
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x37
	.byte	0
	.uleb128 0x24
	.4byte	.LVL48
	.4byte	0x33c
	.byte	0
	.byte	0
	.uleb128 0x17
	.4byte	.LASF41
	.byte	0x1
	.byte	0xb0
	.4byte	.LFB118
	.4byte	.LFE118-.LFB118
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x66e
	.uleb128 0x20
	.ascii	"rx\000"
	.byte	0x1
	.byte	0xb2
	.4byte	0x97
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0x1b
	.4byte	.LVL49
	.4byte	0x417
	.4byte	0x63f
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x1b
	.4byte	.LVL50
	.4byte	0x20c
	.4byte	0x65d
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x1d
	.4byte	.LVL51
	.4byte	0xa49
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x8
	.byte	0x82
	.byte	0
	.byte	0
	.uleb128 0x17
	.4byte	.LASF42
	.byte	0x1
	.byte	0xcb
	.4byte	.LFB120
	.4byte	.LFE120-.LFB120
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x694
	.uleb128 0x1d
	.4byte	.LVL52
	.4byte	0xa5a
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x9
	.byte	0xe1
	.byte	0
	.byte	0
	.uleb128 0x25
	.4byte	0x1a7
	.4byte	.LFB121
	.4byte	.LFE121-.LFB121
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x6bc
	.uleb128 0x1e
	.4byte	.LVL53
	.4byte	0x2d1
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x3a
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.byte	0
	.uleb128 0x17
	.4byte	.LASF43
	.byte	0x1
	.byte	0xeb
	.4byte	.LFB122
	.4byte	.LFE122-.LFB122
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x740
	.uleb128 0x19
	.4byte	.LASF44
	.byte	0x1
	.byte	0xeb
	.4byte	0x206
	.4byte	.LLST13
	.uleb128 0x1a
	.ascii	"k\000"
	.byte	0x1
	.byte	0xed
	.4byte	0x97
	.uleb128 0x20
	.ascii	"tmp\000"
	.byte	0x1
	.byte	0xed
	.4byte	0x97
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.uleb128 0x1b
	.4byte	.LVL56
	.4byte	0xa33
	.4byte	0x710
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.byte	0
	.uleb128 0x1b
	.4byte	.LVL57
	.4byte	0xa6f
	.4byte	0x72a
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x8
	.byte	0x20
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x75
	.sleb128 0
	.byte	0
	.uleb128 0x1d
	.4byte	.LVL58
	.4byte	0x2d1
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x8
	.byte	0x40
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x37
	.byte	0
	.byte	0
	.uleb128 0x1f
	.4byte	.LASF46
	.byte	0x1
	.byte	0xf9
	.4byte	0x97
	.4byte	.LFB123
	.4byte	.LFE123-.LFB123
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x78b
	.uleb128 0x28
	.4byte	.LASF26
	.byte	0x1
	.byte	0xfb
	.4byte	0x97
	.4byte	.LLST14
	.uleb128 0x1b
	.4byte	.LVL60
	.4byte	0x417
	.4byte	0x77b
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x37
	.byte	0
	.uleb128 0x1d
	.4byte	.LVL63
	.4byte	0x417
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x47
	.byte	0
	.byte	0
	.uleb128 0x25
	.4byte	0x1af
	.4byte	.LFB125
	.4byte	.LFE125-.LFB125
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x8c7
	.uleb128 0x29
	.4byte	0x1bc
	.4byte	.LLST15
	.uleb128 0x26
	.4byte	0x1c8
	.4byte	.LLST16
	.uleb128 0x2a
	.4byte	0x1d4
	.uleb128 0x2a
	.4byte	0x1de
	.uleb128 0x26
	.4byte	0x1ea
	.4byte	.LLST17
	.uleb128 0x2b
	.4byte	.LBB24
	.4byte	.LBE24-.LBB24
	.4byte	0x871
	.uleb128 0x29
	.4byte	0x1bc
	.4byte	.LLST18
	.uleb128 0x2c
	.4byte	.LBB25
	.4byte	.LBE25-.LBB25
	.uleb128 0x2a
	.4byte	0x1c8
	.uleb128 0x2a
	.4byte	0x1d4
	.uleb128 0x2d
	.4byte	0x1de
	.uleb128 0x2
	.byte	0x91
	.sleb128 -25
	.uleb128 0x2a
	.4byte	0x1ea
	.uleb128 0x2e
	.4byte	0x1a7
	.4byte	.LBB26
	.4byte	.LBE26-.LBB26
	.byte	0x1
	.2byte	0x13a
	.4byte	0x822
	.uleb128 0x1d
	.4byte	.LVL75
	.4byte	0x2d1
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x3a
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.byte	0
	.uleb128 0x24
	.4byte	.LVL76
	.4byte	0x66e
	.uleb128 0x1b
	.4byte	.LVL77
	.4byte	0xa33
	.4byte	0x845
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x78
	.sleb128 0
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x91
	.sleb128 -25
	.byte	0
	.uleb128 0x1b
	.4byte	.LVL78
	.4byte	0xa33
	.4byte	0x85f
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x8
	.byte	0x20
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x77
	.sleb128 0
	.byte	0
	.uleb128 0x1d
	.4byte	.LVL79
	.4byte	0xa49
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x8
	.byte	0x82
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x2b
	.4byte	.LBB28
	.4byte	.LBE28-.LBB28
	.4byte	0x89d
	.uleb128 0x2f
	.4byte	0x1f7
	.4byte	0x889
	.uleb128 0x15
	.byte	0
	.uleb128 0x1d
	.4byte	.LVL82
	.4byte	0xa85
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC2
	.byte	0
	.byte	0
	.uleb128 0x24
	.4byte	.LVL66
	.4byte	0xab8
	.uleb128 0x24
	.4byte	.LVL69
	.4byte	0x417
	.uleb128 0x1d
	.4byte	.LVL72
	.4byte	0xac3
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x3
	.byte	0xa
	.2byte	0x3e8
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x75
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x30
	.4byte	.LASF47
	.byte	0x1
	.2byte	0x111
	.4byte	0x97
	.4byte	.LFB124
	.4byte	.LFE124-.LFB124
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x9ab
	.uleb128 0x31
	.4byte	.LASF48
	.byte	0x1
	.2byte	0x111
	.4byte	0x206
	.4byte	.LLST19
	.uleb128 0x31
	.4byte	.LASF44
	.byte	0x1
	.2byte	0x111
	.4byte	0x206
	.4byte	.LLST20
	.uleb128 0x32
	.ascii	"res\000"
	.byte	0x1
	.2byte	0x113
	.4byte	0x97
	.4byte	.LLST21
	.uleb128 0x33
	.4byte	.LASF27
	.byte	0x1
	.2byte	0x114
	.4byte	0xb8
	.4byte	.LLST22
	.uleb128 0x34
	.4byte	0x18b
	.4byte	.LBB33
	.4byte	.Ldebug_ranges0+0x30
	.byte	0x1
	.2byte	0x118
	.4byte	0x970
	.uleb128 0x27
	.4byte	.Ldebug_ranges0+0x30
	.uleb128 0x26
	.4byte	0x19b
	.4byte	.LLST23
	.uleb128 0x27
	.4byte	.Ldebug_ranges0+0x48
	.uleb128 0x26
	.4byte	0x19b
	.4byte	.LLST24
	.uleb128 0x1b
	.4byte	.LVL94
	.4byte	0x417
	.4byte	0x964
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x37
	.byte	0
	.uleb128 0x24
	.4byte	.LVL97
	.4byte	0x33c
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x24
	.4byte	.LVL85
	.4byte	0xab8
	.uleb128 0x1b
	.4byte	.LVL88
	.4byte	0x3b9
	.4byte	0x98d
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x75
	.sleb128 0
	.byte	0
	.uleb128 0x1b
	.4byte	.LVL89
	.4byte	0x1af
	.4byte	0x9a1
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x24
	.4byte	.LVL92
	.4byte	0xac3
	.byte	0
	.uleb128 0x35
	.4byte	.LASF50
	.byte	0x5
	.2byte	0x51b
	.4byte	0xe9
	.uleb128 0x6
	.4byte	0x9c7
	.4byte	0x9c7
	.uleb128 0x7
	.4byte	0xc3
	.byte	0x5
	.byte	0
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF49
	.uleb128 0x36
	.4byte	.LASF51
	.byte	0x1
	.byte	0x4
	.4byte	0x9df
	.uleb128 0x5
	.byte	0x3
	.4byte	c_nrf_master_addr
	.uleb128 0x37
	.4byte	0x9b7
	.uleb128 0x36
	.4byte	.LASF52
	.byte	0x1
	.byte	0x5
	.4byte	0x9f5
	.uleb128 0x5
	.byte	0x3
	.4byte	c_nrf_slave_addr
	.uleb128 0x37
	.4byte	0x9b7
	.uleb128 0x36
	.4byte	.LASF53
	.byte	0x1
	.byte	0x3
	.4byte	0xdf
	.uleb128 0x5
	.byte	0x3
	.4byte	g_nrf24l01_node_type
	.uleb128 0x36
	.4byte	.LASF54
	.byte	0x1
	.byte	0x6
	.4byte	0xa1c
	.uleb128 0x5
	.byte	0x3
	.4byte	g_node_addr
	.uleb128 0x16
	.byte	0x4
	.4byte	0xdf
	.uleb128 0x36
	.4byte	.LASF55
	.byte	0x1
	.byte	0x9
	.4byte	0xdf
	.uleb128 0x5
	.byte	0x3
	.4byte	nrf_mode
	.uleb128 0x38
	.4byte	.LASF56
	.byte	0x6
	.byte	0x1e
	.4byte	0xa49
	.uleb128 0x39
	.4byte	0x206
	.uleb128 0x39
	.4byte	0xa2
	.byte	0
	.uleb128 0x38
	.4byte	.LASF57
	.byte	0x7
	.byte	0xc
	.4byte	0xa5a
	.uleb128 0x39
	.4byte	0xb8
	.byte	0
	.uleb128 0x3a
	.4byte	.LASF59
	.byte	0x6
	.byte	0x1d
	.4byte	0x97
	.4byte	0xa6f
	.uleb128 0x39
	.4byte	0x97
	.byte	0
	.uleb128 0x38
	.4byte	.LASF60
	.byte	0x6
	.byte	0x1f
	.4byte	0xa85
	.uleb128 0x39
	.4byte	0x206
	.uleb128 0x39
	.4byte	0xa2
	.byte	0
	.uleb128 0x23
	.4byte	.LASF40
	.byte	0x1
	.byte	0x3b
	.4byte	0x89
	.4byte	0xa96
	.uleb128 0x15
	.byte	0
	.uleb128 0x38
	.4byte	.LASF61
	.byte	0x7
	.byte	0xb
	.4byte	0xaa7
	.uleb128 0x39
	.4byte	0xb8
	.byte	0
	.uleb128 0x38
	.4byte	.LASF62
	.byte	0x6
	.byte	0x1b
	.4byte	0xab8
	.uleb128 0x39
	.4byte	0xa2
	.byte	0
	.uleb128 0x3b
	.4byte	.LASF68
	.byte	0x7
	.byte	0x18
	.4byte	0xb8
	.uleb128 0x3c
	.4byte	.LASF63
	.byte	0x7
	.byte	0x19
	.4byte	0x97
	.uleb128 0x39
	.4byte	0xb8
	.uleb128 0x39
	.4byte	0xb8
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
	.uleb128 0xa
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
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
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
	.byte	0
	.byte	0
	.uleb128 0xe
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
	.uleb128 0x20
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x5
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
	.uleb128 0x11
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
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0xb
	.byte	0x1
	.byte	0
	.byte	0
	.uleb128 0x14
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
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x18
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
	.uleb128 0x19
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
	.uleb128 0x1a
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
	.uleb128 0x1b
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
	.uleb128 0x1c
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x2111
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x2115
	.uleb128 0x19
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1f
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
	.uleb128 0x20
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
	.uleb128 0x21
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x22
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
	.uleb128 0x23
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
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x24
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x25
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
	.uleb128 0x26
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x27
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
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
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x29
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2a
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2b
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
	.uleb128 0x2c
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x2d
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x2e
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
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2f
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x47
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x30
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
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
	.uleb128 0x31
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x32
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x33
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
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x34
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
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x35
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
	.uleb128 0x36
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
	.uleb128 0x37
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x38
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
	.uleb128 0x39
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3a
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
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3b
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
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x3c
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
	.uleb128 0x3c
	.uleb128 0x19
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
	.4byte	.LFE112-.Ltext0
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
	.4byte	.LVL5-.Ltext0
	.2byte	0x1
	.byte	0x56
	.4byte	.LVL5-.Ltext0
	.4byte	.LFE112-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL0-.Ltext0
	.4byte	.LVL3-1-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL3-1-.Ltext0
	.4byte	.LFE112-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST3:
	.4byte	.LVL6-.Ltext0
	.4byte	.LVL7-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL7-.Ltext0
	.4byte	.LVL9-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL9-.Ltext0
	.4byte	.LVL10-1-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL10-1-.Ltext0
	.4byte	.LFE111-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST4:
	.4byte	.LVL6-.Ltext0
	.4byte	.LVL8-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL8-.Ltext0
	.4byte	.LFE111-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST5:
	.4byte	.LVL11-.Ltext0
	.4byte	.LVL12-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL12-.Ltext0
	.4byte	.LFE113-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST6:
	.4byte	.LVL11-.Ltext0
	.4byte	.LVL13-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL13-.Ltext0
	.4byte	.LFE113-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST7:
	.4byte	.LVL20-.Ltext0
	.4byte	.LVL21-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL21-.Ltext0
	.4byte	.LVL22-1-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL22-1-.Ltext0
	.4byte	.LVL23-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL23-.Ltext0
	.4byte	.LVL24-1-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL24-1-.Ltext0
	.4byte	.LFE116-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST8:
	.4byte	.LVL25-.Ltext0
	.4byte	.LVL26-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL26-.Ltext0
	.4byte	.LFE119-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST9:
	.4byte	.LVL29-.Ltext0
	.4byte	.LVL30-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL30-.Ltext0
	.4byte	.LVL31-1-.Ltext0
	.2byte	0x5
	.byte	0x3
	.4byte	g_nrf24l01_node_type
	.4byte	.LVL31-1-.Ltext0
	.4byte	.LVL44-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	.LVL44-.Ltext0
	.4byte	.LFE110-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST10:
	.4byte	.LVL39-.Ltext0
	.4byte	.LVL40-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL40-.Ltext0
	.4byte	.LVL42-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	0
	.4byte	0
.LLST11:
	.4byte	.LVL46-.Ltext0
	.4byte	.LVL47-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST12:
	.4byte	.LVL45-.Ltext0
	.4byte	.LVL46-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL47-.Ltext0
	.4byte	.LVL48-1-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL48-.Ltext0
	.4byte	.LFE117-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST13:
	.4byte	.LVL54-.Ltext0
	.4byte	.LVL55-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL55-.Ltext0
	.4byte	.LVL59-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL59-.Ltext0
	.4byte	.LFE122-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST14:
	.4byte	.LVL60-.Ltext0
	.4byte	.LVL62-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL63-.Ltext0
	.4byte	.LVL64-.Ltext0
	.2byte	0x5
	.byte	0x70
	.sleb128 0
	.byte	0x31
	.byte	0x1a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST15:
	.4byte	.LVL65-.Ltext0
	.4byte	.LVL66-1-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL66-1-.Ltext0
	.4byte	.LVL83-.Ltext0
	.2byte	0x1
	.byte	0x57
	.4byte	.LVL83-.Ltext0
	.4byte	.LFE125-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST16:
	.4byte	.LVL69-.Ltext0
	.4byte	.LVL70-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST17:
	.4byte	.LVL67-.Ltext0
	.4byte	.LVL68-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL68-.Ltext0
	.4byte	.LVL71-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL71-.Ltext0
	.4byte	.LVL72-1-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL72-1-.Ltext0
	.4byte	.LVL74-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL80-.Ltext0
	.4byte	.LVL81-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL81-.Ltext0
	.4byte	.LVL83-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	0
	.4byte	0
.LLST18:
	.4byte	.LVL73-.Ltext0
	.4byte	.LVL80-.Ltext0
	.2byte	0x1
	.byte	0x57
	.4byte	0
	.4byte	0
.LLST19:
	.4byte	.LVL84-.Ltext0
	.4byte	.LVL85-1-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL85-1-.Ltext0
	.4byte	.LVL90-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL90-.Ltext0
	.4byte	.LFE124-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST20:
	.4byte	.LVL84-.Ltext0
	.4byte	.LVL85-1-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL85-1-.Ltext0
	.4byte	.LVL91-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL91-.Ltext0
	.4byte	.LFE124-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST21:
	.4byte	.LVL84-.Ltext0
	.4byte	.LVL98-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL98-.Ltext0
	.4byte	.LVL99-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL99-.Ltext0
	.4byte	.LFE124-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST22:
	.4byte	.LVL86-.Ltext0
	.4byte	.LVL87-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL87-.Ltext0
	.4byte	.LVL91-.Ltext0
	.2byte	0x1
	.byte	0x56
	.4byte	.LVL91-.Ltext0
	.4byte	.LVL92-1-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL92-1-.Ltext0
	.4byte	.LVL96-.Ltext0
	.2byte	0x1
	.byte	0x56
	.4byte	.LVL96-.Ltext0
	.4byte	.LVL97-1-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL97-1-.Ltext0
	.4byte	.LVL100-.Ltext0
	.2byte	0x1
	.byte	0x56
	.4byte	0
	.4byte	0
.LLST23:
	.4byte	.LVL91-.Ltext0
	.4byte	.LVL93-.Ltext0
	.2byte	0x2
	.byte	0x31
	.byte	0x9f
	.4byte	.LVL94-.Ltext0
	.4byte	.LVL97-.Ltext0
	.2byte	0x2
	.byte	0x31
	.byte	0x9f
	.4byte	.LVL97-.Ltext0
	.4byte	.LVL99-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL99-.Ltext0
	.4byte	.LFE124-.Ltext0
	.2byte	0x2
	.byte	0x31
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST24:
	.4byte	.LVL94-.Ltext0
	.4byte	.LVL95-.Ltext0
	.2byte	0x1
	.byte	0x50
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
	.4byte	.LBB10-.Ltext0
	.4byte	.LBE10-.Ltext0
	.4byte	.LBB11-.Ltext0
	.4byte	.LBE11-.Ltext0
	.4byte	0
	.4byte	0
	.4byte	.LBB15-.Ltext0
	.4byte	.LBE15-.Ltext0
	.4byte	.LBB16-.Ltext0
	.4byte	.LBE16-.Ltext0
	.4byte	0
	.4byte	0
	.4byte	.LBB33-.Ltext0
	.4byte	.LBE33-.Ltext0
	.4byte	.LBB42-.Ltext0
	.4byte	.LBE42-.Ltext0
	.4byte	0
	.4byte	0
	.4byte	.LBB36-.Ltext0
	.4byte	.LBE36-.Ltext0
	.4byte	.LBB37-.Ltext0
	.4byte	.LBE37-.Ltext0
	.4byte	.LBB38-.Ltext0
	.4byte	.LBE38-.Ltext0
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF25:
	.ascii	"GPIO_TypeDef\000"
.LASF36:
	.ascii	"setTxAddrNRF24L01\000"
.LASF61:
	.ascii	"delay_ms\000"
.LASF54:
	.ascii	"g_node_addr\000"
.LASF60:
	.ascii	"rxSPI1\000"
.LASF43:
	.ascii	"rxDataNRF24L01\000"
.LASF17:
	.ascii	"sizetype\000"
.LASF53:
	.ascii	"g_nrf24l01_node_type\000"
.LASF65:
	.ascii	"nrf24l01.c\000"
.LASF44:
	.ascii	"data\000"
.LASF57:
	.ascii	"delay_us\000"
.LASF66:
	.ascii	"/home/wubuntu/msut/STM32F407/projects/p6/PROJEKAT_R"
	.ascii	"ADI_PRENOS_ZVUKA\000"
.LASF4:
	.ascii	"__uint16_t\000"
.LASF68:
	.ascii	"getSYSTIM\000"
.LASF2:
	.ascii	"short int\000"
.LASF64:
	.ascii	"GNU C 4.9.3 20141119 (release) [ARM/embedded-4_9-br"
	.ascii	"anch revision 218278] -mlittle-endian -mthumb -mcpu"
	.ascii	"=cortex-m4 -mthumb-interwork -mfloat-abi=hard -mfpu"
	.ascii	"=fpv4-sp-d16 -g -O2 -fsingle-precision-constant\000"
.LASF58:
	.ascii	"txOverNRF24L01\000"
.LASF46:
	.ascii	"dataReadyNRF24L01\000"
.LASF27:
	.ascii	"timer\000"
.LASF19:
	.ascii	"OTYPER\000"
.LASF47:
	.ascii	"txDataNRF24L01\000"
.LASF31:
	.ascii	"setRxAddrNRF24L01\000"
.LASF10:
	.ascii	"long long int\000"
.LASF21:
	.ascii	"PUPDR\000"
.LASF7:
	.ascii	"long int\000"
.LASF32:
	.ascii	"addr\000"
.LASF23:
	.ascii	"BSRRH\000"
.LASF18:
	.ascii	"MODER\000"
.LASF67:
	.ascii	"setTxModeNRF24L01\000"
.LASF8:
	.ascii	"__uint32_t\000"
.LASF51:
	.ascii	"c_nrf_master_addr\000"
.LASF55:
	.ascii	"nrf_mode\000"
.LASF22:
	.ascii	"BSRRL\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF42:
	.ascii	"flushTxNRF24L01\000"
.LASF59:
	.ascii	"txByteSPI1\000"
.LASF0:
	.ascii	"signed char\000"
.LASF11:
	.ascii	"long long unsigned int\000"
.LASF16:
	.ascii	"uint32_t\000"
.LASF12:
	.ascii	"unsigned int\000"
.LASF14:
	.ascii	"uint16_t\000"
.LASF28:
	.ascii	"reg_val\000"
.LASF5:
	.ascii	"short unsigned int\000"
.LASF26:
	.ascii	"status\000"
.LASF40:
	.ascii	"printUSART2\000"
.LASF49:
	.ascii	"char\000"
.LASF15:
	.ascii	"int32_t\000"
.LASF34:
	.ascii	"setRxModeNRF24L01\000"
.LASF52:
	.ascii	"c_nrf_slave_addr\000"
.LASF63:
	.ascii	"chk4TimeoutSYSTIM\000"
.LASF20:
	.ascii	"OSPEEDR\000"
.LASF9:
	.ascii	"long unsigned int\000"
.LASF30:
	.ascii	"setRegNRF24L01\000"
.LASF41:
	.ascii	"onNRF24L01\000"
.LASF39:
	.ascii	"txPacketNRF24L01\000"
.LASF6:
	.ascii	"__int32_t\000"
.LASF62:
	.ascii	"initSPI1\000"
.LASF13:
	.ascii	"uint8_t\000"
.LASF45:
	.ascii	"getRegNRF24L01\000"
.LASF37:
	.ascii	"initNRF24L01\000"
.LASF29:
	.ascii	"n_val\000"
.LASF48:
	.ascii	"daddr\000"
.LASF50:
	.ascii	"ITM_RxBuffer\000"
.LASF33:
	.ascii	"conRegNRF24L01\000"
.LASF35:
	.ascii	"flushRxNRF24L01\000"
.LASF24:
	.ascii	"LCKR\000"
.LASF38:
	.ascii	"node_type\000"
.LASF3:
	.ascii	"__uint8_t\000"
.LASF56:
	.ascii	"txSPI1\000"
	.ident	"GCC: (GNU Tools for ARM Embedded Processors) 4.9.3 20141119 (release) [ARM/embedded-4_9-branch revision 218278]"
