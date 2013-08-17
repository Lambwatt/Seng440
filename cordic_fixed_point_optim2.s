	.arch armv4t
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 2
	.eabi_attribute 18, 4
	.file	"cordic_fixed_point.c"
	.text
	.align	2
	.global	rotation
	.type	rotation, %function
rotation:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, r0, asl #16
	movs	r1, r1, asl #24
	mov	r3, r3, asr #16
	mov	r0, r0, asr #16
	stmfd	sp!, {r4, r5, r6, r7, r8}
	movpl	r2, r3
	movpl	r4, r0
	rsbmi	r4, r0, #0
	rsbmi	r2, r3, #0
	rsb	r6, r2, r0
	add	r5, r4, r3
	movpl	ip, #754974720
	movmi	ip, #-754974720
	mov	r2, #1
	rsb	r4, ip, r1
	ldr	r8, .L12
	mov	r1, r6
	mov	r3, r5
	mov	r0, #0
	mov	r7, r2
	b	.L8
.L11:
	orr	r0, r0, r7, asl ip
.L8:
	cmp	r4, #0
	ldr	ip, [r8, r2, asl #2]
	rsblt	r1, r6, #0
	rsblt	r3, r5, #0
	rsblt	ip, ip, #0
	tst	r1, r0
	orrne	r1, r1, r7, asl r2
	tst	r3, r0
	orrne	r3, r3, r7, asl r2
	add	r5, r5, r1, asr r2
	sub	r6, r6, r3, asr r2
	add	r2, r2, #1
	cmp	r2, #16
	rsb	r4, ip, r4
	mov	r3, r5
	sub	ip, r2, #2
	mov	r1, r6
	bne	.L11
	ldr	r2, .L12+4
	mov	r0, r5, asl #10
	smull	r3, r1, r2, r0
	mov	r3, r6, asl #10
	smull	r4, ip, r2, r3
	mov	r0, r0, asr #31
	rsb	r0, r0, r1, asr #4
	mov	r3, r3, asr #31
	mov	r0, r0, asl #16
	rsb	r3, r3, ip, asr #4
	mov	r0, r0, lsr #16
	orr	r0, r0, r3, asl #16
	ldmfd	sp!, {r4, r5, r6, r7, r8}
	bx	lr
.L13:
	.align	2
.L12:
	.word	.LANCHOR0
	.word	40758883
	.size	rotation, .-rotation
	.align	2
	.global	vectoring
	.type	vectoring, %function
vectoring:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, r0, asl #16
	movs	r3, r3, asr #16
	mov	r0, r0, asr #16
	movmi	r1, r0
	movmi	r2, r3
	rsbpl	r1, r0, #0
	rsbpl	r2, r3, #0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl}
	rsb	r5, r2, r0
	add	r4, r1, r3
	mov	r1, #1
	movmi	r6, #-754974720
	movpl	r6, #754974720
	ldr	r9, .L25
	mov	r2, r5
	mov	r3, r4
	mov	r0, #0
	mov	sl, r1
	b	.L21
.L24:
	add	r4, r4, r2, asr r1
	orr	r0, r0, sl, asl r8
	mov	r1, r7
	mov	r3, r4
	mov	r2, r5
.L21:
	cmp	r4, #0
	ldr	ip, [r9, r1, asl #2]
	rsbge	r2, r5, #0
	rsbge	r3, r4, #0
	rsbge	ip, ip, #0
	tst	r2, r0
	orrne	r2, r2, sl, asl r1
	tst	r3, r0
	orrne	r3, r3, sl, asl r1
	add	r7, r1, #1
	cmp	r7, #16
	sub	r8, r1, #1
	rsb	r6, ip, r6
	sub	r5, r5, r3, asr r1
	bne	.L24
	bic	r3, r6, #-16777216
	bic	r3, r3, #8388608
	cmp	r3, #0
	ldr	r3, .L25+4
	mov	r2, r5, asl #10
	smull	r0, r1, r3, r2
	orrne	r6, r6, #16777216
	mov	r0, r6, asr #24
	mov	r2, r2, asr #31
	mov	r0, r0, asl #16
	rsb	r2, r2, r1, asr #4
	mov	r0, r0, lsr #16
	orr	r0, r0, r2, asl #16
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl}
	bx	lr
.L26:
	.align	2
.L25:
	.word	.LANCHOR0
	.word	40758883
	.size	vectoring, .-vectoring
	.align	2
	.global	arctan_fraction
	.type	arctan_fraction, %function
arctan_fraction:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #65536
	sub	r3, r3, #1
	and	r0, r0, r3
	stmfd	sp!, {r4, lr}
	orr	r0, r0, r1, asl #16
	bl	vectoring
	mov	r0, r0, asl #16
	mov	r0, r0, asr #16
	ldmfd	sp!, {r4, lr}
	bx	lr
	.size	arctan_fraction, .-arctan_fraction
	.align	2
	.global	arctan
	.type	arctan, %function
arctan:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #1
	b	arctan_fraction
	.size	arctan, .-arctan
	.align	2
	.global	cos_cordic
	.type	cos_cordic, %function
cos_cordic:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, r0
	stmfd	sp!, {r4, lr}
	mov	r0, #1073741824
	bl	rotation
	mov	r0, r0, asr #16
	mov	r3, r0, asl #4
	mov	r0, r0, asl #2
	add	r0, r0, r3
	mov	r2, r0, asl #2
	add	r0, r0, r2
	mov	r3, r0, asl #18
	mov	r3, r3, lsr #18
	cmp	r3, #0
	orrne	r0, r0, #16384
	mov	r0, r0, asr #14
	ldmfd	sp!, {r4, lr}
	bx	lr
	.size	cos_cordic, .-cos_cordic
	.align	2
	.global	sin_cordic
	.type	sin_cordic, %function
sin_cordic:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, r0
	stmfd	sp!, {r4, lr}
	mov	r0, #1073741824
	bl	rotation
	mov	r0, r0, asl #16
	mov	r0, r0, asr #16
	mov	r3, r0, asl #4
	mov	r0, r0, asl #2
	add	r0, r0, r3
	mov	r2, r0, asl #2
	add	r0, r0, r2
	mov	r3, r0, asl #18
	mov	r3, r3, lsr #18
	cmp	r3, #0
	orrne	r0, r0, #16384
	mov	r0, r0, asr #14
	ldmfd	sp!, {r4, lr}
	bx	lr
	.size	sin_cordic, .-sin_cordic
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #419430400
	stmfd	sp!, {r4, lr}
	mvn	r1, #0
	add	r0, r0, #59136
	bl	rotation
	mov	r3, r0, lsr #16
	tst	r3, #63
	mov	r0, r0, asl #16
	mov	r1, r3, asl #16
	mov	r0, r0, lsr #16
	orrne	r3, r3, #64
	movne	r1, r3, asl #16
	tst	r0, #63
	mov	r2, r0, asl #16
	orrne	r0, r0, #64
	movne	r2, r0, asl #16
	mov	r1, r1, asr #22
	mov	r2, r2, asr #22
	ldr	r0, .L42
	bl	printf
	mov	r0, #838860800
	add	r0, r0, #12800
	bl	vectoring
	mov	r3, r0, lsr #16
	tst	r3, #127
	mov	r1, r3, asl #16
	orrne	r3, r3, #128
	movne	r1, r3, asl #16
	mov	r2, r0, asl #16
	mov	r2, r2, asr #16
	mov	r1, r1, asr #23
	ldr	r0, .L42+4
	bl	printf
	mov	r1, #5120
	mov	r0, #2560
	bl	arctan_fraction
	mov	r1, r0, asl #16
	mov	r1, r1, asr #16
	ldr	r0, .L42+8
	bl	printf
	mov	r0, #20
	bl	arctan
	mov	r1, r0, asl #16
	mov	r1, r1, asr #16
	ldr	r0, .L42+12
	bl	printf
	mov	r0, #0
	bl	cos_cordic
	mov	r1, r0, asl #16
	mov	r1, r1, asr #16
	ldr	r0, .L42+16
	bl	printf
	mov	r0, #90
	bl	sin_cordic
	mov	r1, r0, asl #16
	mov	r1, r1, asr #16
	ldr	r0, .L42+20
	bl	printf
	mov	r0, #0
	ldmfd	sp!, {r4, lr}
	bx	lr
.L43:
	.align	2
.L42:
	.word	.LC0
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.size	main, .-main
	.global	arctan_degrees
	.section	.rodata
	.align	2
.LANCHOR0 = . + 0
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
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"x = %i\011y = %i\012\000"
	.space	1
.LC1:
	.ascii	"magnitude = %i\011angle = %i\012\000"
	.space	1
.LC2:
	.ascii	"Arctan_fraction = %i\012\000"
	.space	2
.LC3:
	.ascii	"Arctan = %i\012\000"
	.space	3
.LC4:
	.ascii	"cos = %i\012\000"
	.space	2
.LC5:
	.ascii	"sin  = %i\012\000"
	.ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
	.section	.note.GNU-stack,"",%progbits
