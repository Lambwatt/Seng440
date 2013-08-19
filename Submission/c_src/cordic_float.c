#define MAX_ITER		16
#define SCALING_FACTOR	1.6468
#define PI  3.14159

#define ABS(x)		((x < 0) ? (-x) : x)

#include "cordic.h"
#include <stdio.h>
#include <math.h>

float arctan_degrees[MAX_ITER] = {45.0,26.56,14.04,7.13,
								3.58,1.79,0.89,0.45,
								0.22,0.11,0.05,0.03,
								0.000244,0.000122,0.000061,0.0000305};

void rotation(float *x, float *y, float *rotation_angle){
	int i;
	float last_x, last_y;
	last_x = *x;
	last_y = *y;
	
	for(i = 0; i < MAX_ITER; i++){
		
		float d = 1;
		if(*rotation_angle < 0) d = -1;
		
		*x = last_x - ((d*last_y)/(1<<i));
		*y = last_y + ((d*last_x)/(1<<i));
		*rotation_angle -= (d*arctan_degrees[i]);
	
		last_x = *x;
		last_y = *y;
	}
	
	*x /= SCALING_FACTOR;
	*y /= SCALING_FACTOR;
	
}

void vectoring(float* x, float* y, float* z){
	int i;
	float last_x, last_y;
	last_x = *x;
	last_y = *y;
	
	for(i = 0; i < MAX_ITER; i++){
		
		float d = -1;
		if(last_y < 0) d = 1;
		
		*x = last_x - ((d*last_y)/(1<<i));
		*y = last_y + ((d*last_x)/(1<<i));
		*z -= (d*arctan_degrees[i]);
	
		last_x = *x;
		last_y = *y;
	}
	
	*x /= SCALING_FACTOR;
	*y /= SCALING_FACTOR;
	
}

float arctan_fraction_float(float y, float x){
	
	float r = 0.0f; 
	vectoring(&x,&y,&r);
	return r;
}

float arctan_float(float x){
	return arctan_fraction_float(x,1.0);
}

float cos_float(float angle){	
	float r =  1.0f;
	float y = 0.0f;
	rotation(&r,&y,&angle);
	return r;
}

float sin_float(float angle){
	float r = 0.0f;
	float x = 1.0;
	rotation(&x,&r,&angle);
	return r;
}
/*
int main(void){
	float angle[2] = {1,1};
	
	float x = 1.0f;
	float y = 0.0f;
	float z = 90.0f;;
	
	rotation(&x,&y, &z);
	float f = arctan(0.5);

	printf("math.arctan(0.5) = %f\n", (atan(0.5)*180.0/PI));
	printf("Arctan(0.5) = %f\n",f);

	printf("Results: x = %f\ty = %f\tz = %f\n",x,y,z);
	printf("expected: x=0.0, y=1.0, z=0.0\n");
	
	x = 0.0f;
	y = 1.0f;
	z = 0.0f;
	
	vectoring(&x,&y,&z);	
	f = sin_vec(45);

	printf("math.sin(45) = %f\n",(sin(45.0*PI/180.0)*180.0/PI));
	printf("sin = %f\n",f);

	printf("Results: x = %f\ty = %f\tz = %f\n",x,y,z);
	printf("expected: x=1.0, y=0.0, z=90.0\n");
	
	return 0;
}*/
