#include "stm32f4xx.h"
#include "usart.h"
#include "delay.h"
#include "nrf24l01.h"
#include "server.h"
#include "control_server.h"
#include "led.h"
#include "rand.h"

int main(void)
{	
	//uint8_t cnt_addr = 0;
	//uint8_t k, i, res;
	//uint8_t nrf_data[32];
	//uint8_t bus_flag = 0;
	//uint8_t z;
	//uint8_t commands[2];	
	
	initBlink();
	initUSART2(USART2_BAUDRATE_921600);
	initNRF24L01(ADDR_SRV);
    startBlink("red");
    
    printUSART2("\n\nwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww\n");
	printUSART2("w nRF24L01 Tx-Rx - Server\n");
	printUSART2("\nwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww\n");

    
    uint32_t tmp = genRIN();
    uint8_t code = tmp>>24;
	uint8_t reserved = 0;
            	        
	while(1)															// vrti sve dok se ne unese odgovarajuća antena(0-5)
	{
		setTxAddrNRF24L01(ADDR_BUS);									// adresa sa koje sluša
		AntenaState = dataReadyNRF24L01();
				
		if(AntenaState == (NRF_DATA_READY))
		{
			bus_flag = 1;
			rxDataNRF24L01(RxData);								    // primljeni podatak je upisan u nrf_data
			commands[0] = RxData[0];
			commands[1] = RxData[1];
			commands[2] = RxData[2];
			
			printUSART2("%d - %d - %d\n", commands[0], commands[1], commands[2]);
			
			if(commands[0] == RESERVE){
				if(!reserved){
					reserved = 1;
					printUSART2("CODE: %d\n", code);
					appendTx(code);
					txDataNRF24L01((uint8_t*)ADDR_BUS, TxData);
					clearTx();
					clearRx();
				}
			} else if(commands[1] == (CONNECT)) {//connect
				printUSART2("Trying connect with code %d\n", commands[0]);
				printUSART2("Server code is: %d", code);
				
				if(code == commands[0]){
					if(cnt_addr < 5) {
					for(i=0;i<5;i++) {
						appendTx((uint8_t)(USED_ADDR[cnt_addr][i]));
					}	
					delay_ms(1000);	  
					txDataNRF24L01((uint8_t*)ADDR_BUS, TxData);
					delay_ms(500);
					bus_flag = 0;
					clearTx();
					cnt_addr++;
					commands[0] = (CALL);
					}
					else {
						appendTx('e');
						appendTx('r');
						appendTx('r');
						appendTx('o');
						appendTx('r');
						txDataNRF24L01((uint8_t*)ADDR_BUS, TxData);
						clearTx();
						commands[0] = (NO_MORE_ADDRESS);
					}
					
					cnt_addr++;
					commands[1] = (CALL);
				}
			}
			else if(commands[1] == (FREE_CHANNEL)) {//free_chanel
				if(code == commands[0]){
					bus_flag = 0;
					printUSART2("Chanel BUS - SERVER is free!");
					clearRx();
				}
			}
			else if(commands[1] == (HANG_UP)) {//hangup
				
			}
			else {
				
			} 	
		  }
		}
	return 0;
}
