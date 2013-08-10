#define ITERATIONS			16	// 16 iterations for 16 bit precision
#define ANGLE_SCALE			24		// (2^24)
#define ANGLE_MASK			0x7fffff
#define ITER_SCALE			1686 			//1.64676 * 2^10
#define TWO_BYTE_MASK		0xffff

#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <math.h>

/**** Prototypes *********************************************/
int32_t rotation(int32_t, int32_t);
int32_t vectoring(int32_t);

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
	register int i, d;
	register int32_t cur_x, cur_y, int_z, rounding_mask, round_x, round_y;	
	
	rounding_mask = 0;
	
	round_x = vector >> 16;		// x is in top two bytes
	vector = vector << 16;		// push low bytes to far left so negative will propagate
	round_y = vector >> 16;		// y is now in top two bytes
	
	int_z = angle;
	
	// First iteration, no division or rounding required
	d = 1;
	if(int_z < 0) d = -1;
	
	cur_x = round_x - (d*round_y);
	cur_y = round_y + (d*round_x);
	int_z = int_z - (d*arctan_degrees[0]);
	
	round_x = cur_x;
	round_y = cur_y;	
	
	// Remaining iterations 
	for(i = 1; i < ITERATIONS; i++){
		d = 1;
		if(int_z < 0) d = -1;
		
		// if there are bits high in the soon to be truncated region
		if(rounding_mask & round_x){
			round_x |= (1<<i);		// Von Neumann rounding
		}		
		if(rounding_mask & round_y){
			round_y |= (1<<i);		// Von Neumann rounding
		}
		
		cur_x = cur_x - ((d*round_y)>>i);
		cur_y = cur_y + ((d*round_x)>>i);		
		int_z = int_z - (d*arctan_degrees[i]);
		
		round_x = cur_x;
		round_y = cur_y;		
		
		// add another 1 to the rounding mask
		rounding_mask |= (1<<(i-1));
	}
	
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
	register int i, d;
	register int32_t cur_x, cur_y, int_z, rounding_mask, round_x, round_y;	
	
	rounding_mask = 0;
	
	round_x = vector >> 16;		// x is in top two bytes
	vector = vector << 16;		// push low bytes to far left so negative will propagate
	round_y = vector >> 16;		// y is now in top two bytes
	
	int_z = 0;
	
	// First iteration, no division or rounding required
	d = -1;
	if(round_y < 0) d = 1;
	
	cur_x = round_x - (d*round_y);
	cur_y = round_y + (d*round_x);
	int_z = int_z - (d*arctan_degrees[0]);
	
	round_x = cur_x;
	round_y = cur_y;	
	
	// Remaining iterations 
	
	for(i = 1; i < ITERATIONS; i++){
		d = -1;
		if(cur_y < 0) d = 1;
		
		// if there are bits high in the soon to be truncated region
		if(rounding_mask & round_x){
			round_x |= (1<<i);		// Von Neumann rounding
		}		
		if(rounding_mask & round_y){
			round_y |= (1<<i);		// Von Neumann rounding
		}
		
		cur_x = cur_x - ((d*round_y)>>i);
		cur_y = cur_y + ((d*round_x)>>i);		
		int_z = int_z - (d*arctan_degrees[i]);
		
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
	int_z &= TWO_BYTE_MASK;		// ensure it's 16 bits (should be anyway)
	
	cur_x = cur_x << 16;	// Magnitude - high two bytes of returned value
	cur_x |= int_z;			// Angle - low two bytes of the returned value
	
	return cur_x;
}




int main(void){
	/* test rotation */
	int16_t x, y;
	int32_t vector, angle, result;
	float final_x, final_y;
	
	x = -1 * (1<<14);
	y = 0;
	vector = x << 16;
	vector |= y;
	
	angle = 90 << ANGLE_SCALE;
	result = rotation(vector,angle);
	x = result >> 16;	
	y = (int16_t)(result);	
	
	//final_x = (float)x / (float)(1<<14);
	//final_y = (float)y / (float)(1<<14);
	//printf("x = %f\ty = %f\n",final_x,final_y);
	
	if(x & 0x3f0){	// limiting Von Neumann Mask
		x |= (1<<14);
	}
	x = x >> 14;
	if(y & 0x3f0){
		y |= (1<<14);
	}
	y = y >> 14;
	printf("x = %i\ty = %i\n",x,y);
	
	
	// test vectoring
	//int16_t x, y;
	//int32_t vector, result;
	//float final_x, final_y;
	
	y = 1<<14;
	x = 0;
	vector = x << 16;
	vector |= y;
	
	
	result = vectoring(vector);
	x = result >> 16;	
	if(x & 0x3f0){	// limiting Von Neumann Mask
		x |= (1<<14);
	}
	x = x >> 14;
	y = (int16_t)(result);	
	
	final_x = (float)x / (float)(1<<14);
	//final_y = (float)y / (float)(1<<14);
	printf("magnitude = %x\tangle = %i\n",x,y);
	return 0;
}