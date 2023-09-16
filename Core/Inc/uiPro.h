





#ifndef __UIPro_H__
#define __UIPro_H__

#ifdef __cplusplus
extern "C" {
#endif

#include "config.h"
	
#define FRONT_END_MARK 0x0A
	
#define RANGE_PWM_MIN 86	 //往左
#define RANGE_PWM_MID 92
#define RANGE_PWM_MAX 98	//往右
	
#define  Motor htim8.Instance->CCR1	
	
	
#define CALIBRATION_TIME 10000//校准时间
	
	//次数加一

#define BEEP_SUCCESS 2
#define BEEP_FAIL 3
#define BEEP_MachineSelf 11


#define ID_ROW 26
#define ID_LINE 50
void BeepBeep(unsigned char *num);
void uiTime(void);		
char PageMain(USART_DataType *US, unsigned char *Start);//		
char *HighLowLoad(USART_DataType *US,unsigned char *AutoSetOrManual);
char *PageCurConsume_T(USART_DataType *US, unsigned char *AutoSetOrManual);//测试消耗电流
char *PageReversePower_T(USART_DataType *US, unsigned char *AutoSetOrManual);
char *PageKeyVoltage_T(USART_DataType *US, unsigned char *AutoSetOrManual);	
char *Setting(USART_DataType *US, unsigned char *AutoSetOrManual);
char *ButtonCheck(USART_DataType *US, unsigned char *AutoSetOrManual);
char *Calibration(USART_DataType *US, unsigned char *AutoSetOrManual);
int fillStr(char  (*p)[ID_ROW], char *fineGoal);
int fineStr( char  (*p)[ID_ROW], char *fineGoal);
void KM_Reset(void);
char SelfChecking(void);//运行自检
void POWER_UP(void);
char *ClealStrLetter(char *data,char letter);	
extern const	unsigned char PowerCommandString[][30];
extern	const unsigned char MultimeterCommandString[][30];
extern char ID_Temp[ID_LINE][ID_ROW];
extern char ID_TempResult[ID_LINE];	
#ifdef __cplusplus
}
#endif
#endif 



