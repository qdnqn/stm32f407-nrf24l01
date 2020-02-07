#include "stm32f4xx.h"
#include "usart.h"
#include "delay.h"
#include "nrf24l01.h"
#include "server.h"
#include "control_server.h"
#include "led.h"

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
            	        
	while(1)															// vrti sve dok se ne unese odgovarajuća antena(0-5)
	{
		setTxAddrNRF24L01(ADDR_BUS);									// adresa sa koje sluša
		AntenaState = dataReadyNRF24L01();
				
		if(bus_flag == 0) {
			bus_flag = 1;
			
			if(AntenaState == (NRF_DATA_READY))
			{
				rxDataNRF24L01(RxData);								    // primljeni podatak je upisan u nrf_data
				commands[0] = RxData[0];
				printUSART2("%d \n", commands[0]);
				if(commands[0] == (CONNECT)) {//connect
					if(cnt_addr < 5) {
					for(i=0;i<5;i++) {
						appendTx((uint8_t)(USED_ADDR[cnt_addr][i]));
					}	
					delay_ms(1000);	  
					txDataNRF24L01((uint8_t*)ADDR_BUS, TxData);
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
					txDataNRF24L01((uint8_t*)ADDR_BUS, TxData);
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
