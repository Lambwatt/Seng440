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
	.file	"cordic.c"
	.global	__aeabi_fcmplt
	.global	__aeabi_i2f
	.global	__aeabi_fmul
	.global	__aeabi_fdiv
	.global	__aeabi_fsub
	.global	__aeabi_fadd
	.global	__aeabi_f2d
	.global	__aeabi_ddiv
	.global	__aeabi_d2f
	.text
	.align	2
	.global	rotation
	.type	rotation, %function
rotation:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	mov	r9, r0
	ldr	r7, [r0, #0]	@ float
	ldr	r8, [r1, #0]	@ float
	ldr	r0, [r2, #0]	@ float
	mov	fp, r1
	mov	sl, r2
	mov	r6, #0
.L5:
	mov	r1, #0
	bl	__aeabi_fcmplt
	mov	r4, #-1090519040
	cmp	r0, #0
	mov	r3, #1065353216
	add	r4, r4, #8388608
	moveq	r4, r3
	mov	r3, #1
	mov	r0, r3, asl r6
	bl	__aeabi_i2f
	mov	r1, r8
	mov	r5, r0
	mov	r0, r4
	bl	__aeabi_fmul
	mov	r1, r5
	bl	__aeabi_fdiv
	mov	r1, r0
	mov	r0, r7
	bl	__aeabi_fsub
	mov	r1, r7
	str	r0, [r9, #0]	@ float
	mov	r0, r4
	bl	__aeabi_fmul
	mov	r1, r5
	bl	__aeabi_fdiv
	mov	r1, r8
	bl	__aeabi_fadd
	ldr	r3, .L10+8
	str	r0, [fp, #0]	@ float
	mov	r0, r4
	ldr	r1, [r3, r6, asl #2]	@ float
	bl	__aeabi_fmul
	mov	r1, r0
	ldr	r0, [sl, #0]	@ float
	bl	__aeabi_fsub
	add	r6, r6, #1
	str	r0, [sl, #0]	@ float
	cmp	r6, #16
	ldr	r7, [r9, #0]	@ float
	ldr	r8, [fp, #0]	@ float
	bne	.L5
	mov	r0, r7
	bl	__aeabi_f2d
	adr	r3, .L10
	ldmia	r3, {r2-r3}
	bl	__aeabi_ddiv
	bl	__aeabi_d2f
	str	r0, [r9, #0]	@ float
	ldr	r0, [fp, #0]	@ float
	bl	__aeabi_f2d
	adr	r3, .L10
	ldmia	r3, {r2-r3}
	bl	__aeabi_ddiv
	bl	__aeabi_d2f
	str	r0, [fp, #0]	@ float
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L11:
	.align	3
.L10:
	.word	-185542587
	.word	1073371466
	.word	.LANCHOR0
	.size	rotation, .-rotation
	.align	2
	.global	vectoring
	.type	vectoring, %function
vectoring:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	r8, [r0, #0]	@ float
	ldr	r6, [r1, #0]	@ float
	mov	sl, r0
	mov	r9, r1
	mov	fp, r2
	mov	r7, #0
.L16:
	mov	r1, #0
	mov	r0, r6
	bl	__aeabi_fcmplt
	mov	r3, #-1090519040
	cmp	r0, #0
	add	r3, r3, #8388608
	mov	r4, #1065353216
	moveq	r4, r3
	mov	r3, #1
	mov	r0, r3, asl r7
	bl	__aeabi_i2f
	mov	r1, r6
	mov	r5, r0
	mov	r0, r4
	bl	__aeabi_fmul
	mov	r1, r5
	bl	__aeabi_fdiv
	mov	r1, r0
	mov	r0, r8
	bl	__aeabi_fsub
	mov	r1, r8
	str	r0, [sl, #0]	@ float
	mov	r0, r4
	bl	__aeabi_fmul
	mov	r1, r5
	bl	__aeabi_fdiv
	mov	r1, r6
	bl	__aeabi_fadd
	ldr	r3, .L20+8
	str	r0, [r9, #0]	@ float
	mov	r0, r4
	ldr	r1, [r3, r7, asl #2]	@ float
	bl	__aeabi_fmul
	mov	r1, r0
	ldr	r0, [fp, #0]	@ float
	bl	__aeabi_fsub
	add	r7, r7, #1
	str	r0, [fp, #0]	@ float
	cmp	r7, #16
	ldr	r8, [sl, #0]	@ float
	ldr	r6, [r9, #0]	@ float
	bne	.L16
	mov	r0, r8
	bl	__aeabi_f2d
	adr	r3, .L20
	ldmia	r3, {r2-r3}
	bl	__aeabi_ddiv
	bl	__aeabi_d2f
	str	r0, [sl, #0]	@ float
	ldr	r0, [r9, #0]	@ float
	bl	__aeabi_f2d
	adr	r3, .L20
	ldmia	r3, {r2-r3}
	bl	__aeabi_ddiv
	bl	__aeabi_d2f
	str	r0, [r9, #0]	@ float
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L21:
	.align	3
.L20:
	.word	-185542587
	.word	1073371466
	.word	.LANCHOR0
	.size	vectoring, .-vectoring
	.align	2
	.global	arctan_fraction
	.type	arctan_fraction, %function
arctan_fraction:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	sub	sp, sp, #20
	str	r0, [sp, #4]	@ float
	str	r1, [sp, #0]	@ float
	mov	r0, sp
	mov	r3, #0
	add	r1, sp, #4
	add	r2, sp, #12
	str	r3, [sp, #12]	@ float
	bl	vectoring
	ldr	r0, [sp, #12]	@ float
	add	sp, sp, #20
	ldr	lr, [sp], #4
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
	mov	r1, #1065353216
	b	arctan_fraction
	.size	arctan, .-arctan
	.align	2
	.global	cos_vec
	.type	cos_vec, %function
cos_vec:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	sub	sp, sp, #20
	str	r0, [sp, #4]	@ float
	mov	r3, #1065353216
	add	r0, sp, #12
	mov	ip, #0
	add	r1, sp, #8
	add	r2, sp, #4
	str	r3, [sp, #12]	@ float
	str	ip, [sp, #8]	@ float
	bl	rotation
	ldr	r0, [sp, #12]	@ float
	add	sp, sp, #20
	ldr	lr, [sp], #4
	bx	lr
	.size	cos_vec, .-cos_vec
	.align	2
	.global	sin_vec
	.type	sin_vec, %function
sin_vec:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	sub	sp, sp, #20
	add	r3, sp, #16
	mov	r2, #1065353216
	str	r2, [r3, #-8]!	@ float
	str	r0, [sp, #4]	@ float
	add	r1, sp, #12
	mov	r0, r3
	add	r2, sp, #4
	mov	r3, #0
	str	r3, [sp, #12]	@ float
	bl	rotation
	ldr	r0, [sp, #12]	@ float
	add	sp, sp, #20
	ldr	lr, [sp], #4
	bx	lr
	.size	sin_vec, .-sin_vec
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	sub	sp, sp, #36
	add	r9, sp, #28
	add	r8, sp, #24
	add	sl, sp, #20
	mov	r3, #1107296256
	mov	r1, r8
	mov	r6, #0
	mov	r2, sl
	add	r3, r3, #11796480
	mov	fp, #1065353216
	mov	r0, r9
	str	r3, [sp, #20]	@ float
	str	fp, [sp, #28]	@ float
	str	r6, [sp, #24]	@ float
	bl	rotation
	mov	r0, #1056964608
	bl	arctan
	adr	r3, .L32
	ldmia	r3, {r2-r3}
	mov	r4, r0
	ldr	r0, .L32+16
	bl	printf
	mov	r0, r4
	bl	__aeabi_f2d
	mov	r2, r0
	mov	r3, r1
	ldr	r0, .L32+20
	bl	printf
	ldr	r0, [sp, #28]	@ float
	bl	__aeabi_f2d
	mov	r4, r0
	ldr	r0, [sp, #24]	@ float
	mov	r5, r1
	bl	__aeabi_f2d
	stmia	sp, {r0-r1}
	ldr	r0, [sp, #20]	@ float
	bl	__aeabi_f2d
	ldr	r7, .L32+24
	mov	r3, r5
	str	r0, [sp, #8]
	str	r1, [sp, #12]
	mov	r2, r4
	mov	r0, r7
	bl	printf
	ldr	r0, .L32+28
	bl	puts
	mov	r1, r8
	mov	r2, sl
	mov	r0, r9
	str	fp, [sp, #24]	@ float
	str	r6, [sp, #20]	@ float
	str	r6, [sp, #28]	@ float
	bl	vectoring
	mov	r0, #1107296256
	add	r0, r0, #3407872
	bl	sin_vec
	adr	r3, .L32+8
	ldmia	r3, {r2-r3}
	mov	r4, r0
	ldr	r0, .L32+32
	bl	printf
	mov	r0, r4
	bl	__aeabi_f2d
	mov	r2, r0
	mov	r3, r1
	ldr	r0, .L32+36
	bl	printf
	ldr	r0, [sp, #28]	@ float
	bl	__aeabi_f2d
	mov	r4, r0
	ldr	r0, [sp, #24]	@ float
	mov	r5, r1
	bl	__aeabi_f2d
	stmia	sp, {r0-r1}
	ldr	r0, [sp, #20]	@ float
	bl	__aeabi_f2d
	mov	r2, r4
	str	r0, [sp, #8]
	str	r1, [sp, #12]
	mov	r3, r5
	mov	r0, r7
	bl	printf
	ldr	r0, .L32+40
	bl	puts
	mov	r0, #0
	add	sp, sp, #36
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L33:
	.align	3
.L32:
	.word	-1441071890
	.word	1077579944
	.word	-1426803306
	.word	1078215122
	.word	.LC0
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.word	.LC6
	.size	main, .-main
	.global	arctan_degrees
	.data
	.align	2
.LANCHOR0 = . + 0
	.type	arctan_degrees, %object
	.size	arctan_degrees, 64
arctan_degrees:
	.word	1110704128
	.word	1104444129
	.word	1096852439
	.word	1088694518
	.word	1080368824
	.word	1071980216
	.word	1063507722
	.word	1055286886
	.word	1046562734
	.word	1038174126
	.word	1028443341
	.word	1022739087
	.word	964680256
	.word	956291648
	.word	947903040
	.word	939514432
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"math.arctan(0.5) = %f\012\000"
	.space	1
.LC1:
	.ascii	"Arctan(0.5) = %f\012\000"
	.space	2
.LC2:
	.ascii	"Results: x = %f\011y = %f\011z = %f\012\000"
	.space	1
.LC3:
	.ascii	"expected: x=0.0, y=1.0, z=0.0\000"
	.space	2
.LC4:
	.ascii	"math.sin(45) = %f\012\000"
	.space	1
.LC5:
	.ascii	"sin = %f\012\000"
	.space	2
.LC6:
	.ascii	"expected: x=1.0, y=0.0, z=90.0\000"
	.ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
	.section	.note.GNU-stack,"",%progbits
