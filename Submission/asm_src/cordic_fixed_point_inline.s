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
	.file	"cordic_fixed_point_inline.c"
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
	.global	arctan_fraction_inline
	.type	arctan_fraction_inline, %function
arctan_fraction_inline:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
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
	str	r3, [fp, #-8]
#APP
@ 176 "Submission/c_src/cordic_fixed_point_inline.c" 1
	.StartFunc_arctan_fraction_inline
@ 0 "" 2
	ldr	r0, [fp, #-8]
	bl	vectoring
	mov	r3, r0
	str	r3, [fp, #-8]
#APP
@ 178 "Submission/c_src/cordic_fixed_point_inline.c" 1
	.EndFunc_arctan_fraction_inline
@ 0 "" 2
	ldr	r3, [fp, #-8]
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, lr}
	bx	lr
	.size	arctan_fraction_inline, .-arctan_fraction_inline
	.align	2
	.type	vectoring, %function
vectoring:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #44
	str	r0, [fp, #-8]
	mov	r1, #0
	str	r1, [fp, #-20]
	ldr	r3, [fp, #-8]
	mov	r3, r3, asr #16
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-8]
	mov	r3, r3, asl #16
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	mov	r3, r3, asr #16
	str	r3, [fp, #-28]
	mov	r2, #0
	str	r2, [fp, #-24]
	ldr	r3, [fp, #-32]
	str	r3, [fp, #-16]
	ldr	r1, [fp, #-28]
	str	r1, [fp, #-12]
	ldr	r3, .L12
	ldr	r3, [r3, #0]
	str	r3, [fp, #-36]
	ldr	r2, [fp, #-28]
	cmp	r2, #0
	blt	.L4
	ldr	r3, [fp, #-36]
	rsb	r3, r3, #0
	str	r3, [fp, #-36]
	ldr	r1, [fp, #-16]
	rsb	r1, r1, #0
	str	r1, [fp, #-16]
	ldr	r2, [fp, #-12]
	rsb	r2, r2, #0
	str	r2, [fp, #-12]
.L4:
	ldr	r3, [fp, #-32]
	ldr	r1, [fp, #-12]
	rsb	r3, r1, r3
	str	r3, [fp, #-32]
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-16]
	add	r2, r2, r3
	str	r2, [fp, #-28]
	ldr	r1, [fp, #-24]
	ldr	r2, [fp, #-36]
	rsb	r1, r2, r1
	str	r1, [fp, #-24]
	ldr	r3, [fp, #-32]
	str	r3, [fp, #-16]
	ldr	r1, [fp, #-28]
	str	r1, [fp, #-12]
	mov	r2, #1
	str	r2, [fp, #-40]
	b	.L5
.L9:
	ldr	r2, [fp, #-40]
	ldr	r3, .L12
	ldr	r3, [r3, r2, asl #2]
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	blt	.L6
	ldr	r1, [fp, #-36]
	rsb	r1, r1, #0
	str	r1, [fp, #-36]
	ldr	r2, [fp, #-16]
	rsb	r2, r2, #0
	str	r2, [fp, #-16]
	ldr	r3, [fp, #-12]
	rsb	r3, r3, #0
	str	r3, [fp, #-12]
.L6:
	ldr	r1, [fp, #-20]
	ldr	r2, [fp, #-16]
	and	r3, r1, r2
	cmp	r3, #0
	beq	.L7
	mov	r3, #1
	ldr	r1, [fp, #-40]
	mov	r3, r3, asl r1
	ldr	r2, [fp, #-16]
	orr	r2, r2, r3
	str	r2, [fp, #-16]
.L7:
	ldr	r1, [fp, #-20]
	ldr	r2, [fp, #-12]
	and	r3, r1, r2
	cmp	r3, #0
	beq	.L8
	mov	r3, #1
	ldr	r1, [fp, #-40]
	mov	r3, r3, asl r1
	ldr	r2, [fp, #-12]
	orr	r2, r2, r3
	str	r2, [fp, #-12]
.L8:
	ldr	r1, [fp, #-12]
	ldr	r2, [fp, #-40]
	mov	r3, r1, asr r2
	ldr	r1, [fp, #-32]
	rsb	r1, r3, r1
	str	r1, [fp, #-32]
	ldr	r2, [fp, #-16]
	ldr	r1, [fp, #-40]
	mov	r3, r2, asr r1
	ldr	r2, [fp, #-28]
	add	r2, r2, r3
	str	r2, [fp, #-28]
	ldr	r3, [fp, #-24]
	ldr	r1, [fp, #-36]
	rsb	r3, r1, r3
	str	r3, [fp, #-24]
	ldr	r2, [fp, #-32]
	str	r2, [fp, #-16]
	ldr	r3, [fp, #-28]
	str	r3, [fp, #-12]
	ldr	r1, [fp, #-40]
	sub	r2, r1, #1
	mov	r3, #1
	mov	r3, r3, asl r2
	ldr	r2, [fp, #-20]
	orr	r2, r2, r3
	str	r2, [fp, #-20]
	ldr	r3, [fp, #-40]
	add	r3, r3, #1
	str	r3, [fp, #-40]
.L5:
	ldr	r1, [fp, #-40]
	cmp	r1, #15
	ble	.L9
	ldr	r2, [fp, #-32]
	mov	r2, r2, asl #10
	str	r2, [fp, #-32]
	ldr	r3, .L12+4
	ldr	r1, [fp, #-32]
	smull	r2, r3, r1, r3
	mov	r2, r3, asr #4
	ldr	r1, [fp, #-32]
	mov	r3, r1, asr #31
	rsb	r3, r3, r2
	str	r3, [fp, #-32]
	ldr	r2, [fp, #-24]
	bic	r3, r2, #-16777216
	bic	r3, r3, #8388608
	cmp	r3, #0
	beq	.L10
	ldr	r3, [fp, #-24]
	orr	r3, r3, #16777216
	str	r3, [fp, #-24]
.L10:
	ldr	r1, [fp, #-24]
	mov	r1, r1, asr #24
	str	r1, [fp, #-24]
	ldr	r2, [fp, #-24]
	mov	r3, r2, asl #16
	mov	r3, r3, lsr #16
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-32]
	mov	r3, r3, asl #16
	str	r3, [fp, #-32]
	ldr	r1, [fp, #-32]
	ldr	r2, [fp, #-24]
	orr	r1, r1, r2
	str	r1, [fp, #-32]
	ldr	r3, [fp, #-32]
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
.L13:
	.align	2
.L12:
	.word	arctan_degrees
	.word	40758883
	.size	vectoring, .-vectoring
	.align	2
	.global	arctan_inline
	.type	arctan_inline, %function
arctan_inline:
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
	mov	r3, r3, asr #16
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, lr}
	bx	lr
	.size	arctan_inline, .-arctan_inline
	.align	2
	.global	cos_inline
	.type	cos_inline, %function
cos_inline:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-16]
	mov	r3, #16384
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	mov	r3, r3, asl #16
	str	r3, [fp, #-8]
#APP
@ 192 "Submission/c_src/cordic_fixed_point_inline.c" 1
	.StartFunc_cos_inline
@ 0 "" 2
	ldr	r0, [fp, #-8]
	ldr	r1, [fp, #-16]
	bl	rotation
	mov	r3, r0
	str	r3, [fp, #-8]
#APP
@ 194 "Submission/c_src/cordic_fixed_point_inline.c" 1
	.EndFunc_cos_inline
@ 0 "" 2
	ldr	r3, [fp, #-8]
	mov	r3, r3, asr #16
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	mov	r3, r3, asl #2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	mov	r3, r3, asl #18
	mov	r3, r3, lsr #18
	cmp	r3, #0
	beq	.L17
	ldr	r3, [fp, #-8]
	orr	r3, r3, #16384
	str	r3, [fp, #-8]
.L17:
	ldr	r3, [fp, #-8]
	mov	r3, r3, asr #14
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, lr}
	bx	lr
	.size	cos_inline, .-cos_inline
	.align	2
	.type	rotation, %function
rotation:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #44
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	mov	r1, #0
	str	r1, [fp, #-24]
	ldr	r3, [fp, #-8]
	mov	r3, r3, asr #16
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-8]
	mov	r3, r3, asl #16
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	mov	r3, r3, asr #16
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-12]
	mov	r3, r3, asl #24
	str	r3, [fp, #-28]
	ldr	r2, [fp, #-36]
	str	r2, [fp, #-20]
	ldr	r3, [fp, #-32]
	str	r3, [fp, #-16]
	ldr	r3, .L27
	ldr	r3, [r3, #0]
	str	r3, [fp, #-40]
	ldr	r1, [fp, #-28]
	cmp	r1, #0
	bge	.L20
	ldr	r2, [fp, #-40]
	rsb	r2, r2, #0
	str	r2, [fp, #-40]
	ldr	r3, [fp, #-20]
	rsb	r3, r3, #0
	str	r3, [fp, #-20]
	ldr	r1, [fp, #-16]
	rsb	r1, r1, #0
	str	r1, [fp, #-16]
.L20:
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-16]
	rsb	r2, r3, r2
	str	r2, [fp, #-36]
	ldr	r1, [fp, #-32]
	ldr	r2, [fp, #-20]
	add	r1, r1, r2
	str	r1, [fp, #-32]
	ldr	r3, [fp, #-28]
	ldr	r1, [fp, #-40]
	rsb	r3, r1, r3
	str	r3, [fp, #-28]
	ldr	r2, [fp, #-36]
	str	r2, [fp, #-20]
	ldr	r3, [fp, #-32]
	str	r3, [fp, #-16]
	mov	r1, #1
	str	r1, [fp, #-44]
	b	.L21
.L25:
	ldr	r2, [fp, #-44]
	ldr	r3, .L27
	ldr	r3, [r3, r2, asl #2]
	str	r3, [fp, #-40]
	ldr	r2, [fp, #-28]
	cmp	r2, #0
	bge	.L22
	ldr	r3, [fp, #-40]
	rsb	r3, r3, #0
	str	r3, [fp, #-40]
	ldr	r1, [fp, #-20]
	rsb	r1, r1, #0
	str	r1, [fp, #-20]
	ldr	r2, [fp, #-16]
	rsb	r2, r2, #0
	str	r2, [fp, #-16]
.L22:
	ldr	r1, [fp, #-24]
	ldr	r2, [fp, #-20]
	and	r3, r1, r2
	cmp	r3, #0
	beq	.L23
	mov	r3, #1
	ldr	r1, [fp, #-44]
	mov	r3, r3, asl r1
	ldr	r2, [fp, #-20]
	orr	r2, r2, r3
	str	r2, [fp, #-20]
.L23:
	ldr	r1, [fp, #-24]
	ldr	r2, [fp, #-16]
	and	r3, r1, r2
	cmp	r3, #0
	beq	.L24
	mov	r3, #1
	ldr	r1, [fp, #-44]
	mov	r3, r3, asl r1
	ldr	r2, [fp, #-16]
	orr	r2, r2, r3
	str	r2, [fp, #-16]
.L24:
	ldr	r1, [fp, #-16]
	ldr	r2, [fp, #-44]
	mov	r3, r1, asr r2
	ldr	r1, [fp, #-36]
	rsb	r1, r3, r1
	str	r1, [fp, #-36]
	ldr	r2, [fp, #-20]
	ldr	r1, [fp, #-44]
	mov	r3, r2, asr r1
	ldr	r2, [fp, #-32]
	add	r2, r2, r3
	str	r2, [fp, #-32]
	ldr	r3, [fp, #-28]
	ldr	r1, [fp, #-40]
	rsb	r3, r1, r3
	str	r3, [fp, #-28]
	ldr	r2, [fp, #-36]
	str	r2, [fp, #-20]
	ldr	r3, [fp, #-32]
	str	r3, [fp, #-16]
	ldr	r1, [fp, #-44]
	sub	r2, r1, #1
	mov	r3, #1
	mov	r3, r3, asl r2
	ldr	r2, [fp, #-24]
	orr	r2, r2, r3
	str	r2, [fp, #-24]
	ldr	r3, [fp, #-44]
	add	r3, r3, #1
	str	r3, [fp, #-44]
.L21:
	ldr	r1, [fp, #-44]
	cmp	r1, #15
	ble	.L25
	ldr	r2, [fp, #-36]
	mov	r2, r2, asl #10
	str	r2, [fp, #-36]
	ldr	r3, .L27+4
	ldr	r1, [fp, #-36]
	smull	r2, r3, r1, r3
	mov	r2, r3, asr #4
	ldr	r1, [fp, #-36]
	mov	r3, r1, asr #31
	rsb	r3, r3, r2
	str	r3, [fp, #-36]
	ldr	r2, [fp, #-32]
	mov	r2, r2, asl #10
	str	r2, [fp, #-32]
	ldr	r3, .L27+4
	ldr	r1, [fp, #-32]
	smull	r2, r3, r1, r3
	mov	r2, r3, asr #4
	ldr	r1, [fp, #-32]
	mov	r3, r1, asr #31
	rsb	r3, r3, r2
	str	r3, [fp, #-32]
	ldr	r2, [fp, #-32]
	mov	r3, r2, asl #16
	mov	r3, r3, lsr #16
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-36]
	mov	r3, r3, asl #16
	str	r3, [fp, #-36]
	ldr	r1, [fp, #-36]
	ldr	r2, [fp, #-32]
	orr	r1, r1, r2
	str	r1, [fp, #-36]
	ldr	r3, [fp, #-36]
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
.L28:
	.align	2
.L27:
	.word	arctan_degrees
	.word	40758883
	.size	rotation, .-rotation
	.align	2
	.global	sin_inline
	.type	sin_inline, %function
sin_inline:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-16]
	mov	r3, #16384
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	mov	r3, r3, asl #16
	str	r3, [fp, #-8]
#APP
@ 210 "Submission/c_src/cordic_fixed_point_inline.c" 1
	.StartFunc_sin_inline
@ 0 "" 2
	ldr	r0, [fp, #-8]
	ldr	r1, [fp, #-16]
	bl	rotation
	mov	r3, r0
	str	r3, [fp, #-8]
#APP
@ 212 "Submission/c_src/cordic_fixed_point_inline.c" 1
	.EndFunc_sin_inline
@ 0 "" 2
	ldr	r3, [fp, #-8]
	mov	r3, r3, asl #16
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	mov	r3, r3, asr #16
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	mov	r3, r3, asl #2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	mov	r3, r3, asl #18
	mov	r3, r3, lsr #18
	cmp	r3, #0
	beq	.L30
	ldr	r3, [fp, #-8]
	orr	r3, r3, #16384
	str	r3, [fp, #-8]
.L30:
	ldr	r3, [fp, #-8]
	mov	r3, r3, asr #14
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, lr}
	bx	lr
	.size	sin_inline, .-sin_inline
	.ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
	.section	.note.GNU-stack,"",%progbits
