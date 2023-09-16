/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : main.h
  * @brief          : Header for main.c file.
  *                   This file contains the common defines of the application.
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
#ifndef __MAIN_H
#define __MAIN_H

#ifdef __cplusplus
extern "C" {
#endif

/* Includes ------------------------------------------------------------------*/
#include "stm32f4xx_hal.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */
	#include "config.h"
	

	
	
//extern unsigned char ClearData[RECEIVE_REAL_DATA];
//extern unsigned char UART1_RX_BUF[RECEIVE_DATA_BUF_LEN_USART1];
//extern unsigned char UART3_RX_BUF[RECEIVE_DATA_BUF_LEN_USART3];
//extern unsigned char UART4_RX_BUF[RECEIVE_DATA_BUF_LEN_USART4];
//extern unsigned char UART6_RX_BUF[RECEIVE_DATA_BUF_LEN_USART6];
//extern unsigned char string[30];
/* USER CODE END Includes */

/* Exported types ------------------------------------------------------------*/
/* USER CODE BEGIN ET */

/* USER CODE END ET */

/* Exported constants --------------------------------------------------------*/
/* USER CODE BEGIN EC */

/* USER CODE END EC */

/* Exported macro ------------------------------------------------------------*/
/* USER CODE BEGIN EM */

/* USER CODE END EM */

/* Exported functions prototypes ---------------------------------------------*/
void Error_Handler(void);

/* USER CODE BEGIN EFP */

/* USER CODE END EFP */

/* Private defines -----------------------------------------------------------*/
#define K_powerRv_Pin GPIO_PIN_2
#define K_powerRv_GPIO_Port GPIOE
#define K_OUTSW_Pin GPIO_PIN_3
#define K_OUTSW_GPIO_Port GPIOE
#define K_OUTSEL_Pin GPIO_PIN_4
#define K_OUTSEL_GPIO_Port GPIOE
#define K_LoadPower_Pin GPIO_PIN_5
#define K_LoadPower_GPIO_Port GPIOE
#define K_Load_Pin GPIO_PIN_0
#define K_Load_GPIO_Port GPIOF
#define IO8_IN_Pin GPIO_PIN_1
#define IO8_IN_GPIO_Port GPIOF
#define IO7_IN_Pin GPIO_PIN_2
#define IO7_IN_GPIO_Port GPIOF
#define IO6_IN_Pin GPIO_PIN_3
#define IO6_IN_GPIO_Port GPIOF
#define IO5_IN_Pin GPIO_PIN_4
#define IO5_IN_GPIO_Port GPIOF
#define IO1_IN_Pin GPIO_PIN_5
#define IO1_IN_GPIO_Port GPIOF
#define IO2_IN_Pin GPIO_PIN_7
#define IO2_IN_GPIO_Port GPIOF
#define IO3_IN_Pin GPIO_PIN_8
#define IO3_IN_GPIO_Port GPIOF
#define IO4_IN_Pin GPIO_PIN_9
#define IO4_IN_GPIO_Port GPIOF
#define PWM_NPN_Pin GPIO_PIN_2
#define PWM_NPN_GPIO_Port GPIOA
#define PWM_PNP_Pin GPIO_PIN_3
#define PWM_PNP_GPIO_Port GPIOA
#define LED_B2_Pin GPIO_PIN_6
#define LED_B2_GPIO_Port GPIOA
#define LED_G2_Pin GPIO_PIN_7
#define LED_G2_GPIO_Port GPIOA
#define LED_R2_Pin GPIO_PIN_0
#define LED_R2_GPIO_Port GPIOB
#define LED_B3_Pin GPIO_PIN_11
#define LED_B3_GPIO_Port GPIOE
#define LED_G3_Pin GPIO_PIN_13
#define LED_G3_GPIO_Port GPIOE
#define LED_R3_Pin GPIO_PIN_14
#define LED_R3_GPIO_Port GPIOE
#define KEY_2_Pin GPIO_PIN_15
#define KEY_2_GPIO_Port GPIOE
#define BEEP_Pin GPIO_PIN_12
#define BEEP_GPIO_Port GPIOB
#define KEY_1_Pin GPIO_PIN_13
#define KEY_1_GPIO_Port GPIOB
#define K_V_1_Pin GPIO_PIN_11
#define K_V_1_GPIO_Port GPIOD
#define LED_B1_Pin GPIO_PIN_12
#define LED_B1_GPIO_Port GPIOD
#define LED_G1_Pin GPIO_PIN_13
#define LED_G1_GPIO_Port GPIOD
#define LED_R1_Pin GPIO_PIN_14
#define LED_R1_GPIO_Port GPIOD
#define K_Short_Pin GPIO_PIN_15
#define K_Short_GPIO_Port GPIOD
#define K_V_OUT2_Pin GPIO_PIN_2
#define K_V_OUT2_GPIO_Port GPIOG
#define K_V_2_Pin GPIO_PIN_3
#define K_V_2_GPIO_Port GPIOG
#define K_V_5_Pin GPIO_PIN_4
#define K_V_5_GPIO_Port GPIOG
#define K_V_4_Pin GPIO_PIN_5
#define K_V_4_GPIO_Port GPIOG
#define K_V_3_Pin GPIO_PIN_6
#define K_V_3_GPIO_Port GPIOG
#define K_V_6_Pin GPIO_PIN_7
#define K_V_6_GPIO_Port GPIOG
#define K_V_7_Pin GPIO_PIN_8
#define K_V_7_GPIO_Port GPIOG
#define SD_D0_Pin GPIO_PIN_8
#define SD_D0_GPIO_Port GPIOC
#define SD_D1_Pin GPIO_PIN_9
#define SD_D1_GPIO_Port GPIOC
#define SD_D2_Pin GPIO_PIN_10
#define SD_D2_GPIO_Port GPIOC
#define SD_D3_Pin GPIO_PIN_11
#define SD_D3_GPIO_Port GPIOC
#define SD_CK_Pin GPIO_PIN_12
#define SD_CK_GPIO_Port GPIOC
#define SD_CMD_Pin GPIO_PIN_2
#define SD_CMD_GPIO_Port GPIOD
#define K_V_8_Pin GPIO_PIN_9
#define K_V_8_GPIO_Port GPIOG
#define IN_Test_Pin GPIO_PIN_10
#define IN_Test_GPIO_Port GPIOG
#define K_V_N_Pin GPIO_PIN_11
#define K_V_N_GPIO_Port GPIOG
#define K_V_OUT1_Pin GPIO_PIN_12
#define K_V_OUT1_GPIO_Port GPIOG
#define K_C_Load_Pin GPIO_PIN_13
#define K_C_Load_GPIO_Port GPIOG
#define K_C_power_Pin GPIO_PIN_14
#define K_C_power_GPIO_Port GPIOG
/* USER CODE BEGIN Private defines */

//extern SYStickTimeType  SYS_tickTime;
//extern USART_DataType USART_Data;
////extern DATA_storeType DATA_store;	
//extern comVariableBlockType comVariableBlock;

/* USER CODE END Private defines */

#ifdef __cplusplus
}
#endif

#endif /* __MAIN_H */
