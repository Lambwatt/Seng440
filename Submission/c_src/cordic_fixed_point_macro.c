#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include "cordic.h"

#define ITERATIONS			16	// 16 iterations for 16 bit precision
#define ANGLE_SCALE			24		// (2^24)
#define ANGLE_MASK			0x7fffff
#define ITER_SCALE			1686 			//1.64676 * 2^10
#define TWO_BYTE_MASK		0xffff

/* each value in the array = arctan(2^-i) * 2^24
(Domain of convergence is -90...90) */
static int32_t const arctan_degrees[ITERATIONS] = {754974720, 445687602, 235489088, 119537938,
									60000934, 30029717, 15018523, 7509720,
									3754917, 1877470, 938734, 469367,
									234684, 117342, 58671, 29335};


/**** Cordic macros **********************************************/
/*
uint32_t macro_out must be instantiated before calling this macro.  Will be populated with result. */
#define ROTATION(vector, angle) 											\
	register int i, arc_tan;												\
	register int32_t cur_x, cur_y, int_z, rounding_mask, round_x, round_y;	\
																			\
	rounding_mask = 0;														\
	cur_x = vector >> 16;													\
	vector = vector << 16;													\
	cur_y = vector >> 16;													\
																			\
	int_z = angle << ANGLE_SCALE;											\
																			\
	round_x = cur_x;														\
	round_y = cur_y;														\
																			\
	arc_tan = arctan_degrees[0];											\
	if(int_z < 0){															\
		arc_tan *= -1;														\
		round_x *= -1;														\
		round_y *= -1;														\
	}																		\
																			\
	cur_x = cur_x - round_y;												\
	cur_y = cur_y + round_x;												\
	int_z = int_z - arc_tan;												\
																			\
	round_x = cur_x;														\
	round_y = cur_y;														\
																			\
	for(i = 1; i < ITERATIONS; i++){										\
		arc_tan = arctan_degrees[i];										\
		if(int_z < 0){														\
			arc_tan *= -1;													\
			round_x *= -1;													\
			round_y *= -1;													\
		}																	\
																			\
		if(rounding_mask & round_x){										\
			round_x |= (1<<i);												\
		}																	\
		if(rounding_mask & round_y){										\
			round_y |= (1<<i);												\
		}																	\
																			\
		cur_x = cur_x - (round_y>>i);										\
		cur_y = cur_y + (round_x>>i);										\
		int_z = int_z - arc_tan;											\
																			\
		round_x = cur_x;													\
		round_y = cur_y;													\
																			\
		rounding_mask |= (1<<(i-1));										\
	}																		\
																			\
	cur_x = cur_x << 10;													\
	cur_x /= ITER_SCALE;													\
	cur_y = cur_y << 10;													\
	cur_y /= ITER_SCALE;													\
																			\
	cur_y &= TWO_BYTE_MASK;													\
																			\
	cur_x = cur_x << 16;													\
	cur_x |= cur_y;															\
																			\
	macro_out = cur_x;


/*
uint32_t macro_out must be instantiated before calling this macro.  Will be populated with result. */
#define VECTORING(vector)													\
	register int i, arc_tan;												\
	register int32_t cur_x, cur_y, int_z, rounding_mask, round_x, round_y;	\
																			\
	rounding_mask = 0;														\
																			\
	cur_x = vector >> 16;													\
	vector = vector << 16;													\
	cur_y = vector >> 16;													\
																			\
	int_z = 0;																\
																			\
	round_x = cur_x;														\
	round_y = cur_y;														\
																			\
	arc_tan = arctan_degrees[0];											\
	if(cur_y >= 0){															\
		arc_tan *= -1;														\
		round_x *= -1;														\
		round_y *= -1;														\
	}																		\
																			\
	cur_x = cur_x - round_y;												\
	cur_y = cur_y + round_x;												\
	int_z = int_z - arc_tan;												\
																			\
	round_x = cur_x;														\
	round_y = cur_y;														\
																			\
	for(i = 1; i < ITERATIONS; i++){										\
		arc_tan = arctan_degrees[i];										\
		if(cur_y >= 0){														\
			arc_tan *= -1;													\
			round_x *= -1;													\
			round_y *= -1;													\
		}																	\
																			\
		if(rounding_mask & round_x){										\
			round_x |= (1<<i);												\
		}																	\
		if(rounding_mask & round_y){										\
			round_y |= (1<<i);												\
		}																	\
																			\
		cur_x = cur_x - (round_y>>i);										\
		cur_y = cur_y + (round_x>>i);										\
		int_z = int_z - arc_tan;											\
																			\
		round_x = cur_x;													\
		round_y = cur_y;													\
																			\
		rounding_mask |= (1<<(i-1));										\
	}																		\
																			\
	cur_x = cur_x << 10;													\
	cur_x /= ITER_SCALE;													\
																			\
	if(int_z & ANGLE_MASK){													\
		int_z |= (1 << ANGLE_SCALE);										\
	}																		\
	int_z = int_z >> ANGLE_SCALE;											\
	int_z &= TWO_BYTE_MASK;													\
																			\
	cur_x = cur_x << 16;													\
	cur_x |= int_z;															\
																			\
	macro_out = cur_x;


int16_t arctan_fraction_macro(int16_t numerator, int16_t denominator){
	int32_t temp = (denominator << 16) | (numerator & TWO_BYTE_MASK);
	int32_t macro_out = 0;
	VECTORING(temp);
	temp = macro_out;

	return temp;
}

/* x strictly greater than 0 */
int16_t arctan_macro(int16_t x){
	return arctan_fraction_routine(x,1);
}

/* angle in range [-90,90]
 * First two base 10 digits are decimal*/
int16_t cos_macro(int32_t angle){
	int32_t vector = (1 << 14) ;
	vector = vector << 16;
	int32_t macro_out = 0;
	ROTATION(vector, angle);
	vector = macro_out;
	vector = vector >> 16;
	vector *= 100;

	if(vector & 0x3fff){
		vector |= (1<<14);
	}

	return (vector >> 14);
}

/* angle in range [-90,90]
* First two base 10 digits are decimal*/
int16_t sin_macro(int32_t angle){
	int32_t vector = (1 << 14) ;
	vector = vector << 16;
	int32_t macro_out = 0;
	ROTATION(vector, angle);
	vector = macro_out;
	vector = vector << 16;
	vector = vector >> 16;
	vector *= 100;

	if(vector & 0x3fff){
		vector |= (1<<14);
	}

	return (vector >> 14);
}


