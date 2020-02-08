#include "stm32f4xx.h"
#include "control.h"

uint8_t state = BOOT;
uint8_t talkingOrListening = 0;
uint8_t changeMode = 0x00;

volatile uint32_t g_irq_cnt = 0;
volatile uint8_t g_gpioa_irq_state = (IRQ_IDLE);
volatile uint32_t g_irq_timer = 0;
