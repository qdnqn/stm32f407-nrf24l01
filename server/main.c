#include "stm32f4xx.h"
#include "usart.h"
#include "delay.h"
#include "nrf24l01.h"
#include "server.h"
#include "control_server.h"
#include "led.h"

///----Simboli za kontrolu----///
#define CONNECT				97
#define FREE_CHANNEL		98
#define CONFIRM				99
#define CALL				100
#define HANG_UP				101

char ADDR_SRV[6] = "CHSRV"; 											// Adresa servera
char ADDR_BUS[6] = "CHBUS";												// Adresa busa
												
char CALLS[5][5] = {"0x00", "0x00", "0x00", "0x00", "0x00"};	
char USED_ADDR[5][5] = {"alpha", "charl", "bravo", "delta", "echoo"};		

char ADDR_TX_P0[5] = "alpha";													
char ADDR_TX_P1[5] = "charl";
char ADDR_TX_P2[5] = "bravo";
char ADDR_TX_P3[5] = "delta";
char ADDR_TX_P4[5] = "echoo";

int main(void)
{	
	uint8_t cnt_addr = 0;
	uint8_t k, i, res;
	uint8_t nrf_data[32];
	uint8_t bus_flag = 0;
	uint8_t z;
	uint8_t commands[2];	
	
	initBlink();
	initUSART2(USART2_BAUDRATE_921600);
	initNRF24L01(ADDR_SRV);
    startBlink("red");
            	        
    setRxAddrNRF24L01((uint8_t *)ADDR_SRV, NRF24L01_RX_ADDR_P1);		// adresa servera
            	        
	while(1)															// vrti sve dok se ne unese odgovarajuća antena(0-5)
	{
		setTxAddrNRF24L01(ADDR_BUS);									// adresa sa koje sluša
		res = dataReadyNRF24L01();
				
		if(bus_flag == 0) {
			bus_flag = 1;
			
			if(res == (NRF_DATA_READY))
			{
				rxDataNRF24L01(nrf_data);								// primljeni podatak je upisan u nrf_data
				commands[0] = nrf_data[0];
				printUSART2("%d \n", commands[0]);
				if(commands[0] == (CONNECT)) {//connect
					printUSART2("COMMAND A EXECUTION \n");
					uint8_t nrf2[NRF24L01_PIPE_LENGTH];
					for(i=0;i<32;i++) {
						if(i < 5) 
							nrf2[i] = (uint8_t)(USED_ADDR[cnt_addr][i]);
						else
							nrf2[i] = 1;
					}
					
					delay_ms(2000);
					
					txDataNRF24L01((uint8_t*)ADDR_BUS, nrf2);
					bus_flag = 0;
					cnt_addr++;
					commands[0] = (CALL);
					}
					else if(commands[0] == (CALL)) {//call
						
					}
					else if(commands[0] == (HANG_UP)) {//hangup
					
					}
					else {
						
					} 	
				}
			}
		}
	return 0;
}
