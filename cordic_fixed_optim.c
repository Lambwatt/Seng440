#define ITERATIONS			16	// 16 iterations for 16 bit precision
#define ANGLE_SCALE			24		// (2^24)
#define ANGLE_MASK			0x7fffff
#define ITER_SCALE			1686 			//1.64676 * 2^10
#define TWO_BYTE_MASK		0xffff
#define ABS(x)				(x > 0 ? x : -x)

#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>

/**** Prototypes *********************************************/
int32_t rotation(int32_t, int32_t);
int32_t vectoring(int32_t);
int16_t arctan_fraction(int16_t, int16_t);
int16_t arctan(int16_t);
int16_t cos_cordic(int32_t angle);
int16_t sin_cordic(int32_t angle);

/**** Members ************************************************/
/* To retain 16 bits of precision we need a minimum of 20 bits for
intermediate values.  Will be using 32 bits instead. */

/* each value in the array = arctan(2^-i) * 2^24
(Domain of convergence is -90...90) */
int32_t const arctan_degrees[ITERATIONS] = {754974720, 445687602, 235489088, 119537938,
									60000934, 30029717, 15018523, 7509720,
									3754917, 1877470, 938734, 469367,
									234684, 117342, 58671, 29335};

/**** Functions **********************************************/
/*
vector: High 16 bits are x.  Low 16 bits are y. Application engineer assumed to scale values themselves.
angle: assumed to be in range [-90,90] scaled to 32 bit accuracy (2^31)/90 */
int32_t rotation(int32_t vector, int32_t angle){
	register int i, i_next, arc_tan, rounding_term;
	register int32_t cur_x, cur_y, int_z, rounding_mask, round_x, round_y;

	rounding_mask = 0;

	cur_x = vector >> 16;		// x is in top two bytes
	vector = vector << 16;		// push low bytes to far left so negative will propagate
	cur_y = vector >> 16;		// y is now in top two bytes

	int_z = angle << ANGLE_SCALE;

	round_x = cur_x;
	round_y = cur_y;

	// First iteration, no division or rounding required
	/*loop prolog*/
	arc_tan = arctan_degrees[0];
	if(int_z < 0){
		//replaced explicitly with subtraction to match assembler. Assempler should now further optimize.
		arc_tan = 0-arc_tan;
		round_x = 0-round_x;
		round_y = 0-round_y;
	}

	cur_x = cur_x - round_y;
	cur_y = cur_y + round_x;
	int_z = int_z - arc_tan;

	round_x = cur_x;
	round_y = cur_y;

	rounding_term = 1;
	// Remaining iterations
	for(i = i-i; i - (ITERATIONS-1); i++){//optimized loop condition
		
		// if there are bits high in the soon to be truncated region. Now uses rounding_term	
		if(rounding_mask & round_x){
			round_x |= rounding_term;		// Von Neumann rounding
		}
		if(rounding_mask & round_y){
			round_y |= rounding_term;		// Von Neumann rounding
		}
		// add another 1 to the rounding mask
		rounding_mask |= rounding_term;
		rounding_term = 1<<i+1

		cur_x = cur_x - (round_y>>i);
		round_x = cur_x;//moved to resuse variable immediately
		
		cur_y = cur_y + (round_x>>i);
		round_y = cur_y;//moved to resuse variable immediately
		
		int_z = int_z - arc_tan;	
	
		i_next = i+1;	
		arc_tan = arctan_degrees[i_next];
		if(int_z < 0){
			//replaced explicitly with subtraction to match assembler. Assempler should now further optimize.
			arc_tan = 0-arc_tan;
			round_x = 0-round_x;
			round_y = 0-round_y;
		}
	}
	//Consider grafting entire loop body here.
	/*pipeling epilogue*/
	//i == 8
	// if there are bits high in the soon to be truncated region. Now uses rounding_term
	if(rounding_mask & round_x){
		round_x |= rounding_term;		// Von Neumann rounding
	}
	if(rounding_mask & round_y){
		round_y |= rounding_term;		// Von Neumann rounding
	}

	cur_x = cur_x - (round_y>>i);
	//round_x = cur_x;//not necessary since rounding mask will not be used again.
		
	cur_y = cur_y + (round_x>>i);
	//round_y = cur_y;//not necessary since rounding mask will not be used again.
		
	//int_z = int_z - arc_tan; not necessary since rounding mask will not be used again.
		
	// add another 1 to the rounding mask
	//rounding_mask |= (1<<(i-1)); not necessary since rounding mask will not be used again.

	//post loop code
	// ITER_SCALE is multiplied by 2^10 so shifting current values to compensate.
	cur_x = cur_x << 10;
	cur_x /= ITER_SCALE;
	cur_y = cur_y << 10;
	cur_y /= ITER_SCALE;

	// mask the y value to be 16 bits long (should be anyway)
	cur_y &= TWO_BYTE_MASK;

	cur_x = cur_x << 16;	// high two bytes of the returned value
	cur_x |= cur_y;			// low two bytes of the returned value

	return cur_x;
}

/*
Magnitude returned as high two bytes.
Angle returned as low two bytes. */
int32_t vectoring(int32_t vector){
	register int i, arc_tan;
	register int32_t cur_x, cur_y, int_z, rounding_mask, round_x, round_y;

	rounding_mask = 0;

	cur_x = vector >> 16;		// x is in top two bytes
	vector = vector << 16;		// push low bytes to far left so negative will propagate
	cur_y = vector >> 16;		// y is now in top two bytes

	int_z = 0;

	round_x = cur_x;
	round_y = cur_y;

	// First iteration, no division or rounding required
	arc_tan = arctan_degrees[0];
	if(cur_y >= 0){
		arc_tan *= -1;
		round_x *= -1;
		round_y *= -1;
	}

	cur_x = cur_x - round_y;
	cur_y = cur_y + round_x;
	int_z = int_z - arc_tan;

	round_x = cur_x;
	round_y = cur_y;

	// Remaining iterations
	for(i = 1; i < ITERATIONS; i++){
		arc_tan = arctan_degrees[i];
		if(cur_y >= 0){
			arc_tan *= -1;
			round_x *= -1;
			round_y *= -1;
		}

		// if there are bits high in the soon to be truncated region
		if(rounding_mask & round_x){
			round_x |= (1<<i);		// Von Neumann rounding
		}
		if(rounding_mask & round_y){
			round_y |= (1<<i);		// Von Neumann rounding
		}

		cur_x = cur_x - (round_y>>i);
		cur_y = cur_y + (round_x>>i);
		int_z = int_z - arc_tan;

		round_x = cur_x;
		round_y = cur_y;

		// add another 1 to the rounding mask
		rounding_mask |= (1<<(i-1));
	}
	// ITER_SCALE is multiplied by 2^10 so shifting current values to compensate.
	cur_x = cur_x << 10;
	cur_x /= ITER_SCALE;

	if(int_z & ANGLE_MASK){
		int_z |= (1 << ANGLE_SCALE);
	}
	int_z = int_z >> ANGLE_SCALE;		// put angle into degrees
	int_z &= TWO_BYTE_MASK;		// ensure it's 16 bits

	cur_x = cur_x << 16;	// Magnitude - high two bytes of returned value
	cur_x |= int_z;			// Angle - low two bytes of the returned value

	return cur_x;
}

int16_t arctan_fraction(int16_t numerator, int16_t denominator){
	int32_t temp = (denominator << 16) | (numerator & TWO_BYTE_MASK);
	temp = vectoring(temp);

	return temp;
}

/* x strictly greater than 0 */
int16_t arctan(int16_t x){
	return arctan_fraction(x,1);
}

/* angle in range [-90,90]
 * First two base 10 digits are decimal*/
int16_t cos_cordic(int32_t angle){
	int32_t vector = (1 << 14) ;
	vector = vector << 16;
	vector = rotation(vector, angle);
	vector = vector >> 16;
	vector *= 100;

	if(vector & 0x3fff){
		vector |= (1<<14);
	}

	return (vector >> 14);
}

/* angle in range [-90,90]
* First two base 10 digits are decimal*/
int16_t sin_cordic(int32_t angle){
	int32_t vector = (1 << 14) ;
	vector = vector << 16;
	vector = rotation(vector, angle);

	//int16_t r =
	vector = vector << 16;
	vector = vector >> 16;
	vector *= 100;

	if(vector & 0x3fff){
		vector |= (1<<14);
	}

	return (vector >> 14);
}


int main(void){
	/* test rotation */
	int16_t x, y;
	int32_t vector, angle, result;


	x =  (100<<6);
	y =  (-100<<6);
	vector = x << 16;
	vector |= (y & TWO_BYTE_MASK);

	angle = -1;
	result = rotation(vector,angle);
	x = result >> 16;
	y = (int16_t)(result);

	if(x & 0x3f){
		x |= (1<<6);
	}

	if(y & 0x3f){
		y |= (1<<6);
	}
	y = y >> 6;
	x = x >>6;
	printf("x = %i\ty = %i\n",x,y);

	/* test vectoring */
	x =  (100<<7);
	y =  (100<<7);
	vector = x << 16;
	vector |= y;


	result = vectoring(vector);
	x = result >> 16;
	if(x & 0x7f){
		x |= (1<<7);
	}
	x = x >> 7;
	y = (int16_t)(result);


	printf("magnitude = %i\tangle = %i\n",x,y);

	int16_t n = 10 << 8;
	int16_t d = 20 << 8;

	n = arctan_fraction(n,d);

	printf("Arctan_fraction = %i\n", n);

	n = 20;

	n = arctan(n);


	printf("Arctan = %i\n", n);

	n = cos_cordic(0);

	printf("cos = %i\n", n);

	n = sin_cordic(90);

	printf("sin  = %i\n", n);

	return 0;


}
