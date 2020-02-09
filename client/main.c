#include "stm32f4xx.h"
#include "usart.h"
#include "delay.h"
#include "mp45dt02.h"
#include "cs43l22.h"
#include "pdm_filter.h"
#include "nrf24l01.h"
#include "control.h"
#include "led.h"
#include "client.h"

#define DAC_BUFF_SIZE 128

void pujdo(void);
void feedPujdo(void);
void startPujdo();
void stopPujdo();

/*
 * Setting up neeeded variables for RADIO_MODE -------------------------
 */
PDMFilter_InitStruct Filter;
uint32_t utmp32 = 0, k_mic = 0, n_mic = 0;
uint16_t buff[64], cnt = 0;

uint16_t outdata[16]; 
uint16_t volume = 20, utmp16;
uint16_t dac_data[DAC_BUFF_SIZE], dac_data2[DAC_BUFF_SIZE];
uint16_t fs = 16000;
uint32_t pid = 0;
/*
 * ---------------------------------------------------------------------
 */

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
	initCS43L22(3, 8000, dac_data, dac_data2, DAC_BUFF_SIZE);
	
	SPI2->I2SCFGR |= SPI_I2SCFGR_I2SE; 
	
	/* Enable PA0 input */
	RCC->AHB1ENR |= RCC_AHB1ENR_GPIOAEN;
	GPIOA->MODER &= ~0x00000003; 
		
	RCC->AHB1ENR |= RCC_AHB1ENR_GPIOCEN;
	GPIOC->MODER &= ~(GPIO_MODER_MODER6);  
	GPIOC->PUPDR |= (GPIO_PUPDR_PUPDR6_0);	
	
	delay_ms(10);
{
	//if((GPIOC->IDR & 0x00000040) == 0x00000000)
	//{// init as Tx node
		//MyAddr[0] = 'e';
		//MyAddr[1] = 'd';
		//MyAddr[2] = 'm';
		//MyAddr[3] = 'i';
		//MyAddr[4] = 'r';
		
		//OtherAddr[0] = 'a';
		//OtherAddr[1] = 'd';
		//OtherAddr[2] = 'n';
		//OtherAddr[3] = 'a';
		//OtherAddr[4] = 'n';
	//} else {
		//MyAddr[0] = 'a';
		//MyAddr[1] = 'd';
		//MyAddr[2] = 'n';
		//MyAddr[3] = 'a';
		//MyAddr[4] = 'n';
		
		//OtherAddr[0] = 'e';
		//OtherAddr[1] = 'd';
		//OtherAddr[2] = 'm';
		//OtherAddr[3] = 'i';
		//OtherAddr[4] = 'r';
		
		//talkingOrListening = 1;
	//}
	
	//state = RADIO_MODE;
	

	/* End of testing RADIO_MODE */
}
	 
	printUSART2("\n\nwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww\n");
	printUSART2("w nRF24L01 Tx-Rx - Client\n");
	printUSART2("\nwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww\n");
	
	initSYSTIM();
	
	/* For production uncomment this:
	 */ 
	initNRF24L01(ADDR_BUS);
	
	/* For testing RADIO_MODE uncomment this:
	 */
	
	//initNRF24L01(MyAddr);
	
	
	uint8_t i = 0;
	pujdo();
	
	setClientCode();
	
	while(1){
		if(state == BOOT){
			startBlink("red");
			
			if(reserveBus() == 1){
				stopBlink("red");
				ledTurnOn("red");
				
				printUSART2("Bus reserved hoooray!\n");
				
				if(alreadyHaveAddress == 1){
					state = FREE_CHANNEL_C;
				} else {
					state = ADDRESS_CONTROL;
				}
			}		
		} else if(state == ADDRESS_CONTROL){
			if(getAddressFromServer(client_code) == 1){
				printUSART2("Got address reserved hoooray!\n");
				printUSART2("Trying to print address as string: %s \n", MyAddr);
								
				if(freeBus() == 1){
					printUSART2("Bus is free hoooray!\n");
					state = STANDBY;
				}
			} 
		} else if(state == STANDBY){
			if((GPIOA->IDR & 0x0001) == 0x0001){
				state = CHOOSE_OPTION;
				break;
			}
			
			if(reserveBus() == 1){
				uint8_t calls = getCallsFromServer(client_code);
				
				if(calls == HAVE_CALL){
					printUSART2("You have call! \n");
				} else if(calls == NO_CALL){
					printUSART2("No calls! \n");
				} else {
					//
				}
				
				freeBus();
			}
			
			delay_ms(5000);
		} else if(state == CHOOSE_OPTION){
			printUSART2("Enter address you want to call: ");
			uint8_t cnt = getOneLineUSART2();
			
			if(oneLine[0] == (uint8_t)'q'){
				state = STANDBY;
				break;
			}
			
			if(reserveBus() == 1){
				if(callAnotherClient(oneLine) == 1){
					printUSART2("User is available for call. Switching to radio mode.\n");
					state = RADIO_MODE;
				} else {
					printUSART2("User is busy. Switching back to standy mode.\n");
					state = STANDBY;
				}
				
				freeBus();
			}
		} else {
			if(freeBus() == 1){
				printUSART2("Bus is free hoooray!\n");
				delay_ms(5000);
				
				state = BOOT;
			}
		}
	}
		
	return 0;
}

void pujdo(void)
{
	RCC->APB1ENR |= RCC_APB1ENR_TIM5EN; 								// 
	TIM5->PSC = 0x20D0-0x0001;											// 
																		// 
	TIM5->ARR = 0x0FFF;													// 
	TIM5->CR1 = 0x0084;													// 
																		//
	TIM5->CR2 = 0x0000;
	TIM5->CNT = 0x0000;													// 
	TIM5->EGR |= TIM_EGR_UG;											//
	TIM5->DIER = 0x0001;												// enable 
	
	NVIC_SetPriority(TIM5_IRQn, 0);
	NVIC_EnableIRQ(TIM5_IRQn);											// 	
}

