

#include "uiPro.h"
#include "config.h"
#include "stdio.h"	//使用printf函数需引用的头文件
#include <string.h>
#include  <stdio.h>
#include <stdlib.h>
//#include "main.h"
#include "dma.h"
#include "i2c.h"
#include "tim.h"
#include "usart.h"
#include "gpio.h"
#include "processing.h"


#define WindowsTxtStrLen 40
const  char WindowsTxtStr[][WindowsTxtStrLen] =
{
    "电压6V ",
    "电压5V ",
    "电压AVCC ",
    "电压3.3V ",
//"电压测量 ",
//"电压测量 ",
//"电压测量 ",
/////////////////////////////////////////////	
	 "电源反接测试",
/////////////////////////////////////////////
	"校准初始化",
	"校准数据波动FINE ",
	"校准FINE100mA ",
	"校准FINE自检 ",
	"校准FINE DAC ",
	"校准电流FINE ",
	"校准数值FINE ",
	"校准波动FINE ",
	
	"校准模式切换",
	"校准数据波动HIGH ",
	"校准校准HIGH60mA ",
	"校准HIGH自检 ",
	"校准HIGH DAC ",
	"校准电流HIGH ",
	"校准数值HIGH ",
	"校准波动HIGH ",
	/////////////////////////////////////////////
    "数码管1",
    "数码管2",
    "数码管3",
    "数码管4",
    "数码管5",
    "数码管6",
    "数码管7",
    "数码管8",
    "消耗电流 ",
    "输入线",
	/////////////////////////////////////////////
    "NPN漏电电流 ",
    "NPN带载电流 ",
    "NPN自检负载 ",
	"NPN短路自检 ",
	"NPN短路带载自检 ",
	"NPN短路带载 ",
	"NPN残余电流 ",
	"NPN残余电压 ",
	/////////////////////////////////////////////
    "PNP漏电电流 ",
    "PNP带载电流 ",
    "PNP自检负载 ",
	"PNP短路自检 ",
	"PNP短路带载自检 ",
	"PNP短路带载 ",
	"PNP残余电流 ",
	"PNP残余电压 ",
   
	
	"按键测试中",
	"按键测试 ",
};

//void PeripheralInitStatus()
//{

//	LED_R2(1);
//}
void VariableInitialization()
{
//    USART_Data.SeparatorString = '/';
	comVariableBlock.DeviceStatus=DS_Non;
	 comVariableBlock.MainStep=MS_non;
	comVariableBlock.AutoSetOrManual = 0;
	comVariableBlock.MeasureResults=ResultsNULL;
	comVariableBlock.BeepControl=0;
	SYS_tickTime.sys_ReceiveData_ms=99999;
	comVariableBlock.ProgressCoefficient =  100/((float)sizeof(WindowsTxtStr)/WindowsTxtStrLen-1);//计算出进度条的系数
}


void RemoveLetter(char *strLetter, char *strNoLetter)//移除字母
{
    for(unsigned char i = 0, n = 0; strLetter[i] != '\0'; i++)
    {
        if((strLetter[i] >= '0' && strLetter[i] <= '9') || strLetter[i] == '.')
        {
            strNoLetter[n++] = strLetter[i];
        }
    }

}



void DataFilling( char *str)//屏幕接收后填充数据
{
    char NoLetterStr[50] = {0}; //存放没有字母的字符串
	char StringLenBuf=0;
	static unsigned	char StringBuf[50];
	
	
    switch(str[0])
    {
        case 'a'://消耗电流
        {
			comVariableBlock.SaveDataFlag=1;
            if(str[2] == 'o' && str[3] == 'u' && str[4] == 't')
            {
                RemoveLetter(str, NoLetterStr);
                USART_Data.USART1_Data.US1_a_Voltage = strtod((char *)NoLetterStr, NULL);

            }
            else if(str[2] == 'm' && str[3] == 'a' && str[4] == 'x')
            {
                RemoveLetter(str, NoLetterStr);
                USART_Data.USART1_Data.US1_a_Max_mA = strtod((char *)NoLetterStr, NULL);
            }
            else if(str[2] == 'm' && str[3] == 'i' && str[4] == 'n')
            {
                RemoveLetter(str, NoLetterStr);
                USART_Data.USART1_Data.US1_a_Min_mA = strtod((char *)NoLetterStr, NULL);
            }
        }
        break;
        case 'p'://页面更改
        {
            if(strcmp((const char *)str, "page_main") == 0)
            {
                
				if(comVariableBlock.MeasureResults != ResultsTesting)
				{
					USART_Data.USART1_Data.US1_ReceiDataSucce_Flag=0;
					USART_Data.USART1_Data.PageNum = page_main;
					StringLenBuf = sprintf((char *)StringBuf, "page main%c%c%c", 0xFF, 0xFF, 0xFF); //
					HAL_UART_Transmit_IT(&UART_HANDLE_SCREEN, StringBuf, StringLenBuf);				
				}

            }
            else if(strcmp((const char *)str, "page_CurConsume_T") == 0)
            {
              
				if(comVariableBlock.MeasureResults != ResultsTesting)
				{  
					USART_Data.USART1_Data.US1_ReceiDataSucce_Flag=0;
					USART_Data.USART1_Data.PageNum = page_CurConsume_T;
					StringLenBuf = sprintf((char *)StringBuf, "page CC_T%c%c%c", 0xFF, 0xFF, 0xFF); //
					HAL_UART_Transmit_IT(&UART_HANDLE_SCREEN, StringBuf, StringLenBuf);					
				}

				
            }
            else if(strcmp((const char *)str, "page_KV_T") == 0)
            {
				if(comVariableBlock.MeasureResults != ResultsTesting)
				{ 
					USART_Data.USART1_Data.US1_ReceiDataSucce_Flag=0;
					USART_Data.USART1_Data.PageNum = page_KV_T;
					StringLenBuf = sprintf((char *)StringBuf, "page KV_T%c%c%c", 0xFF, 0xFF, 0xFF); //
					HAL_UART_Transmit_IT(&UART_HANDLE_SCREEN, StringBuf, StringLenBuf);					
				}

            }
            else if(strcmp((const char *)str, "page_HL_T") == 0)
            {
				if(comVariableBlock.MeasureResults != ResultsTesting)
				{ 
					USART_Data.USART1_Data.US1_ReceiDataSucce_Flag=0;
					USART_Data.USART1_Data.PageNum = page_HL_T;
					StringLenBuf = sprintf((char *)StringBuf, "page HL_T%c%c%c", 0xFF, 0xFF, 0xFF); //
					HAL_UART_Transmit_IT(&UART_HANDLE_SCREEN, StringBuf, StringLenBuf);					
				}
            }
            else if(strcmp((const char *)str, "page_Setting") == 0)
            {
				if(comVariableBlock.MeasureResults != ResultsTesting)
				{ 
					USART_Data.USART1_Data.US1_ReceiDataSucce_Flag=0;
					USART_Data.USART1_Data.PageNum = page_Setting;
					StringLenBuf = sprintf((char *)StringBuf, "page Setting%c%c%c", 0xFF, 0xFF, 0xFF); //
					HAL_UART_Transmit_IT(&UART_HANDLE_SCREEN, StringBuf, StringLenBuf);					
				}
            }else if(strcmp((const char *)str, "page_Data") == 0)
            {
				if(comVariableBlock.MeasureResults != ResultsTesting)
				{ 
					USART_Data.USART1_Data.US1_ReceiDataSucce_Flag=0;
					USART_Data.USART1_Data.PageNum = page_Data;
					StringLenBuf = sprintf((char *)StringBuf, "page Data%c%c%c", 0xFF, 0xFF, 0xFF); //
					HAL_UART_Transmit_IT(&UART_HANDLE_SCREEN, StringBuf, StringLenBuf);					
				}
            }else if(strcmp((const char *)str, "page_Button") == 0)
            {
				if(comVariableBlock.MeasureResults != ResultsTesting)
				{ 
					USART_Data.USART1_Data.US1_ReceiDataSucce_Flag=0;
					USART_Data.USART1_Data.PageNum = page_Button;
					StringLenBuf = sprintf((char *)StringBuf, "page Button%c%c%c", 0xFF, 0xFF, 0xFF); //
					HAL_UART_Transmit_IT(&UART_HANDLE_SCREEN, StringBuf, StringLenBuf);					
				}
            }else if(strcmp((const char *)str, "page_Cali") == 0)
            {
				if(comVariableBlock.MeasureResults != ResultsTesting)
				{ 
					USART_Data.USART1_Data.US1_ReceiDataSucce_Flag=0;
					USART_Data.USART1_Data.PageNum = page_Calibration;
					StringLenBuf = sprintf((char *)StringBuf, "page Cali%c%c%c", 0xFF, 0xFF, 0xFF); //
					HAL_UART_Transmit_IT(&UART_HANDLE_SCREEN, StringBuf, StringLenBuf);					
				}
            }
        }
        break;
        case 'b'://关键点电压
        {
			comVariableBlock.SaveDataFlag=1;
            if(str[2] == 'a')
            {
                RemoveLetter(str, NoLetterStr);
                USART_Data.USART1_Data.US1_b_Max_mA0 = strtod((char *)NoLetterStr, NULL);
            }else

            if(str[2] == 'b')
            {
                RemoveLetter(str, NoLetterStr);
                USART_Data.USART1_Data.US1_b_Min_mA0 = strtod((char *)NoLetterStr, NULL);
            }else

            if(str[2] == 'c')
            {
                RemoveLetter(str, NoLetterStr);
                USART_Data.USART1_Data.US1_b_Max_mA1 = strtod((char *)NoLetterStr, NULL);
            }else

            if(str[2] == 'd')
            {
                RemoveLetter(str, NoLetterStr);
                USART_Data.USART1_Data.US1_b_Min_mA1 = strtod((char *)NoLetterStr, NULL);
            }else

            if(str[2] == 'e')
            {
                RemoveLetter(str, NoLetterStr);
                USART_Data.USART1_Data.US1_b_Max_mA2 = strtod((char *)NoLetterStr, NULL);
            }else

            if(str[2] == 'f')
            {
                RemoveLetter(str, NoLetterStr);
                USART_Data.USART1_Data.US1_b_Min_mA2 = strtod((char *)NoLetterStr, NULL);
            }else

            if(str[2] == 'g')
            {
                RemoveLetter(str, NoLetterStr);
                USART_Data.USART1_Data.US1_b_Max_mA3 = strtod((char *)NoLetterStr, NULL);
            }else

            if(str[2] == 'h')
            {
                RemoveLetter(str, NoLetterStr);
                USART_Data.USART1_Data.US1_b_Min_mA3 = strtod((char *)NoLetterStr, NULL);
            }else

            if(str[2] == 'i')
            {
                RemoveLetter(str, NoLetterStr);
                USART_Data.USART1_Data.US1_b_Max_mA4 = strtod((char *)NoLetterStr, NULL);
            }else

            if(str[2] == 'z')
            {
                RemoveLetter(str, NoLetterStr);
                USART_Data.USART1_Data.US1_b_Min_mA4 = strtod((char *)NoLetterStr, NULL);
            }else

            if(str[2] == 'k')
            {
                RemoveLetter(str, NoLetterStr);
                USART_Data.USART1_Data.US1_b_Max_mA5 = strtod((char *)NoLetterStr, NULL);
            }else

            if(str[2] == 'l')
            {
                RemoveLetter(str, NoLetterStr);
                USART_Data.USART1_Data.US1_b_Min_mA5 = strtod((char *)NoLetterStr, NULL);
            }else

            if(str[2] == 'm')
            {
                RemoveLetter(str, NoLetterStr);
                USART_Data.USART1_Data.US1_b_Max_mA6 = strtod((char *)NoLetterStr, NULL);
            }else

            if(str[2] == 'n')
            {
                RemoveLetter(str, NoLetterStr);
                USART_Data.USART1_Data.US1_b_Min_mA6 = strtod((char *)NoLetterStr, NULL);
            }else

            if(str[2] == 'o')
            {
                RemoveLetter(str, NoLetterStr);
                USART_Data.USART1_Data.US1_b_Max_mA7 = strtod((char *)NoLetterStr, NULL);
            }else

            if(str[2] == 'p')
            {
                RemoveLetter(str, NoLetterStr);
                USART_Data.USART1_Data.US1_b_Min_mA7 = strtod((char *)NoLetterStr, NULL);
            }

        }
        break;
        case 'c'://高低负载
        {
			comVariableBlock.SaveDataFlag=1;
            if(str[2] == 'a')
            {
                RemoveLetter(str, NoLetterStr);
                USART_Data.USART1_Data.US1_c_Max_mA1 = strtod((char *)NoLetterStr, NULL);
            }else

            if(str[2] == 'b')
            {
                RemoveLetter(str, NoLetterStr);
                USART_Data.USART1_Data.US1_c_Min_mA1 = strtod((char *)NoLetterStr, NULL);
            }else

            if(str[2] == 'c')
            {
                RemoveLetter(str, NoLetterStr);
                USART_Data.USART1_Data.US1_c_Max_mA2 = strtod((char *)NoLetterStr, NULL);
            }else

            if(str[2] == 'd')
            {
                RemoveLetter(str, NoLetterStr);
                USART_Data.USART1_Data.US1_c_Min_mA2 = strtod((char *)NoLetterStr, NULL);
            }else

            if(str[2] == 'e')
            {
                RemoveLetter(str, NoLetterStr);
                USART_Data.USART1_Data.US1_c_Max_mA3 = strtod((char *)NoLetterStr, NULL);
            }else

            if(str[2] == 'f')
            {
                RemoveLetter(str, NoLetterStr);
                USART_Data.USART1_Data.US1_c_Min_mA3 = strtod((char *)NoLetterStr, NULL);
            }else

            if(str[2] == 'g')
            {
                RemoveLetter(str, NoLetterStr);
                USART_Data.USART1_Data.US1_c_Max_mA4 = strtod((char *)NoLetterStr, NULL);
            }else

            if(str[2] == 'h')
            {
                RemoveLetter(str, NoLetterStr);
                USART_Data.USART1_Data.US1_c_Min_mA4 = strtod((char *)NoLetterStr, NULL);
            }else

            if(str[2] == 'i')
            {
                RemoveLetter(str, NoLetterStr);
                USART_Data.USART1_Data.US1_c_Max_mA5 = strtod((char *)NoLetterStr, NULL);
            }else

            if(str[2] == 'z')
            {
                RemoveLetter(str, NoLetterStr);
                USART_Data.USART1_Data.US1_c_Min_mA5 = strtod((char *)NoLetterStr, NULL);
            }else

            if(str[2] == 'k')
            {
                RemoveLetter(str, NoLetterStr);
                USART_Data.USART1_Data.US1_c_Max_mA6 = strtod((char *)NoLetterStr, NULL);
            }else

            if(str[2] == 'l')
            {
                RemoveLetter(str, NoLetterStr);
                USART_Data.USART1_Data.US1_c_Min_mA6 = strtod((char *)NoLetterStr, NULL);
            }else

            if(str[2] == 'm')
            {
                RemoveLetter(str, NoLetterStr);
                USART_Data.USART1_Data.US1_c_Max_mA7 = strtod((char *)NoLetterStr, NULL);
            }else

            if(str[2] == 'n')
            {
                RemoveLetter(str, NoLetterStr);
                USART_Data.USART1_Data.US1_c_Min_mA7 = strtod((char *)NoLetterStr, NULL);
            }else

            if(str[2] == 'o')
            {
                RemoveLetter(str, NoLetterStr);
                USART_Data.USART1_Data.US1_c_Max_mA8 = strtod((char *)NoLetterStr, NULL);
            }else

            if(str[2] == 'p')
            {
                RemoveLetter(str, NoLetterStr);
                USART_Data.USART1_Data.US1_c_Min_mA8 = strtod((char *)NoLetterStr, NULL);
            }

        } break;
		case 'd'://主页面
		{
			
            if(str[2] == 'S' &&  str[4] == 'a')//启动
            {
				if(comVariableBlock.MeasureResults!=ResultsTesting)
				{
					comVariableBlock.StartDetecFlag=1;

				}
				StringLenBuf = sprintf((char *)StringBuf, "mainClickVa10.val=1000%c%c%c", 0xFF, 0xFF, 0xFF); //
			    HAL_UART_Transmit_IT(&UART_HANDLE_SCREEN, StringBuf, StringLenBuf);					
            }else
            if(str[2] == 'S' &&  str[4] == 'o')//停止
            {
				comVariableBlock.StopDetecFlag=1;
				StringLenBuf = sprintf((char *)StringBuf, "mainClickVa10.val=1000%c%c%c", 0xFF, 0xFF, 0xFF); //
				HAL_UART_Transmit_IT(&UART_HANDLE_SCREEN, StringBuf, StringLenBuf);		
            }else
			if(str[2] == 'R')
            {
				USART_Data.USART1_Data.US1_ReceiDataSucce_Flag=0;
				comVariableBlock.StartRunLED=1;
            }else
			if(str[2] == 'c')
			{
				comVariableBlock.ScreenCommunicationState = 1;
			}
		
		}break;
		case 't'://时间
		{
            if(str[4] == 'Y')
            {
                RemoveLetter(str, NoLetterStr);
                comVariableBlock.TimYear = atoi((char *)NoLetterStr);
			}else
            if(str[4] == 'M')
            {
				
				if(str[5] == 'o')
				{
					RemoveLetter(str, NoLetterStr);
					comVariableBlock.TimMonth  = atoi((char *)NoLetterStr);				
				}
				if(str[5] == 'i')
				{
					RemoveLetter(str, NoLetterStr);
					comVariableBlock.TimMinute = atoi((char *)NoLetterStr);				
				}

            }else
			 if(str[4] == 'D')
            {
                RemoveLetter(str, NoLetterStr);
                comVariableBlock.TimDay= atoi((char *)NoLetterStr);
            }else
			if(str[4] == 'H')
            {
                RemoveLetter(str, NoLetterStr);
                comVariableBlock.TimHour  = atoi((char *)NoLetterStr);
            }else
			 if(str[4] == 'S')
            {
                RemoveLetter(str, NoLetterStr);
                comVariableBlock.TimSecond  = atoi((char *)NoLetterStr);
            }
		}break;
		
		case 'I'://按键
		{
			if(str[2]=='1')
			{
				for(char i=4,j=0;i<30;i++)
				{
					comVariableBlock.ID_SreeFindScreen[0][j++]=str[i];
				}	
			}else if(str[2]=='2')
			{
				for(char i=4,j=0;i<30;i++)
				{
					comVariableBlock.ID_SreeFindScreen[1][j++]=str[i];
				}	
			}else if(str[2]=='3')
			{
				for(char i=4,j=0;i<30;i++)
				{
					comVariableBlock.ID_SreeFindScreen[2][j++]=str[i];
				}	
			}else if(str[2]=='4')
			{
				for(char i=4,j=0;i<30;i++)
				{
					comVariableBlock.ID_SreeFindScreen[3][j++]=str[i];
				}	
			}
  
		}break;
		
		case 'L'://校准页面
		{
			
			comVariableBlock.SaveDataFlag=1;
            if(str[2] == 'a')
            {
                RemoveLetter(str, NoLetterStr);
                USART_Data.USART1_Data.US1_d_Max_Val = strtod((char *)NoLetterStr, NULL);
            }else 			 if(str[2] == 'b')
            {
                RemoveLetter(str, NoLetterStr);
                USART_Data.USART1_Data.US1_d_Max_Va2 = strtod((char *)NoLetterStr, NULL);
            }else            if(str[2] == 'c')
            {
                RemoveLetter(str, NoLetterStr);
                USART_Data.USART1_Data.US1_d_Max_Va3 = strtod((char *)NoLetterStr, NULL);
            }else            if(str[2] == 'd')
            {
                RemoveLetter(str, NoLetterStr);
                USART_Data.USART1_Data.US1_d_Max_Va4 = strtod((char *)NoLetterStr, NULL);
            }else            if(str[2] == 'e')
            {
                RemoveLetter(str, NoLetterStr);
                USART_Data.USART1_Data.US1_d_Max_Va5 = strtod((char *)NoLetterStr, NULL);
            }else            if(str[2] == 'f')
            {
                RemoveLetter(str, NoLetterStr);
                USART_Data.USART1_Data.US1_d_Min_Val = strtod((char *)NoLetterStr, NULL);
            }else            if(str[2] == 'g')
            {
                RemoveLetter(str, NoLetterStr);
                USART_Data.USART1_Data.US1_d_Min_Va2 = strtod((char *)NoLetterStr, NULL);
            }else            if(str[2] == 'h')
            {
                RemoveLetter(str, NoLetterStr);
                USART_Data.USART1_Data.US1_d_Min_Va3 = strtod((char *)NoLetterStr, NULL);
            }else            if(str[2] == 'i')
            {
                RemoveLetter(str, NoLetterStr);
                USART_Data.USART1_Data.US1_d_Min_Va4 = strtod((char *)NoLetterStr, NULL);
            }else            if(str[2] == 'z')
            {
                RemoveLetter(str, NoLetterStr);
                USART_Data.USART1_Data.US1_d_Min_Va5 = strtod((char *)NoLetterStr, NULL);
            }else            if(str[2] == 'k')
            {
                RemoveLetter(str, NoLetterStr);
                USART_Data.USART1_Data.US1_d_Max_Va6 = strtod((char *)NoLetterStr, NULL);
            }else            if(str[2] == 'l')
            {
                RemoveLetter(str, NoLetterStr);
                USART_Data.USART1_Data.US1_d_Max_Va7 = strtod((char *)NoLetterStr, NULL);
            }else            if(str[2] == 'm')
            {
                RemoveLetter(str, NoLetterStr);
                USART_Data.USART1_Data.US1_d_Max_Va8 = strtod((char *)NoLetterStr, NULL);
            }else            if(str[2] == 'n')
            {
                RemoveLetter(str, NoLetterStr);
                USART_Data.USART1_Data.US1_d_Max_Va9 = strtod((char *)NoLetterStr, NULL);
            }else            if(str[2] == 'o')
            {
                RemoveLetter(str, NoLetterStr);
                USART_Data.USART1_Data.US1_d_Max_Va10 = strtod((char *)NoLetterStr, NULL);
            }else            if(str[2] == 'p')
            {
                RemoveLetter(str, NoLetterStr);
                USART_Data.USART1_Data.US1_d_Min_Va6 = strtod((char *)NoLetterStr, NULL);
            }else            if(str[2] == 'q')
            {
                RemoveLetter(str, NoLetterStr);
                USART_Data.USART1_Data.US1_d_Min_Va7 = strtod((char *)NoLetterStr, NULL);
            }else			 if(str[2] == 'r')
            {
                RemoveLetter(str, NoLetterStr);
                USART_Data.USART1_Data.US1_d_Min_Va8 = strtod((char *)NoLetterStr, NULL);
            }else            if(str[2] == 's')
            {
                RemoveLetter(str, NoLetterStr);
                USART_Data.USART1_Data.US1_d_Min_Va9 = strtod((char *)NoLetterStr, NULL);
            }else            if(str[2] == 't')
            {
                RemoveLetter(str, NoLetterStr);
                USART_Data.USART1_Data.US1_d_Min_Va10 = strtod((char *)NoLetterStr, NULL);
            }
		}break;
    }
}


void StringSplitting(const char *str, char (*str_out)[CutApartBufLen], char *mark) //字符串分割
{
    for(unsigned int i = 0, n = 0, n1 = 0; str[i] != '\0'; i++)
    {
        if(str[i] != *mark )//&& ((str[i] >= '0' && str[i]<='9')|| str[i]=='.'))
        {
            str_out[n][n1++] = str[i];
        }
        else
        {
            if(str[i] == *mark)
            {
                str_out[n][n1] = '\0';
                DataFilling(str_out[n]);
                n++;
            }

            n1 = 0;
        }
    }
}


//0手动，1自动
char *SetAutoDetecMultimeter(char NoAuto_Auto, unsigned short int OutTime)
{
    static char ReturnNum = 0; //返回值，第一位是标记位，第二位是数值
    static unsigned char Sendstr[50] = {0};
    unsigned char SenfstrBu[][20] = {"CONF:AUTO OFF", "CONF:AUTO ON", "CONF:AUTO ?"};
    unsigned char len = 0;

    SYS_tickTime.sys_WaitOutTime_ms = 0;
    USART_Data.USART6_Data.US6_ReceiDataSucce_Flag = 0;
    USART_Data.USART6_Data.US6_SendDataSucce_Flag = 0;
	USART_Data.USART6_Data.US6_ReceiDataSucceCount=0;

    len = sprintf((char *)Sendstr, "%s%c%s%c", SenfstrBu[NoAuto_Auto], 0x0A, SenfstrBu[2], 0x0A);
    HAL_UART_Transmit_IT(&UART_HANDLE_MULTIMETER, Sendstr, len);

    while(1)
    {
        if(SYS_tickTime.sys_WaitOutTime_ms > OutTime)
        {
            ReturnNum = 1;
            return &ReturnNum;
        }

        if(USART_Data.USART6_Data.US6_SendDataSucce_Flag == 1)
        {
            SYS_tickTime.sys_WaitOutTime_ms = 0;
            break;
        }
    }

    while(1)
    {
        if(SYS_tickTime.sys_WaitOutTime_ms > OutTime)
        {
            ReturnNum = 1;
            return &ReturnNum;
        }

        if(USART_Data.USART6_Data.US6_ReceiDataSucce_Flag == 1)
        {
            if(NoAuto_Auto == USART_Data.USART6_Data.US6_ReceiveDataNum[0])//验证是否设定成功
            {
                SYS_tickTime.sys_WaitOutTime_ms = 0;
                break;
            }

        }
    }

    ReturnNum = 0;
    return &ReturnNum;
}


//unsigned char Sendstr[50]={0};



char *GetMultimeter(unsigned char C_V, unsigned short int OutTime) //0是DC电流，1是DC电压，2是AC电压
{
    static char ReturnNum = 0; //返回值，第一位是标记位，第二位是数值
	static  unsigned char Sendstr[50] = {0};
    unsigned char SenfstrBuf1[][50] = {"CONFigure:FUNCtion?","CONFigure:RANGe?", "CONF:VOLT:DC 20","VAL1?"};
    unsigned char SenfstrBuf2[][50] = {"CONFigure:FUNCtion?","CONFigure:RANGe?", "CONF:CURR:DC 10e-2","VAL1?"};
    unsigned char SenfstrBuf3[][50] = {"CONFigure:FUNCtion?","CONFigure:RANGe?","CONF:VOLT:AC 20","VAL1?"};
    unsigned char CompareStr[][50] = {"VOLT","CURR","VOLT:AC","20"};
    unsigned char CompareStrAddEnd[50] = {0};
    unsigned char line = 0;
    unsigned char (*PointBuf)[50];
    static char SkipFlag=0;


    if(C_V == 0)
    {
        PointBuf = SenfstrBuf2;
        line = 1;
    }
    else if(C_V == 1)
    {
        PointBuf = SenfstrBuf1;
        line = 0;
    }
    else if(C_V == 2)
    {
        PointBuf = SenfstrBuf3;
        line = 2;
    }

    sprintf((char *)CompareStrAddEnd, "%s%c%c", CompareStr[line], 0x0D, 0x0A);

    for(char i = 0, len = 0; i < 4; i++)
    {
        USART_Data.USART6_Data.US6_SendDataSucce_Flag = 0;
        USART_Data.USART6_Data.US6_ReceiDataSucce_Flag = 0;
        USART_Data.USART6_Data.US6_ReceiDataSucceCount = 0;
        SYS_tickTime.sys_WaitOutTime_ms = 0;
        len = sprintf((char *)Sendstr, "%s%c", PointBuf[i], 0x0A);
        HAL_UART_Transmit_IT(&UART_HANDLE_MULTIMETER, Sendstr, len);

        while(1)
        {
            if(SYS_tickTime.sys_WaitOutTime_ms > OutTime)
            {
                ReturnNum = 1;
                return &ReturnNum;
            }

            if(USART_Data.USART6_Data.US6_SendDataSucce_Flag == 1)
            {
                SYS_tickTime.sys_WaitOutTime_ms = 0;
                break;
            }
        }

        if(i == 0 || i == 1||i == 3)
        {
            while(1)
            {
                if(SYS_tickTime.sys_WaitOutTime_ms > OutTime)
                {
                    ReturnNum = 1;
                    return &ReturnNum;
                }

                if(USART_Data.USART6_Data.US6_ReceiDataSucce_Flag == 1)
                {
                    break;
                }
            }
        }

        if(i == 0)
        {
            if(strcmp((char *)USART_Data.USART6_Data.US6_ReceiveDataStr[0], (char *)CompareStrAddEnd) == 0)
            {
				sprintf((char *)CompareStrAddEnd, "%s%c%c", CompareStr[3], 0x0D, 0x0A);
				SkipFlag++;
            }
			else
			{
				i = 1;
			}
			 continue;
        }
       if(i == 1)
        {
            if(strcmp((char *)USART_Data.USART6_Data.US6_ReceiveDataStr[0], (char *)CompareStrAddEnd) == 0)
            {
				if(SkipFlag==1)
				{
					i = 2;
				}               
                continue;
            }
        }
		
		
    }

    if(C_V == 0)
    {
        USART_Data.USART6_Data.US6_OutValCurrent = USART_Data.USART6_Data.US6_ReceiveDataNum[0] * 1000;

        if(USART_Data.USART6_Data.US6_OutValCurrent < 0)
        {
            USART_Data.USART6_Data.US6_OutValCurrent *= -1;
        }
    }
    else if(C_V == 1)
    {
        USART_Data.USART6_Data.US6_OutValVoltageDC = USART_Data.USART6_Data.US6_ReceiveDataNum[0];

        if(USART_Data.USART6_Data.US6_OutValVoltageDC < 0)
        {
            USART_Data.USART6_Data.US6_OutValVoltageDC *= -1;
        }
    }
    else if(C_V == 2)
    {
        USART_Data.USART6_Data.US6_OutValVoltageAC = USART_Data.USART6_Data.US6_ReceiveDataNum[0];

        if(USART_Data.USART6_Data.US6_OutValVoltageAC < 0)
        {
            USART_Data.USART6_Data.US6_OutValVoltageAC *= -1;
        }
    }

    ReturnNum = 0;
    return &ReturnNum;
}





//参数1：SetOrGet->0为设定电压数值
//参数2：1设定电流，2(获取输出电压、功率、电流)
char *SetPower(float SetValue, unsigned char Set_V0_C1_Get2, unsigned short int OutTime)
{
    unsigned char SendBuf[][20] = {"VOLTage ", "CURRent ", "MEASure: VOLTage ?", "MEASure: POWer ?", "MEASure: CURRent ?"};
    static char ReturnNum = 0; //
	static unsigned char SendstrTrue[70] = {0};
	static unsigned char Sendstr[30] = {0};
    unsigned char len = 0;
    

    USART_Data.USART3_Data.US3_ReceiDataSucceCount = 0;
    USART_Data.USART3_Data.US3_SendDataSucce_Flag = 0;
    USART_Data.USART3_Data.US3_ReceiDataSucce_Flag = 0;
    USART_Data.USART3_Data.US3_ReceiDataSucceCount = 0;
    SYS_tickTime.sys_WaitOutTime_ms = 0;

    if(Set_V0_C1_Get2 == 0)
    {
        len = sprintf((char *)SendstrTrue, "%s%f%c", SendBuf[0], SetValue, 0x0A);
    }

    if(Set_V0_C1_Get2 == 1)
    {
        len = sprintf((char *)SendstrTrue, "%s%f%c", SendBuf[1], SetValue, 0x0A);
    }

    if(Set_V0_C1_Get2 == 2)
    {
        len += sprintf((char *)SendstrTrue, "%s%c", SendBuf[2], 0x0A);
        len += sprintf((char *)Sendstr, "%s%c", SendBuf[3], 0x0A);
        strcat((char *)SendstrTrue, (char *)Sendstr); //拼接后面的字符串
        len += sprintf((char *)Sendstr, "%s%c", SendBuf[4], 0x0A);
        strcat((char *)SendstrTrue, (char *)Sendstr); //拼接后面的字符串
    }

    HAL_UART_Transmit_IT(&UART_HANDLE_POWER, SendstrTrue, len);

    while(1)
    {
        if(SYS_tickTime.sys_WaitOutTime_ms > OutTime)
        {
            ReturnNum = 1;
            return &ReturnNum;
        }

        if(USART_Data.USART3_Data.US3_SendDataSucce_Flag == 1)
        {
            SYS_tickTime.sys_WaitOutTime_ms = 0;

            if(Set_V0_C1_Get2 == 0 || Set_V0_C1_Get2 == 1) //设定电压为执行退出
            {
				
                return 0;
            }

            break;
        }
    }

    if(Set_V0_C1_Get2 == 2)
    {
        while(1)
        {
            if(SYS_tickTime.sys_WaitOutTime_ms > OutTime)
            {
                ReturnNum = 1;
                return &ReturnNum;
            }

            if(USART_Data.USART3_Data.US3_ReceiDataSucceCount == 3) //接收三个数据完成
            {
                break;
            }
        }
    }

    USART_Data.USART3_Data.US3_OutValVoltage = USART_Data.USART3_Data.US3_ReceiveDataNum[0];
    USART_Data.USART3_Data.US3_OutValPower = USART_Data.USART3_Data.US3_ReceiveDataNum[1];
    USART_Data.USART3_Data.US3_OutValCurrent = USART_Data.USART3_Data.US3_ReceiveDataNum[2];
    ReturnNum = 0;
    return &ReturnNum;
}




//SetOrCheck---0是设定，1是查询
//ON_OFF---0是关闭，1是开启
char *SetPowerOut(unsigned char SetOrCheck, unsigned char ON_OFF, unsigned short int OutTime)
{
    static char ReturnNum = 0;
    unsigned char SendBuf[][20] = {"OUTPut OFF", "OUTPut ON", "OUTPut ?"};
    static unsigned char SendstrTrue[20] = {0};
    unsigned char len = 0;
    USART_Data.USART3_Data.US3_ReceiDataSucceCount = 0;
    USART_Data.USART3_Data.US3_SendDataSucce_Flag = 0;
    USART_Data.USART3_Data.US3_ReceiDataSucce_Flag = 0;
    USART_Data.USART3_Data.US3_ReceiDataSucceCount = 0;
    SYS_tickTime.sys_WaitOutTime_ms = 0;

    if(SetOrCheck == 0)
    {
        len = sprintf((char *)SendstrTrue, "%s%c", SendBuf[ON_OFF], 0x0A);
    }
    else
    {
        len = sprintf((char *)SendstrTrue, "%s%c", SendBuf[2], 0x0A);
    }

    HAL_UART_Transmit_IT(&UART_HANDLE_POWER, SendstrTrue, len);

    while(1)
    {
        if(SYS_tickTime.sys_WaitOutTime_ms > OutTime)
        {
            ReturnNum = 1;
            return &ReturnNum;
        }

        if(USART_Data.USART3_Data.US3_SendDataSucce_Flag == 1)
        {
            SYS_tickTime.sys_WaitOutTime_ms = 0;
            break;
        }
    }

    if(SetOrCheck)
    {
        while(1)
        {
            if(SYS_tickTime.sys_WaitOutTime_ms > OutTime)
            {
                ReturnNum = 1;
                return &ReturnNum;
            }

            if(USART_Data.USART3_Data.US3_ReceiDataSucce_Flag == 1) //接收三个数据完成
            {
                break;
            }
        }
    }

    ReturnNum = 0;
    USART_Data.USART3_Data.US3_OutState = USART_Data.USART3_Data.US3_ReceiveDataNum[0];
    return &ReturnNum;
}

//unsigned char StringTrue[50];//单个

char *SensorTransmit(unsigned char *Str, unsigned short int OutTime)
{

    static unsigned char StringTrue[50];//单个
    static char  ReturnNum = 0;
    unsigned char len = 0;
    USART_Data.USART4_Data.US4_ReceiDataSucce_Flag = 0;
    USART_Data.USART4_Data.US4_SendDataSucce_Flag = 0;
    SYS_tickTime.sys_WaitOutTime_ms = 0;

    len = sprintf((char *)StringTrue, "%s%c", Str, 0x0a); //
    HAL_UART_Transmit_IT(&UART_HANDLE_SENSOR, StringTrue, len);

    while(1)
    {
        if(SYS_tickTime.sys_WaitOutTime_ms > OutTime)
        {
            ReturnNum = 1;
            return &ReturnNum;
        }

        if(USART_Data.USART4_Data.US4_SendDataSucce_Flag == 1)
        {
            SYS_tickTime.sys_WaitOutTime_ms = 0;
            break;
        }
    }

    while(1)
    {
        if(SYS_tickTime.sys_WaitOutTime_ms > OutTime)
        {
            ReturnNum = 1;
            return &ReturnNum;
        }

        if(USART_Data.USART4_Data.US4_ReceiDataSucce_Flag == 1) //接收三个数据完成
        {
            break;
        }
    }

    ReturnNum = 0;
    return &ReturnNum;

}

char *ScreenTransmit(USART_DataType *US_1, char (*str)[SendDataBuf_Len], unsigned char lines, unsigned short int OutTime)
{
    static char  ReturnNum = 0;
    static	unsigned char StringTrue[1024];	//总数
    unsigned short int StringLen = 0, StringLenBuf = 0;
    unsigned char StringBuf[SendDataBuf_Len+4]={0};//单个长度,加4是因为后面有结束符

    SYS_tickTime.sys_WaitOutTime_ms = 0;
    US_1->USART1_Data.US1_SendDataSucce_Flag = 0;

	StringTrue[0]='\0';//清零

    for(unsigned char i = 0; i < lines; i++)
    {
        StringLenBuf = sprintf((char *)StringBuf, "%s%c%c%c", str[i], 0xFF, 0xFF, 0xFF); //
//			StringLenBuf=sprintf((char *)StringBuf,"%s/xff/xff/xff",str[i]);//
        StringLen = StringLenBuf + StringLen;
        strcat((char *)StringTrue, (char *)StringBuf);
    }

    HAL_UART_Transmit_IT(&UART_HANDLE_SCREEN, StringTrue, StringLen);

    while(1)
    {
        if(SYS_tickTime.sys_WaitOutTime_ms > OutTime)
        {
            ReturnNum = 1;
            return &ReturnNum;
        }

        if(US_1->USART1_Data.US1_SendDataSucce_Flag == 1)
        {
            SYS_tickTime.sys_WaitOutTime_ms = 0;
            break;
        }
    }

    ReturnNum = 0;
    return &ReturnNum;
}


//const char *num 不带参数就放一个空格,两个空格就发空格
void StringChangeLine(char *StrResult, char *str, const char *num, char DeviceNum)
{
    char StrTemp_1 = 0;

    for(unsigned char  i = 0, len = strlen(str); i < len; i++)
    {
        StrResult[i] = str[i];
		StrResult[i+1] = '\0';
    }

    if(DeviceNum == 0)//程控电源和台式万用表使用
    {
        if(num[0] != ' ')
        {
            strcat(StrResult, num); //拼接后面的字符串，带参数的指令
        }
    }
    else if(DeviceNum == 1) //屏幕设备使用
    {
        if(num[0] != ' ')
        {
            sprintf(&StrTemp_1, "%c", '"'); //
            strcat(StrResult, &StrTemp_1);
            strcat(StrResult, num);
            strcat(StrResult, &StrTemp_1);
        }
        else if(num[0] == ' ' && num[1] == ' ')
        {
            sprintf(&StrTemp_1, "%c", '"'); //
            strcat(StrResult, &StrTemp_1);
            strcat(StrResult, " ");
            strcat(StrResult, &StrTemp_1);
        }
    }

}
//0是PNP,1是NPN
void PWMSetCurrent(char PNP_NPN, unsigned short int  Current)
{
    float temp = 0;
    if(PNP_NPN)
    {
        temp = (Current - comVariableBlock.Coefficient_NPN_B) / (comVariableBlock.Coefficient_NPN_A);
        htim2.Instance->CCR3 = temp;
    }
    else
    {
        temp = (Current -comVariableBlock.Coefficient_PNP_B) / (comVariableBlock.Coefficient_PNP_A);
        htim9.Instance->CCR2 = temp;

    }
//    if(PNP_NPN)
//    {
//        temp = (Current - 323.9308) / (-0.00781974);
//        htim2.Instance->CCR3 = temp;
//    }
//    else
//    {
//        temp = (Current - 296.41794) / (-0.00708813);
//        htim9.Instance->CCR2 = temp;

//    }
}



/*
ResultStr 拼接后面的字符串
Result 0 是no  1是ok
Restart 1是复位
OutTime 超时
*/
char *OutWindowsTxt2( unsigned char *ResultStr, unsigned char Result, char Restart, unsigned short int OutTime)
{

    static  unsigned char OutWindowsTxtBuf1[40] = {0}; //每一行最大的数量
    static  unsigned char OutWindowsTxtBuf2[1024] = {0}; //
    static  unsigned char OutWindowsTxtSend[1024] = {0}; //
    static  unsigned char i = 0;
    static unsigned short int Val_y = 0;
    static unsigned char Result_TxtTrs[][10] = {"NO", "OK", "..."};
	static  unsigned char StopShow[] = " ----";
	static  unsigned char StopShow1[] = " SEN-Er";
    unsigned short int Len = 0;
    static char  ReturnNum = 0;

	
	
    if(Restart)
    {
		OutWindowsTxtBuf1[0]='\0';
		OutWindowsTxtBuf2[0]='\0';
		OutWindowsTxtSend[0]='\0';
        i = 0;
        Val_y = 0;
    }

	comVariableBlock.Progress = i*comVariableBlock.ProgressCoefficient+0.5f;
	if(comVariableBlock.Progress>100.0f)
	{
		comVariableBlock.Progress = 100;
	}


	if(comVariableBlock.StopDetecFlag==1)//停止标记位
	{
		ResultStr=&StopShow;
		HAL_Delay(5);//防止和屏幕中断停止冲突
	}
	
	if(comVariableBlock.MainStep != MS_SelfChecking && comVariableBlock.MainStep != MS_PageKeyVoltage_T )
	{
		if(comVariableBlock.DeviceStatus==DS_Error_USART4)
		{
			ResultStr=&StopShow1;
			comVariableBlock.StopDetecFlag=1;		
		}

	}
    SYS_tickTime.sys_WaitOutTime_ms = 0;
    USART_Data.USART1_Data.US1_SendDataSucce_Flag = 0;

    sprintf((char *)OutWindowsTxtBuf1, "%s%s%c%s%c%c", WindowsTxtStr[i], ResultStr, 0x20, Result_TxtTrs[Result], 0x0d, 0x0a); //拼接结果和换行字符
    strcat((char *)OutWindowsTxtBuf2, (char *)OutWindowsTxtBuf1); //累加字符串
    Len = sprintf((char *)OutWindowsTxtSend, "main.mainOutTxt.txt=%c%s%c%c%c%c", '"', OutWindowsTxtBuf2, '"', 0xff, 0xff, 0xff);

	Len+=sprintf((char *)OutWindowsTxtBuf1, "main.mainj0.val=%d%c%c%c",comVariableBlock.Progress, 0xff, 0xff, 0xff);  //拼接进度条
	strcat((char *)OutWindowsTxtSend, (char *)OutWindowsTxtBuf1); //进度条

	Len+=sprintf((char *)OutWindowsTxtBuf1, "main.mainT0.txt=%c%d%%%c%c%c%c",'"',comVariableBlock.Progress,'"', 0xff, 0xff, 0xff);  //拼接进度条
	strcat((char *)OutWindowsTxtSend, (char *)OutWindowsTxtBuf1); //进度百分比
	
    HAL_UART_Transmit_IT(&UART_HANDLE_SCREEN, OutWindowsTxtSend, Len);
    i++;

    while(1)
    {
        if(SYS_tickTime.sys_WaitOutTime_ms > OutTime)
        {
//            ReturnNum = 1;
			ReturnNum = 0;//因为和停止标记位冲突 所以改成返回0
            return &ReturnNum;
        }

        if(USART_Data.USART1_Data.US1_SendDataSucce_Flag == 1)
        {
            SYS_tickTime.sys_WaitOutTime_ms = 0;
            break;
        }
    }

    if(i >= 15)//到了行数要滑动
    {
        Val_y += 30;
        SYS_tickTime.sys_WaitOutTime_ms = 0;
        USART_Data.USART1_Data.US1_SendDataSucce_Flag = 0;
        Len = sprintf((char *)OutWindowsTxtSend, "main.mainOutTxt.val_y=%d%c%c%c", Val_y, 0xff, 0xff, 0xff); //
        HAL_UART_Transmit_IT(&UART_HANDLE_SCREEN, OutWindowsTxtSend, Len);

        while(1)
        {
            if(SYS_tickTime.sys_WaitOutTime_ms > OutTime)
            {
//				ReturnNum = 1;
                ReturnNum = 0;//因为和停止标记位冲突 所以改成返回0
                return &ReturnNum;
            }

            if(USART_Data.USART1_Data.US1_SendDataSucce_Flag == 1)
            {
                SYS_tickTime.sys_WaitOutTime_ms = 0;
                break;
            }
        }
    }
	if(comVariableBlock.StopDetecFlag==1)//停止标记位
	{
		ReturnNum = 1;
		return &ReturnNum;
	}
    ReturnNum = 0;
    return &ReturnNum;
}



//0测试中，1成功，2失败，3停止，4失败（通讯失败没有ID的情况下）
char *MeasurResultTransmit(unsigned char Result, unsigned short int OutTime)
{
    static  unsigned char mainResultTxtSend[100] = {0}; //
    static  unsigned char mainResultTxtBuf[100] = {0}; //
    static char  ReturnNum = 0;

    unsigned char showTXT[][20] = {"测试中...", "通过", "失败","停止"};
    unsigned char mainResultTxtSendBuf[30] = "main.mainResultTxt.txt=";
    unsigned char mainResultTxtSendBuf1[30] = "main.mainResultTxt.bco=";
    unsigned char colour[][10] = {"65520", "2024", "63488","63488"}; //黄绿红
    unsigned char Len = 0;

	
	//记录结果
	if(Result==0)
	{
		comVariableBlock.MeasureResults=ResultsTesting;
	}else if(Result==1)
	{
		comVariableBlock.MeasureResults=ResultsSuccess;
		if(comVariableBlock.NumOfQualifiedFlag)
		{
			ID_TempResult[comVariableBlock.ID_RowCoordinate]=comVariableBlock.MeasureResults;
			comVariableBlock.NumOfQualifiedTotal++;
			comVariableBlock.NumOfQualified++;	
		}
		//相同的ID合格只能加一次
		if(comVariableBlock.NumOfQualifiedFlag==0)
		{
			if(ID_TempResult[comVariableBlock.ID_FineRowCoordinate]==ResultsFail||
				ID_TempResult[comVariableBlock.ID_FineRowCoordinate]==ResultsStop)
			{
				ID_TempResult[comVariableBlock.ID_FineRowCoordinate]=ResultsSuccess;
				comVariableBlock.NumOfQualified++;	
				comVariableBlock.NumOfNQualified--;					
			}
		}
		
		
	}else if(Result==2)
	{
		comVariableBlock.MeasureResults=ResultsFail;
		ID_TempResult[comVariableBlock.ID_RowCoordinate]=comVariableBlock.MeasureResults;
		if(comVariableBlock.NumOfQualifiedFlag)
		{
			comVariableBlock.NumOfQualifiedTotal++;
			comVariableBlock.NumOfNQualified++;	
		}
	
	}else if(Result==3)
	{
		comVariableBlock.MeasureResults=ResultsStop;
		ID_TempResult[comVariableBlock.ID_RowCoordinate]=comVariableBlock.MeasureResults;
	}else if(Result==4)
	{
		comVariableBlock.MeasureResults=ResultsFail;
		Result=2;
	}

	
    SYS_tickTime.sys_WaitOutTime_ms = 0;
    USART_Data.USART1_Data.US1_SendDataSucce_Flag = 0;

    Len = sprintf((char *)mainResultTxtSend, "%s%c%s%c%c%c%c",
                  mainResultTxtSendBuf, '"',showTXT[Result], '"', 0xff, 0xff, 0xff); //拼接结果和换行字符


    Len += sprintf((char *)mainResultTxtBuf, "%s%s%c%c%c",
                   mainResultTxtSendBuf1, colour[Result], 0xff, 0xff, 0xff); //拼接结果和换行字符

    strcat((char *)mainResultTxtSend, (char *)mainResultTxtBuf); //累加字符串

    HAL_UART_Transmit_IT(&UART_HANDLE_SCREEN, mainResultTxtSend, Len);


    while(1)
    {
        if(SYS_tickTime.sys_WaitOutTime_ms > OutTime)
        {
            ReturnNum = 1;
            return &ReturnNum;
        }

        if(USART_Data.USART1_Data.US1_SendDataSucce_Flag == 1)
        {
            SYS_tickTime.sys_WaitOutTime_ms = 0;
            break;
        }
    }

    ReturnNum = 0;
    return &ReturnNum;
}




char Resend=1;//重发次数
char ResendTime=50;//重发次数
char *NixieTubeTransmit(unsigned char NumberOfTimes, char On_Off, unsigned short int OutTime)
{
    static char  ReturnNum = 0;
    static	unsigned char StringTrue[30] = {0};	//总数
    unsigned short int StringLen = 0;
    unsigned char str[][20] = {"TurnOnTheSeg", "TurnOffTheSeg"};


	for(int i=0;i<Resend;i++)
	{
		
		
		SYS_tickTime.sys_WaitOutTime_ms = 0;
		USART_Data.USART4_Data.US4_SendDataSucce_Flag = 0;
		USART_Data.USART4_Data.US4_ReceiDataSucce_Flag = 0;


		StringLen = sprintf((char *)StringTrue, "%s%d%c", str[On_Off], NumberOfTimes + 1, 0x0A); //
		HAL_UART_Transmit_IT(&UART_HANDLE_SENSOR, StringTrue, StringLen);

		while(1)
		{
			if(SYS_tickTime.sys_WaitOutTime_ms > OutTime)
			{
				ReturnNum = 1;
				return &ReturnNum;
			}

			if(USART_Data.USART4_Data.US4_SendDataSucce_Flag == 1)
			{
				SYS_tickTime.sys_WaitOutTime_ms = 0;
				break;
			}
		}

		while(1)
		{
			if(SYS_tickTime.sys_WaitOutTime_ms >ResendTime  && i<Resend )
			{
				break;
			}else if(SYS_tickTime.sys_WaitOutTime_ms > OutTime)
			{
				ReturnNum = 1;
				return &ReturnNum;				
			}
			if(USART_Data.USART4_Data.US4_ReceiDataSucce_Flag == 1) //传感器执行了返回ok 不执行没有数据返回
			{
				break;
			}
		}		
	}
    ReturnNum = 0;
    return &ReturnNum;

}

 //返回5是停止
char *SensorInstructionTransmit( char *Instruction, unsigned short int OutTime)
{
    static char  ReturnNum = 0;
	static unsigned char StringTrue[30] = {0};	//总数
    unsigned short int StringLen = 0;

	for( int i=0;i<Resend;i++)
	{
		
		USART_Data.USART4_Data.US4_SendDataSucce_Flag = 0;
		USART_Data.USART4_Data.US4_ReceiDataSucce_Flag = 0;

		StringLen = sprintf((char *)StringTrue, "%s%c", Instruction, 0x0A); //
		HAL_UART_Transmit_IT(&UART_HANDLE_SENSOR, StringTrue, StringLen);
		SYS_tickTime.sys_WaitOutTime_ms = 0;
		while(1)
		{
			if(SYS_tickTime.sys_WaitOutTime_ms > OutTime)
			{
				ReturnNum = 1;
				return &ReturnNum;
			}

			if(USART_Data.USART4_Data.US4_SendDataSucce_Flag == 1)
			{
				SYS_tickTime.sys_WaitOutTime_ms = 0;
				break;
			}
			
		}

		while(1)
		{
			//只有在主函数的时候停止标记位才生效,Test指令不快速停止
			if(USART_Data.USART1_Data.PageNum==page_main &&
				strcmp((const char *)"Test", Instruction) != 0 &&
				strcmp((const char *)"CheckID", Instruction) != 0	)
			{
			   if(comVariableBlock.StopDetecFlag==1)
			   {
					 ReturnNum = 5;
					 return &ReturnNum;		   
			   }		
			}
			if(SYS_tickTime.sys_WaitOutTime_ms >ResendTime  && i<Resend-1 )
			{
				break;
			}else if(SYS_tickTime.sys_WaitOutTime_ms > OutTime)
			{
				ReturnNum = 1;
				return &ReturnNum;				
			}

			if(USART_Data.USART4_Data.US4_ReceiDataSucce_Flag == 1) //传感器执行了返回ok 不执行没有数据返回
			{
				ReturnNum = 0;
				return &ReturnNum;
			}
		}	
	}

    ReturnNum = 0;
    return &ReturnNum;

}




 char My_Delay(uint32_t Delay)
{
  uint32_t tickstart = HAL_GetTick();
  uint32_t wait = Delay;

  /* Add a freq to guarantee minimum wait */
  if (wait < HAL_MAX_DELAY)
  {
    wait += (uint32_t)(uwTickFreq);
  }

  while((HAL_GetTick() - tickstart) < wait)
  {
	  	if(USART_Data.USART1_Data.PageNum==page_main)//只有在主函数的时候停止标记位才生效
		{
		  if(comVariableBlock.StopDetecFlag==1)
		  {
			 return 0;
		  }			
		}

  }
}

