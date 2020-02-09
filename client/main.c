#include "stm32f4xx.h"
#include "usart.h"
#include "delay.h"
#include "mp45dt02.h"
#include "cs43l22.h"
#include "pdm_filter.h"
#include "nrf24l01.h"
#include "fir.h"
#include "fft.h"



char ADDR_SERV[5] = "CHSRV"; 											// Adresa servera
char ADDR_BUS[5] = "CHBUS";												// Adresa busa

void connect();															//
void listen(void);														// umjesto RunSlaveNode

uint8_t res;
uint8_t nrf2[NRF24L01_PIPE_LENGTH];
uint8_t nrf_data[NRF24L01_PIPE_LENGTH];
char MyAddr[5] = "";

///----Funkcije za kontrolu-----///
void startBlink(char color);
char getMyAddress(void);
char enterAddress(void);
char numOfRX(void);
char listenToConnectedDevices(void);
///----Kraj funkcija za kontrolu-----///

///----Varijable za kontrolu----///
#define BOOT			    0
#define CHOOSE_OPTION		1
#define WAIT_FOR_CALL		2
#define CALL         		3
#define ADDR_OK				5
#define FETCHED_OK			6
#define GET_ADDR_OK 		7
volatile uint8_t ControlState = (BOOT);
char server_addr[5];
///----Kraj kontrole

#define DAC_BUFF_SIZE 128

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
	
	uint8_t i = 0;
	///----Dio za kontrolu toka----///
	switch(ControlState) {
		case(BOOT):
		{
			startBlink('r');
			nrf2[0] = 'a';
			txDataNRF24L01((uint8_t *)ADDR_SERV, nrf2);
			
			while(1)
			{
			setTxAddrNRF24L01(ADDR_BUS);
			res = dataReadyNRF24L01();
			
				if(res == (NRF_DATA_READY))
				{
				    rxDataNRF24L01(nrf_data);
					for(i=0;i<5;i++) {	
						MyAddr[i] = nrf_data[i];
					}
					printUSART2("My address from server: %s", MyAddr);
					delay_ms(2000);	
				}
			}	
		}	
	}
	
	
	///----Kraj kontrole toka-----///
	
	//if(node_type == (NRF24L01_NODE_TYPE_TX))							// ako je antena TX
	//{
		//runMasterNodeSYS(&Filter);
	//}
	//else
	//{
		//runSlaveNodeSYS();												// antena RX
	//}	
	
	return 0;
}

void runMasterNodeSYS1(uint8_t nrf_data)
{
	//potrebno resetovati antenu, i ponovo je init ali u TX mode//
	//implementirati funkciju za deinit antene//
	uint8_t * addr = (uint8_t *) nrf_data;
	uint8_t k, i;
	while(1)
	{
		txDataNRF24L01((uint8_t *)c_nrf_slave_addr, addr);
		//printUSART2("\nU masterNode: %c", nrf_data);
		//for(k=0;k<(NRF24L01_PIPE_LENGTH);k++)
			//nrf_data[k] = 0x00;
	}
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


void startBlink(char color) {
	if(color == 'r') {  								
		RCC->AHB1ENR |= RCC_AHB1ENR_GPIODEN;  								//
		GPIOD->MODER |= 0xAA000000;             							//
		GPIOD->OTYPER |= 0x00000000; 										//
		GPIOD->AFR[1] |= 0x22220000;
		
		RCC->APB1ENR |= RCC_APB1ENR_TIM4EN; 							
		TIM4->PSC = 2000 - 1;											//T = 0.2s, f = 5Hz												 											
		TIM4->ARR = 8400;
		
		TIM4->CCR2 = 0x0000;											
					
		TIM4->CCMR1 |= (TIM_CCMR1_OC2PE)|(TIM_CCMR1_OC2M_1)|(TIM_CCMR1_OC2M_0);					
																						
		TIM4->CCER &= ~((TIM_CCER_CC1P)|(TIM_CCER_CC2P));
		TIM4->CR1 |= (TIM_CR1_ARPE)|(TIM_CR1_URS);
		TIM4->EGR |= TIM_EGR_UG;											
		TIM4->CCER |= (TIM_CCER_CC1E)|(TIM_CCER_CC2E);										
		TIM4->CR1 |= TIM_CR1_CEN;											
	}
}

char numOfRX(void) {
	uint8_t nrf_data;
	nrf_data = getcharUSART2();
	putcharUSART2(nrf_data);
	runMasterNodeSYS1(nrf_data);
	return ADDR_OK;
}

//char enterAddress(void) {
	//uint8_t i = 0;
	//uint8_t rbr = 0;
	//char server_addr[5];												//Adrese su formata 0x0A
	//while(i < 5) {
		//server_addr[i] = getcharUSART2();
		//if(server_addr[i] == 13) {
			//break;
		//}
		//printUSART2("%c", server_addr[i]);
		//i++;
	//}
	
	//if(server_addr[0] == 48 && server_addr[1] == 120 && server_addr[4] == 13) {// x13 je ENTER, treba staviti završni karakter za adresu, napraviti konvenciju
		//uint8_t k = 0;
		//printUSART2("\n\t- Adresa prihvacena!\n");
		/////Napisati sve adrese od svih TX antena, i provjeriti koja od tih adresa odgovara unesenoj!///
		//if(server_addr[3] == TX_P0[3]) {								// konvencija, samo se LSB razlikuje u svakoj adresi
			//rbr = 0;							
		//}
		//else if(server_addr[3] == TX_P1[3]) {
			//rbr = 1;
		//}
		//else if(server_addr[3] == TX_P2[3]) {
			//rbr = 2;
		//}
		//else if(server_addr[3] == TX_P3[3]) {
			//rbr = 3;
		//}
		//printUSART2("\nOdabrana je adresa TX_P%d: ", rbr);
		//while(k<5) {
			//printUSART2("%c",server_addr[k]);
			//k++;
		//}
		//printUSART2("\n");
		//return ADDR_OK;
	//}
	//else
		//printUSART2("\n\t- Neispravna adresa!\nEnter your address: ");
	
	
//}

char getMyAddress(void) {
	
}

char listenToConnectedDevices(void) {
	
		
}
