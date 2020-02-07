#ifndef CLIENT_H
#define CLIENT_H

#include "nrf24l01.h"

char ADDR_SERV[6]; 											
char ADDR_BUS[6];
char MyAddr[6];

uint8_t AntenaState;
uint8_t RxData[NRF24L01_PIPE_LENGTH];
uint8_t TxData[NRF24L01_PIPE_LENGTH];

uint8_t RxCnt;
uint8_t TxCnt;

void appendRx(char tmp);
void resetRxCnt();
void clearRx();
void appendTx(char tmp);
void resetTxCnt();
void clearTx();

#endif 
