#define ITERATIONS			16	// 16 iterations for 16 bit precision
#define ANGLE_SCALE			23860929		// (2^31)/90
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

/* each value in the array = arctan(2^-i) * 2^31/90 
(Domain of convergence is -90...90) */
int32_t const arctan_degrees[ITERATIONS] = {1074000000, 633900000, 334900000, 170000000,
									85330000, 42710000, 21360000, 10680000,
									5340000, 2670000, 1335000, 667544,
									333772, 166886, 83443, 41722};
									
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
	register int32_t cur_x, cur_y, last_x, last_y, int_z, rounding_mask;	
	
	rounding_mask = 0;
	
	
	last_x = vector >> 16;
	vector = vector << 16;
	last_y = vector >> 16;
	
	int_z = 0;
	
	for(i = 0; i < ITERATIONS; i++){
		d = -1;
		if(last_y < 0) d = 1;
		
		if(rounding_mask & last_x){
			//last_x |= (1<<i);
		}
		
		if(rounding_mask & last_y){
			//last_y |= (1<<i);
		}
		
		cur_x = last_x - ((d*last_y)>>i);
		cur_y = last_y + ((d*last_x)>>i);
		int_z = int_z - (d*arctan_degrees[i]);
		
		last_x = cur_x;
		last_y = cur_y;	
		
		rounding_mask |= (1<<i);
	}
	
	last_x = last_x << 10;
	last_x /= ITER_SCALE;
	
	last_x = last_x << 16;
	
	int_z /= ANGLE_SCALE;
	
	int_z &= TWO_BYTE_MASK;
	
	last_x |= int_z;
	
	return last_x;
}




int main(void){
	/* test rotation */
	int16_t x, y;
	int32_t vector, angle, result;
	float final_x, final_y;
	
	y = 1<<14;
	x = 0;
	vector = x << 16;
	vector |= y;
	
	angle = 1<<31;
	result = rotation(vector,angle);
	x = result >> 16;	
	y = (int16_t)(result);	
	
	final_x = (float)x / (float)(1<<14);
	final_y = (float)y / (float)(1<<14);
	printf("x = %f\ty = %f\n",final_x,final_y);
	
	// test vectoring
	/*int16_t x, y;
	int32_t vector, result;
	float final_x, final_y;
	
	y = 1<<14;
	x = 0;
	vector = x << 16;
	vector |= y;
	
	
	result = vectoring(vector);
	x = result >> 16;	
	y = (int16_t)(result);	
	
	final_x = (float)x / (float)(1<<14);
	//final_y = (float)y / (float)(1<<14);
	printf("magnitude = %f\tangle = %i\n",final_x,y);
	return 0;*/
}