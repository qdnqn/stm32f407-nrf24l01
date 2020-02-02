#ifndef __FFT_H
#define __FFT_H

#include "stm32f4xx.h"
#include "delay.h"
#include "arm_math.h"

#define NFFT				128
//#define PI					(3.14159265359)
#define WSIZE				((NFFT) - 1)

void initFFT(void);
void ditRadix2FFT(int16_t * intdata);
void getRBArrayFFT(void);
void getTWArrayFFT(void);
void getAmpSpectrumFFT(uint16_t * ampdata);
inline float32_t sqrtf32(float32_t op1) ;


extern volatile float 		Xr[NFFT];
extern volatile float 		Xi[NFFT];

#endif 
