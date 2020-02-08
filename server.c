#include "server.h"

char ADDR_SRV[6] = "CHSRV"; 											// Adresa servera
char ADDR_BUS[6] = "CHBUS";												// Adresa busa											
uint8_t CALLING[5] = {0, 0, 0, 0, 0};
uint8_t CALLERS[5] = {0, 0, 0, 0, 0};	
char USED_ADDR[5][5] = {"alpha", "bravo", "charl", "delta", "echoo"};		
char ADDR_TX_P0[5] = "alpha";													
char ADDR_TX_P1[5] = "charl";
char ADDR_TX_P2[5] = "bravo";
char ADDR_TX_P3[5] = "delta";
char ADDR_TX_P4[5] = "echoo";

uint8_t i;
uint8_t cnt_addr = 0;
uint8_t bus_flag = 0;
uint8_t AntenaState;
uint8_t RxData[NRF24L01_PIPE_LENGTH];
uint8_t TxData[NRF24L01_PIPE_LENGTH];

uint8_t RxCnt = 0;
uint8_t TxCnt = 0;

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

/* Returns 1 when calling address is available
 * otherwise 0 
 * after that it makes them busy both caller and calling address
 */
uint8_t checkCallStatus(char caller, char calling){
	if(CALLING[textAddrToIndex(calling)] == 0){
		CALLING[textAddrToIndex(calling)] = 1;
		CALLING[textAddrToIndex(caller)] = 1;
		CALLERS[textAddrToIndex(calling)] = textAddrToIndex(caller);
		
		return 1;
	} else {
		return 0;
	}
}

uint8_t iHaveCalls(char myAddr){
	if(CALLING[textAddrToIndex(myAddr)] == 1){
		return 1;
	} else {
		return 0;
	}
}

uint8_t textAddrToIndex(char addr){
	if(addr == 'a'){
		return ALPHA_INDEX;
	} else if(addr == 'b'){
		return BRAVO_INDEX;
	} else if(addr == 'c'){
		return CHARL_INDEX;
	} else if(addr == 'd'){
		return DELTA_INDEX;
	} else if(addr == 'e'){
		return ECHOO_INDEX;
	} else {
		return OUTOFBOUNDS_INDEX;
	}
}

