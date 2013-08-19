cordic.exe: cordic.o cordic_float.o cordic_fixed_point_routine.o cordic_fixed_point_inline.o cordic_fixed_point_macro.o cordic_fixed_point_optimized.o
	gcc cordic.o cordic_float.o cordic_fixed_point_routine.o cordic_fixed_point_inline.o cordic_fixed_point_macro.o cordic_fixed_point_optimized.o -o cordic.exe

cordic.o: cordic.c
	gcc -c cordic.c 

cordic_fixed_point_optimized.o: cordic_fixed_point_optimized.c
	gcc -c -O2 cordic_fixed_point_optimized.c

cordic_float.o: cordic_float.c
	gcc -c cordic_float.c

cordic_fixed_point_routine.o: cordic_fixed_point_routine.c
	gcc -c cordic_fixed_point_routine.c

cordic_fixed_point_inline.o: cordic_fixed_point_inline.c
	gcc -c cordic_fixed_point_inline.c

cordic_fixed_point_macro.o: cordic_fixed_point_macro.c
	gcc -c cordic_fixed_point_macro.c
