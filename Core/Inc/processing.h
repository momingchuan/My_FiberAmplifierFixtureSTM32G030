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

#ifndef __PROCESSING_H__
#define __PROCESSING_H__

#ifdef __cplusplus
extern "C" {
#endif


#include "config.h"
//#include "main.h"
	
	
//void PeripheralInitStatus(void);	
void PWM_SetCurrent(unsigned char Current);
void VariableInitialization(void);
void StringSplitting(const char *str,char (*str_out)[CutApartBufLen],char *mark);
void StringChangeLine(char *StrResult,char *str, const char *num,char DeviceNum);	


char My_Delay(unsigned int Delay);	
	
char *ScreenTransmit(USART_DataType *USART_1,char (*str)[SendDataBuf_Len],unsigned char lines,unsigned short int OutTime);	
char *SetPowerOut(unsigned char SetOrCheck,unsigned char ON_OFF,unsigned short int OutTime);
char *SetPower(float SetValue,unsigned char Set_V0_C1_Get2,unsigned short int OutTime);
char *GetMultimeter(unsigned char C_V,unsigned short int OutTime);	
char *SetAutoDetecMultimeter(char NoAuto_Auto ,unsigned short int OutTime);
char *SensorTransmit(unsigned char *Str, unsigned short int OutTime);
char *SensorInstructionTransmit( char *Instruction,unsigned short int OutTime);
char *NixieTubeTransmit(unsigned char NumberOfTimes, char WriteOrRead,unsigned short int OutTime);
char *OutWindowsTxt2( unsigned char *ResultStr, unsigned char Result,char Restart,unsigned short int OutTime);
char *MeasurResultTransmit(unsigned char Result,unsigned short int OutTime);

void PWMSetCurrent(char PNP_NPN,unsigned short int  Current);	
	
#ifdef __cplusplus
}
#endif
#endif /*__ GPIO_H__ */

