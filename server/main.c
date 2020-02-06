#include "stm32f4xx.h"
#include "usart.h"
#include "delay.h"
#include "nrf24l01.h"

char ADDR_SERV[5] = "CHSRV"; 											// Adresa servera
char ADDR_BUS[5] = "CHRBUS";											// Adresa busa

void connect();															//
void listen(void);															// umjesto RunSlaveNode


///----Simboli-----///
#define TX_P0			0
#define TX_P1			1
#define TX_P2			2
#define TX_P3			3
#define TX_P4			4
///----Kraj simbola----///

///----Adrese TX uređaja----///
char * CALLS[5] = {"0x00", "0x00", "0x00", "0x00", "0x00"};	
char * USED_ADDR[5] = {"0x00", "0x00", "0x00", "0x00", "0x00"};		
uint8_t cnt_addr = 0;
//kad se inicijalizira poziv u CALLS mijenjati adresu i ko prima i ko šalje//

//potrebne funkcije
//connect() za klijenta, da dobije se adresa pločice koja se povezuje na server
//
char ADDR_TX_P0[5] = "alpha";													
char ADDR_TX_P1[5] = "charl";
char ADDR_TX_P2[5] = "bravo";
char ADDR_TX_P3[5] = "delta";
char ADDR_TX_P4[5] = "echoo";
///----Kraj TX adresa----///

///----Funkcije za kontrolu-----///
void startBlink(char color);

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
///----Kraj kontrole----///

void runMasterNodeSYS(uint8_t * nrf_data);
void runSlaveNodeSYS(void);

int main(void)
{	
	initUSART2(USART2_BAUDRATE_921600);
	
	printUSART2("\nwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww\n");
	printUSART2("w STM32F407 - CS43L22 Audio DAC MIC I2S demo");
	printUSART2("\nwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww\n");
	
	printUSART2("-> SYS: init completed\n");
	SPI2->I2SCFGR |= SPI_I2SCFGR_I2SE; 
	uint8_t node_type = (NRF24L01_NODE_TYPE_RX);

	delay_ms(10);
	//node_type = (NRF24L01_NODE_TYPE_TX);
	 
	printUSART2("\n\nwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww\n");
	printUSART2("w nRF24L01 Server - TYPE[%d] ",node_type);
	printUSART2("\nwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww\n");
	
	initSYSTIM();
	initNRF24L01(node_type);
	
	runSlaveNodeSYS();		     										// antena RX
	return 0;
}


void runMasterNodeSYS(uint8_t * nrf_data)
{
	//potrebno resetovati antenu, i ponovo je init ali u TX mode//
	//implementirati funkciju za deinit antene//
	
	
	uint8_t k, i;
	
	//while(1)
	//{
		txDataNRF24L01((uint8_t *)c_nrf_slave_addr, nrf_data);
		printUSART2("U masterNode: %c", nrf_data);
		for(k=0;k<(NRF24L01_PIPE_LENGTH);k++)
			nrf_data[k] = 0x00;
	//}
}

void runSlaveNodeSYS(void)
{
	uint8_t k, i, res;
	uint8_t nrf_data = 10;
		
	RCC->AHB1ENR |= RCC_AHB1ENR_GPIODEN;  								//  
    GPIOD->MODER |= 0x55000000;             							// 
    GPIOD->OTYPER |= 0x00000000;										// 
    GPIOD->OSPEEDR |= 0xFF000000; 										// 
    GPIOD->ODR &= ~0xF000;
            	        
	while(1)															// vrti sve dok se ne unese odgovarajuća antena(0-5)
	{
		setTxAddrNRF24L01(ADDR_BUS);
		res = dataReadyNRF24L01();
		
		if(bus_flag == 0) {
			bus_flag = 1;
			
			if(res == (NRF_DATA_READY))
			{
				rxDataNRF24L01(nrf_data);								// primljeni podatak je upisan u nrf_data
				printUSART2("U slave mode: %c", nrf_data);
				uint16_t z;
				uint8_t commands;
				for(z=0;z<2;z++) {
					commands[z] = (nrf_data[z])
				}							//comands[0] - komanda, commands[1] - adresa;
					if(commands[0] == 97) {//connect
						GPIOD->ODR |= GPIO_ODR_ODR_12;
						runMasterNodeSYS(ADDR_TX[0]);
						if()
					}
					else if(commands[0] == 98) {//call
						GPIOD->ODR |= GPIO_ODR_ODR_13;
						runMasterNodeSYS(ADDR_TX[1]);
					}
					else if(commands[0] == 99) {//hangup
						GPIOD->ODR |= GPIO_ODR_ODR_14;
						runMasterNodeSYS(ADDR_TX[2]);
					else 
						return;
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
