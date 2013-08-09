
#define ITERATIONS		16	// 16 iterations for 16 bit precision
#define ANGLE_SCALE		23860929		// (2^31)/90
#define ITER_SCALE		1.64676
#define ABS(x)			(x > 0 ? x : -x)
#define VECTOR_SCALE	14

#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <math.h>

/**** Prototypes *********************************************/
void rotation(float,float,float,float[2]);
void vectoring(float,float,float,float[2]);

/**** Members ************************************************/

/* We will have to pack 2 arguments into one 32 bit representation
when implementing the hardware component.  I nominate these to be 
the X and Y values, which will leave the Z value at 32 bits.  The
X and Y values are limited to 16 bit signed integers.  */
								
/* To retain 16 bits of precision we need a minimum of 20 bits for
intermediate values.  Will be using 32 bits instead. */

/* each value in the array = arctan(2^-i) * 2^31/90 
(Domain of convergence is -90...90) */
int32_t const arctan_degrees[ITERATIONS] = {1074000000, 633900000, 334900000, 170000000,
									85330000, 42710000, 21360000, 10680000,
									5340000, 2670000, 1335000, 667544,
									333772, 166886, 83443, 41722};
									
/* Function down scales the input vectors to be in range [-1,1], applies Cordic then
up scales the result accordingly. Z is in the range [-90,90]

'result' will contain the rotated vector. X in position 0 and Y in position 1*/
void rotation(float x,float y, float rotation_angle, float result[2]){
	register int i, d;
	register int32_t cur_x, cur_y, last_x, last_y, int_z;	
	float orig_scaler;


	// scale down vector to be in range [-1,1]
	if(ABS(y) > ABS(x)){
		orig_scaler = y;
		y = 1;
		x /= orig_scaler;
	} else {
		orig_scaler = x;
		x = 1;
		y /= orig_scaler;
	}
	
	// Convert vector floats to be integers in the rage [-2,2]
	// (worst case intermediate value of 1.414 if x = y = 1)
	last_x = x * (1<<VECTOR_SCALE);
	last_y = y * (1<<VECTOR_SCALE);

	// scale the angle with pre-calculated angle scale (2^31)/90
	int_z =  rotation_angle * ANGLE_SCALE;

	// iterate through Cordic
	for(i = 0; i < ITERATIONS; i++){
		d = 1;
		if(int_z < 0) d = -1;
		
		printf("Iteration: %i\td = %i\tx = %i\ty = %i\tz = %i\n",i,d,last_x,last_y,int_z);
		
		cur_x = last_x - ((d*last_y)>>i);
		cur_y = last_y + ((d*last_x)>>i);
		int_z = int_z - (d*arctan_degrees[i]);
		
		last_x = cur_x;
		last_y = cur_y;
	}
	
	// convert result into floats
	float final_scale = (1<<VECTOR_SCALE)*ITER_SCALE;
	final_scale = orig_scaler / final_scale;

	result[0] = ((float)cur_x) * final_scale;
	result[1] = ((float)cur_y) * final_scale;
}

/* Function down scales the input vectors to be in range [0,1] for x and
 [-1,1] for y, applies Cordic then up scales the result accordingly.

 X must be >= 0 otherwise the results are undefined.

 Z is in the range [-90,90]

'result' will contain the rotation angle in pos 0 and the scaled magnitude 
of the original vector in po 1 */
void vectoring(float x,float y, float z, float result[2]){
	register int i, d;
	register int32_t cur_x, cur_y, last_x, last_y, int_z;	
	float orig_scaler;

	// scale down vector to be in range [-1,1]
	if(ABS(y) > x){
		orig_scaler = y;
		y = 1;
		x /= orig_scaler;
	} else {
		orig_scaler = x;
		x = 1;
		y /= orig_scaler;
	}

	// Convert vector floats to be integers in the rage [-2,2]
	// (worst case intermediate value of 1.414 if x = y = 1)
	last_x = x * (1<<VECTOR_SCALE);
	last_y = y * (1<<VECTOR_SCALE);

	// scale the angle with pre-calculated angle scale (2^31)/90
	int_z =  z * ANGLE_SCALE;
	
	// iterate through Cordic
	for(i = 0; i < ITERATIONS; i++){
		d = -1;
		if(last_y < 0) d = 1;
		
		printf("Iteration: %i\td = %i\tx = %i\ty = %i\tz = %i\n",i,d,last_x,last_y,int_z);
		
		cur_x = last_x - ((d*last_y)>>i);
		cur_y = last_y + ((d*last_x)>>i);
		int_z = int_z - (d*arctan_degrees[i]);
		
		last_x = cur_x;
		last_y = cur_y;
	}
	
	// convert integers back to floats
	float final_scale = (1<<VECTOR_SCALE)*ITER_SCALE;
	
	result[0] = ((float)int_z) / ANGLE_SCALE;
	result[1] = ABS(((float)cur_x * orig_scaler) / final_scale); // Scaled magnitude always positive?

}

float arctan_fraction(float numerator, float denominator){	// y/x
	float r[2] = {0,0};
	vectoring(denominator,numerator,0,r);
	return r[0];
}

float arctan(float x){
	return arctan_fraction(x,1);
}

float cos_cordic(float angle){
	float r[2] = {0,0};
	rotation(1,0,angle,r);
	return r[0];
}

float sin_cordic(float angle){
	float r[2] = {0,0};
	rotation(1,0,angle,r);
	return r[1];
}

int main(void){
	float result[2] = {0,0};
	
	//rotation(10,0,90,result);
	//printf("Result:\tx = %f\ty = %f\n",result[X],result[Y]);
	
	//vectoring(0,100,0,result);
	//printf("Result: Rot Angle = %f\tscaled mag = %f\n",result[0],result[1]);

	//float at = arctan_fraction(1,2);
	//printf("Arctan = %f\n",at);

	//float c = cos_cordic(-90);
	//printf("cos = %f\n", c);

	float s = sin_cordic(0);
	printf("sin = %f\n",s);

	return 0;
}
