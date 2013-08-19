
#include "cordic.h"
#include <stdint.h>
#include <stdio.h>
#include <math.h>

#define PI 3.14159265359

int main(void){
	int32_t temp = 0;
	float tmp_float = 0;
	int16_t angle;
	int i = 0;
	float error;
	float correctSin, correctCos;
	
	for(;i<13;i++)
	{
		angle = 90 - i*15;
		correctSin = sin(angle*PI/180);
		correctCos = cos(angle*PI/180);

		printf("Correct values: Angle = %i, Sin = %f, Cos = %f", angle, correctSin, correctCos);

		printf("\n\nSin results:\n");
		printf("Function| Value		| Error		");

		tmp_float = sin_float((float)angle);
		error = abs(correctSin - tmp_float);
		printf("Float		| %07f		|	%07f	\n",tmp_float, error);
		
		temp = sin_routine(angle<<8);
		error = abs(correctSin - (float)temp/(float)(1<<8));
		printf("Routine	| %07f		|	%07f	\n",(float)temp/(float)(1<<8), error);
	
		temp = sin_inline(angle<<8);
		error = abs(correctSin - (float)temp/(float)(1<<8));
		printf("Inline	| %07f		|	%07f	\n",(float)temp/(float)(1<<8), error);
	
		temp = sin_macro(angle<<8);
		error = abs(correctSin - (float)temp/(float)(i<<8));
		printf("Macro		| %07f		|	%07f	\n", (float)temp/(float)(1<<8), error);
		
		temp = sin_optimized(angle<<8);
		error = abs(correctSin - (float)temp/(float)(1<<8));
		printf("Optimizd| %07f		|	%07f	\n", (float)temp/(float)(1<<8), error);
	
		printf("\nCos results:\n");
		printf("Function| Value		| Error		");

		tmp_float = cos_float(angle);
		error = abs(correctCos - tmp_float);
		printf("Float		| %07f		|	%07f	\n",tmp_float, error);
		
		temp = cos_routine(angle<<8);
		error = abs(correctCos - (float)temp/(float)(1<<8));
		printf("Routine	| %07f		|	%07f	\n",(float)temp/(float)(1<<8), error);
	
		temp = cos_inline(angle<<8);
		error = abs(correctCos - (float)temp/(float)(1<<8));
		printf("Inline	| %07f		|	%07f	\n",(float)temp/(float)(1<<8), error);
	
		temp = cos_macro(angle<<8);
		error = abs(correctCos - (float)temp/(float)(1<<8));
		printf("Macro		| %07f		|	%07f	\n",(float)temp/(float)(1<<8), error);
		
		temp = cos_optimized(angle<<8);
		error = abs(correctCos - (float)temp/(float)(1<<8));
		printf("Optimizd| %07f		|	%07f	\n",(float)temp/(float)(1<<8), error);
	}
}
