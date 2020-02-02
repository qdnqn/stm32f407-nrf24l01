#include "fft.h"

volatile float32_t 		Xr[NFFT];
volatile float32_t 		Xi[NFFT];
volatile float32_t 		Wr[WSIZE];
volatile float32_t 		Wi[WSIZE];
volatile uint32_t 	RBM[NFFT];											// reverse bit matrix of indices
volatile uint32_t 	M;	

void initFFT(void)
{
	uint16_t L;
	
	L = NFFT;
	M = 0;																// number of iteration for FFT
	while(L > 1)
	{
		M++;
		L = L >> 1;
	}
	getRBArrayFFT();													// create reverse bit index array
	getTWArrayFFT();
}

void ditRadix2FFT(int16_t * intdata)
{/// DFT calculation
	float32_t t_val,f_tmp1,f_tmp2;
	uint32_t t_k,t_n,k,n,m,N,L, K,t_X, wcnt, t_wcnt;
	// index reversal
	for(k=0;k<NFFT;k++)
	{
		t_k = RBM[k];
		Xr[t_k] = ((float)intdata[k])*3.0/32768.0; 									
		Xi[k] = 0;
	}

	///WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW
	/// DIT RADIX2 FFT Algorithm
	///wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww
	K = 1;
	/// go through each iteration
	wcnt = 0;
	for(m=0;m<M;m++)
	{
		L = 2<<m;
		N = 1<<(M-m-1);
		t_wcnt = wcnt;
	
		/// calculate butterfly's
		for(n=0;n<N;n++)
		{// for each butterfly
			wcnt = t_wcnt;
			for(k=0;k<K;k++)
			{
				t_k = L*n + k;
				t_n = t_k + K;
				
				f_tmp1 = Wr[wcnt]*Xr[t_n] - Wi[wcnt]*Xi[t_n];
				f_tmp2 = Wr[wcnt]*Xi[t_n] + Wi[wcnt]*Xr[t_n];
				
				// calculate second half of data
				Xr[t_n] = Xr[t_k] - f_tmp1;
				Xi[t_n] = Xi[t_k] - f_tmp2;
				// calculate first half of data
				Xr[t_k] = Xr[t_k] + f_tmp1;
				Xi[t_k] = Xi[t_k] + f_tmp2;
				
				wcnt++;
			}
		}
		K = K << 1;
	}
}

void getRBArrayFFT(void)
{///BIT REVERSING
	// example of bit reversing for 3 bits
	//x[0]=0;x[1]=4;x[2]=2;x[3]=6;x[4]=1;x[5]=5;x[6]=3;x[7]=7;		
		
	uint32_t k, n, n_idx, t_idx;
	
	for(k=0;k<NFFT;k++)
	{
		n_idx = 0;
		t_idx = k;
		
		for(n=0;n<M;n++)
		{// go through each bit in address
			if((t_idx & 0x0001) == 0x0001)
			{
				n_idx = n_idx + (1<<(M-n-1));
			}
			t_idx = t_idx >> 1;
		}	
		RBM[k] = n_idx;
	}
}

void getTWArrayFFT(void)
{/// calculate twiddle factors
	uint32_t k, m, L, K = 1, n = 0;
	float32_t t_val;
	
	/// go through each iteration
	for(m=0;m<M;m++)
	{
		L = 2<<m;

		for(k=0;k<K;k++)
		{
			t_val = 2*(PI)*((float32_t)(k))/((float32_t)L);
			Wr[n] = arm_sin_f32(t_val + 1.57);
			Wi[n] = -arm_sin_f32(t_val);
			n++;
		}
		K = K << 1;
	}
}

void getAmpSpectrumFFT(uint16_t * ampdata)
{
	uint16_t k;
	float32_t val;
	
	for(k=0;k<(NFFT);k++)
	{
		val = Xr[k]*Xr[k] + Xi[k]*Xi[k];
		ampdata[k] = (uint16_t)(1000*sqrtf32(val)/(NFFT));
	}
}

inline float32_t sqrtf32(float32_t op1) 
{
	//VSQRT{cond}.F32 Sd, Sm
	float32_t result;
	__asm volatile("vsqrt.f32 %0, %1" : "=w" (result) : "w" (op1) );
	return result;
}
