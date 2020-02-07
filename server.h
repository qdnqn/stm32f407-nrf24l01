#ifndef SERVER_H
#define SERVER_H

#include "stm32f4xx.h"
#include "nrf24l01.h"

///----Simboli za kontrolu----///
#define CONNECT				97
#define FREE_CHANNEL		98
#define CONFIRM				99
#define CALL				100
#define HANG_UP				101
#define NO_MORE_ADDRESS		102

char ADDR_SRV[6]; 											// Adresa servera
char ADDR_BUS[6];												// Adresa busa											
char CALLS[5][5];	
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
void appendRx(char tmp);
void resetRxCnt();
void clearRx();
void appendTx(char tmp);
void resetTxCnt();
void clearTx();

#endif 
