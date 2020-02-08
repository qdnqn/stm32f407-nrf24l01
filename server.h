#ifndef SERVER_H
#define SERVER_H

#include "stm32f4xx.h"
#include "nrf24l01.h"

///----Simboli za kontrolu----///
#define RESERVE				97
#define CONNECT				98
#define FREE_CHANNEL		99
#define CONFIRM				100
#define CALL				101
#define HANG_UP				102
#define NO_MORE_ADDRESS		103
#define KEEP_ALIVE			104
#define CHECK_CALLS			105

#define USER_BUSY 			110
#define CAN_CALL			111

#define HAVE_CALL			112
#define NO_CALL  			113

#define ALPHA_INDEX 		0
#define BRAVO_INDEX 		1
#define CHARL_INDEX 		2
#define DELTA_INDEX 		3
#define ECHOO_INDEX 		4
#define OUTOFBOUNDS_INDEX	5


char ADDR_SRV[6]; 											// Adresa servera
char ADDR_BUS[6];												// Adresa busa											
uint8_t CALLING[5];
uint8_t CALLERS[5];	
char USED_ADDR[5][5];		
char ADDR_TX_P0[5];													
char ADDR_TX_P1[5];
char ADDR_TX_P2[5];
char ADDR_TX_P3[5];
char ADDR_TX_P4[5];

uint8_t i;
uint8_t cnt_addr;
uint8_t bus_flag;
uint8_t AntenaState;
uint8_t RxData[NRF24L01_PIPE_LENGTH];
uint8_t TxData[NRF24L01_PIPE_LENGTH];
uint8_t RxCnt;
uint8_t TxCnt;
uint8_t commands[2];

uint8_t parser_command(void);
uint8_t checkCallStatus(char caller, char calling);
uint8_t textAddrToIndex(char addr);
void appendRx(char tmp);
void clearRx();
void appendTx(char tmp);
void clearTx();

#endif 
