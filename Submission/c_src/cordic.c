
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
	float multiplier = 100.0000000f;
	
	for(;i<13;i++)
	{
		angle = 90 - i*15;
		correctSin = sin(angle*PI/180);
		correctCos = cos(angle*PI/180);

		printf("\n\nCorrect values: Angle = %i, Sin = %f, Cos = %f", angle, correctSin, correctCos);

		printf("\nSin results:\n");
		printf("Function| Value		| Error		\n");

		tmp_float = sin_float((float)angle);
		error = fabs(correctSin - tmp_float);
		//printf("%s",(correctSin - tmp_float));
		printf("Float	| %07f		|	%07f	\n",tmp_float, error);
		
		temp = sin_routine(angle);
		//printf("int returned = %i",temp);
		error = fabs((correctSin*multiplier) - ((float)temp))/multiplier;
		printf("Routine	| %07f		|	%07f	\n",((float)temp)/multiplier, error);
	
		temp = sin_inline(angle);
		//printf("int returned = %i",temp);
		error = fabs((correctSin*multiplier) - ((float)temp)/multiplier)/multiplier;
		printf("Inline	| %07f		|	%07f	\n",((float)temp)/multiplier, error);
	
		temp = sin_macro(angle);
		//printf("int returned = %i",temp);
		error = fabs((correctSin*multiplier) - ((float)temp)/multiplier)/multiplier;
		printf("Macro	| %07f		|	%07f	\n", ((float)temp)/multiplier, error);
		
		temp = sin_optimized(angle);
		//printf("int returned = %i",temp);
		error = fabs((correctSin*multiplier) - ((float)temp)/multiplier)/multiplier;
		printf("Optimizd| %07f		|	%07f	\n", ((float)temp)/multiplier, error);
		
		printf("\nCos results:\n");
		printf("Function| Value		| Error		\n");

		tmp_float = cos_float((float)angle);
		//printf("int returned = %i",temp);
		error = correctCos - tmp_float;
		printf("Float	| %07f		|	%07f	\n",tmp_float, error);
		
		temp = cos_routine(angle);
		//printf("int returned = %i",temp);
		error = fabs((correctCos*multiplier) - ((float)temp)/multiplier)/multiplier;
		printf("Routine	| %07f		|	%07f	\n",((float)temp)/multiplier, error);
	
		temp = cos_inline(angle);
		//printf("int returned = %i",temp);
		error = fabs((correctCos*multiplier) - ((float)temp)/multiplier)/multiplier;
		printf("Inline	| %07f		|	%07f	\n",((float)temp)/multiplier, error);
	
		temp = cos_macro(angle);
		//printf("int returned = %i",temp);
		error = fabs((correctCos*multiplier) - ((float)temp)/multiplier)/multiplier;
		printf("Macro	| %07f		|	%07f	\n",((float)temp)/multiplier, error);
		
		temp = cos_optimized(angle);
		//printf("int returned = %i",temp);
		error = fabs((correctCos*multiplier) - ((float)temp)/multiplier)/multiplier;
		printf("Optimizd| %07f		|	%07f	\n",((float)temp)/multiplier, error);

		printf("\nArctan fraction results:\n");
    printf("Function| Value   | Error   \n");


		tmp_float = arctan_fraction_float(correctSin, correctCos);
 	      //printf("int returned = %i",temp);
    error = fabs((float)angle - tmp_float);
    printf("Float 	| %07f    | %07f  \n",tmp_float, error);
   
    temp = arctan_fraction_routine((int16_t)(correctSin*(1<<14)), (int16_t)correctCos*(1<<14));
    //printf("int returned = %i",temp);
    error = fabs((float)angle - (float)temp);
    printf("Routine | %07f    | %07f  \n",(float)temp, error);
     
    temp = arctan_fraction_inline((int16_t)(correctSin*(1<<14)), (int16_t)correctCos*(1<<14));
       // printf("int returned = %i",temp);
    error = fabs((float)angle - (float)temp);
    printf("Inline  | %07f    | %07f  \n",(float)temp, error);
     
    temp = arctan_fraction_macro((int16_t)(correctSin*(1<<14)), (int16_t)correctCos*(1<<14));
        //printf("int returned = %i",temp);
    error = fabs((float)angle - (float)temp);
    printf("Macro 	| %07f    | %07f  \n",(float)temp, error);
     
    temp = arctan_fraction_optimized((int16_t)(correctSin*(1<<14)), (int16_t)correctCos*(1<<14));
        //printf("int returned =1<<15) %i",temp);
    error = fabs((float)angle - (float)temp);
    printf("Optimizd| %07f    | %07f  \n",(float)temp/(float)(1<<14), error);
	}
}
