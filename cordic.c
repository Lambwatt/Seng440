#define X				0
#define Y				1
#define Z				2
#define MAX_ITER		16
#define SCALING_FACTOR	1.6468

#define ABS(x)		((x < 0) ? (-x) : x)

#include <stdio.h>
#include <math.h>

float arctan_degrees[MAX_ITER] = {45.0,26.56,14.04,7.13,
								3.58,1.79,0.89,0.45,
								0.22,0.11,0.05,0.03,
								0.000244,0.000122,0.000061,0.0000305};

float new_values[3];


float *rotation(float x, float y, float rotation_angle){
	int i;
	float last_x, last_y;
	last_x = x;
	last_y = y;
	new_values[Z] = rotation_angle;
	
	for(i = 0; i < MAX_ITER; i++){
		
	
		float d = 1;
		if(new_values[Z] < 0) d = -1;
		
		printf("Iteration: %i\td = %f\tx = %f\ty = %f\tz = %f\n",i,d,last_x,last_y,new_values[Z]);
		
		new_values[X] = last_x - ((d*last_y)/(1<<i));
		new_values[Y] = last_y + ((d*last_x)/(1<<i));
		new_values[Z] = new_values[Z] - (d*arctan_degrees[i]);
	
		
		
		last_x = new_values[X];
		last_y = new_values[Y];
	}
	
	new_values[X] /= SCALING_FACTOR;
	new_values[Y] /= SCALING_FACTOR;
	
	return new_values;
}

float *vectoring(float x, float y, float z){
	int i;
	float last_x, last_y;
	last_x = x;
	last_y = y;
	new_values[Z] = z;
	
	for(i = 0; i < MAX_ITER; i++){
		
	
		float d = -1;
		if(last_y < 0) d = 1;
		
		printf("Iteration: %i\td = %f\tx = %f\ty = %f\tz = %f\n",i,d,last_x,last_y,new_values[Z]);
		
		new_values[X] = last_x - ((d*last_y)/(1<<i));
		new_values[Y] = last_y + ((d*last_x)/(1<<i));
		new_values[Z] = new_values[Z] - (d*arctan_degrees[i]);
	
		
		
		last_x = new_values[X];
		last_y = new_values[Y];
	}
	
	new_values[X] /= SCALING_FACTOR;
	new_values[Y] /= SCALING_FACTOR;
	
	
	
	return new_values;
	
	
}

float arctan_fraction(float y, float x){
	
	float *r = vectoring(x,y,0);
	
	return r[Z];

}

float arctan(float x){
	return arctan_fraction(x,1.0);
}

float cos_vec(float angle){	
	float *r = rotation(1,0,angle);
	return r[X];
}

float sin_vec(float angle){
	float *r = rotation(1,0,angle);
	return r[Y];
}

int main(void){
	float angle[2] = {1,1};
	
	//float *result = rotation(1,0, 90);
	float *result = vectoring(0,1,0);
	
	printf("Results: x = %f\ty = %f\tz = %f\n",result[X],result[Y],result[Z]);
	
	//float f = arctan(0.5);
	
	//printf("Arctan = %f\n",f);
	
	//float f = sin_vec(45);
	//printf("sin = %f\n",f);
	return 0;
}
