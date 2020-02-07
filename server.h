#ifndef SERVER_H
#define SERVER_H

#include "stm32f4xx.h"
#include "nrf24l01.h"

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
