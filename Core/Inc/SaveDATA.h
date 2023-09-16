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

#ifndef __SAVEDATA_H__
#define __SAVEDATA_H__

#ifdef __cplusplus
extern "C" {
#endif


#include "config.h"
#include "main.h"
	
	
	
	
typedef	struct 
	{
	
//		char UN8_1;
//		char UN8_2;
//		char UN8_3;
//		char UN8_4;
//		char UN8_5;
//		char UN8_6;
//		
//		unsigned char U8_1;
//		unsigned char U8_2;
//		unsigned char U8_3;
//		unsigned char U8_4;
//		unsigned char U8_5;
//		
//		short int UN16_1;
//		short int UN16_2;
//		short int UN16_3;
//		short int UN16_4;
//		short int UN16_5;
//		
//		unsigned short int U16_1;
//		unsigned short int U16_2;
//		unsigned short int U16_3;
//		unsigned short int U16_4;
//		unsigned short int U16_5;
//		unsigned short int U16_6;
//		
//		
//		unsigned int U32_1;
//		unsigned int U32_2;
//		unsigned int U32_3;
//		unsigned int U32_4;
//		unsigned int U32_5;
//		unsigned int U32_6;
//		
//		 int UN32_1;
//		 int UN32_2;
//		 int UN32_3;
//		 int UN32_4;
//		 int UN32_5;
//		 int UN32_6;
	

	float F32_1;
	float F32_2;
	float F32_3;
	float F32_4;
	float F32_5;
	float F32_6;
	float F32_7;
	float F32_8;
	float F32_9;
	float F32_10;
	float F32_11;
	float F32_12;
	float F32_13;
	float F32_14;
	float F32_15;
	float F32_16;
	float F32_17;
	float F32_18;
	float F32_19;
	float F32_20;
	float F32_21;
	float F32_22;
	float F32_23;
	float F32_24;
	float F32_25;
	float F32_26;
	float F32_27;
	float F32_28;
	float F32_29;
	float F32_30;
	float F32_31;
	float F32_32;
	float F32_33;
	float F32_34;
	float F32_35;
	
	float F32_36;
	float F32_37;
	float F32_38;
	float F32_40;
//	float F32_40;
//	float F32_41;
//	float F32_42;
//	float F32_43;
//	float F32_44;
	
	unsigned short int U16_1;
	unsigned short int U16_2;
	unsigned short int U16_3;
	unsigned short int U16_4;
	unsigned short int U16_5;
	unsigned short int U16_6;
	unsigned short int U16_7;
	unsigned short int U16_8;
	unsigned short int U16_9;
	unsigned short int U16_10;
	unsigned short int U16_11;
	unsigned short int U16_12;
	unsigned short int U16_13;
	unsigned short int U16_14;
	unsigned short int U16_15;
	unsigned short int U16_16;
	unsigned short int U16_17;
	unsigned short int U16_18;
	unsigned short int U16_19;
	unsigned short int U16_20;
	}DATA_blockType;
	
	
	
	
	
	
	
	
	void SaveData_EX(void);
	void ReadData_EX(void);
	
void ReadData(I2C_HandleTypeDef* i2cHandle,unsigned char *str_DATA,unsigned short int len);
	
HAL_StatusTypeDef WriteData(I2C_HandleTypeDef* i2cHandle,unsigned char *str_DATA,unsigned short int len);

extern DATA_blockType DATA_block;
	
	
#ifdef __cplusplus
}
#endif
#endif /*__ GPIO_H__ */

