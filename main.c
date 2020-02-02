#include "stm32f4xx.h"
#include "usart.h"
#include "delay.h"
#include "mp45dt02.h"
#include "cs43l22.h"
#include "pdm_filter.h"
#include "nrf24l01.h"
#include "fir.h"
#include "fft.h"

#define DAC_BUFF_SIZE 128

PDMFilter_InitStruct Filter;

void runMasterNodeSYS(PDMFilter_InitStruct *);
void runSlaveNodeSYS(void);

PDMFilter_InitStruct Filter;
uint32_t utmp32 = 0, k_mic = 0, n_mic = 0;
uint16_t buff[64], cnt = 0;

uint16_t outdata[16]; 
uint16_t volume = 20, utmp16;
uint16_t dac_data[DAC_BUFF_SIZE], dac_data2[DAC_BUFF_SIZE];
uint16_t fs = 16000;
uint32_t pid = 0;

int main(void)
{
	Filter.LP_HZ = 8000;
	Filter.HP_HZ = 20;
	Filter.Fs = fs;
	Filter.Out_MicChannels = 1;
	Filter.In_MicChannels = 1;
	PDM_Filter_Init((PDMFilter_InitStruct *)&Filter);  
	
	initMIC(fs);
	 
	RCC->AHB1ENR |= RCC_AHB1ENR_CRCEN;
	
	initUSART2(USART2_BAUDRATE_921600);
	
	printUSART2("\nwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww\n");
	printUSART2("w STM32F407 - CS43L22 Audio DAC MIC I2S demo");
	printUSART2("\nwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww\n");
	
	initCS43L22(3, 8000, dac_data, dac_data2, DAC_BUFF_SIZE);
	printUSART2("-> SYS: init completed\n");
	SPI2->I2SCFGR |= SPI_I2SCFGR_I2SE; 
	
	uint8_t node_type = (NRF24L01_NODE_TYPE_RX);
	
	RCC->AHB1ENR |= RCC_AHB1ENR_GPIOCEN;
	GPIOC->MODER &= ~(GPIO_MODER_MODER6);  
	GPIOC->PUPDR |= (GPIO_PUPDR_PUPDR6_0);		

	delay_ms(10);
	if((GPIOC->IDR & 0x00000040) == 0x00000000)
	{// init as Tx node
		node_type = (NRF24L01_NODE_TYPE_TX);
	}
	 
	printUSART2("\n\nwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww\n");
	printUSART2("w nRF24L01 Tx-Rx demo - TYPE[%d] ",node_type);
	printUSART2("\nwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww\n");
	
	initSYSTIM();
	initNRF24L01(node_type);
	
	if(node_type == (NRF24L01_NODE_TYPE_TX))
	{
		runMasterNodeSYS(&Filter);
	}
	else
	{
		runSlaveNodeSYS();
	}	
	
	return 0;
}


void runMasterNodeSYS(PDMFilter_InitStruct *filter)
{
	uint8_t k, i, nrf_data[NRF24L01_PIPE_LENGTH];
	
	for(k=0;k<(NRF24L01_PIPE_LENGTH);k++)
		nrf_data[k] = 0x00;
	
	while(1)
	{
		for(k_mic=0;k_mic<64;k_mic++)
		{
			while((SPI2->SR & 0x0001) == 0x0000); 							// wait until data receiving is completed
			while(SPI2->SR & 0x0080); 										// wait until SPI becomes idle
			buff[k_mic] = HTONS(SPI2->DR);
		}
				
		PDM_Filter_64_LSB((uint8_t *)buff, (uint16_t *)outdata, volume , filter);
		
		i = 0;
		k = 0;
		while(k<(NRF24L01_PIPE_LENGTH)){
			nrf_data[k] = ((outdata[i]&0xFF00) >> 8);
			nrf_data[k+1] = (outdata[i]&0x00FF);
			
			k+=2;
			i++;
		}

		txDataNRF24L01((uint8_t *)c_nrf_slave_addr, nrf_data);
				
		for(k=0;k<(NRF24L01_PIPE_LENGTH);k++)
			nrf_data[k] = 0x00;
	}
}

void runSlaveNodeSYS(void)
{
	uint8_t k, i, res;
	uint8_t nrf_data[NRF24L01_PIPE_LENGTH], b2[NRF24L01_PIPE_LENGTH];
		
	RCC->AHB1ENR |= RCC_AHB1ENR_GPIODEN;  								//  
    GPIOD->MODER |= 0x55000000;             							// 
    GPIOD->OTYPER |= 0x00000000;										// 
    GPIOD->OSPEEDR |= 0xFF000000; 										// 
    GPIOD->ODR &= ~0xF000;
    
    /* Buffering */
    
    uint16_t buffer[16];
    uint16_t cntb = 0;
    uint16_t cntb_max = 16;
    uint8_t dac_mode = 0;
    uint16_t imf=0;
    
    /* Buffering end */
    
    /* Moving average */    
    /* */
            	        
	while(1)
	{
		setTxAddrNRF24L01(c_nrf_master_addr);
		res = dataReadyNRF24L01();
		
		if(res == (NRF_DATA_READY))
		{
			rxDataNRF24L01(nrf_data);
			
			
			k=0;
		
			for(i=0;i<NRF24L01_PIPE_LENGTH/2;i++){				
				buffer[cntb] = ((nrf_data[k]) << 8)|nrf_data[k+1];
								
				cntb++;
				k+=2;
			}
						
			if(cntb >= cntb_max){								
				for(k=0;k<cntb_max;k++){
					if(!dac_mode){
						dac_data[n_mic] = buffer[k];								 
						dac_data[n_mic+1] = buffer[k];	
					} else {
						dac_data2[n_mic] = buffer[k];								 
						dac_data2[n_mic+1] = buffer[k];
					}	
					
					n_mic+=2;
				}
												
				cntb = 0;
				
				if(n_mic > DAC_BUFF_SIZE){
					n_mic = 0;
					
					if(!dac_mode){
						dac_mode = 1;
					} else {
						dac_mode = 0;
					}
				}
			}
		}
	}
}
