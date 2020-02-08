#ifndef CONTROL_CLIENT_H
#define CONTROL_CLIENT_H

#define BOOT			    0
#define ADDRESS				1
#define CHOOSE_OPTION		2
#define WAIT_FOR_CALL		3
#define CALL_CONTROL   		4
#define ADDR_OK				5
#define FETCHED_OK			6
#define GET_ADDR_OK 		7
#define STANDBY				8
#define RADIO_MODE			9
#define FREE_CHANNEL_C		10
#define HANG_UP_C			11

#define TALKING				0
#define LISTENING			1

#define IRQ_IDLE			0
#define IRQ_DETECTED		1
#define IRQ_WAIT4LOW		2
#define IRQ_DEBOUNCE		3

uint8_t state;
uint8_t talkingOrListening;
uint8_t changeMode;

volatile uint32_t g_irq_cnt;
volatile uint8_t g_gpioa_irq_state;
volatile uint32_t g_irq_timer;

void serviceIRQA(void);

#endif
