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
	.file	"cordic_fixed_point_optim.c"
	.global	arctan_degrees
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
	.global	rotation
	.type	rotation, %function
rotation:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #52
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	mov	r1, #0
	str	r1, [fp, #-24]
	ldr	r3, [fp, #-8]
	mov	r3, r3, asr #16
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-8]
	mov	r3, r3, asl #16
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	mov	r3, r3, asr #16
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-12]
	mov	r3, r3, asl #24
	str	r3, [fp, #-32]
	ldr	r2, [fp, #-40]
	str	r2, [fp, #-20]
	ldr	r3, [fp, #-36]
	str	r3, [fp, #-16]
	ldr	r3, .L9
	ldr	r3, [r3, #0]
	str	r3, [fp, #-44]
	ldr	r1, [fp, #-32]
	cmp	r1, #0
	bge	.L2
	ldr	r2, [fp, #-44]
	rsb	r2, r2, #0
	str	r2, [fp, #-44]
	ldr	r3, [fp, #-20]
	rsb	r3, r3, #0
	str	r3, [fp, #-20]
	ldr	r1, [fp, #-16]
	rsb	r1, r1, #0
	str	r1, [fp, #-16]
.L2:
	ldr	r2, [fp, #-40]
	ldr	r3, [fp, #-16]
	rsb	r2, r3, r2
	str	r2, [fp, #-40]
	ldr	r1, [fp, #-36]
	ldr	r2, [fp, #-20]
	add	r1, r1, r2
	str	r1, [fp, #-36]
	ldr	r3, [fp, #-32]
	ldr	r1, [fp, #-44]
	rsb	r3, r1, r3
	str	r3, [fp, #-32]
	ldr	r2, [fp, #-40]
	str	r2, [fp, #-20]
	ldr	r3, [fp, #-36]
	str	r3, [fp, #-16]
	mov	r1, #1
	str	r1, [fp, #-48]
	b	.L3
.L7:
	ldr	r2, [fp, #-48]
	ldr	r3, .L9
	ldr	r3, [r3, r2, asl #2]
	str	r3, [fp, #-44]
	ldr	r2, [fp, #-32]
	cmp	r2, #0
	bge	.L4
	ldr	r3, [fp, #-44]
	rsb	r3, r3, #0
	str	r3, [fp, #-44]
	ldr	r1, [fp, #-20]
	rsb	r1, r1, #0
	str	r1, [fp, #-20]
	ldr	r2, [fp, #-16]
	rsb	r2, r2, #0
	str	r2, [fp, #-16]
.L4:
	mov	r3, #1
	ldr	r1, [fp, #-48]
	mov	r3, r3, asl r1
	str	r3, [fp, #-28]
	ldr	r2, [fp, #-24]
	ldr	r1, [fp, #-20]
	and	r3, r2, r1
	cmp	r3, #0
	beq	.L5
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-28]
	orr	r2, r2, r3
	str	r2, [fp, #-20]
.L5:
	ldr	r1, [fp, #-24]
	ldr	r2, [fp, #-16]
	and	r3, r1, r2
	cmp	r3, #0
	beq	.L6
	ldr	r3, [fp, #-16]
	ldr	r1, [fp, #-28]
	orr	r3, r3, r1
	str	r3, [fp, #-16]
.L6:
	ldr	r2, [fp, #-28]
	mov	r3, r2, asr #1
	ldr	r1, [fp, #-24]
	orr	r1, r1, r3
	str	r1, [fp, #-24]
	ldr	r2, [fp, #-16]
	ldr	r1, [fp, #-48]
	mov	r3, r2, asr r1
	ldr	r2, [fp, #-40]
	rsb	r2, r3, r2
	str	r2, [fp, #-40]
	ldr	r1, [fp, #-20]
	ldr	r2, [fp, #-48]
	mov	r3, r1, asr r2
	ldr	r1, [fp, #-36]
	add	r1, r1, r3
	str	r1, [fp, #-36]
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-44]
	rsb	r2, r3, r2
	str	r2, [fp, #-32]
	ldr	r1, [fp, #-40]
	str	r1, [fp, #-20]
	ldr	r2, [fp, #-36]
	str	r2, [fp, #-16]
	ldr	r3, [fp, #-48]
	add	r3, r3, #1
	str	r3, [fp, #-48]
.L3:
	ldr	r1, [fp, #-48]
	cmp	r1, #16
	bne	.L7
	ldr	r2, [fp, #-40]
	mov	r2, r2, asl #10
	str	r2, [fp, #-40]
	ldr	r3, .L9+4
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
	ldr	r3, .L9+4
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
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
.L10:
	.align	2
.L9:
	.word	arctan_degrees
	.word	40758883
	.size	rotation, .-rotation
	.align	2
	.global	vectoring
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
	ldr	r3, .L20
	ldr	r3, [r3, #0]
	str	r3, [fp, #-36]
	ldr	r2, [fp, #-28]
	cmp	r2, #0
	blt	.L12
	ldr	r3, [fp, #-36]
	rsb	r3, r3, #0
	str	r3, [fp, #-36]
	ldr	r1, [fp, #-16]
	rsb	r1, r1, #0
	str	r1, [fp, #-16]
	ldr	r2, [fp, #-12]
	rsb	r2, r2, #0
	str	r2, [fp, #-12]
.L12:
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
	b	.L13
.L17:
	ldr	r2, [fp, #-40]
	ldr	r3, .L20
	ldr	r3, [r3, r2, asl #2]
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	blt	.L14
	ldr	r1, [fp, #-36]
	rsb	r1, r1, #0
	str	r1, [fp, #-36]
	ldr	r2, [fp, #-16]
	rsb	r2, r2, #0
	str	r2, [fp, #-16]
	ldr	r3, [fp, #-12]
	rsb	r3, r3, #0
	str	r3, [fp, #-12]
.L14:
	ldr	r1, [fp, #-20]
	ldr	r2, [fp, #-16]
	and	r3, r1, r2
	cmp	r3, #0
	beq	.L15
	mov	r3, #1
	ldr	r1, [fp, #-40]
	mov	r3, r3, asl r1
	ldr	r2, [fp, #-16]
	orr	r2, r2, r3
	str	r2, [fp, #-16]
.L15:
	ldr	r1, [fp, #-20]
	ldr	r2, [fp, #-12]
	and	r3, r1, r2
	cmp	r3, #0
	beq	.L16
	mov	r3, #1
	ldr	r1, [fp, #-40]
	mov	r3, r3, asl r1
	ldr	r2, [fp, #-12]
	orr	r2, r2, r3
	str	r2, [fp, #-12]
.L16:
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
.L13:
	ldr	r1, [fp, #-40]
	cmp	r1, #15
	ble	.L17
	ldr	r2, [fp, #-32]
	mov	r2, r2, asl #10
	str	r2, [fp, #-32]
	ldr	r3, .L20+4
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
	beq	.L18
	ldr	r3, [fp, #-24]
	orr	r3, r3, #16777216
	str	r3, [fp, #-24]
.L18:
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
.L21:
	.align	2
.L20:
	.word	arctan_degrees
	.word	40758883
	.size	vectoring, .-vectoring
	.align	2
	.global	arctan_fraction
	.type	arctan_fraction, %function
arctan_fraction:
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
	ldr	r0, [fp, #-8]
	bl	vectoring
	mov	r3, r0
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, lr}
	bx	lr
	.size	arctan_fraction, .-arctan_fraction
	.align	2
	.global	arctan
	.type	arctan, %function
arctan:
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
	bl	arctan_fraction
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
	.size	arctan, .-arctan
	.align	2
	.global	cos_cordic
	.type	cos_cordic, %function
cos_cordic:
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
	ldr	r0, [fp, #-8]
	ldr	r1, [fp, #-16]
	bl	rotation
	mov	r3, r0
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
	beq	.L27
	ldr	r3, [fp, #-8]
	orr	r3, r3, #16384
	str	r3, [fp, #-8]
.L27:
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
	.size	cos_cordic, .-cos_cordic
	.align	2
	.global	sin_cordic
	.type	sin_cordic, %function
sin_cordic:
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
	ldr	r0, [fp, #-8]
	ldr	r1, [fp, #-16]
	bl	rotation
	mov	r3, r0
	str	r3, [fp, #-8]
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
	.size	sin_cordic, .-sin_cordic
	.section	.rodata
	.align	2
.LC0:
	.ascii	"x = %i\011y = %i\012\000"
	.align	2
.LC1:
	.ascii	"magnitude = %i\011angle = %i\012\000"
	.align	2
.LC2:
	.ascii	"Arctan_fraction = %i\012\000"
	.align	2
.LC3:
	.ascii	"Arctan = %i\012\000"
	.align	2
.LC4:
	.ascii	"cos = %i\012\000"
	.align	2
.LC5:
	.ascii	"sin  = %i\012\000"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	mov	r3, #6400
	strh	r3, [fp, #-24]	@ movhi
	mov	r3, #59136
	strh	r3, [fp, #-22]	@ movhi
	ldrsh	r3, [fp, #-24]
	mov	r3, r3, asl #16
	str	r3, [fp, #-20]
	ldrsh	r3, [fp, #-22]
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	ldr	r2, [fp, #-20]
	orr	r3, r2, r3
	str	r3, [fp, #-20]
	mvn	r3, #0
	str	r3, [fp, #-16]
	ldr	r0, [fp, #-20]
	ldr	r1, [fp, #-16]
	bl	rotation
	mov	r3, r0
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	mov	r3, r3, asr #16
	strh	r3, [fp, #-24]	@ movhi
	ldr	r3, [fp, #-12]
	strh	r3, [fp, #-22]	@ movhi
	ldrh	r3, [fp, #-24]
	and	r3, r3, #63
	cmp	r3, #0
	beq	.L33
	ldrh	r3, [fp, #-24]	@ movhi
	orr	r3, r3, #64
	strh	r3, [fp, #-24]	@ movhi
.L33:
	ldrh	r3, [fp, #-22]
	and	r3, r3, #63
	cmp	r3, #0
	beq	.L34
	ldrh	r3, [fp, #-22]	@ movhi
	orr	r3, r3, #64
	strh	r3, [fp, #-22]	@ movhi
.L34:
	ldrsh	r3, [fp, #-22]
	mov	r3, r3, asr #6
	strh	r3, [fp, #-22]	@ movhi
	ldrsh	r3, [fp, #-24]
	mov	r3, r3, asr #6
	strh	r3, [fp, #-24]	@ movhi
	ldrsh	r3, [fp, #-24]
	ldrsh	r2, [fp, #-22]
	ldr	r0, .L37
	mov	r1, r3
	bl	printf
	mov	r3, #12800
	strh	r3, [fp, #-24]	@ movhi
	mov	r3, #12800
	strh	r3, [fp, #-22]	@ movhi
	ldrsh	r3, [fp, #-24]
	mov	r3, r3, asl #16
	str	r3, [fp, #-20]
	ldrsh	r2, [fp, #-22]
	ldr	r3, [fp, #-20]
	orr	r3, r3, r2
	str	r3, [fp, #-20]
	ldr	r0, [fp, #-20]
	bl	vectoring
	mov	r3, r0
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	mov	r3, r3, asr #16
	strh	r3, [fp, #-24]	@ movhi
	ldrh	r3, [fp, #-24]
	and	r3, r3, #127
	cmp	r3, #0
	beq	.L35
	ldrh	r3, [fp, #-24]	@ movhi
	orr	r3, r3, #128
	strh	r3, [fp, #-24]	@ movhi
.L35:
	ldrsh	r3, [fp, #-24]
	mov	r3, r3, asr #7
	strh	r3, [fp, #-24]	@ movhi
	ldr	r3, [fp, #-12]
	strh	r3, [fp, #-22]	@ movhi
	ldrsh	r3, [fp, #-24]
	ldrsh	r2, [fp, #-22]
	ldr	r0, .L37+4
	mov	r1, r3
	bl	printf
	mov	r3, #2560
	strh	r3, [fp, #-8]	@ movhi
	mov	r3, #5120
	strh	r3, [fp, #-6]	@ movhi
	ldrsh	r3, [fp, #-8]
	ldrsh	r2, [fp, #-6]
	mov	r0, r3
	mov	r1, r2
	bl	arctan_fraction
	mov	r3, r0
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	strh	r3, [fp, #-8]	@ movhi
	ldrsh	r3, [fp, #-8]
	ldr	r0, .L37+8
	mov	r1, r3
	bl	printf
	mov	r3, #20
	strh	r3, [fp, #-8]	@ movhi
	ldrsh	r3, [fp, #-8]
	mov	r0, r3
	bl	arctan
	mov	r3, r0
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	strh	r3, [fp, #-8]	@ movhi
	ldrsh	r3, [fp, #-8]
	ldr	r0, .L37+12
	mov	r1, r3
	bl	printf
	mov	r0, #0
	bl	cos_cordic
	mov	r3, r0
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	strh	r3, [fp, #-8]	@ movhi
	ldrsh	r3, [fp, #-8]
	ldr	r0, .L37+16
	mov	r1, r3
	bl	printf
	mov	r0, #90
	bl	sin_cordic
	mov	r3, r0
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	strh	r3, [fp, #-8]	@ movhi
	ldrsh	r3, [fp, #-8]
	ldr	r0, .L37+20
	mov	r1, r3
	bl	printf
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, lr}
	bx	lr
.L38:
	.align	2
.L37:
	.word	.LC0
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.size	main, .-main
	.ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
	.section	.note.GNU-stack,"",%progbits
