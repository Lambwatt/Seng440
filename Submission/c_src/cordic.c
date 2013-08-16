
#include "cordic.h"
#include <stdint.h>
#include <stdio.h>

int main(void){
	int32_t temp = 0;
	
	/*temp = arctan_fraction_routine(0, 0);
	temp = arctan_routine(0);
	temp = cos_routine(0);
	temp = sin_routine(0);

	temp = arctan_fraction_inline(0, 0);
	temp = arctan_inline(0);
	temp = cos_inline(0);
	temp = sin_inline(0);
	
	temp = arctan_fraction_macro(0, 0);
	temp = arctan_macro(0);
	temp = cos_macro(0);
	temp = sin_macro(0);*/
	
	temp = cos_routine(0);
	printf("%i\n",temp);
	temp = cos_inline(0);
	printf("%i\n",temp);
	temp = cos_macro(0);
	printf("%i\n",temp);
}