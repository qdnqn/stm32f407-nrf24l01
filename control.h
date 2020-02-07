#ifndef CONTROL_CLIENT_H
#define CONTROL_CLIENT_H

#define BOOT			    0
#define CHOOSE_OPTION		1
#define WAIT_FOR_CALL		2
#define CALL_CONTROL   		3
#define ADDR_OK				5
#define FETCHED_OK			6
#define GET_ADDR_OK 		7

#define CONNECT				97
#define FREE_CHANNEL		98
#define CONFIRM				99
#define CALL				100
#define HANG_UP				101

uint8_t state;

#endif
