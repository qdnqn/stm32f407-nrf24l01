#ifndef CLIENT_H
#define CLIENT_H

#include "nrf24l01.h"

#define RESERVE				97
#define ADDRESS				98
#define FREE_CHANNEL		99
#define CONFIRM				100
#define CALL				101
#define HANG_UP				102
#define KEEP_ALIVE			104
#define CHECK_CALLS			105

#define USER_BUSY 			110
#define CAN_CALL			111

#define HAVE_CALL			112
#define NO_CALL  			113

#define CLIENT_CODE_USED 	114
#define RESERVED			115
#define FREED				116
#define NOT_FREED			117
#define FETCHED_ADDRES		118
#define NO_ADDRESS			119

#define FOREVER_TRIGGER		10

char ADDR_SERV[6]; 											
char ADDR_BUS[6];
char MyAddr[6];
char OtherAddr[6];

uint8_t AntenaState;
uint8_t RxData[NRF24L01_PIPE_LENGTH];
uint8_t TxData[NRF24L01_PIPE_LENGTH];
uint8_t statusOfCall;
uint8_t	pendingCalls;

uint8_t RxCnt;
uint8_t TxCnt;

uint32_t tmpRand;
uint8_t code;
uint8_t client_code;
uint16_t delay;
uint8_t delay_factor;
uint8_t attempts;
uint8_t global_wait;
uint8_t reservedGlobal;
uint8_t alreadyHaveAddress;

void appendRx(char tmp);
void clearRx();
void appendTx(char tmp);
void clearTx();

uint8_t generateCode();
uint8_t reserveBus();
uint8_t freeBus();
uint8_t getAddressFromServer();
uint8_t getCallsFromServer();
uint8_t callAnotherClient(uint8_t addr)

void setClientCode();
void resetAttempts();

void packetDataLight(uint8_t, uint8_t, uint8_t);
void packetData(uint8_t, uint8_t, uint8_t, char*);
uint8_t getServerCode(uint8_t *rx);
uint8_t getClientCode(uint8_t *rx);
uint8_t getResponseCode(uint8_t *rx);
char* getAddress(uint8_t *rx);

void startPujdo();
void stopPujdo();
void feedPujdo(void);
void TIM5_IRQHandler(void);

#endif 
