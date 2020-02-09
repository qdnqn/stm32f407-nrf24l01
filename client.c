#include "stm32f4xx.h"
#include "nrf24l01.h"
#include "client.h"
#include "rand.h"
#include "delay.h"

char ADDR_SERV[6] = "CHSRV"; 											
char ADDR_BUS[6] = "CHBUS";			
char MyAddr[6] = "";
char OtherAddr[6] = "";

uint8_t AntenaState;
uint8_t RxData[NRF24L01_PIPE_LENGTH];
uint8_t TxData[NRF24L01_PIPE_LENGTH];

uint8_t RxCnt = 0;
uint8_t TxCnt = 0;
uint8_t statusOfCall = 0;
uint8_t pendingCalls = 0;

uint32_t tmpRand;
uint8_t code;
uint8_t client_code;

uint16_t delay;
uint8_t delay_factor = 1;
uint8_t attempts = 0;

uint8_t global_wait = 1;
uint8_t reservedGlobal = 0;
uint8_t alreadyHaveAddress = 0;

void appendRx(char tmp){
	RxData[RxCnt] = tmp;
	RxCnt++;
	
	if(RxCnt >= NRF24L01_PIPE_LENGTH){
		RxCnt = 0;
	}
}
void clearRx(){
	uint8_t i;
	
	for(i=0;i<NRF24L01_PIPE_LENGTH;i++){
		RxData[i] = 0;
	}
	
	RxCnt = 0;
}
void appendTx(char tmp){
	TxData[TxCnt] = tmp;
	TxCnt++;
	
	if(TxCnt >= NRF24L01_PIPE_LENGTH){
		TxCnt = 0;
	}
}
void clearTx(){
	uint8_t i;
	
	for(i=0;i<NRF24L01_PIPE_LENGTH;i++){
		TxData[i] = 0;
	}
	
	TxCnt = 0;
}

uint8_t generateCode(){
	uint8_t temp  = 0;
	
	while(temp < 100){
		tmpRand = genRIN();
		temp = tmpRand >> 24;
	}
	
	return temp;
};

void setClientCode(){
	client_code = generateCode();
}

uint8_t getServerCode(uint8_t *rx){
	return rx[0];
}
uint8_t getClientCode(uint8_t *rx){
	return rx[1];
}
uint8_t getResponseCode(uint8_t *rx){
	return rx[2];
}

char* getAddress(uint8_t *rx){
	static char addr[5];
	uint8_t i;
	
	for(i=3;i<8;i++){
		addr[i-3] = rx[i];
	}
	
	return addr;
}

void packetDataLight(uint8_t server_c, uint8_t client_c, uint8_t command){
	clearTx();
	
	appendTx(server_c);
	appendTx(client_c);
	appendTx(command);
}

void packetData(uint8_t server_c, uint8_t client_c, uint8_t command, char *addr){
	clearTx();
	
	appendTx(server_c);
	appendTx(client_c);
	appendTx(command);
	
	uint8_t i;
	for(i=0;i<5;i++){
		appendTx(addr[i]);
	}
}

void resetAttempts(){
	attempts = 0;
	delay_factor = 0;
}

uint8_t reserveBus(){
	uint8_t reserved = 0;
	uint8_t detect_forever = 0;
	
	setRxMode();
	
	while(1){
		packetDataLight(0, client_code, RESERVE);
		
		uint8_t k;
		
		for(k=0;k<32;k++){
			printUSART2("%d%c",k,TxData[k]);
		}
		
		printUSART2("\n");
		
		txDataNRF24L01((uint8_t *)ADDR_SERV, TxData);				
		startPujdo();
		
		while(global_wait){
			setTxAddrNRF24L01(ADDR_SERV);
			AntenaState = dataReadyNRF24L01();
			
			//printUSART2("Atena state: %d\n", AntenaState);
			
			if(AntenaState == (NRF_DATA_READY)){
				rxDataNRF24L01(RxData);
									
				if(client_code == getClientCode(RxData)){
					resetAttempts();
					
					if(getResponseCode(RxData) == CLIENT_CODE_USED){
						printUSART2("Client code already associated.\n");
						client_code = generateCode();
						break;
					} else if(getResponseCode(RxData)){
						reserved = 1;
						code = getServerCode(RxData);
					
						printUSART2("Bus is now yours.\n");
						break;
					}
				} else {
					printUSART2("Active client code changed on server.\n");
					break;
				}
			}
		}
		
		global_wait = 1;
		stopPujdo();
		
		if(reserved == 1){
			reservedGlobal = 1;
			return 1;
		} else {
			attempts++;
			delay_factor += attempts;
			delay = delay_factor * client_code;
			
			printUSART2("Attempt %d for reservation of bus failed.\n", attempts);
			printUSART2("Now delaying for %d [ms] before trying again.\n", delay);
			delay_ms(delay);
			printUSART2("Trying again.\n");
		}
	}
}

uint8_t freeBus(){
	uint8_t freed = 0;
	uint8_t detect_forever = 0;
	
	setRxMode();
	
	while(1 & reservedGlobal){
		packetDataLight(code, client_code, FREE_CHANNEL);
		txDataNRF24L01((uint8_t *)ADDR_SERV, TxData);				
		startPujdo();
		
		while(global_wait){
			setTxAddrNRF24L01(ADDR_SERV);
			AntenaState = dataReadyNRF24L01();
						
			if(AntenaState == (NRF_DATA_READY)){
				rxDataNRF24L01(RxData);
									
				if(client_code == getClientCode(RxData)){
					resetAttempts();
					
					if(getResponseCode(RxData) == FREED){
						printUSART2("Channel is now free.\n");
						reservedGlobal = 0;
						freed = 1;
						break;
					} else if(getResponseCode(RxData)){
						printUSART2("Channel is not free. You need to try again.\n");
						break;
					}
				} else {
					printUSART2("Active client code changed on server.\n");
					break;
				}
			}
		}
		
		global_wait = 1;
		stopPujdo();
		
		if(freed == 1){
			return 1;
		} else {
			attempts++;
			delay_factor += attempts;
			delay = delay_factor * client_code;
			
			if(attempts > 10){
				return 5;
			}
			
			printUSART2("Attempt %d for free of bus failed.\n", attempts);
			printUSART2("Now delaying for %d [ms] before trying again.\n", delay);
			delay_ms(delay);
			printUSART2("Trying again.\n");
		}
	}
}

uint8_t getAddressFromServer(){
	uint8_t gotAddress = 0;
	uint8_t detect_forever = 0;
	
	setRxMode();
	
	while(1 & reservedGlobal){
		packetDataLight(code, client_code, ADDRESS);
		txDataNRF24L01((uint8_t *)ADDR_SERV, TxData);				
		startPujdo();
		
		while(global_wait){
			setTxAddrNRF24L01(ADDR_SERV);
			AntenaState = dataReadyNRF24L01();
						
			if(AntenaState == (NRF_DATA_READY)){
				rxDataNRF24L01(RxData);
									
				if(client_code == getClientCode(RxData)){
					resetAttempts();
					
					if(getResponseCode(RxData) == FETCHED_ADDRES){
						uint8_t i;
						gotAddress = 1;
						
						char *t = getAddress(RxData);
						printUSART2("My address: ");
						
						for(i=0;i<5;i++){
							MyAddr[i] = t[i];
							printUSART2("%c", MyAddr[i]);
						}
						
						printUSART2("\n");
						
						break;
					} else if(getResponseCode(RxData)){
						printUSART2("You didnt get address. You need to try again.\n");
						break;
					}
				} else {
					printUSART2("Active client code changed on server.\n");
					break;
				}
			}
		}
		
		global_wait = 1;
		stopPujdo();
		
		if(gotAddress == 1){
			alreadyHaveAddress = 1;
			return 1;
		} else {
			attempts++;
			delay_factor += attempts;
			delay = delay_factor * client_code;
			
			if(attempts > 10){
				return 5;
			}
			
			printUSART2("Attempt %d for getting address failed.\n", attempts);
			printUSART2("Now delaying for %d [ms] before trying again.\n", delay);
			delay_ms(delay);
			printUSART2("Trying again.\n");
		}
	}
}


uint8_t getCallsFromServer(){
	uint8_t haveCall = 0;
	uint8_t detect_forever = 0;
	
	setRxMode();
	
	while(1 & reservedGlobal){
		packetDataLight(code, client_code, CHECK_CALLS);
		txDataNRF24L01((uint8_t *)ADDR_SERV, TxData);				
		startPujdo();
		
		while(global_wait){
			setTxAddrNRF24L01(ADDR_SERV);
			AntenaState = dataReadyNRF24L01();
						
			if(AntenaState == (NRF_DATA_READY)){
				rxDataNRF24L01(RxData);
									
				if(client_code == getClientCode(RxData)){
					resetAttempts();
					
					if(getResponseCode(RxData) == HAVE_CALL){
						uint8_t i;
						haveCall = 1;
						
						char *t = getAddress(RxData);
						printUSART2("Address calling: ");
						
						for(i=0;i<5;i++){
							OtherAddr[i] = t[i];
							printUSART2("%c", OtherAddr[i]);
						}
						
						printUSART2("\n");
						
						break;
					} else {
						haveCall = 2;
						
						printUSART2("You have no calls.\n");
						break;
					}
				} else {
					printUSART2("Active client code changed on server.\n");
					break;
				}
			}
		}
		
		global_wait = 1;
		stopPujdo();
		
		if(haveCall == 1 || haveCall == 2){
			return haveCall;
		} else {
			attempts++;
			delay_factor += attempts;
			delay = delay_factor * client_code;
			
			if(attempts > 10){
				return 5;
			}
			
			printUSART2("Attempt %d for getting status of calls failed.\n", attempts);
			printUSART2("Now delaying for %d [ms] before trying again.\n", delay);
			delay_ms(delay);
			printUSART2("Trying again.\n");
		}
	}
}


uint8_t callAnotherClient(char *addr){
	uint8_t callSuccess = 0;
	uint8_t detect_forever = 0;
	
	setRxMode();
	
	while(1 & reservedGlobal){
		packetData(code, client_code, CALL, addr);
		txDataNRF24L01((uint8_t *)ADDR_SERV, TxData);				
		startPujdo();
		
		while(global_wait){
			setTxAddrNRF24L01(ADDR_SERV);
			AntenaState = dataReadyNRF24L01();
						
			if(AntenaState == (NRF_DATA_READY)){
				rxDataNRF24L01(RxData);
									
				if(client_code == getClientCode(RxData)){
					resetAttempts();
					
					if(getResponseCode(RxData) == HAVE_CALL){
						uint8_t i;
						haveCall = 1;
						
						char *t = getAddress(RxData);
						printUSART2("Address calling: ");
						
						for(i=0;i<5;i++){
							OtherAddr[i] = t[i];
							printUSART2("%c", OtherAddr[i]);
						}
						
						printUSART2("\n");
						
						break;
					} else {
						haveCall = 2;
						
						printUSART2("You have no calls.\n");
						break;
					}
				} else {
					printUSART2("Active client code changed on server.\n");
					break;
				}
			}
		}
		
		global_wait = 1;
		stopPujdo();
		
		if(haveCall == 1 || haveCall == 2){
			return haveCall;
		} else {
			attempts++;
			delay_factor += attempts;
			delay = delay_factor * client_code;
			
			if(attempts > 10){
				return 5;
			}
			
			printUSART2("Attempt %d for getting status of calls failed.\n", attempts);
			printUSART2("Now delaying for %d [ms] before trying again.\n", delay);
			delay_ms(delay);
			printUSART2("Trying again.\n");
		}
	}
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

void TIM5_IRQHandler(void){
	if(TIM5->SR & 0x0001){
		global_wait = 0;
		TIM5->SR = 0x0000;
		TIM5->CNT = 0x0000;
		TIM5->CR1 &= ~TIM_CR1_CEN;
	}
}
