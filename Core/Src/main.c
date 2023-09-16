/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : main.c
  * @brief          : Main program body
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
/* Includes ------------------------------------------------------------------*/
#include "main.h"
#include "dma.h"
#include "fatfs.h"
#include "i2c.h"
#include "sdio.h"
#include "tim.h"
#include "usart.h"
#include "gpio.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */
#include "config.h"
#include "stdio.h"	//使用printf函数需引用的头文件
#include <string.h> 
#include  <stdio.h>
#include <stdlib.h>
#include "uiPro.h"
#include "processing.h"
#include "SaveDATA.h"
#include "PeripheralConfi.h"
/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN PTD */
SYStickTimeType  SYS_tickTime;	
USART_DataType USART_Data;
//DATA_storeType DATA_store;
comVariableBlockType comVariableBlock;
//DataBufType DataBuf_Idle;
//DataBufType DataBuf_Entity;
/* USER CODE END PTD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */



unsigned char UART1_RX_BUF[RECEIVE_DATA_BUF_LEN_USART1];
unsigned char UART3_RX_BUF[RECEIVE_DATA_BUF_LEN_USART3];
unsigned char UART4_RX_BUF[RECEIVE_DATA_BUF_LEN_USART4];
unsigned char UART6_RX_BUF[RECEIVE_DATA_BUF_LEN_USART6];
//unsigned char string[30]={0};

/* USER CODE END PD */

/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */

/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/

/* USER CODE BEGIN PV */



/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
/* USER CODE BEGIN PFP */

/* USER CODE END PFP */

/* Private user code ---------------------------------------------------------*/
/* USER CODE BEGIN 0 */

/* USER CODE END 0 */

/**
  * @brief  The application entry point.
  * @retval int
  */
int main(void)
{
  /* USER CODE BEGIN 1 */
	VariableInitialization();
  /* USER CODE END 1 */

  /* MCU Configuration--------------------------------------------------------*/

  /* Reset of all peripherals, Initializes the Flash interface and the Systick. */
  HAL_Init();

  /* USER CODE BEGIN Init */

  /* USER CODE END Init */

  /* Configure the system clock */
  SystemClock_Config();

  /* USER CODE BEGIN SysInit */
//  MX_SDIO_SD_Init();
  /* USER CODE END SysInit */

  /* Initialize all configured peripherals */
  MX_GPIO_Init();
  MX_USART3_UART_Init();
  MX_USART6_UART_Init();
  MX_DMA_Init();
  MX_USART1_UART_Init();
  MX_USART2_UART_Init();
  MX_I2C1_Init();
  MX_TIM9_Init();
  MX_UART4_Init();
  MX_TIM2_Init();
  MX_SDIO_SD_Init();
  MX_FATFS_Init();
  MX_TIM8_Init();
  MX_TIM4_Init();
  /* USER CODE BEGIN 2 */
//  	PWR_PVD();

	HAL_UART_Receive_DMA(&UART_HANDLE_SCREEN, UART1_RX_BUF, RECEIVE_DATA_BUF_LEN_USART1);  // 启动DMA接收
	__HAL_UART_ENABLE_IT(&UART_HANDLE_SCREEN, UART_IT_IDLE);              // 使能空闲中断
	
	HAL_UART_Receive_IT(&UART_HANDLE_POWER,UART3_RX_BUF,RECEIVE_DATA_BUF_LEN_USART3);//开启接收
	__HAL_UART_ENABLE_IT(&UART_HANDLE_POWER, UART_IT_IDLE);              // 使能空闲中断
	
	HAL_UART_Receive_IT(&UART_HANDLE_MULTIMETER,UART6_RX_BUF,RECEIVE_DATA_BUF_LEN_USART6);//开启接收
	__HAL_UART_ENABLE_IT(&UART_HANDLE_MULTIMETER, UART_IT_IDLE);              // 使能空闲中断

	
	HAL_UART_Receive_DMA(&UART_HANDLE_SENSOR,UART4_RX_BUF,RECEIVE_DATA_BUF_LEN_USART4);//开启接收
	__HAL_UART_ENABLE_IT(&UART_HANDLE_SENSOR, UART_IT_IDLE);              // 使能空闲中断
	

	HAL_TIM_Base_Start_IT(&htim4);
	
//	for(int i=0; i<255;i++) //存储数据测试初始化
//	{		
//		DATA_store.DATA_Transmit_eeprom[i]=i;
//		
//	}
//	  	WriteData(&hi2c1);

//	 SaveData_EX();

	ReadData_EX();
	Motor = RANGE_PWM_MID;//范围84-99

	PWMSetCurrent(0,20);
	PWMSetCurrent(1,20);


	
	if(HAL_TIM_PWM_Start(&htim9,TIM_CHANNEL_2) != HAL_OK)
	{
		Error_Handler();
	}

	if(HAL_TIM_PWM_Start(&htim2,TIM_CHANNEL_3) != HAL_OK)
	{
		Error_Handler();
	}

	if(HAL_TIMEx_PWMN_Start(&htim8,TIM_CHANNEL_1) != HAL_OK)
	{
		Error_Handler();
	}
//	PeripheralInitStatus();
	HAL_Delay(1500);
	 POWER_UP();
  /* USER CODE END 2 */

  /* Infinite loop */
  /* USER CODE BEGIN WHILE */
  while (1)
  {
    /* USER CODE END WHILE */

    /* USER CODE BEGIN 3 */

	if(comVariableBlock.SaveDataFlag==1)
	{
		comVariableBlock.SaveDataFlag=0;
		SaveData_EX();
	}

	switch(USART_Data.USART1_Data.PageNum)	  
	{ 
		case page_main:
		{
			if(KEY_2  && SYS_tickTime.sys_sendTime_ms >= 1000)
			{
				SYS_tickTime.sys_sendTime_ms = 0;
				if(comVariableBlock.MeasureResults!=ResultsTesting)
				{
					comVariableBlock.StartDetecFlag=1;
				}
			}			
			PageMain(&USART_Data,&comVariableBlock.StartDetecFlag);
			USART_Data.USART1_Data.PageNumChange = page_NNNNNNNO;
		}break;
		case page_CurConsume_T:
		{
			comVariableBlock.AutoSetOrManual=0;
			PageCurConsume_T(&USART_Data,&comVariableBlock.AutoSetOrManual);
		}break;
		case page_KV_T:
		{
			comVariableBlock.AutoSetOrManual=0;
			PageKeyVoltage_T(&USART_Data,&comVariableBlock.AutoSetOrManual);
		}break;
		case page_HL_T:
		{
			comVariableBlock.AutoSetOrManual=0;
			HighLowLoad(&USART_Data,&comVariableBlock.AutoSetOrManual);
		
		}break;
		
		case page_Setting:
		{
			comVariableBlock.AutoSetOrManual=0;
			Setting(&USART_Data,&comVariableBlock.AutoSetOrManual);
		}break;
		case page_Button:
		{
			comVariableBlock.AutoSetOrManual=0;
			ButtonCheck(&USART_Data,&comVariableBlock.AutoSetOrManual);
		}break;
		case page_Data:
		{
		
		}break;
		case page_Calibration:
		{
			comVariableBlock.AutoSetOrManual=0;
			Calibration(&USART_Data,&comVariableBlock.AutoSetOrManual);
		}break;
		case page_NNNNNNNO:
		{
		
		}break;
	}  
  }
  /* USER CODE END 3 */
}

/**
  * @brief System Clock Configuration
  * @retval None
  */
void SystemClock_Config(void)
{
  RCC_OscInitTypeDef RCC_OscInitStruct = {0};
  RCC_ClkInitTypeDef RCC_ClkInitStruct = {0};

  /** Configure the main internal regulator output voltage
  */
  __HAL_RCC_PWR_CLK_ENABLE();
  __HAL_PWR_VOLTAGESCALING_CONFIG(PWR_REGULATOR_VOLTAGE_SCALE1);

  /** Initializes the RCC Oscillators according to the specified parameters
  * in the RCC_OscInitTypeDef structure.
  */
  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSE;
  RCC_OscInitStruct.HSEState = RCC_HSE_ON;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
  RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSE;
  RCC_OscInitStruct.PLL.PLLM = 16;
  RCC_OscInitStruct.PLL.PLLN = 336;
  RCC_OscInitStruct.PLL.PLLP = RCC_PLLP_DIV2;
  RCC_OscInitStruct.PLL.PLLQ = 7;
  if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
  {
    Error_Handler();
  }

  /** Initializes the CPU, AHB and APB buses clocks
  */
  RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK|RCC_CLOCKTYPE_SYSCLK
                              |RCC_CLOCKTYPE_PCLK1|RCC_CLOCKTYPE_PCLK2;
  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV4;
  RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV2;

  if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_5) != HAL_OK)
  {
    Error_Handler();
  }
}

/* USER CODE BEGIN 4 */



/* USER CODE END 4 */

/**
  * @brief  This function is executed in case of error occurrence.
  * @retval None
  */
void Error_Handler(void)
{
  /* USER CODE BEGIN Error_Handler_Debug */
  /* User can add his own implementation to report the HAL error return state */
  __disable_irq();
  while (1)
  {
  }
  /* USER CODE END Error_Handler_Debug */
}

#ifdef  USE_FULL_ASSERT
/**
  * @brief  Reports the name of the source file and the source line number
  *         where the assert_param error has occurred.
  * @param  file: pointer to the source file name
  * @param  line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t *file, uint32_t line)
{
  /* USER CODE BEGIN 6 */
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */
  /* USER CODE END 6 */
}
#endif /* USE_FULL_ASSERT */
