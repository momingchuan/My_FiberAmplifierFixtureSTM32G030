#include "uiPro.h"
#include "config.h"
#include "stdio.h"	//使用printf函数需引用的头文件
#include <string.h> 
#include <stdlib.h>
//#include "main.h"
#include "dma.h"
#include "i2c.h"
#include "tim.h"
#include "usart.h"
#include "gpio.h"
#include "processing.h"
#include "SaveDATA.h"


DATA_blockType DATA_block;


void SaveData_EX()
{
	
	
	DATA_block.F32_1=USART_Data.USART1_Data.US1_a_Voltage;
	DATA_block.F32_2=USART_Data.USART1_Data.US1_a_Max_mA;
	DATA_block.F32_3=USART_Data.USART1_Data.US1_a_Min_mA;
	
	DATA_block.F32_4 = USART_Data.USART1_Data.US1_b_Min_mA0;
	DATA_block.F32_5 = USART_Data.USART1_Data.US1_b_Min_mA1;
	DATA_block.F32_6 = USART_Data.USART1_Data.US1_b_Min_mA2;
	DATA_block.F32_7 = USART_Data.USART1_Data.US1_b_Min_mA3;
	DATA_block.F32_8 = USART_Data.USART1_Data.US1_b_Min_mA4;
	DATA_block.F32_9 = USART_Data.USART1_Data.US1_b_Min_mA5;
	DATA_block.F32_10= USART_Data.USART1_Data.US1_b_Min_mA6;
	DATA_block.F32_11= USART_Data.USART1_Data.US1_b_Min_mA7;
	
	DATA_block.F32_12= USART_Data.USART1_Data.US1_b_Max_mA0;
	DATA_block.F32_13= USART_Data.USART1_Data.US1_b_Max_mA1;
	DATA_block.F32_14= USART_Data.USART1_Data.US1_b_Max_mA2;
	DATA_block.F32_15= USART_Data.USART1_Data.US1_b_Max_mA3;
	DATA_block.F32_16= USART_Data.USART1_Data.US1_b_Max_mA4;
	DATA_block.F32_17= USART_Data.USART1_Data.US1_b_Max_mA5;
	DATA_block.F32_18= USART_Data.USART1_Data.US1_b_Max_mA6;
	DATA_block.F32_19= USART_Data.USART1_Data.US1_b_Max_mA7;
	
	

	DATA_block.F32_20 = USART_Data.USART1_Data.US1_c_Min_mA1;
	DATA_block.F32_21 = USART_Data.USART1_Data.US1_c_Min_mA2;
	DATA_block.F32_22 = USART_Data.USART1_Data.US1_c_Min_mA3;
	DATA_block.F32_23 = USART_Data.USART1_Data.US1_c_Min_mA4;
	DATA_block.F32_24 = USART_Data.USART1_Data.US1_c_Min_mA5;
	DATA_block.F32_25 = USART_Data.USART1_Data.US1_c_Min_mA6;
	DATA_block.F32_26 = USART_Data.USART1_Data.US1_c_Min_mA7;
	DATA_block.F32_27 = USART_Data.USART1_Data.US1_c_Min_mA8;
	
	DATA_block.F32_28= USART_Data.USART1_Data.US1_c_Max_mA1;
	DATA_block.F32_29= USART_Data.USART1_Data.US1_c_Max_mA2;
	DATA_block.F32_30= USART_Data.USART1_Data.US1_c_Max_mA3;
	DATA_block.F32_31= USART_Data.USART1_Data.US1_c_Max_mA4;
	DATA_block.F32_32= USART_Data.USART1_Data.US1_c_Max_mA5;
	DATA_block.F32_33= USART_Data.USART1_Data.US1_c_Max_mA6;
	DATA_block.F32_34= USART_Data.USART1_Data.US1_c_Max_mA7;
	DATA_block.F32_35= USART_Data.USART1_Data.US1_c_Max_mA8;
	
	
	DATA_block.F32_36 = comVariableBlock.Coefficient_PNP_A;
	DATA_block.F32_37 = comVariableBlock.Coefficient_PNP_B;
	
	DATA_block.F32_38 = comVariableBlock.Coefficient_NPN_A;
	DATA_block.F32_40 = comVariableBlock.Coefficient_NPN_B;
	
	DATA_block.U16_1 =  USART_Data.USART1_Data.US1_d_Max_Val;
	DATA_block.U16_2 =  USART_Data.USART1_Data.US1_d_Max_Va2;
	DATA_block.U16_3 =  USART_Data.USART1_Data.US1_d_Max_Va3;
	DATA_block.U16_4 =  USART_Data.USART1_Data.US1_d_Max_Va4;
	DATA_block.U16_5 =  USART_Data.USART1_Data.US1_d_Max_Va5;
	DATA_block.U16_6 =  USART_Data.USART1_Data.US1_d_Max_Va6;
	DATA_block.U16_7 =  USART_Data.USART1_Data.US1_d_Max_Va7;
	DATA_block.U16_8 =  USART_Data.USART1_Data.US1_d_Max_Va8;
	DATA_block.U16_9 =  USART_Data.USART1_Data.US1_d_Max_Va9;
	DATA_block.U16_10 =  USART_Data.USART1_Data.US1_d_Max_Va10;
	DATA_block.U16_11 =  USART_Data.USART1_Data.US1_d_Min_Val;
	DATA_block.U16_12 =  USART_Data.USART1_Data.US1_d_Min_Va2;
	DATA_block.U16_13 =  USART_Data.USART1_Data.US1_d_Min_Va3;
	DATA_block.U16_14 =  USART_Data.USART1_Data.US1_d_Min_Va4;
	DATA_block.U16_15 =  USART_Data.USART1_Data.US1_d_Min_Va5;
	DATA_block.U16_16 =  USART_Data.USART1_Data.US1_d_Min_Va6;
	DATA_block.U16_17 =  USART_Data.USART1_Data.US1_d_Min_Va7;
	DATA_block.U16_18 =  USART_Data.USART1_Data.US1_d_Min_Va8;
	DATA_block.U16_19 =  USART_Data.USART1_Data.US1_d_Min_Va9;
	DATA_block.U16_20 =  USART_Data.USART1_Data.US1_d_Min_Va10;
	
	

	comVariableBlock.SaveDATA_BUF = (unsigned char *)&DATA_block;
	comVariableBlock.SaveDATA_BUF_Len=sizeof(DATA_block);
	if(WriteData(&hi2c1,comVariableBlock.SaveDATA_BUF,comVariableBlock.SaveDATA_BUF_Len)!=HAL_OK)
	{
//		LED_B1(1);
		
	}
}
	
void ReadData_EX()
{

	unsigned char *FirstDATA;
	FirstDATA = (unsigned char *)&DATA_block;
	ReadData(&hi2c1,FirstDATA,sizeof(DATA_block));
	HAL_Delay(50);//读完数据要延时一下，等数据读取完成
	
	USART_Data.USART1_Data.US1_a_Voltage = DATA_block.F32_1;
	USART_Data.USART1_Data.US1_a_Max_mA  = DATA_block.F32_2;
	USART_Data.USART1_Data.US1_a_Min_mA  = DATA_block.F32_3;
	
	 USART_Data.USART1_Data.US1_b_Min_mA0=DATA_block.F32_4;
	 USART_Data.USART1_Data.US1_b_Min_mA1=DATA_block.F32_5;
	 USART_Data.USART1_Data.US1_b_Min_mA2=DATA_block.F32_6;
	 USART_Data.USART1_Data.US1_b_Min_mA3=DATA_block.F32_7;
	 USART_Data.USART1_Data.US1_b_Min_mA4=DATA_block.F32_8;
	 USART_Data.USART1_Data.US1_b_Min_mA5=DATA_block.F32_9;
	 USART_Data.USART1_Data.US1_b_Min_mA6=DATA_block.F32_10;
	 USART_Data.USART1_Data.US1_b_Min_mA7=DATA_block.F32_11;
	
	 USART_Data.USART1_Data.US1_b_Max_mA0=DATA_block.F32_12;
	 USART_Data.USART1_Data.US1_b_Max_mA1=DATA_block.F32_13;
	 USART_Data.USART1_Data.US1_b_Max_mA2=DATA_block.F32_14;
	 USART_Data.USART1_Data.US1_b_Max_mA3=DATA_block.F32_15;
	 USART_Data.USART1_Data.US1_b_Max_mA4=DATA_block.F32_16;
	 USART_Data.USART1_Data.US1_b_Max_mA5=DATA_block.F32_17;
	 USART_Data.USART1_Data.US1_b_Max_mA6=DATA_block.F32_18;
	 USART_Data.USART1_Data.US1_b_Max_mA7=DATA_block.F32_19;
	 
	  USART_Data.USART1_Data.US1_c_Min_mA1=DATA_block.F32_20;
	  USART_Data.USART1_Data.US1_c_Min_mA2=DATA_block.F32_21;
	  USART_Data.USART1_Data.US1_c_Min_mA3=DATA_block.F32_22;
	  USART_Data.USART1_Data.US1_c_Min_mA4=DATA_block.F32_23;
	  USART_Data.USART1_Data.US1_c_Min_mA5=DATA_block.F32_24;
	  USART_Data.USART1_Data.US1_c_Min_mA6=DATA_block.F32_25;
	  USART_Data.USART1_Data.US1_c_Min_mA7=DATA_block.F32_26;
	  USART_Data.USART1_Data.US1_c_Min_mA8=DATA_block.F32_27;
	
	 USART_Data.USART1_Data.US1_c_Max_mA1=DATA_block.F32_28;
	 USART_Data.USART1_Data.US1_c_Max_mA2=DATA_block.F32_29;
	 USART_Data.USART1_Data.US1_c_Max_mA3=DATA_block.F32_30;
	 USART_Data.USART1_Data.US1_c_Max_mA4=DATA_block.F32_31;
	 USART_Data.USART1_Data.US1_c_Max_mA5=DATA_block.F32_32;
	 USART_Data.USART1_Data.US1_c_Max_mA6=DATA_block.F32_33;
	 USART_Data.USART1_Data.US1_c_Max_mA7=DATA_block.F32_34;
	 USART_Data.USART1_Data.US1_c_Max_mA8=DATA_block.F32_35;
	 
	comVariableBlock.Coefficient_PNP_A= DATA_block.F32_36 ;
	comVariableBlock.Coefficient_PNP_B= DATA_block.F32_37;
	
	comVariableBlock.Coefficient_NPN_A= DATA_block.F32_38;
	comVariableBlock.Coefficient_NPN_B= DATA_block.F32_40 ;
	 
	 
	   USART_Data.USART1_Data.US1_d_Max_Val=DATA_block.U16_1;
	   USART_Data.USART1_Data.US1_d_Max_Va2=DATA_block.U16_2;
	   USART_Data.USART1_Data.US1_d_Max_Va3=DATA_block.U16_3;
	   USART_Data.USART1_Data.US1_d_Max_Va4=DATA_block.U16_4;
	   USART_Data.USART1_Data.US1_d_Max_Va5=DATA_block.U16_5;
	   USART_Data.USART1_Data.US1_d_Max_Va6=DATA_block.U16_6;
	   USART_Data.USART1_Data.US1_d_Max_Va7=DATA_block.U16_7;
	   USART_Data.USART1_Data.US1_d_Max_Va8=DATA_block.U16_8;
	   USART_Data.USART1_Data.US1_d_Max_Va9=DATA_block.U16_9;
	   USART_Data.USART1_Data.US1_d_Max_Va10=DATA_block.U16_10;
	   USART_Data.USART1_Data.US1_d_Min_Val=DATA_block.U16_11;
	   USART_Data.USART1_Data.US1_d_Min_Va2=DATA_block.U16_12;
	   USART_Data.USART1_Data.US1_d_Min_Va3=DATA_block.U16_13;
	   USART_Data.USART1_Data.US1_d_Min_Va4=DATA_block.U16_14;
	   USART_Data.USART1_Data.US1_d_Min_Va5=DATA_block.U16_15;
	   USART_Data.USART1_Data.US1_d_Min_Va6=DATA_block.U16_16;
	   USART_Data.USART1_Data.US1_d_Min_Va7=DATA_block.U16_17;
	   USART_Data.USART1_Data.US1_d_Min_Va8=DATA_block.U16_18;
	   USART_Data.USART1_Data.US1_d_Min_Va9=DATA_block.U16_19;
	   USART_Data.USART1_Data.US1_d_Min_Va10=DATA_block.U16_20;
	 
	 if(comVariableBlock.Coefficient_PNP_A>=0 ||comVariableBlock.Coefficient_NPN_A>=0)
	 {
		 comVariableBlock.Coefficient_PNP_A=-0.001;
		 comVariableBlock.Coefficient_NPN_A=-0.001;
		 comVariableBlock.DataException|=0x01;
	 }
	 if(comVariableBlock.Coefficient_NPN_B>400 ||comVariableBlock.Coefficient_PNP_B>400)
	 {
		 comVariableBlock.Coefficient_PNP_A=1000;
		 comVariableBlock.Coefficient_PNP_B=1000;
		 comVariableBlock.DataException|=0x01;
	 }
	 
	 if(USART_Data.USART1_Data.US1_a_Voltage > 1000 || USART_Data.USART1_Data.US1_a_Voltage < 0)
	 {
		USART_Data.USART1_Data.US1_a_Voltage=24;
	 }
	 if(USART_Data.USART1_Data.US1_a_Max_mA > 1000 || USART_Data.USART1_Data.US1_a_Max_mA < 0)
	 {
		USART_Data.USART1_Data.US1_a_Max_mA=50;
	 }
	 if(USART_Data.USART1_Data.US1_a_Min_mA > 1000 || USART_Data.USART1_Data.US1_a_Min_mA < 0)
	 {
		USART_Data.USART1_Data.US1_a_Min_mA=50;
	 }
	 if(USART_Data.USART1_Data.US1_b_Min_mA0 > 1000 || USART_Data.USART1_Data.US1_b_Min_mA0 < 0)
	 {
		USART_Data.USART1_Data.US1_b_Min_mA0=50;
	 }
	 if(USART_Data.USART1_Data.US1_b_Min_mA1 > 1000 || USART_Data.USART1_Data.US1_b_Min_mA1 < 0)
	 {
		USART_Data.USART1_Data.US1_b_Min_mA1=50;
	 }
	 if(USART_Data.USART1_Data.US1_b_Min_mA2 > 1000 || USART_Data.USART1_Data.US1_b_Min_mA2 < 0)
	 {
		USART_Data.USART1_Data.US1_b_Min_mA2=50;
	 }
	 if(USART_Data.USART1_Data.US1_b_Min_mA3 > 1000 || USART_Data.USART1_Data.US1_b_Min_mA3 < 0)
	 {
		USART_Data.USART1_Data.US1_b_Min_mA3=50;
	 }
	 if(USART_Data.USART1_Data.US1_b_Min_mA4 > 1000 || USART_Data.USART1_Data.US1_b_Min_mA4 < 0)
	 {
		USART_Data.USART1_Data.US1_b_Min_mA4=50;
	 }
	 if(USART_Data.USART1_Data.US1_b_Min_mA5 > 1000 || USART_Data.USART1_Data.US1_b_Min_mA5 < 0)
	 {
		USART_Data.USART1_Data.US1_b_Min_mA5=50;
	 }
	 if(USART_Data.USART1_Data.US1_b_Min_mA6 > 1000 || USART_Data.USART1_Data.US1_b_Min_mA6 < 0)
	 {
		USART_Data.USART1_Data.US1_b_Min_mA6=50;
	 }
	 if(USART_Data.USART1_Data.US1_b_Min_mA7 > 1000 || USART_Data.USART1_Data.US1_b_Min_mA7 < 0)
	 {
		USART_Data.USART1_Data.US1_b_Min_mA7=50;
	 }
	 if(USART_Data.USART1_Data.US1_b_Max_mA0 > 1000 || USART_Data.USART1_Data.US1_b_Max_mA0 < 0)
	 {
		USART_Data.USART1_Data.US1_b_Max_mA0=50;
	 }
	 if(USART_Data.USART1_Data.US1_b_Max_mA1 > 1000 || USART_Data.USART1_Data.US1_b_Max_mA1 < 0)
	 {
		USART_Data.USART1_Data.US1_b_Max_mA1=50;
	 }
	 if(USART_Data.USART1_Data.US1_b_Max_mA2 > 1000 || USART_Data.USART1_Data.US1_b_Max_mA2 < 0)
	 {
		USART_Data.USART1_Data.US1_b_Max_mA2=50;
	 }
	 if(USART_Data.USART1_Data.US1_b_Max_mA3 > 1000 || USART_Data.USART1_Data.US1_b_Max_mA3 < 0)
	 {
		USART_Data.USART1_Data.US1_b_Max_mA3=50;
	 }
	 if(USART_Data.USART1_Data.US1_b_Max_mA4 > 1000 || USART_Data.USART1_Data.US1_b_Max_mA4 < 0)
	 {
		USART_Data.USART1_Data.US1_b_Max_mA4=50;
	 }
	 if(USART_Data.USART1_Data.US1_b_Max_mA5 > 1000 || USART_Data.USART1_Data.US1_b_Max_mA5 < 0)
	 {
		USART_Data.USART1_Data.US1_b_Max_mA5=50;
	 }
	 if(USART_Data.USART1_Data.US1_b_Max_mA6 > 1000 || USART_Data.USART1_Data.US1_b_Max_mA6 < 0)
	 {
		USART_Data.USART1_Data.US1_b_Max_mA6=50;
	 }
	 if(USART_Data.USART1_Data.US1_b_Max_mA7 > 1000 || USART_Data.USART1_Data.US1_b_Max_mA7 < 0)
	 {
		USART_Data.USART1_Data.US1_b_Max_mA7=50;
	 }
	 if(USART_Data.USART1_Data.US1_c_Min_mA1 > 1000 || USART_Data.USART1_Data.US1_c_Min_mA1 < 0)
	 {
		USART_Data.USART1_Data.US1_c_Min_mA1=50;
	 }
	 if(USART_Data.USART1_Data.US1_c_Min_mA2 > 1000 || USART_Data.USART1_Data.US1_c_Min_mA2 < 0)
	 {
		USART_Data.USART1_Data.US1_c_Min_mA2=50;
	 }
	 if(USART_Data.USART1_Data.US1_c_Min_mA3 > 1000 || USART_Data.USART1_Data.US1_c_Min_mA3 < 0)
	 {
		USART_Data.USART1_Data.US1_c_Min_mA3=50;
	 }
	 if(USART_Data.USART1_Data.US1_c_Min_mA4 > 1000 || USART_Data.USART1_Data.US1_c_Min_mA4 < 0)
	 {
		USART_Data.USART1_Data.US1_c_Min_mA4=50;
	 }
	 if(USART_Data.USART1_Data.US1_c_Min_mA5 > 1000 || USART_Data.USART1_Data.US1_c_Min_mA5 < 0)
	 {
		USART_Data.USART1_Data.US1_c_Min_mA5=50;
	 }
	  if(USART_Data.USART1_Data.US1_c_Min_mA6 > 1000 || USART_Data.USART1_Data.US1_c_Min_mA6 < 0)
	 {
		USART_Data.USART1_Data.US1_c_Min_mA6=50;
	 }
	 if(USART_Data.USART1_Data.US1_c_Min_mA7 > 1000 || USART_Data.USART1_Data.US1_c_Min_mA7 < 0)
	 {
		USART_Data.USART1_Data.US1_c_Min_mA7=50;
	 }
	 if(USART_Data.USART1_Data.US1_c_Min_mA8 > 1000 || USART_Data.USART1_Data.US1_c_Min_mA8 < 0)
	 {
		USART_Data.USART1_Data.US1_c_Min_mA8=50;
	 }
	 if(USART_Data.USART1_Data.US1_c_Max_mA1 > 1000 || USART_Data.USART1_Data.US1_c_Max_mA1 < 0)
	 {
		USART_Data.USART1_Data.US1_c_Max_mA1=50;
	 }
	 if(USART_Data.USART1_Data.US1_c_Max_mA2 > 1000 || USART_Data.USART1_Data.US1_c_Max_mA2 < 0)
	 {
		USART_Data.USART1_Data.US1_c_Max_mA2=50;
	 }
	 if(USART_Data.USART1_Data.US1_c_Max_mA3 > 1000 || USART_Data.USART1_Data.US1_c_Max_mA3 < 0)
	 {
		USART_Data.USART1_Data.US1_c_Max_mA3=50;
	 }
	 
	 if(USART_Data.USART1_Data.US1_c_Max_mA4 > 1000 || USART_Data.USART1_Data.US1_c_Max_mA4 < 0)
	 {
		USART_Data.USART1_Data.US1_c_Max_mA4=50;
	 }
	 if(USART_Data.USART1_Data.US1_c_Max_mA5 > 1000 || USART_Data.USART1_Data.US1_c_Max_mA5 < 0)
	 {
		USART_Data.USART1_Data.US1_c_Max_mA5=50;
	 }
	 if(USART_Data.USART1_Data.US1_c_Max_mA6 > 1000 || USART_Data.USART1_Data.US1_c_Max_mA6 < 0)
	 {
		USART_Data.USART1_Data.US1_c_Max_mA6=50;
	 }
	 if(USART_Data.USART1_Data.US1_c_Max_mA7 > 1000 || USART_Data.USART1_Data.US1_c_Max_mA7 < 0)
	 {
		USART_Data.USART1_Data.US1_c_Max_mA7=50;
	 }
	 if(USART_Data.USART1_Data.US1_c_Max_mA8 > 1000 || USART_Data.USART1_Data.US1_c_Max_mA8 < 0)
	 {
		USART_Data.USART1_Data.US1_c_Max_mA8=50;
	 }
	 
	 
}
	
	
	

void ReadData(I2C_HandleTypeDef* i2cHandle,unsigned char *str_DATA,unsigned short int len)
{
	HAL_I2C_Mem_Read_DMA(i2cHandle,0xA1,0, I2C_MEMADD_SIZE_8BIT,str_DATA,len);
}

//unsigned char dwrgwergwrg=0;
HAL_StatusTypeDef WriteData(I2C_HandleTypeDef* i2cHandle,unsigned char *str_DATA,unsigned short int len)
{

	static HAL_StatusTypeDef communicationState; 
	unsigned char pageNum=0;
	unsigned char countNum=0;	
	pageNum = len/16;
	if(len & 0x0f)pageNum++;
	
	while(pageNum)
	{
		
//查询标记位老是返回 HAL忙
//		if(HAL_I2C_Mem_Write_DMA(&hi2c1,0xA0,countNum,I2C_MEMADD_SIZE_8BIT,str_DATA+countNum,16) == HAL_OK)
//		{
//			pageNum--;
//			countNum+=16;			
//		}
	
		if((communicationState = HAL_I2C_Mem_Write_DMA(&hi2c1,0xA0,countNum,I2C_MEMADD_SIZE_8BIT,str_DATA+countNum,16)) != HAL_OK )
		{
			return communicationState;
		}
		pageNum--;
		countNum+=16;	
		HAL_Delay(50);		
	}
}





