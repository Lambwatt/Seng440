
#include "cordic.h"
#include <stdint.h>
#include <stdio.h>
#include <math.h>

#define PI 3.14159265359

int main(void){
	int32_t temp = 0;
	int16_t angle;
	int i = 0;
	float error;
	float correctSin, correctCos;
	
	for(;i<13;i++)
	{
		angle = 90 - i*15;
		correctSin = sin(angle*PI/180);
		correctCos = cos(angle*PI/180);

		printf("Correct values: Angle = %i, Sin = %f, Cos = %f", angle, corectSin, correctCos);

		printf("\n\nSin results:\n");
		printf("Function| Value		| Error		");

		temp = sin_float(angle);
		error = abs(correctSin - temp);
		printf("Float		| %07f		|	%07f	\n",temp, error);
		
		temp = sin_routine(angle);
		error = abs(correctSin - temp);
		printf("Routine	| %07f		|	%07f	\n",temp, error);
	
		temp = sin_inline(angle);
		error = abs(correctSin - temp);
		printf("Inline	| %07f		|	%07f	\n",temp, error);
	
		temp = sin_macro(angle);
		error = abs(correctSin - temp);
		printf("Macro		| %07f		|	%07f	\n",temp, error);
		
		temp = sin_optimized(angle);
		error = abs(correctSin - temp);
		printf("Optimizd| %07f		|	%07f	\n",temp, error);
	
		printf("\nCos results:\n");
		printf("Function| Value		| Error		");

		temp = cos_float(angle);
		error = abs(correctCos - temp);
		printf("Float		| %07f		|	%07f	\n",temp, error);
		
		temp = cos_routine(angle);
		error = abs(correctCos - temp);
		printf("Routine	| %07f		|	%07f	\n",temp, error);
	
		temp = cos_inline(angle);
		error = abs(correctCos - temp);
		printf("Inline	| %07f		|	%07f	\n",temp, error);
	
		temp = cos_macro(angle);
		error = abs(correctCos - temp);
		printf("Macro		| %07f		|	%07f	\n",temp, error);
		
		temp = cos_optimized(angle);
		error = abs(correctCos - temp);
		printf("Optimizd| %07f		|	%07f	\n",temp, error);
	}	
	//temp = cos_routine(0);
	//printf("%i\n",temp);
	//temp = cos_inline(0);
	//printf("%i\n",temp);
	//temp = cos_macro(0);
	//printf("%i\n",temp);
}
