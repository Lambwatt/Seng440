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
	.file	"cordic.c"
	.global	arctan_degrees
	.data
	.align	2
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
	.global	__aeabi_fcmplt
	.global	__aeabi_fmul
	.global	__aeabi_i2f
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
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, fp, lr}
	add	fp, sp, #16
	sub	sp, sp, #36
	str	r0, [fp, #-40]
	str	r1, [fp, #-44]
	str	r2, [fp, #-48]
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #0]	@ float
	str	r3, [fp, #-32]	@ float
	ldr	r3, [fp, #-44]
	ldr	r3, [r3, #0]	@ float
	str	r3, [fp, #-28]	@ float
	mov	r3, #0
	str	r3, [fp, #-36]
	b	.L2
.L5:
	ldr	r3, .L8+8	@ float
	str	r3, [fp, #-24]	@ float
	ldr	r3, [fp, #-48]
	ldr	r3, [r3, #0]	@ float
	mov	r0, r3
	ldr	r1, .L8+12	@ float
	bl	__aeabi_fcmplt
	mov	r3, r0
	cmp	r3, #0
	beq	.L3
.L7:
	ldr	r3, .L8+16	@ float
	str	r3, [fp, #-24]	@ float
.L3:
	ldr	r3, [fp, #-24]	@ float
	ldr	r2, [fp, #-28]	@ float
	mov	r0, r3
	mov	r1, r2
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r4, r3
	mov	r2, #1
	ldr	r3, [fp, #-36]
	mov	r3, r2, asl r3
	mov	r0, r3
	bl	__aeabi_i2f
	mov	r3, r0
	mov	r0, r4
	mov	r1, r3
	bl	__aeabi_fdiv
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [fp, #-32]	@ float
	mov	r0, r3
	mov	r1, r2
	bl	__aeabi_fsub
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [fp, #-40]
	str	r2, [r3, #0]	@ float
	ldr	r3, [fp, #-24]	@ float
	ldr	r2, [fp, #-32]	@ float
	mov	r0, r3
	mov	r1, r2
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r4, r3
	mov	r2, #1
	ldr	r3, [fp, #-36]
	mov	r3, r2, asl r3
	mov	r0, r3
	bl	__aeabi_i2f
	mov	r3, r0
	mov	r0, r4
	mov	r1, r3
	bl	__aeabi_fdiv
	mov	r3, r0
	ldr	r2, [fp, #-28]	@ float
	mov	r0, r3
	mov	r1, r2
	bl	__aeabi_fadd
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [fp, #-44]
	str	r2, [r3, #0]	@ float
	ldr	r3, [fp, #-48]
	ldr	r4, [r3, #0]	@ float
	ldr	r2, [fp, #-36]
	ldr	r3, .L8+20
	ldr	r3, [r3, r2, asl #2]	@ float
	ldr	r2, [fp, #-24]	@ float
	mov	r0, r3
	mov	r1, r2
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r0, r4
	mov	r1, r3
	bl	__aeabi_fsub
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [fp, #-48]
	str	r2, [r3, #0]	@ float
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #0]	@ float
	str	r3, [fp, #-32]	@ float
	ldr	r3, [fp, #-44]
	ldr	r3, [r3, #0]	@ float
	str	r3, [fp, #-28]	@ float
	ldr	r3, [fp, #-36]
	add	r3, r3, #1
	str	r3, [fp, #-36]
.L2:
	ldr	r3, [fp, #-36]
	cmp	r3, #15
	ble	.L5
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #0]	@ float
	mov	r0, r3
	bl	__aeabi_f2d
	mov	r3, r0
	mov	r4, r1
	adr	r6, .L8
	ldmia	r6, {r5-r6}
	mov	r0, r3
	mov	r1, r4
	mov	r2, r5
	mov	r3, r6
	bl	__aeabi_ddiv
	mov	r3, r0
	mov	r4, r1
	mov	r0, r3
	mov	r1, r4
	bl	__aeabi_d2f
	mov	r2, r0
	ldr	r3, [fp, #-40]
	str	r2, [r3, #0]	@ float
	ldr	r3, [fp, #-44]
	ldr	r3, [r3, #0]	@ float
	mov	r0, r3
	bl	__aeabi_f2d
	mov	r3, r0
	mov	r4, r1
	adr	r6, .L8
	ldmia	r6, {r5-r6}
	mov	r0, r3
	mov	r1, r4
	mov	r2, r5
	mov	r3, r6
	bl	__aeabi_ddiv
	mov	r3, r0
	mov	r4, r1
	mov	r0, r3
	mov	r1, r4
	bl	__aeabi_d2f
	mov	r2, r0
	ldr	r3, [fp, #-44]
	str	r2, [r3, #0]	@ float
	sub	sp, fp, #16
	ldmfd	sp!, {r4, r5, r6, fp, lr}
	bx	lr
.L9:
	.align	3
.L8:
	.word	-185542587
	.word	1073371466
	.word	1065353216
	.word	0
	.word	-1082130432
	.word	arctan_degrees
	.size	rotation, .-rotation
	.align	2
	.global	vectoring
	.type	vectoring, %function
vectoring:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, fp, lr}
	add	fp, sp, #16
	sub	sp, sp, #36
	str	r0, [fp, #-40]
	str	r1, [fp, #-44]
	str	r2, [fp, #-48]
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #0]	@ float
	str	r3, [fp, #-32]	@ float
	ldr	r3, [fp, #-44]
	ldr	r3, [r3, #0]	@ float
	str	r3, [fp, #-28]	@ float
	mov	r3, #0
	str	r3, [fp, #-36]
	b	.L11
.L14:
	ldr	r3, .L17+8	@ float
	str	r3, [fp, #-24]	@ float
	ldr	r0, [fp, #-28]	@ float
	ldr	r1, .L17+12	@ float
	bl	__aeabi_fcmplt
	mov	r3, r0
	cmp	r3, #0
	beq	.L12
.L16:
	ldr	r3, .L17+16	@ float
	str	r3, [fp, #-24]	@ float
.L12:
	ldr	r3, [fp, #-24]	@ float
	ldr	r2, [fp, #-28]	@ float
	mov	r0, r3
	mov	r1, r2
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r4, r3
	mov	r2, #1
	ldr	r3, [fp, #-36]
	mov	r3, r2, asl r3
	mov	r0, r3
	bl	__aeabi_i2f
	mov	r3, r0
	mov	r0, r4
	mov	r1, r3
	bl	__aeabi_fdiv
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [fp, #-32]	@ float
	mov	r0, r3
	mov	r1, r2
	bl	__aeabi_fsub
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [fp, #-40]
	str	r2, [r3, #0]	@ float
	ldr	r3, [fp, #-24]	@ float
	ldr	r2, [fp, #-32]	@ float
	mov	r0, r3
	mov	r1, r2
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r4, r3
	mov	r2, #1
	ldr	r3, [fp, #-36]
	mov	r3, r2, asl r3
	mov	r0, r3
	bl	__aeabi_i2f
	mov	r3, r0
	mov	r0, r4
	mov	r1, r3
	bl	__aeabi_fdiv
	mov	r3, r0
	ldr	r2, [fp, #-28]	@ float
	mov	r0, r3
	mov	r1, r2
	bl	__aeabi_fadd
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [fp, #-44]
	str	r2, [r3, #0]	@ float
	ldr	r3, [fp, #-48]
	ldr	r4, [r3, #0]	@ float
	ldr	r2, [fp, #-36]
	ldr	r3, .L17+20
	ldr	r3, [r3, r2, asl #2]	@ float
	ldr	r2, [fp, #-24]	@ float
	mov	r0, r3
	mov	r1, r2
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r0, r4
	mov	r1, r3
	bl	__aeabi_fsub
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [fp, #-48]
	str	r2, [r3, #0]	@ float
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #0]	@ float
	str	r3, [fp, #-32]	@ float
	ldr	r3, [fp, #-44]
	ldr	r3, [r3, #0]	@ float
	str	r3, [fp, #-28]	@ float
	ldr	r3, [fp, #-36]
	add	r3, r3, #1
	str	r3, [fp, #-36]
.L11:
	ldr	r3, [fp, #-36]
	cmp	r3, #15
	ble	.L14
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #0]	@ float
	mov	r0, r3
	bl	__aeabi_f2d
	mov	r3, r0
	mov	r4, r1
	adr	r6, .L17
	ldmia	r6, {r5-r6}
	mov	r0, r3
	mov	r1, r4
	mov	r2, r5
	mov	r3, r6
	bl	__aeabi_ddiv
	mov	r3, r0
	mov	r4, r1
	mov	r0, r3
	mov	r1, r4
	bl	__aeabi_d2f
	mov	r2, r0
	ldr	r3, [fp, #-40]
	str	r2, [r3, #0]	@ float
	ldr	r3, [fp, #-44]
	ldr	r3, [r3, #0]	@ float
	mov	r0, r3
	bl	__aeabi_f2d
	mov	r3, r0
	mov	r4, r1
	adr	r6, .L17
	ldmia	r6, {r5-r6}
	mov	r0, r3
	mov	r1, r4
	mov	r2, r5
	mov	r3, r6
	bl	__aeabi_ddiv
	mov	r3, r0
	mov	r4, r1
	mov	r0, r3
	mov	r1, r4
	bl	__aeabi_d2f
	mov	r2, r0
	ldr	r3, [fp, #-44]
	str	r2, [r3, #0]	@ float
	sub	sp, fp, #16
	ldmfd	sp!, {r4, r5, r6, fp, lr}
	bx	lr
.L18:
	.align	3
.L17:
	.word	-185542587
	.word	1073371466
	.word	-1082130432
	.word	0
	.word	1065353216
	.word	arctan_degrees
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
	str	r0, [fp, #-16]	@ float
	str	r1, [fp, #-20]	@ float
	ldr	r3, .L21	@ float
	str	r3, [fp, #-8]	@ float
	sub	r3, fp, #20
	sub	r2, fp, #16
	sub	ip, fp, #8
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	vectoring
	ldr	r3, [fp, #-8]	@ float
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, lr}
	bx	lr
.L22:
	.align	2
.L21:
	.word	0
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
	str	r0, [fp, #-8]	@ float
	ldr	r0, [fp, #-8]	@ float
	ldr	r1, .L25	@ float
	bl	arctan_fraction
	mov	r3, r0
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, lr}
	bx	lr
.L26:
	.align	2
.L25:
	.word	1065353216
	.size	arctan, .-arctan
	.align	2
	.global	cos_vec
	.type	cos_vec, %function
cos_vec:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-16]	@ float
	ldr	r3, .L29	@ float
	str	r3, [fp, #-8]	@ float
	ldr	r3, .L29+4	@ float
	str	r3, [fp, #-12]	@ float
	sub	r3, fp, #8
	sub	r2, fp, #12
	sub	ip, fp, #16
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	rotation
	ldr	r3, [fp, #-8]	@ float
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, lr}
	bx	lr
.L30:
	.align	2
.L29:
	.word	1065353216
	.word	0
	.size	cos_vec, .-cos_vec
	.align	2
	.global	sin_vec
	.type	sin_vec, %function
sin_vec:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-16]	@ float
	ldr	r3, .L33	@ float
	str	r3, [fp, #-8]	@ float
	ldr	r3, .L33+4	@ float
	str	r3, [fp, #-12]	@ float
	sub	r3, fp, #12
	sub	r2, fp, #8
	sub	ip, fp, #16
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	rotation
	ldr	r3, [fp, #-8]	@ float
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, lr}
	bx	lr
.L34:
	.align	2
.L33:
	.word	0
	.word	1065353216
	.size	sin_vec, .-sin_vec
	.section	.rodata
	.align	2
	.type	C.2.2251, %object
	.size	C.2.2251, 8
C.2.2251:
	.word	1065353216
	.word	1065353216
	.align	2
.LC0:
	.ascii	"math.arctan(0.5) = %f\012\000"
	.align	2
.LC1:
	.ascii	"Arctan(0.5) = %f\012\000"
	.align	2
.LC2:
	.ascii	"Results: x = %f\011y = %f\011z = %f\012\000"
	.align	2
.LC3:
	.ascii	"expected: x=0.0, y=1.0, z=0.0\000"
	.align	2
.LC4:
	.ascii	"math.sin(45) = %f\012\000"
	.align	2
.LC5:
	.ascii	"sin = %f\012\000"
	.align	2
.LC6:
	.ascii	"expected: x=1.0, y=0.0, z=90.0\000"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, fp, lr}
	add	fp, sp, #24
	sub	sp, sp, #44
	ldr	r3, .L37+16
	sub	r2, fp, #40
	ldmia	r3, {r0, r1}
	stmia	r2, {r0, r1}
	ldr	r3, .L37+20	@ float
	str	r3, [fp, #-44]	@ float
	ldr	r3, .L37+24	@ float
	str	r3, [fp, #-48]	@ float
	ldr	r3, .L37+28	@ float
	str	r3, [fp, #-52]	@ float
	sub	r3, fp, #44
	sub	r2, fp, #48
	sub	ip, fp, #52
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	rotation
	ldr	r0, .L37+32	@ float
	bl	arctan
	mov	r3, r0
	str	r3, [fp, #-32]	@ float
	ldr	r0, .L37+36
	adr	r3, .L37
	ldmia	r3, {r2-r3}
	bl	printf
	ldr	r0, [fp, #-32]	@ float
	bl	__aeabi_f2d
	mov	r3, r0
	mov	r4, r1
	ldr	r0, .L37+40
	mov	r2, r3
	mov	r3, r4
	bl	printf
	ldr	r3, [fp, #-44]	@ float
	mov	r0, r3
	bl	__aeabi_f2d
	mov	r7, r0
	mov	r8, r1
	ldr	r3, [fp, #-48]	@ float
	mov	r0, r3
	bl	__aeabi_f2d
	mov	r5, r0
	mov	r6, r1
	ldr	r3, [fp, #-52]	@ float
	mov	r0, r3
	bl	__aeabi_f2d
	mov	r3, r0
	mov	r4, r1
	stmia	sp, {r5-r6}
	str	r3, [sp, #8]
	str	r4, [sp, #12]
	ldr	r0, .L37+44
	mov	r2, r7
	mov	r3, r8
	bl	printf
	ldr	r0, .L37+48
	bl	puts
	ldr	r3, .L37+24	@ float
	str	r3, [fp, #-44]	@ float
	ldr	r3, .L37+20	@ float
	str	r3, [fp, #-48]	@ float
	ldr	r3, .L37+24	@ float
	str	r3, [fp, #-52]	@ float
	sub	r3, fp, #44
	sub	r2, fp, #48
	sub	ip, fp, #52
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	vectoring
	ldr	r0, .L37+52	@ float
	bl	sin_vec
	mov	r3, r0
	str	r3, [fp, #-32]	@ float
	ldr	r0, .L37+56
	adr	r3, .L37+8
	ldmia	r3, {r2-r3}
	bl	printf
	ldr	r0, [fp, #-32]	@ float
	bl	__aeabi_f2d
	mov	r3, r0
	mov	r4, r1
	ldr	r0, .L37+60
	mov	r2, r3
	mov	r3, r4
	bl	printf
	ldr	r3, [fp, #-44]	@ float
	mov	r0, r3
	bl	__aeabi_f2d
	mov	r7, r0
	mov	r8, r1
	ldr	r3, [fp, #-48]	@ float
	mov	r0, r3
	bl	__aeabi_f2d
	mov	r5, r0
	mov	r6, r1
	ldr	r3, [fp, #-52]	@ float
	mov	r0, r3
	bl	__aeabi_f2d
	mov	r3, r0
	mov	r4, r1
	stmia	sp, {r5-r6}
	str	r3, [sp, #8]
	str	r4, [sp, #12]
	ldr	r0, .L37+44
	mov	r2, r7
	mov	r3, r8
	bl	printf
	ldr	r0, .L37+64
	bl	puts
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #24
	ldmfd	sp!, {r4, r5, r6, r7, r8, fp, lr}
	bx	lr
.L38:
	.align	3
.L37:
	.word	-1441071890
	.word	1077579944
	.word	-1426803306
	.word	1078215122
	.word	C.2.2251
	.word	1065353216
	.word	0
	.word	1119092736
	.word	1056964608
	.word	.LC0
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.word	1110704128
	.word	.LC4
	.word	.LC5
	.word	.LC6
	.size	main, .-main
	.ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
	.section	.note.GNU-stack,"",%progbits
