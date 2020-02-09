#include<string.h>
#include "server.h"

char ADDR_SRV[6] = "CHSRV"; 											
char ADDR_BUS[6] = "CHBUS";			

struct Address alpha;
struct Address bravo;
struct Address charlie;
struct Address delta;
struct Address echo;

struct Address *ptrAddr;

uint8_t cnt_addr = 0;
															
uint8_t CALLING[5] = {0, 0, 0, 0, 0};
uint8_t CALLERS[5] = {0, 0, 0, 0, 0};	
char USED_ADDR[5][5] = {"alpha", "bravo", "charl", "delta", "echoo"};		
char ADDR_TX_P0[5] = "alpha";													
char ADDR_TX_P1[5] = "charl";
char ADDR_TX_P2[5] = "bravo";
char ADDR_TX_P3[5] = "delta";
char ADDR_TX_P4[5] = "echoo";

uint8_t i;
uint8_t AntenaState;
uint8_t RxData[NRF24L01_PIPE_LENGTH];
uint8_t TxData[NRF24L01_PIPE_LENGTH];

uint8_t RxCnt = 0;
uint8_t TxCnt = 0;

uint32_t tmpRand;
uint8_t code, client_code;
uint8_t reserved = 0;

uint8_t generateCode(){
	uint8_t temp  = 0;
	
	while(temp < 100){
		tmpRand = genRIN();
		temp = tmpRand >> 24;
	}
	
	strcpy(alpha.name, "alpha");
	strcpy(bravo.name, "bravo");
	strcpy(charlie.name, "chrli");
	strcpy(delta.name, "delta");
	strcpy(echo.name, "echoo");

	return temp;
}

void setServerCode(){
	code = generateCode();
}

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
uint8_t hangUpCall(char caller, char calling){
	if(CALLING[textAddrToIndex(calling)] == 1){
		CALLING[textAddrToIndex(calling)] = 0;
		CALLING[textAddrToIndex(caller)] = 0;
		CALLERS[textAddrToIndex(calling)] = 0;
		
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
char* textAddrToFullAddress(char addr){
	if(addr == 'a'){
		return ADDR_TX_P0;
	} else if(addr == 'b'){
		return ADDR_TX_P1;
	} else if(addr == 'c'){
		return ADDR_TX_P2;
	} else if(addr == 'd'){
		return ADDR_TX_P3;
	} else if(addr == 'e'){
		return ADDR_TX_P4;
	} else {
		return OUTOFBOUNDS_INDEX;
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

uint8_t setClientCode(uint8_t code){
	uint8_t i;
	
	for(i=0;i<10;i++){
		if(client_codes[i] == code){
			return 0;
		}
	}
	
	client_code = code;
	return 1;
}

uint8_t clearClientCode(uint8_t code){
	uint8_t i;
	
	for(i=0;i<10;i++){
		if(client_codes[i] == code){
			client_codes[i] = 0;
		}
	}
	
	client_code = 0;
	return 1;
}

uint8_t getServerCode(uint8_t *rx){
	return rx[0];
}
uint8_t getClientCode(uint8_t *rx){
	return rx[1];
}
uint8_t getCommand(uint8_t *rx){
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

uint8_t getPtrAddr(uint8_t code){
	if(alpha.client_code == code){
		ptrAddr = &alpha;
	} else if(bravo.client_code == code){
		ptrAddr = &bravo;
	} else if(charlie.client_code == code){
		ptrAddr = &charlie;
	} else if(delta.client_code == code){
		ptrAddr = &delta;
	} else if(echo.client_code == code){
		ptrAddr = &echo;
	} else {
		return 0;
	}
	
	return 1;
}

char *fetchFreeAddress(uint8_t code){
	static char *addr = "";
	
	if(cnt_addr == 0){
		alpha.client_code = code;
		addr = alpha.name;
		cnt_addr++;
	} else if(cnt_addr == 1){
		bravo.client_code = code;
		addr = bravo.name;
		cnt_addr++;
	} else if(cnt_addr == 2){
		charlie.client_code = code;
		addr = charlie.name;
		cnt_addr++;
	} else if(cnt_addr == 3){
		delta.client_code = code;
		addr = delta.name;
		cnt_addr++;
	} else if(cnt_addr == 4){
		echo.client_code = code;
		addr = echo.name;
		cnt_addr++;
	} else {
		addr = "error";
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
