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

PDMFilter_InitStruct Filter;

void runMasterNodeSYS(PDMFilter_InitStruct *);
void runSlaveNodeSYS(void);
void runMasterNodeSYS1(uint8_t nrf_data);

PDMFilter_InitStruct Filter;
uint32_t utmp32 = 0, k_mic = 0, n_mic = 0;
uint16_t buff[64], cnt = 0;

uint16_t outdata[16]; 
uint16_t volume = 20, utmp16;
uint16_t dac_data[DAC_BUFF_SIZE], dac_data2[DAC_BUFF_SIZE];
uint16_t fs = 16000;
uint32_t pid = 0;

/* 0 -> Keep alive
 * 1 -> Check hanged up
 */
uint8_t TIM5WatchDogMode = 0; 

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
	
	/* Enable PA0 input & activate interupt */
	RCC->AHB1ENR |= RCC_AHB1ENR_GPIOAEN;
	GPIOA->MODER &= ~0x00000003; 
	
	/*RCC->APB2ENR |= RCC_APB2ENR_SYSCFGEN;
	NVIC_EnableIRQ(EXTI0_IRQn);
	SYSCFG->EXTICR[0] = SYSCFG_EXTICR1_EXTI0_PA;
	EXTI->IMR = EXTI_IMR_MR0;											// enable interrupt on EXTI_Line0
	EXTI->EMR &= ~EXTI_EMR_MR0;											// disable event on EXTI_Line0
	EXTI->RTSR = EXTI_RTSR_TR0;	
	EXTI->FTSR = 0x00000000;	*/
	/* */
		
	
	/* 
	 * Uncomment this if you want to test RADIO_MODE instantly
	 */	
	
	RCC->AHB1ENR |= RCC_AHB1ENR_GPIOCEN;
	GPIOC->MODER &= ~(GPIO_MODER_MODER6);  
	GPIOC->PUPDR |= (GPIO_PUPDR_PUPDR6_0);	
	
	delay_ms(10);
	if((GPIOC->IDR & 0x00000040) == 0x00000000)
	{// init as Tx node
		MyAddr[0] = 'e';
		MyAddr[1] = 'd';
		MyAddr[2] = 'm';
		MyAddr[3] = 'i';
		MyAddr[4] = 'r';
		
		OtherAddr[0] = 'a';
		OtherAddr[1] = 'd';
		OtherAddr[2] = 'n';
		OtherAddr[3] = 'a';
		OtherAddr[4] = 'n';
	} else {
		MyAddr[0] = 'a';
		MyAddr[1] = 'd';
		MyAddr[2] = 'n';
		MyAddr[3] = 'a';
		MyAddr[4] = 'n';
		
		OtherAddr[0] = 'e';
		OtherAddr[1] = 'd';
		OtherAddr[2] = 'm';
		OtherAddr[3] = 'i';
		OtherAddr[4] = 'r';
		
		talkingOrListening = 1;
	}
	
	state = RADIO_MODE;
	

	/* End of testing RADIO_MODE */

	delay_ms(10);
	 
	printUSART2("\n\nwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww\n");
	printUSART2("w nRF24L01 Tx-Rx - Client\n");
	printUSART2("\nwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww\n");
	
	initSYSTIM();
	initSYSTIMER();
	
	/* For production uncomment this:
	 */ 
	//initNRF24L01(ADDR_BUS);
	
	/* For testing RADIO_MODE uncomment this:
	 */
	
	initNRF24L01(MyAddr);
	
	
	uint8_t i = 0;
	pujdo();
	
	while(1){
		
	if(state == BOOT){
		ledTurnOn("red");
		appendTx(RESERVE);
		txDataNRF24L01((uint8_t *)ADDR_SERV, TxData);				
		clearTx();
		setRxMode();
		
		while(1)
		{
			setTxAddrNRF24L01(ADDR_SERV);
			AntenaState = dataReadyNRF24L01();
							
			if(AntenaState == (NRF_DATA_READY))
			{
				rxDataNRF24L01(RxData);
				code = RxData[0];
				printUSART2("CODE: %d \n", code);
				state = ADDRESS;
				break;
			} 
		}	
	} else if(state == ADDRESS){
		ledTurnOn("green");
		
		printUSART2("Trying to connect!\n");
		
		clearTx();
		appendTx(code);
		appendTx(CONNECT);
		txDataNRF24L01((uint8_t *)ADDR_SERV, TxData);				
		clearTx();
		setRxMode();
		
		printUSART2("Trying to recieve addres from server!\n");
				
		while(1)
		{
			setTxAddrNRF24L01(ADDR_SERV);
			AntenaState = dataReadyNRF24L01();
							
			if(AntenaState == (NRF_DATA_READY))
			{
								
				rxDataNRF24L01(RxData);
				
				for(i=0;i<5;i++) {	
					MyAddr[i] = RxData[i];
				}
				
				printUSART2("My address from server: %s\n", MyAddr);
				delay_ms(1000);
				state = STANDBY;	
				
				appendTx(code);
				appendTx(FREE_CHANNEL);
				txDataNRF24L01((uint8_t *)ADDR_SERV, TxData);				
				clearTx();
				
				break;
			}
			
		}	
	} else if(state == STANDBY){
		printUSART2("CHECKING FOR CALLS...\n");
		appendTx(RESERVE);
		txDataNRF24L01((uint8_t *)ADDR_SERV, TxData);				
		clearTx();
		setRxMode();
		
		while(1)
		{
			setTxAddrNRF24L01(ADDR_SERV);
			AntenaState = dataReadyNRF24L01();
							
			if(AntenaState == (NRF_DATA_READY))
			{
				rxDataNRF24L01(RxData);
				code = RxData[0];
				printUSART2("CODE: %d \n", code);
				break;
			} 
		}
		
		appendTx(code);
		appendTx(CHECK_CALLS);
		appendTx(MyAddr[0]);
				
		txDataNRF24L01((uint8_t *)ADDR_SERV, TxData);				
		clearTx();
		setRxMode();
		
		while(1)
		{
			setTxAddrNRF24L01(ADDR_SERV);
			AntenaState = dataReadyNRF24L01();
							
			if(AntenaState == (NRF_DATA_READY))
			{
				rxDataNRF24L01(RxData);
				pendingCalls = RxData[0];
				break;
			} 
		}	
		
		if(pendingCalls == HAVE_CALL){
			state = RADIO_MODE;
			
			for(i=1;i<6;i++){
				OtherAddr[i-1] = RxData[i];
			}
		} else {
			delay_ms(2500);
		}
		
		state = FREE_CHANNEL_C;
	} else if(state == CHOOSE_OPTION){	
		TIM5WatchDogMode = 0;
		startPujdo();
								
		while(1){
			printUSART2("Enter address: ");
			uint8_t addr = getcharUSART2();
			clearTx();
			appendTx(code);
			appendTx(CALL);
			appendTx(MyAddr[0]);
			appendTx(addr);
			txDataNRF24L01((uint8_t *)ADDR_SERV, TxData);				
			clearTx();
			stopPujdo();
			
			setRxMode();
			
			while(1)
			{
				setTxAddrNRF24L01(ADDR_SERV);
				AntenaState = dataReadyNRF24L01();
								
				if(AntenaState == (NRF_DATA_READY))
				{
					rxDataNRF24L01(RxData);
					statusOfCall = RxData[0];
					
					for(i=1;i<6;i++) {	
						OtherAddr[i] = RxData[i];
					}
					
					printUSART2("Response from server ---->\n");
					
					if(statusOfCall == CAN_CALL){
						printUSART2("CAN CALLLLLL HOORAY %s !\n", OtherAddr);
						clearTx();
						appendTx(code);
						appendTx(FREE_CHANNEL);
						txDataNRF24L01((uint8_t *)ADDR_SERV, TxData);
						clearTx();
					} else {
						printUSART2("No call for you.\n");
					}
					
					break;
				} 
			}
			
			if(statusOfCall == CAN_CALL){
				state = RADIO_MODE;
			} else {
				state = STANDBY;
			}
			
			break;
		}
	} else if(state == FREE_CHANNEL_C){
		clearTx();
		appendTx(code);
		appendTx(FREE_CHANNEL);
		txDataNRF24L01((uint8_t *)ADDR_SERV, TxData);				
		clearTx();
		state = STANDBY;
	} else if(state == RADIO_MODE){		
		setRxAddrNRF24L01((uint8_t *)MyAddr,NRF24L01_RX_ADDR_P1);
		
		uint8_t k = 0, i = 0;
		uint16_t buffer[16];
		uint16_t cntb = 0;
		uint16_t cntb_max = 16;
		uint8_t dac_mode = 0;
		uint16_t imf=0;
		
		setRxMode();
		
		while(1){
			while((GPIOA->IDR & 0x0001) == 0x0001){
				n_mic = 0;
				for(k=0;k<64;k++){
					dac_data[n_mic] = 0;								 
					dac_data[n_mic+1] = 0;	
					
					n_mic+=2;
				}
				n_mic = 0;
				for(k=0;k<64;k++){
					dac_data2[n_mic] = 0;								 
					dac_data2[n_mic+1] = 0;	
					
					n_mic+=2;
				}
				n_mic = 0;
				
				for(k_mic=0;k_mic<64;k_mic++)
				{
					while((SPI2->SR & 0x0001) == 0x0000); 							// wait until data receiving is completed
					while(SPI2->SR & 0x0080); 										// wait until SPI becomes idle
					buff[k_mic] = HTONS(SPI2->DR);
				}
						
				PDM_Filter_64_LSB((uint8_t *)buff, (uint16_t *)outdata, volume , &Filter);
				
				i = 0;
				k = 0;
				while(k<(NRF24L01_PIPE_LENGTH)){
					appendTx( ((outdata[i]&0xFF00) >> 8) );
					appendTx ( (outdata[i]&0x00FF) );
					
					k+=2;
					i++;
				}

				txDataNRF24L01((uint8_t *)OtherAddr, TxData);
				clearTx();
			}
			
			setTxAddrNRF24L01(OtherAddr);
			AntenaState = dataReadyNRF24L01();
						
			if(AntenaState == (NRF_DATA_READY))
			{
				rxDataNRF24L01(RxData);
									
				k=0;
			
				for(i=0;i<NRF24L01_PIPE_LENGTH/2;i++){				
					buffer[cntb] = ((RxData[k]) << 8)|RxData[k+1];
									
					cntb++;
					k+=2;
				}
				
				if(buffer[0] == (uint8_t)'s' && buffer[1] == (uint8_t)'t' && buffer[2] == (uint8_t)'o' &&  buffer[3] == (uint8_t)'p'){
					state = STANDBY;
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
		
	} else if(state == HANG_UP_C){
		clearTx();
		appendTx('s');
		appendTx('t');
		appendTx('o');
		appendTx('p');
		txDataNRF24L01((uint8_t *)OtherAddr, TxData);
		clearTx();
		
		setRxAddrNRF24L01((uint8_t *)ADDR_BUS,NRF24L01_RX_ADDR_P1);
		printUSART2("CHECKING FOR CALLS...\n");
		appendTx(RESERVE);
		txDataNRF24L01((uint8_t *)ADDR_SERV, TxData);				
		clearTx();
		setRxMode();
		
		while(1)
		{
			setTxAddrNRF24L01(ADDR_SERV);
			AntenaState = dataReadyNRF24L01();
							
			if(AntenaState == (NRF_DATA_READY))
			{
				rxDataNRF24L01(RxData);
				code = RxData[0];
				printUSART2("CODE: %d \n", code);
				break;
			} 
		}
		
		appendTx(code);
		appendTx(HANG_UP);
		appendTx(MyAddr[0]);
		appendTx(OtherAddr[0]);
		txDataNRF24L01((uint8_t *)ADDR_SERV, TxData);
		clearTx();
		state = FREE_CHANNEL_C;
	} else {
		// MALFUNCTION -> INVALID STATE(THIS SHOULD NEVER HAPPEN)
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

void startPujdo(){
	TIM5->CR1 |= TIM_CR1_CEN;
} 

void stopPujdo(){
	TIM5->CR1 &= ~TIM_CR1_CEN;
	TIM5->SR = 0x0000;
}

void feedPujdo(void){
	TIM5->CNT = 0x0000;
}

void TIM5_IRQHandler(void)
{
	if(TIM5->SR & 0x0001)
	{
		TIM5->SR = 0x0000;
		TIM5->CNT = 0x0000;
	
		clearTx();
		appendTx(code);
		appendTx(KEEP_ALIVE);
		txDataNRF24L01((uint8_t *)ADDR_SERV, TxData);				
		clearTx();
	}
}
