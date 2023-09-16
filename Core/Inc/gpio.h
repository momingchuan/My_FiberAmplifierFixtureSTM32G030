/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file    gpio.h
  * @brief   This file contains all the function prototypes for
  *          the gpio.c file
  ******************************************************************************
  * @attention
  *
  * Copyright (c) 2022 STMicroelectronics.
  * All rights reserved.
  *
  * This software is licensed under terms that can be found in the LICENSE file
  * in the root directory of this software component.
  * If no LICENSE file comes with this software, it is provided AS-IS.
  *
  ******************************************************************************
  */
/* USER CODE END Header */
/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __GPIO_H__
#define __GPIO_H__

#ifdef __cplusplus
extern "C" {
#endif

/* Includes ------------------------------------------------------------------*/
#include "main.h"

/* USER CODE BEGIN Includes */

//#define LED_KEY_G(parameter) ((parameter==1)?(KEY_LED2_GPIO_Port->BSRR=KEY_LED2_Pin):(KEY_LED2_GPIO_Port->BSRR=(uint32_t)KEY_LED2_Pin<<16U))
//#define LED_KEY_R(parameter) ((parameter==1)?(KEY_LED1_GPIO_Port->BSRR=KEY_LED1_Pin):(KEY_LED1_GPIO_Port->BSRR=(uint32_t)KEY_LED1_Pin<<16U))	
//	
//#define LED_KEY_R(parameter) ((parameter==1)?(GPIOC->BSRR=GPIO_PIN_5):(GPIOC->BSRR=(uint32_t)GPIO_PIN_5<<16U))	
	
	
	
	#define LED_B1(parameter) ((parameter==1)?(LED_B1_GPIO_Port->BSRR=LED_B1_Pin):(LED_B1_GPIO_Port->BSRR=(uint32_t)LED_B1_Pin<<16U))
	#define LED_G1(parameter) ((parameter==1)?(LED_G1_GPIO_Port->BSRR=LED_G1_Pin):(LED_G1_GPIO_Port->BSRR=(uint32_t)LED_G1_Pin<<16U))
	#define LED_R1(parameter) ((parameter==1)?(LED_R1_GPIO_Port->BSRR=LED_R1_Pin):(LED_R1_GPIO_Port->BSRR=(uint32_t)LED_R1_Pin<<16U))
	
	#define LED_B2(parameter) ((parameter==1)?(LED_B2_GPIO_Port->BSRR=LED_B2_Pin):(LED_B2_GPIO_Port->BSRR=(uint32_t)LED_B2_Pin<<16U))
	#define LED_G2(parameter) ((parameter==1)?(LED_G2_GPIO_Port->BSRR=LED_G2_Pin):(LED_G2_GPIO_Port->BSRR=(uint32_t)LED_G2_Pin<<16U))
	#define LED_R2(parameter) ((parameter==1)?(LED_R2_GPIO_Port->BSRR=LED_R2_Pin):(LED_R2_GPIO_Port->BSRR=(uint32_t)LED_R2_Pin<<16U))
	
	#define LED_B3(parameter) ((parameter==1)?(LED_B3_GPIO_Port->BSRR=LED_B3_Pin):(LED_B3_GPIO_Port->BSRR=(uint32_t)LED_B3_Pin<<16U))
	#define LED_G3(parameter) ((parameter==1)?(LED_G3_GPIO_Port->BSRR=LED_G3_Pin):(LED_G3_GPIO_Port->BSRR=(uint32_t)LED_G3_Pin<<16U))
	#define LED_R3(parameter) ((parameter==1)?(LED_R3_GPIO_Port->BSRR=LED_R3_Pin):(LED_R3_GPIO_Port->BSRR=(uint32_t)LED_R3_Pin<<16U))
	
	#define K_C_Power(parameter) ((parameter==1)?(K_C_power_GPIO_Port->BSRR=K_C_power_Pin):(K_C_power_GPIO_Port->BSRR=(uint32_t)K_C_power_Pin<<16U))
	#define K_PowerRv(parameter) ((parameter==1)?(K_powerRv_GPIO_Port->BSRR=K_powerRv_Pin):(K_powerRv_GPIO_Port->BSRR=(uint32_t)K_powerRv_Pin<<16U))
	
	#define K_Load(parameter)   ((parameter==1)?(K_Load_GPIO_Port  ->BSRR=K_Load_Pin)  :(K_Load_GPIO_Port  ->BSRR=(uint32_t)K_Load_Pin  <<16U))		
	#define K_C_Load(parameter) ((parameter==1)?(K_C_Load_GPIO_Port->BSRR=K_C_Load_Pin):(K_C_Load_GPIO_Port->BSRR=(uint32_t)K_C_Load_Pin<<16U))
	#define K_OUTSW(parameter)  ((parameter==1)?(K_OUTSW_GPIO_Port ->BSRR=K_OUTSW_Pin) :(K_OUTSW_GPIO_Port ->BSRR=(uint32_t)K_OUTSW_Pin <<16U))
	#define K_LoadPower(parameter)  ((parameter==1)?(K_LoadPower_GPIO_Port ->BSRR=K_LoadPower_Pin) :(K_LoadPower_GPIO_Port ->BSRR=(uint32_t)K_LoadPower_Pin <<16U))

	
	#define K_OUTSET(parameter)  ((parameter==1)?(K_OUTSEL_GPIO_Port ->BSRR=K_OUTSEL_Pin) :(K_OUTSEL_GPIO_Port ->BSRR=(uint32_t)K_OUTSEL_Pin <<16U))
	#define K_Short(parameter)   ((parameter==1)?(K_Short_GPIO_Port  ->BSRR=K_Short_Pin)  :(K_Short_GPIO_Port  ->BSRR=(uint32_t)K_Short_Pin  <<16U))

	#define K_V_OUT2(parameter)   ((parameter==1)?(K_V_OUT2_GPIO_Port  ->BSRR=K_V_OUT2_Pin)  :(K_V_OUT2_GPIO_Port  ->BSRR=(uint32_t)K_V_OUT2_Pin  <<16U))
	#define K_V_OUT1(parameter)   ((parameter==1)?(K_V_OUT1_GPIO_Port  ->BSRR=K_V_OUT1_Pin)  :(K_V_OUT1_GPIO_Port  ->BSRR=(uint32_t)K_V_OUT1_Pin  <<16U))
	
#define K_V_N(parameter)   ((parameter==1)?(K_V_N_GPIO_Port  ->BSRR=K_V_N_Pin)  :(K_V_N_GPIO_Port  ->BSRR=(uint32_t)K_V_N_Pin  <<16U))
#define K_V_1(parameter)   ((parameter==1)?(K_V_1_GPIO_Port  ->BSRR=K_V_1_Pin)  :(K_V_1_GPIO_Port  ->BSRR=(uint32_t)K_V_1_Pin  <<16U))
#define K_V_2(parameter)   ((parameter==1)?(K_V_2_GPIO_Port  ->BSRR=K_V_2_Pin)  :(K_V_2_GPIO_Port  ->BSRR=(uint32_t)K_V_2_Pin  <<16U))
#define K_V_3(parameter)   ((parameter==1)?(K_V_3_GPIO_Port  ->BSRR=K_V_3_Pin)  :(K_V_3_GPIO_Port  ->BSRR=(uint32_t)K_V_3_Pin  <<16U))
#define K_V_4(parameter)   ((parameter==1)?(K_V_4_GPIO_Port  ->BSRR=K_V_4_Pin)  :(K_V_4_GPIO_Port  ->BSRR=(uint32_t)K_V_4_Pin  <<16U))
#define K_V_5(parameter)   ((parameter==1)?(K_V_5_GPIO_Port  ->BSRR=K_V_5_Pin)  :(K_V_5_GPIO_Port  ->BSRR=(uint32_t)K_V_5_Pin  <<16U))
#define K_V_6(parameter)   ((parameter==1)?(K_V_6_GPIO_Port  ->BSRR=K_V_6_Pin)  :(K_V_6_GPIO_Port  ->BSRR=(uint32_t)K_V_6_Pin  <<16U))
#define K_V_7(parameter)   ((parameter==1)?(K_V_7_GPIO_Port  ->BSRR=K_V_7_Pin)  :(K_V_7_GPIO_Port  ->BSRR=(uint32_t)K_V_7_Pin  <<16U))
#define K_V_8(parameter)   ((parameter==1)?(K_V_8_GPIO_Port  ->BSRR=K_V_8_Pin)  :(K_V_8_GPIO_Port  ->BSRR=(uint32_t)K_V_8_Pin  <<16U))

#define IN_Test(parameter) ((parameter==1)?(IN_Test_GPIO_Port->BSRR=IN_Test_Pin):(IN_Test_GPIO_Port->BSRR=(uint32_t)IN_Test_Pin<<16U))


#define K_V_6_Read (((K_V_6_GPIO_Port->IDR&K_V_6_Pin)==(uint32_t)GPIO_PIN_RESET)?1:0)


#define IO1_IN  (((IO1_IN_GPIO_Port->IDR&IO1_IN_Pin)==(uint32_t)GPIO_PIN_RESET)?1:0)
#define IO2_IN  (((IO2_IN_GPIO_Port->IDR&IO2_IN_Pin)==(uint32_t)GPIO_PIN_RESET)?1:0)
#define IO3_IN  (((IO3_IN_GPIO_Port->IDR&IO3_IN_Pin)==(uint32_t)GPIO_PIN_RESET)?1:0)	
#define IO4_IN  (((IO4_IN_GPIO_Port->IDR&IO4_IN_Pin)==(uint32_t)GPIO_PIN_RESET)?1:0)
#define IO5_IN  (((IO5_IN_GPIO_Port->IDR&IO5_IN_Pin)==(uint32_t)GPIO_PIN_RESET)?1:0)
#define IO6_IN  (((IO6_IN_GPIO_Port->IDR&IO6_IN_Pin)==(uint32_t)GPIO_PIN_RESET)?1:0)
#define IO7_IN  (((IO7_IN_GPIO_Port->IDR&IO7_IN_Pin)==(uint32_t)GPIO_PIN_RESET)?1:0)
#define IO8_IN  (((IO8_IN_GPIO_Port->IDR&IO8_IN_Pin)==(uint32_t)GPIO_PIN_RESET)?1:0)
	
	#define KEY_1 (((KEY_1_GPIO_Port->IDR&KEY_1_Pin)==(uint32_t)GPIO_PIN_RESET)?1:0)
	#define KEY_2 (((KEY_2_GPIO_Port->IDR&KEY_2_Pin)==(uint32_t)GPIO_PIN_RESET)?1:0)


	#define BEEP(parameter) ((parameter==1)?(BEEP_GPIO_Port->BSRR=BEEP_Pin):(BEEP_GPIO_Port->BSRR=(uint32_t)BEEP_Pin<<16U))
	
	

	
	
/* USER CODE END Includes */

/* USER CODE BEGIN Private defines */

/* USER CODE END Private defines */

void MX_GPIO_Init(void);

/* USER CODE BEGIN Prototypes */

/* USER CODE END Prototypes */

#ifdef __cplusplus
}
#endif
#endif /*__ GPIO_H__ */

