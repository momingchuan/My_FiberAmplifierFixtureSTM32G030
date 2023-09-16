/* */
/**
  ******************************************************************************
  * @file    
  * @brief   
  *          
  ******************************************************************************
  * @attention
  *
  * 
  *
  *
  * 
  * 
  * 
  *
  ******************************************************************************
  */

#ifndef __UI_H__
#define __UI_H__

#ifdef __cplusplus
extern "C" {
#endif


#include "UI.h"
#include "config.h"
#include "stdio.h"	//使用printf函数需引用的头文件
#include <string.h> 
#include <stdlib.h>
#include "main.h"
#include "dma.h"
#include "i2c.h"
#include "tim.h"
#include "usart.h"
#include "gpio.h"
#include "processing.h"

extern const	unsigned char PowerCommandString[][30];
extern	const unsigned char MultimeterCommandString[][30];
	
char PageMain(USART_DataType *US, unsigned char *Start);//	
	
char *HighLowLoad(USART_DataType *US,unsigned char *AutoSetOrManual);
char *PageCurConsume_T(USART_DataType *US, unsigned char *AutoSetOrManual);//测试消耗电流
char *PageReversePower_T(USART_DataType *US, unsigned char *AutoSetOrManual);
char *PageKeyVoltage_T(USART_DataType *US, unsigned char *AutoSetOrManual);	

#ifdef __cplusplus
}
#endif
#endif /*__ GPIO_H__ */



