	.arch armv4t
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 18, 4
	.file	"cordic_fixed_point_macro.c"
	.section	.rodata
	.align	2
	.type	arctan_degrees, %object
	.size	arctan_degrees, 64
arctan_degrees:
	.word	754974720
	.word	445687602
	.word	235489088
	.word	119537938
	.word	60000934
	.word	30029717
	.word	15018523
	.word	7509720
	.word	3754917
	.word	1877470
	.word	938734
	.word	469367
	.word	234684
	.word	117342
	.word	58671
	.word	29335
	.text
	.align	2
	.global	arctan_fraction_macro
	.type	arctan_fraction_macro, %function
arctan_fraction_macro:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #52
	mov	r3, r0
	mov	r2, r1
	strh	r3, [fp, #-14]	@ movhi
	strh	r2, [fp, #-16]	@ movhi
	ldrsh	r3, [fp, #-16]
	mov	r2, r3, asl #16
	ldrsh	r3, [fp, #-14]
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	orr	r3, r2, r3
	str	r3, [fp, #-12]
	mov	r3, #0
	str	r3, [fp, #-8]
#APP
@ 163 "Submission/c_src/cordic_fixed_point_macro.c" 1
	StartFunc_arctan_fraction_macro
@ 0 "" 2
	mov	r1, #0
	str	r1, [fp, #-28]
	ldr	r3, [fp, #-12]
	mov	r3, r3, asr #16
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-12]
	mov	r3, r3, asl #16
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	mov	r3, r3, asr #16
	str	r3, [fp, #-36]
	mov	r2, #0
	str	r2, [fp, #-32]
	ldr	r3, [fp, #-40]
	str	r3, [fp, #-24]
	ldr	r1, [fp, #-36]
	str	r1, [fp, #-20]
	ldr	r3, .L10
	ldr	r3, [r3, #0]
	str	r3, [fp, #-44]
	ldr	r2, [fp, #-36]
	cmp	r2, #0
	blt	.L2
	ldr	r3, [fp, #-44]
	rsb	r3, r3, #0
	str	r3, [fp, #-44]
	ldr	r1, [fp, #-24]
	rsb	r1, r1, #0
	str	r1, [fp, #-24]
	ldr	r2, [fp, #-20]
	rsb	r2, r2, #0
	str	r2, [fp, #-20]
.L2:
	ldr	r3, [fp, #-40]
	ldr	r1, [fp, #-20]
	rsb	r3, r1, r3
	str	r3, [fp, #-40]
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-24]
	add	r2, r2, r3
	str	r2, [fp, #-36]
	ldr	r1, [fp, #-32]
	ldr	r2, [fp, #-44]
	rsb	r1, r2, r1
	str	r1, [fp, #-32]
	ldr	r3, [fp, #-40]
	str	r3, [fp, #-24]
	ldr	r1, [fp, #-36]
	str	r1, [fp, #-20]
	mov	r2, #1
	str	r2, [fp, #-48]
	b	.L3
.L7:
	ldr	r2, [fp, #-48]
	ldr	r3, .L10
	ldr	r3, [r3, r2, asl #2]
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-36]
	cmp	r3, #0
	blt	.L4
	ldr	r1, [fp, #-44]
	rsb	r1, r1, #0
	str	r1, [fp, #-44]
	ldr	r2, [fp, #-24]
	rsb	r2, r2, #0
	str	r2, [fp, #-24]
	ldr	r3, [fp, #-20]
	rsb	r3, r3, #0
	str	r3, [fp, #-20]
.L4:
	ldr	r1, [fp, #-28]
	ldr	r2, [fp, #-24]
	and	r3, r1, r2
	cmp	r3, #0
	beq	.L5
	mov	r3, #1
	ldr	r1, [fp, #-48]
	mov	r3, r3, asl r1
	ldr	r2, [fp, #-24]
	orr	r2, r2, r3
	str	r2, [fp, #-24]
.L5:
	ldr	r1, [fp, #-28]
	ldr	r2, [fp, #-20]
	and	r3, r1, r2
	cmp	r3, #0
	beq	.L6
	mov	r3, #1
	ldr	r1, [fp, #-48]
	mov	r3, r3, asl r1
	ldr	r2, [fp, #-20]
	orr	r2, r2, r3
	str	r2, [fp, #-20]
.L6:
	ldr	r1, [fp, #-20]
	ldr	r2, [fp, #-48]
	mov	r3, r1, asr r2
	ldr	r1, [fp, #-40]
	rsb	r1, r3, r1
	str	r1, [fp, #-40]
	ldr	r2, [fp, #-24]
	ldr	r1, [fp, #-48]
	mov	r3, r2, asr r1
	ldr	r2, [fp, #-36]
	add	r2, r2, r3
	str	r2, [fp, #-36]
	ldr	r3, [fp, #-32]
	ldr	r1, [fp, #-44]
	rsb	r3, r1, r3
	str	r3, [fp, #-32]
	ldr	r2, [fp, #-40]
	str	r2, [fp, #-24]
	ldr	r3, [fp, #-36]
	str	r3, [fp, #-20]
	ldr	r1, [fp, #-48]
	sub	r2, r1, #1
	mov	r3, #1
	mov	r3, r3, asl r2
	ldr	r2, [fp, #-28]
	orr	r2, r2, r3
	str	r2, [fp, #-28]
	ldr	r3, [fp, #-48]
	add	r3, r3, #1
	str	r3, [fp, #-48]
.L3:
	ldr	r1, [fp, #-48]
	cmp	r1, #15
	ble	.L7
	ldr	r2, [fp, #-40]
	mov	r2, r2, asl #10
	str	r2, [fp, #-40]
	ldr	r3, .L10+4
	ldr	r1, [fp, #-40]
	smull	r2, r3, r1, r3
	mov	r2, r3, asr #4
	ldr	r1, [fp, #-40]
	mov	r3, r1, asr #31
	rsb	r3, r3, r2
	str	r3, [fp, #-40]
	ldr	r2, [fp, #-32]
	bic	r3, r2, #-16777216
	bic	r3, r3, #8388608
	cmp	r3, #0
	beq	.L8
	ldr	r3, [fp, #-32]
	orr	r3, r3, #16777216
	str	r3, [fp, #-32]
.L8:
	ldr	r1, [fp, #-32]
	mov	r1, r1, asr #24
	str	r1, [fp, #-32]
	ldr	r2, [fp, #-32]
	mov	r3, r2, asl #16
	mov	r3, r3, lsr #16
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-40]
	mov	r3, r3, asl #16
	str	r3, [fp, #-40]
	ldr	r1, [fp, #-40]
	ldr	r2, [fp, #-32]
	orr	r1, r1, r2
	str	r1, [fp, #-40]
	ldr	r3, [fp, #-40]
	str	r3, [fp, #-8]
#APP
@ 165 "Submission/c_src/cordic_fixed_point_macro.c" 1
	EndFunc_arctan_fraction_macro
@ 0 "" 2
	ldr	r3, [fp, #-8]
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
.L11:
	.align	2
.L10:
	.word	arctan_degrees
	.word	40758883
	.size	arctan_fraction_macro, .-arctan_fraction_macro
	.align	2
	.global	arctan_macro
	.type	arctan_macro, %function
arctan_macro:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	mov	r3, r0
	strh	r3, [fp, #-6]	@ movhi
	ldrsh	r3, [fp, #-6]
	mov	r0, r3
	mov	r1, #1
	bl	arctan_fraction_routine
	mov	r3, r0
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, lr}
	bx	lr
	.size	arctan_macro, .-arctan_macro
	.align	2
	.global	cos_macro
	.type	cos_macro, %function
cos_macro:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #52
	str	r0, [fp, #-16]
	mov	r3, #16384
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	mov	r3, r3, asl #16
	str	r3, [fp, #-12]
	mov	r3, #0
	str	r3, [fp, #-8]
#APP
@ 182 "Submission/c_src/cordic_fixed_point_macro.c" 1
	StartFunc_cos_macro
@ 0 "" 2
	mov	r1, #0
	str	r1, [fp, #-28]
	ldr	r3, [fp, #-12]
	mov	r3, r3, asr #16
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-12]
	mov	r3, r3, asl #16
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	mov	r3, r3, asr #16
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-16]
	mov	r3, r3, asl #24
	str	r3, [fp, #-32]
	ldr	r2, [fp, #-40]
	str	r2, [fp, #-24]
	ldr	r3, [fp, #-36]
	str	r3, [fp, #-20]
	ldr	r3, .L23
	ldr	r3, [r3, #0]
	str	r3, [fp, #-44]
	ldr	r1, [fp, #-32]
	cmp	r1, #0
	bge	.L15
	ldr	r2, [fp, #-44]
	rsb	r2, r2, #0
	str	r2, [fp, #-44]
	ldr	r3, [fp, #-24]
	rsb	r3, r3, #0
	str	r3, [fp, #-24]
	ldr	r1, [fp, #-20]
	rsb	r1, r1, #0
	str	r1, [fp, #-20]
.L15:
	ldr	r2, [fp, #-40]
	ldr	r3, [fp, #-20]
	rsb	r2, r3, r2
	str	r2, [fp, #-40]
	ldr	r1, [fp, #-36]
	ldr	r2, [fp, #-24]
	add	r1, r1, r2
	str	r1, [fp, #-36]
	ldr	r3, [fp, #-32]
	ldr	r1, [fp, #-44]
	rsb	r3, r1, r3
	str	r3, [fp, #-32]
	ldr	r2, [fp, #-40]
	str	r2, [fp, #-24]
	ldr	r3, [fp, #-36]
	str	r3, [fp, #-20]
	mov	r1, #1
	str	r1, [fp, #-48]
	b	.L16
.L20:
	ldr	r2, [fp, #-48]
	ldr	r3, .L23
	ldr	r3, [r3, r2, asl #2]
	str	r3, [fp, #-44]
	ldr	r2, [fp, #-32]
	cmp	r2, #0
	bge	.L17
	ldr	r3, [fp, #-44]
	rsb	r3, r3, #0
	str	r3, [fp, #-44]
	ldr	r1, [fp, #-24]
	rsb	r1, r1, #0
	str	r1, [fp, #-24]
	ldr	r2, [fp, #-20]
	rsb	r2, r2, #0
	str	r2, [fp, #-20]
.L17:
	ldr	r1, [fp, #-28]
	ldr	r2, [fp, #-24]
	and	r3, r1, r2
	cmp	r3, #0
	beq	.L18
	mov	r3, #1
	ldr	r1, [fp, #-48]
	mov	r3, r3, asl r1
	ldr	r2, [fp, #-24]
	orr	r2, r2, r3
	str	r2, [fp, #-24]
.L18:
	ldr	r1, [fp, #-28]
	ldr	r2, [fp, #-20]
	and	r3, r1, r2
	cmp	r3, #0
	beq	.L19
	mov	r3, #1
	ldr	r1, [fp, #-48]
	mov	r3, r3, asl r1
	ldr	r2, [fp, #-20]
	orr	r2, r2, r3
	str	r2, [fp, #-20]
.L19:
	ldr	r1, [fp, #-20]
	ldr	r2, [fp, #-48]
	mov	r3, r1, asr r2
	ldr	r1, [fp, #-40]
	rsb	r1, r3, r1
	str	r1, [fp, #-40]
	ldr	r2, [fp, #-24]
	ldr	r1, [fp, #-48]
	mov	r3, r2, asr r1
	ldr	r2, [fp, #-36]
	add	r2, r2, r3
	str	r2, [fp, #-36]
	ldr	r3, [fp, #-32]
	ldr	r1, [fp, #-44]
	rsb	r3, r1, r3
	str	r3, [fp, #-32]
	ldr	r2, [fp, #-40]
	str	r2, [fp, #-24]
	ldr	r3, [fp, #-36]
	str	r3, [fp, #-20]
	ldr	r1, [fp, #-48]
	sub	r2, r1, #1
	mov	r3, #1
	mov	r3, r3, asl r2
	ldr	r2, [fp, #-28]
	orr	r2, r2, r3
	str	r2, [fp, #-28]
	ldr	r3, [fp, #-48]
	add	r3, r3, #1
	str	r3, [fp, #-48]
.L16:
	ldr	r1, [fp, #-48]
	cmp	r1, #15
	ble	.L20
	ldr	r2, [fp, #-40]
	mov	r2, r2, asl #10
	str	r2, [fp, #-40]
	ldr	r3, .L23+4
	ldr	r1, [fp, #-40]
	smull	r2, r3, r1, r3
	mov	r2, r3, asr #4
	ldr	r1, [fp, #-40]
	mov	r3, r1, asr #31
	rsb	r3, r3, r2
	str	r3, [fp, #-40]
	ldr	r2, [fp, #-36]
	mov	r2, r2, asl #10
	str	r2, [fp, #-36]
	ldr	r3, .L23+4
	ldr	r1, [fp, #-36]
	smull	r2, r3, r1, r3
	mov	r2, r3, asr #4
	ldr	r1, [fp, #-36]
	mov	r3, r1, asr #31
	rsb	r3, r3, r2
	str	r3, [fp, #-36]
	ldr	r2, [fp, #-36]
	mov	r3, r2, asl #16
	mov	r3, r3, lsr #16
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-40]
	mov	r3, r3, asl #16
	str	r3, [fp, #-40]
	ldr	r1, [fp, #-40]
	ldr	r2, [fp, #-36]
	orr	r1, r1, r2
	str	r1, [fp, #-40]
	ldr	r3, [fp, #-40]
	str	r3, [fp, #-8]
#APP
@ 184 "Submission/c_src/cordic_fixed_point_macro.c" 1
	EndFunc_cos_macro
@ 0 "" 2
	ldr	r3, [fp, #-8]
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	mov	r3, r3, asr #16
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	mov	r3, r3, asl #2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	mov	r3, r3, asl #18
	mov	r3, r3, lsr #18
	cmp	r3, #0
	beq	.L21
	ldr	r3, [fp, #-12]
	orr	r3, r3, #16384
	str	r3, [fp, #-12]
.L21:
	ldr	r3, [fp, #-12]
	mov	r3, r3, asr #14
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
.L24:
	.align	2
.L23:
	.word	arctan_degrees
	.word	40758883
	.size	cos_macro, .-cos_macro
	.align	2
	.global	sin_macro
	.type	sin_macro, %function
sin_macro:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #52
	str	r0, [fp, #-16]
	mov	r3, #16384
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	mov	r3, r3, asl #16
	str	r3, [fp, #-12]
	mov	r3, #0
	str	r3, [fp, #-8]
#APP
@ 202 "Submission/c_src/cordic_fixed_point_macro.c" 1
	StartFunc_sin_macro
@ 0 "" 2
	mov	r1, #0
	str	r1, [fp, #-28]
	ldr	r3, [fp, #-12]
	mov	r3, r3, asr #16
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-12]
	mov	r3, r3, asl #16
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	mov	r3, r3, asr #16
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-16]
	mov	r3, r3, asl #24
	str	r3, [fp, #-32]
	ldr	r2, [fp, #-40]
	str	r2, [fp, #-24]
	ldr	r3, [fp, #-36]
	str	r3, [fp, #-20]
	ldr	r3, .L34
	ldr	r3, [r3, #0]
	str	r3, [fp, #-44]
	ldr	r1, [fp, #-32]
	cmp	r1, #0
	bge	.L26
	ldr	r2, [fp, #-44]
	rsb	r2, r2, #0
	str	r2, [fp, #-44]
	ldr	r3, [fp, #-24]
	rsb	r3, r3, #0
	str	r3, [fp, #-24]
	ldr	r1, [fp, #-20]
	rsb	r1, r1, #0
	str	r1, [fp, #-20]
.L26:
	ldr	r2, [fp, #-40]
	ldr	r3, [fp, #-20]
	rsb	r2, r3, r2
	str	r2, [fp, #-40]
	ldr	r1, [fp, #-36]
	ldr	r2, [fp, #-24]
	add	r1, r1, r2
	str	r1, [fp, #-36]
	ldr	r3, [fp, #-32]
	ldr	r1, [fp, #-44]
	rsb	r3, r1, r3
	str	r3, [fp, #-32]
	ldr	r2, [fp, #-40]
	str	r2, [fp, #-24]
	ldr	r3, [fp, #-36]
	str	r3, [fp, #-20]
	mov	r1, #1
	str	r1, [fp, #-48]
	b	.L27
.L31:
	ldr	r2, [fp, #-48]
	ldr	r3, .L34
	ldr	r3, [r3, r2, asl #2]
	str	r3, [fp, #-44]
	ldr	r2, [fp, #-32]
	cmp	r2, #0
	bge	.L28
	ldr	r3, [fp, #-44]
	rsb	r3, r3, #0
	str	r3, [fp, #-44]
	ldr	r1, [fp, #-24]
	rsb	r1, r1, #0
	str	r1, [fp, #-24]
	ldr	r2, [fp, #-20]
	rsb	r2, r2, #0
	str	r2, [fp, #-20]
.L28:
	ldr	r1, [fp, #-28]
	ldr	r2, [fp, #-24]
	and	r3, r1, r2
	cmp	r3, #0
	beq	.L29
	mov	r3, #1
	ldr	r1, [fp, #-48]
	mov	r3, r3, asl r1
	ldr	r2, [fp, #-24]
	orr	r2, r2, r3
	str	r2, [fp, #-24]
.L29:
	ldr	r1, [fp, #-28]
	ldr	r2, [fp, #-20]
	and	r3, r1, r2
	cmp	r3, #0
	beq	.L30
	mov	r3, #1
	ldr	r1, [fp, #-48]
	mov	r3, r3, asl r1
	ldr	r2, [fp, #-20]
	orr	r2, r2, r3
	str	r2, [fp, #-20]
.L30:
	ldr	r1, [fp, #-20]
	ldr	r2, [fp, #-48]
	mov	r3, r1, asr r2
	ldr	r1, [fp, #-40]
	rsb	r1, r3, r1
	str	r1, [fp, #-40]
	ldr	r2, [fp, #-24]
	ldr	r1, [fp, #-48]
	mov	r3, r2, asr r1
	ldr	r2, [fp, #-36]
	add	r2, r2, r3
	str	r2, [fp, #-36]
	ldr	r3, [fp, #-32]
	ldr	r1, [fp, #-44]
	rsb	r3, r1, r3
	str	r3, [fp, #-32]
	ldr	r2, [fp, #-40]
	str	r2, [fp, #-24]
	ldr	r3, [fp, #-36]
	str	r3, [fp, #-20]
	ldr	r1, [fp, #-48]
	sub	r2, r1, #1
	mov	r3, #1
	mov	r3, r3, asl r2
	ldr	r2, [fp, #-28]
	orr	r2, r2, r3
	str	r2, [fp, #-28]
	ldr	r3, [fp, #-48]
	add	r3, r3, #1
	str	r3, [fp, #-48]
.L27:
	ldr	r1, [fp, #-48]
	cmp	r1, #15
	ble	.L31
	ldr	r2, [fp, #-40]
	mov	r2, r2, asl #10
	str	r2, [fp, #-40]
	ldr	r3, .L34+4
	ldr	r1, [fp, #-40]
	smull	r2, r3, r1, r3
	mov	r2, r3, asr #4
	ldr	r1, [fp, #-40]
	mov	r3, r1, asr #31
	rsb	r3, r3, r2
	str	r3, [fp, #-40]
	ldr	r2, [fp, #-36]
	mov	r2, r2, asl #10
	str	r2, [fp, #-36]
	ldr	r3, .L34+4
	ldr	r1, [fp, #-36]
	smull	r2, r3, r1, r3
	mov	r2, r3, asr #4
	ldr	r1, [fp, #-36]
	mov	r3, r1, asr #31
	rsb	r3, r3, r2
	str	r3, [fp, #-36]
	ldr	r2, [fp, #-36]
	mov	r3, r2, asl #16
	mov	r3, r3, lsr #16
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-40]
	mov	r3, r3, asl #16
	str	r3, [fp, #-40]
	ldr	r1, [fp, #-40]
	ldr	r2, [fp, #-36]
	orr	r1, r1, r2
	str	r1, [fp, #-40]
	ldr	r3, [fp, #-40]
	str	r3, [fp, #-8]
#APP
@ 204 "Submission/c_src/cordic_fixed_point_macro.c" 1
	EndFunc_sin_macro
@ 0 "" 2
	ldr	r3, [fp, #-8]
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	mov	r3, r3, asl #16
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	mov	r3, r3, asr #16
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	mov	r3, r3, asl #2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	mov	r3, r3, asl #18
	mov	r3, r3, lsr #18
	cmp	r3, #0
	beq	.L32
	ldr	r3, [fp, #-12]
	orr	r3, r3, #16384
	str	r3, [fp, #-12]
.L32:
	ldr	r3, [fp, #-12]
	mov	r3, r3, asr #14
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
.L35:
	.align	2
.L34:
	.word	arctan_degrees
	.word	40758883
	.size	sin_macro, .-sin_macro
	.ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
	.section	.note.GNU-stack,"",%progbits
