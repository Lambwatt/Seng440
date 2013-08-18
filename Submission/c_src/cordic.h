#ifndef CORDIC_H
#define CORDIC_H

#include <stdint.h>


int16_t arctan_fraction_float(int16_t, int16_t);
int16_t arctan_float(int16_t);
int16_t cos_float(int32_t angle);
int16_t sin_float(int32_t angle);
						
int16_t arctan_fraction_routine(int16_t, int16_t);
int16_t arctan_routine(int16_t);
int16_t cos_routine(int32_t angle);
int16_t sin_routine(int32_t angle);
			
int16_t arctan_fraction_inline(int16_t, int16_t);
int16_t arctan_inline(int16_t);
int16_t cos_inline(int32_t angle);
int16_t sin_inline(int32_t angle);

int16_t arctan_fraction_macro(int16_t, int16_t);
int16_t arctan_macro(int16_t);
int16_t cos_macro(int32_t angle);
int16_t sin_macro(int32_t angle);

int16_t arctan_fraction_optimized(int16_t, int16_t);
int16_t arctan_optimized(int16_t);
int16_t cos_optimized(int32_t angle);
int16_t sin_optimized(int32_t angle);

#endif
