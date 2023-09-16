#include "uiPro.h"

//#include "config.h"
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
#include "SDPro.h"


char ID_Temp[ID_LINE][ID_ROW];
char ID_TempResult[ID_LINE];


const unsigned char  SetStateStr[] =
{
    0x01,
    0x02,
    0x04,
    0x08,
    0x10,
    0x20,
    0x40,
    0x80
};

const unsigned char  ResetStateStr[] =
{
    0xfe,
    0xfd,
    0xfb,
    0xf7,
    0xef,
    0xdf,
    0xbf,
    0x7f
};


const unsigned char PowerCommandString[][30] =
{
    "OUTPut OFF",//0开启输出
    "OUTPut ON",//1
    "OUTPut ?",//2查询输出状态
    "VOLTage ",//3设定电压值 <设置值|MIN|MAX|UP|DOWN|DEF>
    "VOLTage ?",//4获取电压值
    "CURRent ", //5<设置值|MIN|MAX|UP|DOWN|DEF>
    "CURRent ?",//6查询电流值
    "MEASure: CURRent ?",//7查询输出的电流值
    "MEASure: POWer ?",//8查询输出的功率值
    "MEASure: VOLTage ?",//9查询当前测得的电压值
};

const unsigned char MultimeterCommandString[][30] =
{
    "CONF:VOLT:DC ",//0，Sets the voltage range to 2 volt.
    "CONF:VOLT:AC",//1，Sets the AC range to auto range.
    "CONF:VOLT:DCAC",//2，Sets the DC+AC voltage range to auto range.
    "CONF:RES 10e3",//3，Sets the range to 20k?.
    "CONF2:VOLT:AC",//4，Sets the measurement mode to AC voltage.
    "CONF:CURR:DC ",//5，Sets the DC current range to 20mA
    "MEAS:VOLT:DC?",// 6，Returns the DC voltage measurement as 0.010348 V
    "MEAS:CURR:DC?",//7 ，Returns the DC current measurement as 0.0703 mA
    "CONF:AUTO?",//8Returns the Auto-Range status of the function on the 2nd display.Return Parameter: 0|1, 1=Auto range, 0=Manual range
    "CONF:AUTO ",//9 Parameter: ON | OFF
    "VAL1?",//10显示1的值
    "CONF:CURR:DC 10e-2",//11,200mA量程
    "READ?",//12,Returns 1st and 2nd display value.
    "*RST",//Recalls default panel setup
};


enum ReturnState
{
	RS_Null=0,
	RS_OverTime,
	RS_StopState

};

GPIO_TypeDef *IO_IN_GPIO_Port[] =
{
    IO1_IN_GPIO_Port,
    IO2_IN_GPIO_Port,
    IO3_IN_GPIO_Port,
    IO4_IN_GPIO_Port,
    IO5_IN_GPIO_Port,
    IO6_IN_GPIO_Port,
    IO7_IN_GPIO_Port,
    IO8_IN_GPIO_Port,

};

const uint16_t IO_IN_Pin[] =
{
    IO1_IN_Pin,
    IO2_IN_Pin,
    IO3_IN_Pin,
    IO4_IN_Pin,
    IO5_IN_Pin,
    IO6_IN_Pin,
    IO7_IN_Pin,
    IO8_IN_Pin
};





void uiTime(void)
{
	static char ui_ms=0;
	

	
	ui_ms++;
	if(ui_ms >= 50)
	{
		if(KEY_1)
		{
//			LED_KEY_R(1);
			comVariableBlock.StopDetecFlag=1;
		}else
		{
//			LED_KEY_R(0);
		}
		if(KEY_2)
		{
//			LED_KEY_G(1);
		}else
		{
//			LED_KEY_G(0);
		}
		ui_ms=0;
	}

}

char *PageCurConsume_T(USART_DataType *US, unsigned char *AutoSetOrManual) //测试消耗电流
{
    static  char Result[2] = {0};
    static unsigned char Step = 0; //大步
    static unsigned char SmallStep = 1; //小步
    static  char StrTemp[20] = {0};
//    static  char KeyStrTemp[20] = {0}; //按键字符串

    if(USART_Data.USART1_Data.PageNum != USART_Data.USART1_Data.PageNumChange)
    {
        Step = 0;
        SmallStep = 1;
        USART_Data.USART1_Data.PageNumChange = USART_Data.USART1_Data.PageNum;
//		HAL_Delay(100);
    }

    if(*AutoSetOrManual == 1)
    {
        Result[1] = 0;
        Result[0] = 0;
        *AutoSetOrManual = 2;
        Step = 3;
        SmallStep = 2;
    }

    switch(Step)
    {

        case 0://查询
        {
            SetPowerOut(1, 0, 100);
            Step = 1;
        }
        break;

        case 1://发送结果,
        {
            Step = 2;
            US->USART1_Data.US1_SendAutoAdd = 0;

            if(HAL_GPIO_ReadPin(K_C_power_GPIO_Port, K_C_power_Pin) == GPIO_PIN_SET)
            {

                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "CC_T.CCB1.txt=", "KM_ON", 1);
            }
            else
            {
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "CC_T.CCB1.txt=", "KM_OFF", 1);
            }

            if(US->USART3_Data.US3_OutState == 1)
            {
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "CC_T.CCB2.txt=", "Power_ON", 1);
            }
            else
            {
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "CC_T.CCB2.txt=", "Power_OFF", 1);
            }

            if(HAL_GPIO_ReadPin(K_powerRv_GPIO_Port, K_powerRv_Pin) == GPIO_PIN_SET)
            {
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "CC_T.CCB3.txt=", "开启反接", 1);
            }
            else
            {
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "CC_T.CCB3.txt=", "关闭反接", 1);
            }



            sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_a_Max_mA); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "CCTxt0.txt=", StrTemp, 1);

            sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_a_Min_mA); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "CCTxt1.txt=", StrTemp, 1);

            sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_a_Voltage); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "CCTxt2.txt=", StrTemp, 1);

            ScreenTransmit(&USART_Data, US->USART1_Data.US1_SendDataBuf, US->USART1_Data.US1_SendAutoAdd, 1000);
        }
        break;

        case 2://按键响应
        {
			if(US->USART1_Data.US1_ReceiDataSucce_Flag==1)
			
//            if(strcmp((const char *)KeyStrTemp, US->USART1_Data.US1_CutApartBuf[0]) != 0 )
            {
				US->USART1_Data.US1_ReceiDataSucce_Flag=0;
                Step = 0;
//                strcpy(KeyStrTemp, US->USART1_Data.US1_CutApartBuf[0]);

                if(strcmp((const char *)US->USART1_Data.US1_CutApartBuf[0], "开启反接") == 0 )
                {
                    K_PowerRv(0);
                }
                else if(strcmp((const char *)US->USART1_Data.US1_CutApartBuf[0], "关闭反接") == 0 )
                {
                    K_PowerRv(1);

                }

                if(strcmp((const char *)US->USART1_Data.US1_CutApartBuf[0], "KM_ON") == 0 )
                {
                    K_C_Power(0);
                }
                else if(strcmp((const char *)US->USART1_Data.US1_CutApartBuf[0], "KM_OFF") == 0  )
                {
                    K_C_Power(1);
                }
                else if(strcmp((const char *)US->USART1_Data.US1_CutApartBuf[0], "Power_OFF") == 0 )
                {
                    SetPowerOut(0, 1, 1000);
                }
                else if(strcmp((const char *)US->USART1_Data.US1_CutApartBuf[0], "Power_ON") == 0  )
                {
                    SetPowerOut(0, 0, 1000);
                }
                else if(US->USART1_Data.US1_CutApartBuf[0][0] == 'a' &&
                        US->USART1_Data.US1_CutApartBuf[0][2] == 'o' &&
                        US->USART1_Data.US1_CutApartBuf[0][3] == 'u' &&
                        US->USART1_Data.US1_CutApartBuf[0][4] == 't' )
                {
                    Step = 3;
                    memset(US->USART1_Data.US1_CutApartBuf, 0, sizeof(US->USART1_Data.US1_CutApartBuf));
                }
            }
        }
        break;

        case 3://测试流程
        {

            if(SmallStep == 1)
            {
                SmallStep = 2;
                SYS_tickTime.sys_MeasuringTime_ms = 0;
                SetPower(US->USART1_Data.US1_a_Voltage, 0, 1000);	//设定电压
                SetPower(1, 1, 1000);	//设定电流
                SetPowerOut(0, 1, 1000);//打开输出
				
            }
            else if( SmallStep == 2)
            {
                SYS_tickTime.sys_sendTime_ms = 0;

                if(*AutoSetOrManual)
                {
                    SYS_tickTime.sys_MeasuringTime_ms = 1500;
                }

                if(SYS_tickTime.sys_MeasuringTime_ms >= 1500)
                {
					if(*SensorInstructionTransmit("Test", 100) )
					{
						SmallStep = 1;
						Step = 0;
						US->USART1_Data.US1_SendAutoAdd=0;
						StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "page Detec", " ", 1);
						StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "Detec.backPage.val=", "1", 0);
						StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "Detec.Succeed_txt.txt=", "传感器通讯失败，请检查传感器是否连接正常。", 1);
						ScreenTransmit(&USART_Data, US->USART1_Data.US1_SendDataBuf, US->USART1_Data.US1_SendAutoAdd, 1000);
					}else
					{
						KM_Reset();
						SmallStep = 3;
						K_C_Power(1);//开启电流检测
						SensorInstructionTransmit("TurnOnAllSeg", 1000);
						SensorInstructionTransmit("TurnOnTheLed", 1000);
						SetPower(0, 2, 1000);//去读输出参数
						My_Delay(200);
						GetMultimeter(0, 1000);//读取电流
						K_C_Power(0);//关闭电流检测				
					}
                }
            }
            else if( SmallStep == 3)//测试完成，发送结果到显示器
            {
                SmallStep = 1;
                Step = 0;
                US->USART1_Data.US1_SendAutoAdd = 0;

                sprintf(StrTemp, "%0.3fV", US->USART3_Data.US3_OutValVoltage); //
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++],
                                 "CCTxt3.txt=", StrTemp, 1);

                sprintf(StrTemp, "%0.3fA", US->USART3_Data.US3_OutValCurrent); //
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++],
                                 "CCTxt4.txt=", StrTemp, 1);

                sprintf(StrTemp, "%0.3fW", US->USART3_Data.US3_OutValPower); //
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++],
                                 "CCTxt5.txt=", StrTemp, 1);

                sprintf(StrTemp, "%0.3fmA", US->USART6_Data.US6_OutValCurrent); //
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++],
                                 "CCTxt6.txt=", StrTemp, 1);

                if(*AutoSetOrManual == 0)
                {
                    StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "page Detec", " ", 1);
                    StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "Detec.backPage.val=", "1", 0);
                }

                sprintf((char *)StrTemp, "%1.2f%s", US->USART6_Data.US6_OutValCurrent, "mA");
				US->USART1_Data.ConsumeCur = US->USART6_Data.US6_OutValCurrent;
                if(US->USART6_Data.US6_OutValCurrent > US->USART1_Data.US1_a_Min_mA &&
                        US->USART6_Data.US6_OutValCurrent < US->USART1_Data.US1_a_Max_mA )//通过
                {
					StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "CC_T.CCTxt6.bco=", "65535", 0);
                    StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "Detec.Succeed_txt.txt=", "测试成功  OK", 1);
					if(*AutoSetOrManual == 2)
                    {
						if(*OutWindowsTxt2((uint8_t *)StrTemp, 1, 0, 1000))
						{
							MeasurResultTransmit(3, 1000);
							*AutoSetOrManual = 0;
							Result[1] = 1;
							Result[0] = 1;
							return Result;
						}
					}
                }
                else//失败
                {
					StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "CC_T.CCTxt6.bco=", "63488", 0);
                    
                    StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "Detec.Succeed_txt.txt=", "测试失败  NO", 1);

                    if(*AutoSetOrManual == 2)
                    {
						
						if(*OutWindowsTxt2((uint8_t *)StrTemp, 0, 0, 1000))
						{
							MeasurResultTransmit(3, 1000);
						}else
						{
							MeasurResultTransmit(2, 1000);
						}
                        *AutoSetOrManual = 0;
                        Result[1] = 1;
                        Result[0] = 1;
                        return Result;
                    }

                }

                ScreenTransmit(&USART_Data, US->USART1_Data.US1_SendDataBuf, US->USART1_Data.US1_SendAutoAdd, 1000);
                *AutoSetOrManual = 0;
                Result[0] = 1;
                return Result;
            }
        }
        break;
    }

    Result[0] = 0;
    return Result;
}




char *PageReversePower_T(USART_DataType *US, unsigned char *AutoSetOrManual)
{
    static  char Result[2] = {0};
	*AutoSetOrManual = 0;

	
	if(*SensorInstructionTransmit("Test", 100))//检测通讯
	{
		MeasurResultTransmit(4, 1000);
		Result[1] = 1;
		Result[0] = 1;
		return Result;					
	}
	
    K_PowerRv(1);
    My_Delay(1000);
    K_PowerRv(0);
    My_Delay(1000);
	
	SensorInstructionTransmit("Test", 1000);//重新启动检测模式，因为断电了
    SensorInstructionTransmit("GetSelfTestResult", 2000);//sensor self-checking
	My_Delay(10);
    if(USART_Data.USART4_Data.US4_receiveData[0] == '0')
    {
        if(*OutWindowsTxt2("", 1, 0, 1000))
		{
			MeasurResultTransmit(3, 1000);
			*AutoSetOrManual = 0;
			Result[1] = 1;
			Result[0] = 1;
			return Result;
		}
    }
    else
    {
        if(*OutWindowsTxt2("", 0, 0, 1000))
		{
			MeasurResultTransmit(3, 1000);
		}else
		{
			MeasurResultTransmit(2, 1000);
		}
        Result[1] = 1;
        Result[0] = 1;
        return Result;
    }

    Result[1] = 0;
    Result[0] = 1;
    return Result;

}





char *PageKeyVoltage_T(USART_DataType *US, unsigned char *AutoSetOrManual) //0手动，1为自动,测试完成后返回1，没完成返回0
{
    static  char Result[2] = {0};
    static unsigned char Step = 0; //大步
    static unsigned char SmallStep = 1; //小步
    static  char StrTemp[20] = {0};
//    static  char KeyStrTemp[20] = {0}; //按键变化字符串
    static unsigned char SequenceStrManual[10] = {8, 10, 0, 2, 4, 0, 0, 5, 0}; //执行顺序
    static unsigned char SequenceStrAuto[10] = {2, 3, 4, 5, 6, 7, 8, 9, 10};
    static unsigned char *SequenceStrBuf;
    unsigned char NumStrTemp[50] = {0}; //数字转换



    if(*AutoSetOrManual == 1)
    {
        *AutoSetOrManual = 2;
        Step = 2;
        SmallStep = 1;
        Result[1] = 0;
        Result[0] = 0;
        SequenceStrBuf = SequenceStrManual;
    }


    if(USART_Data.USART1_Data.PageNum != USART_Data.USART1_Data.PageNumChange)
    {
        USART_Data.USART1_Data.PageNumChange = USART_Data.USART1_Data.PageNum;
        Step = 0;
        SmallStep = 1;
        SequenceStrBuf = SequenceStrAuto;
//		HAL_Delay(100);
    }

    switch(Step)
    {
        case 0://查询
        {
            Step = 1;
            US->USART1_Data.US1_SendAutoAdd = 0;


            if(HAL_GPIO_ReadPin(K_V_N_GPIO_Port, K_V_N_Pin) == GPIO_PIN_SET)
            {
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "KV_T.KVB1.txt=", "KMN_ON", 1);
            }
            else
            {
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "KV_T.KVB1.txt=", "KMN_OFF", 1);
            }

            if(HAL_GPIO_ReadPin(K_V_1_GPIO_Port, K_V_1_Pin) == GPIO_PIN_SET)
            {
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "KV_T.KVB2.txt=", "KM1_ON", 1);
            }
            else
            {
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "KV_T.KVB2.txt=", "KM1_OFF", 1);
            }

            if(HAL_GPIO_ReadPin(K_V_2_GPIO_Port, K_V_2_Pin) == GPIO_PIN_SET)
            {
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "KV_T.KVB3.txt=", "KM2_ON", 1);

            }
            else
            {
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "KV_T.KVB3.txt=", "KM2_OFF", 1);

            }

            if(HAL_GPIO_ReadPin(K_V_3_GPIO_Port, K_V_3_Pin) == GPIO_PIN_SET)
            {
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "KV_T.KVB4.txt=", "KM3_ON", 1);
            }
            else
            {
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "KV_T.KVB4.txt=", "KM3_OFF", 1);
            }

            if(HAL_GPIO_ReadPin(K_V_4_GPIO_Port, K_V_4_Pin) == GPIO_PIN_SET)
            {
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "KV_T.KVB5.txt=", "KM4_ON", 1);
            }
            else
            {
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "KV_T.KVB5.txt=", "KM4_OFF", 1);
            }

            if(HAL_GPIO_ReadPin(K_V_5_GPIO_Port, K_V_5_Pin) == GPIO_PIN_SET)
            {
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "KV_T.KVB6.txt=", "KM5_ON", 1);
            }
            else
            {
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "KV_T.KVB6.txt=", "KM5_OFF", 1);
            }

            if(HAL_GPIO_ReadPin(K_V_6_GPIO_Port, K_V_6_Pin) == GPIO_PIN_SET)
            {
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "KV_T.KVB7.txt=", "KM6_ON", 1);
            }
            else
            {
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "KV_T.KVB7.txt=", "KM6_OFF", 1);
            }

            if(HAL_GPIO_ReadPin(K_V_7_GPIO_Port, K_V_7_Pin) == GPIO_PIN_SET)
            {
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "KV_T.KVB8.txt=", "KM7_ON", 1);
            }
            else
            {
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "KV_T.KVB8.txt=", "KM7_OFF", 1);
            }

            if(HAL_GPIO_ReadPin(K_V_8_GPIO_Port, K_V_8_Pin) == GPIO_PIN_SET)
            {
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "KV_T.KVB9.txt=", "KM8_ON", 1);
            }
            else
            {
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "KV_T.KVB9.txt=", "KM8_OFF", 1);
            }




            sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_b_Max_mA0); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "KV_T.KVT2.txt=", StrTemp, 1);

            sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_b_Min_mA0); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "KV_T.KVT3.txt=", StrTemp, 1);

            sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_b_Max_mA1); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "KV_T.KVT5.txt=", StrTemp, 1);

            sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_b_Min_mA1); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "KV_T.KVT6.txt=", StrTemp, 1);

            sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_b_Max_mA2); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "KV_T.KVT8.txt=", StrTemp, 1);

            sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_b_Min_mA2); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "KV_T.KVT9.txt=", StrTemp, 1);

            sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_b_Max_mA3); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "KV_T.KVT11.txt=", StrTemp, 1);

            sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_b_Min_mA3); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "KV_T.KVT12.txt=", StrTemp, 1);

            sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_b_Max_mA4); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "KV_T.KVT14.txt=", StrTemp, 1);

            sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_b_Min_mA4); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "KV_T.KVT15.txt=", StrTemp, 1);

            sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_b_Max_mA5); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "KV_T.KVT17.txt=", StrTemp, 1);

            sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_b_Min_mA5); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "KV_T.KVT18.txt=", StrTemp, 1);

            sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_b_Max_mA6); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "KV_T.KVT20.txt=", StrTemp, 1);

            sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_b_Min_mA6); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "KV_T.KVT21.txt=", StrTemp, 1);

            sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_b_Max_mA7); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "KV_T.KVT23.txt=", StrTemp, 1);

            sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_b_Min_mA7); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "KV_T.KVT24.txt=", StrTemp, 1);

            ScreenTransmit(&USART_Data, US->USART1_Data.US1_SendDataBuf, US->USART1_Data.US1_SendAutoAdd, 1000);

        }
        break;

        case 1://按键响应
        {
			if(US->USART1_Data.US1_ReceiDataSucce_Flag ==1)
//            if(strcmp((const char *)KeyStrTemp, US->USART1_Data.US1_CutApartBuf[0]) != 0 )
            {
				US->USART1_Data.US1_ReceiDataSucce_Flag=0;
//                strcpy(KeyStrTemp, US->USART1_Data.US1_CutApartBuf[0]);
                Step = 0;

                if(strcmp((const char *)US->USART1_Data.US1_CutApartBuf[0], "KMN_ON") == 0 )
                {

                    K_V_N(0);

                }
                else if	(strcmp((const char *)US->USART1_Data.US1_CutApartBuf[0], "KMN_OFF") == 0 )
                {
                    K_V_N(1);


                }
                else if	(strcmp((const char *)US->USART1_Data.US1_CutApartBuf[0], "KM1_ON") == 0)
                {
                    K_V_1(0);
                }
                else if	(strcmp((const char *)US->USART1_Data.US1_CutApartBuf[0], "KM1_OFF") == 0 )
                {
                    K_V_1(1);
                    K_V_2(0);
                    K_V_3(0);
                    K_V_4(0);
                    K_V_5(0);
                    K_V_6(0);
                    K_V_7(0);
                    K_V_8(0);

                }
                else if	(strcmp((const char *)US->USART1_Data.US1_CutApartBuf[0], "KM2_ON") == 0 )
                {
                    K_V_2(0);
                }
                else if	(strcmp((const char *)US->USART1_Data.US1_CutApartBuf[0], "KM2_OFF") == 0 )
                {

                    K_V_1(0);
                    K_V_2(1);
                    K_V_3(0);
                    K_V_4(0);
                    K_V_5(0);
                    K_V_6(0);
                    K_V_7(0);
                    K_V_8(0);

                }
                else if	(strcmp((const char *)US->USART1_Data.US1_CutApartBuf[0], "KM3_ON") == 0 )
                {

                    K_V_3(0);


                }
                else if	(strcmp((const char *)US->USART1_Data.US1_CutApartBuf[0], "KM3_OFF") == 0 )
                {
                    K_V_1(0);
                    K_V_2(0);
                    K_V_3(1);
                    K_V_4(0);
                    K_V_5(0);
                    K_V_6(0);
                    K_V_7(0);
                    K_V_8(0);

                }
                else if	(strcmp((const char *)US->USART1_Data.US1_CutApartBuf[0], "KM4_ON") == 0 )
                {

                    K_V_4(0);


                }
                else if	(strcmp((const char *)US->USART1_Data.US1_CutApartBuf[0], "KM4_OFF") == 0 )
                {

                    K_V_1(0);
                    K_V_2(0);
                    K_V_3(0);
                    K_V_4(1);
                    K_V_5(0);
                    K_V_6(0);
                    K_V_7(0);
                    K_V_8(0);


                }
                else if	(strcmp((const char *)US->USART1_Data.US1_CutApartBuf[0], "KM5_ON") == 0 )
                {

                    K_V_5(0);


                }
                else if	(strcmp((const char *)US->USART1_Data.US1_CutApartBuf[0], "KM5_OFF") == 0)
                {

                    K_V_1(0);
                    K_V_2(0);
                    K_V_3(0);
                    K_V_4(0);
                    K_V_5(1);
                    K_V_6(0);
                    K_V_7(0);
                    K_V_8(0);

                }
                else if	(strcmp((const char *)US->USART1_Data.US1_CutApartBuf[0], "KM6_ON") == 0 )
                {

                    K_V_6(0);

                }
                else if	(strcmp((const char *)US->USART1_Data.US1_CutApartBuf[0], "KM6_OFF") == 0 )
                {

                    K_V_1(0);
                    K_V_2(0);
                    K_V_3(0);
                    K_V_4(0);
                    K_V_5(0);
                    K_V_6(1);
                    K_V_7(0);
                    K_V_8(0);

                }
                else if	(strcmp((const char *)US->USART1_Data.US1_CutApartBuf[0], "KM7_ON") == 0 )
                {

                    K_V_7(0);

                }
                else if	(strcmp((const char *)US->USART1_Data.US1_CutApartBuf[0], "KM7_OFF") == 0 )
                {


                    K_V_1(0);
                    K_V_2(0);
                    K_V_3(0);
                    K_V_4(0);
                    K_V_5(0);
                    K_V_6(0);
                    K_V_7(1);
                    K_V_8(0);

                }
                else if	(strcmp((const char *)US->USART1_Data.US1_CutApartBuf[0], "KM8_ON") == 0 )
                {

                    K_V_8(0);

                }
                else if	(strcmp((const char *)US->USART1_Data.US1_CutApartBuf[0], "KM8_OFF") == 0)
                {

                    K_V_1(0);
                    K_V_2(0);
                    K_V_3(0);
                    K_V_4(0);
                    K_V_5(0);
                    K_V_6(0);
                    K_V_7(0);
                    K_V_8(1);

                }
                else if(US->USART1_Data.US1_CutApartBuf[0][0] == 'b')  //开始测试
                {

                    Step = 2;
                    SmallStep = 1;
                }

            }
        }
        break;

        case 2://测试流程
        {

            if(SmallStep == 1)//初始化
            {
				KM_Reset();
                SmallStep = SequenceStrBuf[0];
                K_V_N(1);
                K_V_1(0);
                K_V_2(0);
                K_V_3(0);
                K_V_4(0);
                K_V_5(0);
                K_V_6(0);
                K_V_7(0);
                K_V_8(0);
                SetAutoDetecMultimeter(0, 1000);
                SetPowerOut(0, 1, 1000);
				My_Delay(50);
				
				US->USART1_Data.US1_SendAutoAdd = 0;
//				memset(US->USART1_Data.US1_SendDataBuf, 0, sizeof(US->USART1_Data.US1_SendDataBuf));
            }
            else if(SmallStep == 2)
            {
                SmallStep = SequenceStrBuf[1];
                K_V_1(1);
                K_V_2(0);
                K_V_3(0);
                K_V_4(0);
                K_V_5(0);
                K_V_6(0);
                K_V_7(0);
                K_V_8(0);
				My_Delay(80);
                GetMultimeter(1, 2000);
                US->USART1_Data.US1_b_Voltage0 = US->USART6_Data.US6_ReceiveDataNum[0];//保存
                sprintf((char *)NumStrTemp, "%1.2f%s", US->USART1_Data.US1_b_Voltage0, "V");

                if (US->USART1_Data.US1_b_Voltage0	>= US->USART1_Data.US1_b_Min_mA0
                        && US->USART1_Data.US1_b_Voltage0	<= US->USART1_Data.US1_b_Max_mA0 	)
                {
					StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "KV_T.KVT1.bco=", "65520", 0);
                    comVariableBlock.KeyPointVoltageResult |= SetStateStr[0];
                    
                    if(*AutoSetOrManual == 2)
                    {
						if(*OutWindowsTxt2(NumStrTemp, 1, 0, 1000))
						{
							MeasurResultTransmit(3, 1000);
							*AutoSetOrManual = 0;
							Result[1] = 1;
							Result[0] = 1;
							return Result;
						}
					}
                }
                else
                {
					
					StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "KV_T.KVT1.bco=", "63488", 0);
                    comVariableBlock.KeyPointVoltageResult &= ResetStateStr[0];
                    
                    if(*AutoSetOrManual == 2)
                    {
						OutWindowsTxt2(NumStrTemp, 0, 0, 1000);
                        *AutoSetOrManual = 0;
                        MeasurResultTransmit(2, 1000);
                        Result[1] = 1;
                        Result[0] = 1;
                        return Result;
                    }

                }

            }
            else if(SmallStep == 3 )
            {
                SmallStep = SequenceStrBuf[2];
                K_V_1(0);
                K_V_2(1);
                K_V_3(0);
                K_V_4(0);
                K_V_5(0);
                K_V_6(0);
                K_V_7(0);
                K_V_8(0);
                My_Delay(80);
                GetMultimeter(1, 2000);
                US->USART1_Data.US1_b_Voltage1 = US->USART6_Data.US6_ReceiveDataNum[0];
                sprintf((char *)NumStrTemp, "%1.2f%s", US->USART1_Data.US1_b_Voltage1, "V");

                if (US->USART1_Data.US1_b_Voltage1	>= US->USART1_Data.US1_b_Min_mA1
                        && US->USART1_Data.US1_b_Voltage1	<= US->USART1_Data.US1_b_Max_mA1 	)
                {
					StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "KV_T.KVT4.bco=", "65520", 0);
                    comVariableBlock.KeyPointVoltageResult |= SetStateStr[1];
                    
					 if(*AutoSetOrManual == 2)
                    {
						if(*OutWindowsTxt2(NumStrTemp, 1, 0, 1000))
						{
							MeasurResultTransmit(3, 1000);
							*AutoSetOrManual = 0;
							Result[1] = 1;
							Result[0] = 1;
							return Result;
						}
					}
                }
                else
                {

					
					StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "KV_T.KVT4.bco=", "63488", 0);
                    comVariableBlock.KeyPointVoltageResult &= ResetStateStr[1];
                    
                    if(*AutoSetOrManual == 2)
                    {
						OutWindowsTxt2(NumStrTemp, 0, 0, 1000);
                        *AutoSetOrManual = 0;
                        MeasurResultTransmit(2, 1000);
                        Result[1] = 1;
                        Result[0] = 1;
                        return Result;
                    }
					

                }


            }
            else if(SmallStep == 4 )
            {
                SmallStep = SequenceStrBuf[3];
                K_V_1(0);
                K_V_2(0);
                K_V_3(1);
                K_V_4(0);
                K_V_5(0);
                K_V_6(0);
                K_V_7(0);
                K_V_8(0);
                My_Delay(80);
                GetMultimeter(1, 2000);
                US->USART1_Data.US1_b_Voltage2 = US->USART6_Data.US6_ReceiveDataNum[0];
                sprintf((char *)NumStrTemp, "%1.2f%s", US->USART1_Data.US1_b_Voltage2, "V");

                if (US->USART1_Data.US1_b_Voltage2	>= US->USART1_Data.US1_b_Min_mA2
                        && US->USART1_Data.US1_b_Voltage2	<= US->USART1_Data.US1_b_Max_mA2 	)
                {
					StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "KV_T.KVT7.bco=", "65520", 0);
                    comVariableBlock.KeyPointVoltageResult |= SetStateStr[2];
					if(*AutoSetOrManual == 2)
                    {
						if(*OutWindowsTxt2(NumStrTemp, 1, 0, 1000))
						{
							MeasurResultTransmit(3, 1000);
							*AutoSetOrManual = 0;
							Result[1] = 1;
							Result[0] = 1;
							return Result;
						}
					}
                }
                else
                {
					StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "KV_T.KVT7.bco=", "63488", 0);
                    comVariableBlock.KeyPointVoltageResult &= ResetStateStr[2];
                    if(*AutoSetOrManual == 2)
                    {
						OutWindowsTxt2(NumStrTemp, 0, 0, 1000);
                        *AutoSetOrManual = 0;
                        MeasurResultTransmit(2, 1000);
                        Result[1] = 1;
                        Result[0] = 1;
                        return Result;
                    }
                }

            }
            else if(SmallStep == 5 )
            {

                SmallStep = SequenceStrBuf[4];
                K_V_1(0);
                K_V_2(0);
                K_V_3(0);
                K_V_4(1);
                K_V_5(0);
                K_V_6(0);
                K_V_7(0);
                K_V_8(0);
                My_Delay(80);
                GetMultimeter(1, 2000);
                US->USART1_Data.US1_b_Voltage3 = US->USART6_Data.US6_ReceiveDataNum[0];
                sprintf((char *)NumStrTemp, "%1.2f%s", US->USART1_Data.US1_b_Voltage3, "V");

                if (US->USART1_Data.US1_b_Voltage3	>= US->USART1_Data.US1_b_Min_mA3
                        && US->USART1_Data.US1_b_Voltage3	<= US->USART1_Data.US1_b_Max_mA3 	)
                {
					StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "KV_T.KVT10.bco=", "65520", 0);
                    comVariableBlock.KeyPointVoltageResult |= SetStateStr[3];
					if(*AutoSetOrManual == 2)
                    {
						if(*OutWindowsTxt2(NumStrTemp, 1, 0, 1000))
						{
							MeasurResultTransmit(3, 1000);
							*AutoSetOrManual = 0;
							Result[1] = 1;
							Result[0] = 1;
							return Result;
						}
					}
                }
                else
                {
					StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "KV_T.KVT10.bco=", "63488", 0);
                    comVariableBlock.KeyPointVoltageResult &= ResetStateStr[3];
                    if(*AutoSetOrManual == 2)
                    {
						OutWindowsTxt2(NumStrTemp, 0, 0, 1000);
                        *AutoSetOrManual = 0;
                        MeasurResultTransmit(2, 1000);
                        Result[1] = 1;
                        Result[0] = 1;
                        return Result;
                    }
                }

            }
            else if(SmallStep == 6 )
            {

                SmallStep = SequenceStrBuf[5];
                K_V_1(0);
                K_V_2(0);
                K_V_3(0);
                K_V_4(0);
                K_V_5(1);
                K_V_6(0);
                K_V_7(0);
                K_V_8(0);
                My_Delay(80);
                GetMultimeter(1, 2000);
                US->USART1_Data.US1_b_Voltage4 = US->USART6_Data.US6_ReceiveDataNum[0];

                sprintf((char *)NumStrTemp, "%1.2f%s", US->USART1_Data.US1_b_Voltage4, "V");

                if (US->USART1_Data.US1_b_Voltage4	>= US->USART1_Data.US1_b_Min_mA4
                        && US->USART1_Data.US1_b_Voltage4	<= US->USART1_Data.US1_b_Max_mA4	)
                {
					StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "KV_T.KVT13.bco=", "65520", 0);
                    comVariableBlock.KeyPointVoltageResult |= SetStateStr[4];
					if(*AutoSetOrManual == 2)
                    {
						if(*OutWindowsTxt2(NumStrTemp, 2, 0, 1000))
						{
							MeasurResultTransmit(3, 1000);
							*AutoSetOrManual = 0;
							Result[1] = 1;
							Result[0] = 1;
							return Result;
						}
					}
                }
                else
                {
					StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "KV_T.KVT13.bco=", "63488", 0);
                    comVariableBlock.KeyPointVoltageResult &= ResetStateStr[4];
                    if(*AutoSetOrManual == 2)
                    {
						OutWindowsTxt2(NumStrTemp, 2, 0, 1000);
                        *AutoSetOrManual = 0;
                        MeasurResultTransmit(2, 1000);
                        Result[1] = 1;
                        Result[0] = 1;
                        return Result;
                    }
                }

            }
            else if(SmallStep == 7 )
            {
                SmallStep = SequenceStrBuf[6];
                K_V_1(0);
                K_V_2(0);
                K_V_3(0);
                K_V_4(0);
                K_V_5(0);
//                K_V_6(1);//因为和气动的电磁阀共用了
                K_V_7(0);
                K_V_8(0);
                My_Delay(80);
                GetMultimeter(1, 2000);
                US->USART1_Data.US1_b_Voltage5 = US->USART6_Data.US6_ReceiveDataNum[0];
                sprintf((char *)NumStrTemp, "%1.2f%s", US->USART1_Data.US1_b_Voltage5, "V");

                if (US->USART1_Data.US1_b_Voltage5	>= US->USART1_Data.US1_b_Min_mA5
                        && US->USART1_Data.US1_b_Voltage5	<= US->USART1_Data.US1_b_Max_mA5	)
                {
					StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "KV_T.KVT16.bco=", "65520", 0);
                    comVariableBlock.KeyPointVoltageResult |= SetStateStr[5];
					if(*AutoSetOrManual == 2)
                    {
						if(*OutWindowsTxt2(NumStrTemp, 2, 0, 1000))
						{
							MeasurResultTransmit(3, 1000);
							*AutoSetOrManual = 0;
							Result[1] = 1;
							Result[0] = 1;
							return Result;
						}
					}
                }
                else
                {
					StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "KV_T.KVT16.bco=", "63488", 0);
                    comVariableBlock.KeyPointVoltageResult &= ResetStateStr[5];
                    if(*AutoSetOrManual == 2)
                    { 
						OutWindowsTxt2(NumStrTemp, 2, 0, 1000);
                        *AutoSetOrManual = 0;
                        MeasurResultTransmit(2, 1000);
                        Result[1] = 1;
                        Result[0] = 1;
                        return Result;
                    }
                }
            }
            else if(SmallStep == 8 )
            {
                SmallStep = SequenceStrBuf[7];
                K_V_1(0);
                K_V_2(0);
                K_V_3(0);
                K_V_4(0);
                K_V_5(0);
                K_V_6(0);
                K_V_7(1);
                K_V_8(0);

                My_Delay(80);
                GetMultimeter(1, 2000);
                US->USART1_Data.US1_b_Voltage6 = US->USART6_Data.US6_ReceiveDataNum[0];
                sprintf((char *)NumStrTemp, "%1.2f%s", US->USART1_Data.US1_b_Voltage6, "V");

                if (US->USART1_Data.US1_b_Voltage6	>= US->USART1_Data.US1_b_Min_mA6
                        && US->USART1_Data.US1_b_Voltage6	<= US->USART1_Data.US1_b_Max_mA6 	)
                {
					StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "KV_T.KVT19.bco=", "65520", 0);
                    comVariableBlock.KeyPointVoltageResult |= SetStateStr[6];
					if(*AutoSetOrManual == 2)
                    {
						if(*OutWindowsTxt2(NumStrTemp, 1, 1, 1000))
						{
							MeasurResultTransmit(3, 1000);
							*AutoSetOrManual = 0;
							Result[1] = 1;
							Result[0] = 1;
							return Result;
						}
					}
                }
                else
                {//NumStrTemp过长
					StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "KV_T.KVT19.bco=", "63488", 0);
                    comVariableBlock.KeyPointVoltageResult &= ResetStateStr[6];
                    if(*AutoSetOrManual == 2)
                    {
						OutWindowsTxt2(NumStrTemp, 0, 1, 1000);
                        *AutoSetOrManual = 0;
                        MeasurResultTransmit(2, 1000);
                        Result[1] = 1;
                        Result[0] = 1;
                        return Result;
                    }
                }
            }
            else if(SmallStep == 9 )
            {
                SmallStep = SequenceStrBuf[8];
                K_V_1(0);
                K_V_2(0);
                K_V_3(0);
                K_V_4(0);
                K_V_5(0);
                K_V_6(0);
                K_V_7(0);
                K_V_8(1);
                My_Delay(80);
                GetMultimeter(1, 2000);
                US->USART1_Data.US1_b_Voltage7 = US->USART6_Data.US6_ReceiveDataNum[0];
                sprintf((char *)NumStrTemp, "%1.2f%s", US->USART1_Data.US1_b_Voltage7, "V");

                if (US->USART1_Data.US1_b_Voltage7	>= US->USART1_Data.US1_b_Min_mA7
                        && US->USART1_Data.US1_b_Voltage7	<= US->USART1_Data.US1_b_Max_mA7	)
                {
					StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "KV_T.KVT22.bco=", "65520", 0);                   
                    comVariableBlock.KeyPointVoltageResult |= SetStateStr[7];
					if(*AutoSetOrManual == 2)
                    {
						if(*OutWindowsTxt2(NumStrTemp, 2, 0, 1000))
						{
							MeasurResultTransmit(3, 1000);
							*AutoSetOrManual = 0;
							Result[1] = 1;
							Result[0] = 1;
							return Result;
						}
					}
                }
                else
                {
					StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "KV_T.KVT22.bco=", "63488", 0);
                    comVariableBlock.KeyPointVoltageResult &= ResetStateStr[7];                   
                    if(*AutoSetOrManual == 2)
                    {
						OutWindowsTxt2(NumStrTemp, 2, 0, 1000);
                        *AutoSetOrManual = 0;
                        MeasurResultTransmit(2, 1000);
                        Result[1] = 1;
                        Result[0] = 1;
                        return Result;
                    }
                }


            }
            else if(SmallStep == 10)
            {
                K_V_N(0);
                K_V_1(0);
                K_V_2(0);
                K_V_3(0);
                K_V_4(0);
                K_V_5(0);
                K_V_6(0);
                K_V_7(0);
                K_V_8(0);


                if(*AutoSetOrManual == 2)
                {
                    *AutoSetOrManual = 0;
                    SmallStep = 12;
                }
                else
                {
                    SmallStep = 11;
                }


            }
            else if(SmallStep == 11)
            {


                SmallStep = 12;
                
                
                sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_b_Voltage0); //
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "KV_T.KVT1.txt=", StrTemp, 1);
                sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_b_Voltage1); //
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "KV_T.KVT4.txt=", StrTemp, 1);
                sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_b_Voltage2); //
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "KV_T.KVT7.txt=", StrTemp, 1);
                sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_b_Voltage3); //
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "KV_T.KVT10.txt=", StrTemp, 1);
                sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_b_Voltage4); //
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "KV_T.KVT13.txt=", StrTemp, 1);
                sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_b_Voltage5); //
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "KV_T.KVT16.txt=", StrTemp, 1);
                sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_b_Voltage6); //
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "KV_T.KVT19.txt=", StrTemp, 1);
                sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_b_Voltage7); //
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "KV_T.KVT22.txt=", StrTemp, 1);



                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "page Detec", " ", 1);
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "Detec.backPage.val=", "2", 0);



                if((comVariableBlock.KeyPointVoltageResult&0x4d) == 0x4d) //发送最总的结果
                {
                    StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "Detec.Succeed_txt.txt=", "测试成功  OK", 1);

                }
                else
                {
                    StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "Detec.Succeed_txt.txt=", "测试失败  NO", 1);
                }

                ScreenTransmit(&USART_Data, US->USART1_Data.US1_SendDataBuf, US->USART1_Data.US1_SendAutoAdd, 1000);
//                memset(US->USART1_Data.US1_CutApartBuf, 0, sizeof(US->USART1_Data.US1_CutApartBuf));	//擦除缓冲

            }
            else if(SmallStep == 12) //测量结束返回
            {
                Step = 0;
                SmallStep = 1;
                *AutoSetOrManual = 0;
                Result[0] = 1;
                return Result;
            }
        }

        break;
    }

    Result[0] = 0;
    return Result;

}



char *NixieTube(USART_DataType *US)
{
    static  char Result[2] = {0};
    static unsigned char Step = 0;
    char i = 0;

    switch(Step)
    {
        case 0:
        {
            comVariableBlock.NixieTubeResult &= 0x00;
            Step = 1;
        }
        break;

        case 1:
        {
            for(i = 0; i < 8; i++)
            {
                NixieTubeTransmit(i, 0, 1000);
                My_Delay(30);

                if((IO_IN_GPIO_Port[i]->IDR & IO_IN_Pin[i]) == (uint32_t)GPIO_PIN_RESET)
                {
                    comVariableBlock.NixieTubeResult |= SetStateStr[i];
					
                   if( *OutWindowsTxt2("", 1, 0, 1000))
				   {
					    MeasurResultTransmit(3, 1000);
						Result[1] = 1;
                        Result[0] = 1;
                        return Result;
					 
				   }
                }
                else
                {
                    if(*OutWindowsTxt2("", 0, 0, 1000))
					{
						MeasurResultTransmit(3, 1000);
					}else
					{
						MeasurResultTransmit(2, 1000);
					}
                    comVariableBlock.NixieTubeResult &= ResetStateStr[i];
                    Result[1] = 1;
                    Result[0] = 1;
                    return Result;
                }

                NixieTubeTransmit(i, 1, 1000);
                My_Delay(10);
            }

            if(i == 8)
            {
                Step = 0;
                Result[1] = 0;
                Result[0] = 1;
                return Result;

            }
        }
        break;
    }

    Result[0] = 0;
    return Result;
}


char *ExternalInputLine()
{
    static  char Result[2] = {0};
    IN_Test(0);
    SensorInstructionTransmit("GetInputState", 1000);
	My_Delay(10);
    if(USART_Data.USART4_Data.US4_receiveData[0] == '0')
    {
        comVariableBlock.ExternalInputLineResult = 1;
    }
    else
    {
        comVariableBlock.ExternalInputLineResult = 0;
    }

    IN_Test(1);
    SensorInstructionTransmit("GetInputState", 1000);
	My_Delay(10);
    if(USART_Data.USART4_Data.US4_receiveData[0] == '1')
    {
        comVariableBlock.ExternalInputLineResult = 1;
    }
    else
    {
        comVariableBlock.ExternalInputLineResult = 0;
    }

    if(comVariableBlock.ExternalInputLineResult)
    {
        if(*OutWindowsTxt2("", 1, 0, 1000))
		{
			MeasurResultTransmit(3, 1000);
			Result[1] = 1;
			Result[0] = 1;
			return Result;
		}
    }
    else
    {
        if(*OutWindowsTxt2("", 0, 0, 1000))
		{
			MeasurResultTransmit(3, 1000);
		}else
		{
			MeasurResultTransmit(2, 1000);
		}
        Result[1] = 1;
        Result[0] = 1;
        return Result;
    }

    Result[1] = 0;
    Result[0] = 1;
    return Result;
}


char *HighLowLoad(USART_DataType *US, unsigned char *AutoSetOrManual)
{
    static  char Result[2] = {0};
    static  unsigned char Step = 0; //大步
    static  unsigned char SmallStep = 1; //小步
    static  char StrTemp[20] = {0};
//    static  char KeyStrTemp[20] = {0}; //按键变化字符串


    if(USART_Data.USART1_Data.PageNum != USART_Data.USART1_Data.PageNumChange)
    {
        Step = 0;
        USART_Data.USART1_Data.PageNumChange = USART_Data.USART1_Data.PageNum;
//		HAL_Delay(100);
    }

    if(*AutoSetOrManual == 1)
    {
        *AutoSetOrManual = 2;
        Step = 2;
        SmallStep = 1;
    }


    switch(Step)
    {

        case 0://查询
        {
            Step = 1;
            US->USART1_Data.US1_SendAutoAdd = 0;


            if(HAL_GPIO_ReadPin(K_LoadPower_GPIO_Port, K_LoadPower_Pin) == GPIO_PIN_SET)
            {
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "HL_T.HLB1.txt=", "Power_ON", 1);

            }
            else
            {
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "HL_T.HLB1.txt=", "Power_OFF", 1);
            }

            if(HAL_GPIO_ReadPin(K_Load_GPIO_Port, K_Load_Pin) == GPIO_PIN_SET)
            {

                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "HL_T.HLB2.txt=", "load_ON", 1);
            }
            else
            {

                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "HL_T.HLB2.txt=", "load_OFF", 1);
            }

            if(HAL_GPIO_ReadPin(K_C_Load_GPIO_Port, K_C_Load_Pin) == GPIO_PIN_SET)
            {
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "HL_T.HLB3.txt=", "Cload_ON", 1);
            }
            else
            {
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "HL_T.HLB3.txt=", "Cload_OFF", 1);
            }

            if(HAL_GPIO_ReadPin(K_OUTSW_GPIO_Port, K_OUTSW_Pin) == GPIO_PIN_SET)
            {
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "HL_T.HLB4.txt=", "OutSW_ON", 1);
            }
            else
            {
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "HL_T.HLB4.txt=", "OutSW_OFF", 1);
            }

            if(HAL_GPIO_ReadPin(K_OUTSEL_GPIO_Port, K_OUTSEL_Pin) == GPIO_PIN_SET)
            {
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "HL_T.HLB5.txt=", "OutSEL_ON", 1);
            }
            else
            {
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "HL_T.HLB5.txt=", "OutSEL_OFF", 1);
            }

            if(HAL_GPIO_ReadPin(K_Short_GPIO_Port, K_Short_Pin) == GPIO_PIN_SET)
            {
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "HL_T.HLB6.txt=", "Short_ON", 1);
            }
            else
            {
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "HL_T.HLB6.txt=", "Short_OFF", 1);
            }

            if(HAL_GPIO_ReadPin(K_V_OUT1_GPIO_Port, K_V_OUT1_Pin) == GPIO_PIN_SET)
            {
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "HL_T.HLB7.txt=", "VOut1_ON", 1);
            }
            else
            {
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "HL_T.HLB7.txt=", "VOut1_OFF", 1);
            }

            if(HAL_GPIO_ReadPin(K_V_OUT2_GPIO_Port, K_V_OUT2_Pin) == GPIO_PIN_SET)
            {
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "HL_T.HLB8.txt=", "VOut2_ON", 1);
            }
            else
            {
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "HL_T.HLB8.txt=", "VOut2_OFF", 1);
            }


            sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_c_ValN1); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "HL_T.HLT1.txt=", StrTemp, 1);

            sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_c_Max_mA1); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "HL_T.HLT2.txt=", StrTemp, 1);

            sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_c_Min_mA1); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "HL_T.HLT3.txt=", StrTemp, 1);

            sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_c_ValN2); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "HL_T.HLT4.txt=", StrTemp, 1);

            sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_c_Max_mA2); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "HL_T.HLT5.txt=", StrTemp, 1);

            sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_c_Min_mA2); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "HL_T.HLT6.txt=", StrTemp, 1);

            sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_c_ValN3); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "HL_T.HLT7.txt=", StrTemp, 1);

            sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_c_Max_mA3); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "HL_T.HLT8.txt=", StrTemp, 1);

            sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_c_Min_mA3); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "HL_T.HLT9.txt=", StrTemp, 1);

            sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_c_ValN4); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "HL_T.HLT10.txt=", StrTemp, 1);

            sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_c_Max_mA4); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "HL_T.HLT11.txt=", StrTemp, 1);

            sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_c_Min_mA4); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "HL_T.HLT12.txt=", StrTemp, 1);

            sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_c_ValN5); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "HL_T.HLT13.txt=", StrTemp, 1);

            sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_c_Max_mA5); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "HL_T.HLT14.txt=", StrTemp, 1);

            sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_c_Min_mA5); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "HL_T.HLT15.txt=", StrTemp, 1);

            sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_c_ValN6); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "HL_T.HLT16.txt=", StrTemp, 1);

            sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_c_Max_mA6); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "HL_T.HLT17.txt=", StrTemp, 1);

            sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_c_Min_mA6); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "HL_T.HLT18.txt=", StrTemp, 1);

            sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_c_ValN7); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "HL_T.HLT19.txt=", StrTemp, 1);

            sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_c_Max_mA7); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "HL_T.HLT20.txt=", StrTemp, 1);

            sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_c_Min_mA7); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "HL_T.HLT21.txt=", StrTemp, 1);

            sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_c_ValN8); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "HL_T.HLT22.txt=", StrTemp, 1);

            sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_c_Max_mA8); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "HL_T.HLT23.txt=", StrTemp, 1);

            sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_c_Min_mA8); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "HL_T.HLT24.txt=", StrTemp, 1);

            sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_c_ValP1); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "HL_T.HLT25.txt=", StrTemp, 1);
			
			sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_c_ValP2); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "HL_T.HLT26.txt=", StrTemp, 1);
			
			sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_c_ValP3); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "HL_T.HLT27.txt=", StrTemp, 1);
			
			sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_c_ValP4); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "HL_T.HLT28.txt=", StrTemp, 1);

			sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_c_ValP5); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "HL_T.HLT29.txt=", StrTemp, 1);
			
            ScreenTransmit(&USART_Data, US->USART1_Data.US1_SendDataBuf, US->USART1_Data.US1_SendAutoAdd, 1000);


        }
        break;

        case 1://按键响应
        {
			if(US->USART1_Data.US1_ReceiDataSucce_Flag == 1)
//            if(strcmp((const char *)KeyStrTemp, US->USART1_Data.US1_CutApartBuf[0]) != 0 )
            {
//                strcpy(KeyStrTemp, US->USART1_Data.US1_CutApartBuf[0]);
				US->USART1_Data.US1_ReceiDataSucce_Flag=0;
                Step = 0;

				
                if(strcmp((const char *)US->USART1_Data.US1_CutApartBuf[0], "Power_ON") == 0 )
                {
                    K_LoadPower(0);
                }
                else if	(strcmp((const char *)US->USART1_Data.US1_CutApartBuf[0], "Power_OFF") == 0 )
                {
                    K_LoadPower(1);
                }
                else if	(strcmp((const char *)US->USART1_Data.US1_CutApartBuf[0], "load_ON") == 0 )
                {
                    K_Load(0);
                }
                else if	(strcmp((const char *)US->USART1_Data.US1_CutApartBuf[0], "load_OFF") == 0 )
                {
                    K_Load(1);
                }
                else if	(strcmp((const char *)US->USART1_Data.US1_CutApartBuf[0], "Cload_ON") == 0 )
                {
                    K_C_Load(0);
                }
                else if	(strcmp((const char *)US->USART1_Data.US1_CutApartBuf[0], "Cload_OFF") == 0 )
                {
                    K_C_Load(1);
                }
                else if	(strcmp((const char *)US->USART1_Data.US1_CutApartBuf[0], "OutSW_ON") == 0 )
                {
                    K_OUTSW(0);
                }
                else if	(strcmp((const char *)US->USART1_Data.US1_CutApartBuf[0], "OutSW_OFF") == 0 )
                {
                    K_OUTSW(1);
                }
                else if	(strcmp((const char *)US->USART1_Data.US1_CutApartBuf[0], "OutSEL_ON") == 0 )
                {
                    K_OUTSET(0);
                }
                else if	(strcmp((const char *)US->USART1_Data.US1_CutApartBuf[0], "OutSEL_OFF") == 0 )
                {
                    K_OUTSET(1);
                }
                else if	(strcmp((const char *)US->USART1_Data.US1_CutApartBuf[0], "Short_ON") == 0 )
                {
                    K_Short(0);
                }
                else if	(strcmp((const char *)US->USART1_Data.US1_CutApartBuf[0], "Short_OFF") == 0 )
                {
                    K_Short(1);
                }
                else if	(strcmp((const char *)US->USART1_Data.US1_CutApartBuf[0], "VOut1_ON") == 0 )
                {
                    K_V_OUT1(0);
                }
                else if	(strcmp((const char *)US->USART1_Data.US1_CutApartBuf[0], "VOut1_OFF") == 0 )
                {
                    K_V_OUT1(1);
                }
                else if	(strcmp((const char *)US->USART1_Data.US1_CutApartBuf[0], "VOut2_ON") == 0 )
                {
                    K_V_OUT2(0);
                }
                else if	(strcmp((const char *)US->USART1_Data.US1_CutApartBuf[0], "VOut2_OFF") == 0 )
                {
                    K_V_OUT2(1);
                }else if(US->USART1_Data.US1_CutApartBuf[0][0] == 'c')  //开始测试
                {

                    Step = 2;
                    SmallStep = 1;
                }

            }
        }
        break;

        case 2://测试流程
        {

            if(SmallStep == 1) //npn
            {
				KM_Reset();
				US->USART1_Data.US1_SendAutoAdd = 0;
                K_Load(0);
                PWMSetCurrent(1, 110);
                K_C_Load(1);
                K_OUTSW(1);
                K_LoadPower(1);
                K_OUTSET(0);
				if(*SensorInstructionTransmit("Test", 100))
				{
				SmallStep=4;
				US->USART1_Data.US1_SendAutoAdd=0;
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "page Detec", " ", 1);
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "Detec.backPage.val=", "4", 0);
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "Detec.Succeed_txt.txt=", "传感器通讯失败，请检查传感器是否连接正常。", 1);
                ScreenTransmit(&USART_Data, US->USART1_Data.US1_SendDataBuf, US->USART1_Data.US1_SendAutoAdd, 1000);
				break;
				}
                SensorInstructionTransmit("SetOutputTypeNPN", 1000);
                SensorInstructionTransmit("SetOutputStateOFF", 1000);
                My_Delay(100);
                GetMultimeter(0, 1000);

                sprintf((char *)StrTemp, "%1.3f%s", USART_Data.USART6_Data.US6_OutValCurrent, "mA");

                USART_Data.USART1_Data.US1_c_ValN1 = USART_Data.USART6_Data.US6_OutValCurrent;

                if(USART_Data.USART6_Data.US6_OutValCurrent <= USART_Data.USART1_Data.US1_c_Max_mA1 &&
                        USART_Data.USART6_Data.US6_OutValCurrent >= USART_Data.USART1_Data.US1_c_Min_mA1) //漏电电流
                {
					StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "HL_T.HLT1.bco=", "65520", 0);
					comVariableBlock.HighLowDetectionResult |= SetStateStr[0];
                    if(*AutoSetOrManual == 2)
                    {
						if(*OutWindowsTxt2((uint8_t *)StrTemp, 1, 0, 1000))
						{
							MeasurResultTransmit(3, 1000);
							*AutoSetOrManual = 0;
							Result[1] = 1;
							Result[0] = 1;
							return Result;
						}
					}
                }
                else
                {
					StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "HL_T.HLT1.bco=", "63488", 0);
					comVariableBlock.HighLowDetectionResult &= ResetStateStr[0];
                    
                    if(*AutoSetOrManual == 2)
                    {
						if(*OutWindowsTxt2((uint8_t *)StrTemp, 0, 0, 1000))
						{
							MeasurResultTransmit(3, 1000);
						}else
						{
							MeasurResultTransmit(2, 1000);
						}
                        *AutoSetOrManual = 0;
                        Result[1] = 1;
                        Result[0] = 1;
                        return Result;
                    }
                }

                SensorInstructionTransmit("SetOutputStateON", 1000);
                My_Delay(1000);
                GetMultimeter(0, 1000);

                sprintf((char *)StrTemp, "%1.3f%s", USART_Data.USART6_Data.US6_OutValCurrent, "mA");
                USART_Data.USART1_Data.US1_c_ValN2 = USART_Data.USART6_Data.US6_OutValCurrent;

                if(USART_Data.USART6_Data.US6_OutValCurrent <= USART_Data.USART1_Data.US1_c_Max_mA2
                        && USART_Data.USART6_Data.US6_OutValCurrent >= USART_Data.USART1_Data.US1_c_Min_mA2)//输出带载
                {
					StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "HL_T.HLT4.bco=", "65520", 0);
					comVariableBlock.HighLowDetectionResult |= SetStateStr[1];
					 if(*AutoSetOrManual == 2)
                    {
						if(*OutWindowsTxt2((uint8_t *)StrTemp, 1, 0, 1000))
						{
							MeasurResultTransmit(3, 1000);
							*AutoSetOrManual = 0;
							Result[1] = 1;
							Result[0] = 1;
							return Result;
						}
					}
                    
                }
                else
                {
					StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "HL_T.HLT4.bco=", "63488", 0);
					comVariableBlock.HighLowDetectionResult |= SetStateStr[1];
                   
                    if(*AutoSetOrManual == 2)
                    { 
						if(*OutWindowsTxt2((uint8_t *)StrTemp, 0, 0, 1000))
						{
							MeasurResultTransmit(3, 1000);
						}else
						{
							MeasurResultTransmit(2, 1000);
						}
                        *AutoSetOrManual = 0;
                        Result[1] = 1;
                        Result[0] = 1;
                        return Result;
                    }
                }

                SensorInstructionTransmit("GetSelfTestResult", 2000);//sensor self-checking
				My_Delay(10);
                for(char i = 0, j = 0; USART_Data.USART4_Data.US4_receiveData[i] !=  '\0'; i++)
                {
                    if(USART_Data.USART4_Data.US4_receiveData[i] != FRONT_END_MARK)
                    {
                        StrTemp[j++] = USART_Data.USART4_Data.US4_receiveData[i];
						StrTemp[j]='\0';
                    }
                }

                if(USART_Data.USART4_Data.US4_receiveData[0] == '0')
                {
					if(*AutoSetOrManual == 2)
                    {
						if(*OutWindowsTxt2((uint8_t *)StrTemp, 1, 0, 1000))
						{
							MeasurResultTransmit(3, 1000);
							*AutoSetOrManual = 0;
							Result[1] = 1;
							Result[0] = 1;
							return Result;
						}
					}
                    
                }
                else
                {
                    if(*AutoSetOrManual == 2)
                    { 
						if(*OutWindowsTxt2((uint8_t *)StrTemp, 0, 0, 1000))
						{
							MeasurResultTransmit(3, 1000);
						}else
						{
							MeasurResultTransmit(2, 1000);
						}
                        *AutoSetOrManual = 0;
                        Result[1] = 1;
                        Result[0] = 1;
                        return Result;
                    }
                }

                K_Short(0);//npn短路测试
                K_OUTSET(1);

                SensorInstructionTransmit("GetSelfTestResult", 2000);//sensor self-checking
				HAL_Delay(100);
				My_Delay(10);

                for(char i = 0, j = 0; USART_Data.USART4_Data.US4_receiveData[i] !=  '\0' 
				|| i==sizeof(USART_Data.USART4_Data.US4_receiveData); i++)
                {
                    if(USART_Data.USART4_Data.US4_receiveData[i] != 0x0A)
                    {
                        StrTemp[j++] = USART_Data.USART4_Data.US4_receiveData[i];
						StrTemp[j]='\0';
                    }
                }

                if(USART_Data.USART4_Data.US4_receiveData[0] == '1'
					&& USART_Data.USART4_Data.US4_receiveData[1] == '6')
                {
					if(*AutoSetOrManual == 2)
                    {
						 if(*OutWindowsTxt2((uint8_t *)StrTemp, 1, 0, 1000))
						 {
							MeasurResultTransmit(3, 1000);
							*AutoSetOrManual = 0;
							Result[1] = 1;
							Result[0] = 1;
							return Result;
						 }
					}
                   
                }
                else
                {
                    if(*AutoSetOrManual == 2)
                    {	
						if(*OutWindowsTxt2((uint8_t *)StrTemp, 0, 0, 1000))
						{
							MeasurResultTransmit(3, 1000);
						}else
						{
							MeasurResultTransmit(2, 1000);
						}
                        *AutoSetOrManual = 0;
                        Result[1] = 1;
                        Result[0] = 1;
                        return Result;
                    }
                }

                My_Delay(1000);//138行,
                K_OUTSET(0);//带载
                My_Delay(300);


                SensorInstructionTransmit("GetSelfTestResult", 2000);//sensor self-checking
				My_Delay(10);

                for(char i = 0, j = 0; USART_Data.USART4_Data.US4_receiveData[i] !=  '\0' 
				|| i==sizeof(USART_Data.USART4_Data.US4_receiveData); i++)
                {
                    if(USART_Data.USART4_Data.US4_receiveData[i] != 0x0A)
                    {
                        StrTemp[j++] = USART_Data.USART4_Data.US4_receiveData[i];
						StrTemp[j]='\0';
                    }
                }

                if(USART_Data.USART4_Data.US4_receiveData[0] == '0')
                {
					if(*AutoSetOrManual == 2)
                    {
						 if(*OutWindowsTxt2((uint8_t *)StrTemp, 1, 0, 1000))
						 {
							MeasurResultTransmit(3, 1000);
							*AutoSetOrManual = 0;
							Result[1] = 1;
							Result[0] = 1;
							return Result;
						 }
					}
                   
                }
                else
                {
                   
                    if(*AutoSetOrManual == 2)
                    { 
						if(*OutWindowsTxt2((uint8_t *)StrTemp, 0, 0, 1000))
						{
							MeasurResultTransmit(3, 1000);
						}else
						{
							MeasurResultTransmit(2, 1000);
						}
                        *AutoSetOrManual = 0;
                        Result[1] = 1;
                        Result[0] = 1;
                        return Result;
                    }
                }
                GetMultimeter(0, 1000);
                sprintf((char *)StrTemp, "%1.2f%s", USART_Data.USART6_Data.US6_OutValCurrent, "mA");
                USART_Data.USART1_Data.US1_c_ValN3 = USART_Data.USART6_Data.US6_OutValCurrent;

                if(USART_Data.USART6_Data.US6_OutValCurrent <= USART_Data.USART1_Data.US1_c_Max_mA3
                        && USART_Data.USART6_Data.US6_OutValCurrent >= USART_Data.USART1_Data.US1_c_Min_mA3 )//短路测试后带载
                {
					StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "HL_T.HLT7.bco=", "65520", 0);
					comVariableBlock.HighLowDetectionResult |= SetStateStr[2];
					if(*AutoSetOrManual == 2)
                    {
						if(*OutWindowsTxt2((uint8_t *)StrTemp, 1, 0, 1000))
						{
							MeasurResultTransmit(3, 1000);
							*AutoSetOrManual = 0;
							Result[1] = 1;
							Result[0] = 1;
							return Result;
						}
					}
                    
                }
                else
                {
					StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "HL_T.HLT7.bco=", "63488", 0);
					comVariableBlock.HighLowDetectionResult |= SetStateStr[2];
                    

                    if(*AutoSetOrManual == 2)
                    {
						if(*OutWindowsTxt2((uint8_t *)StrTemp, 0, 0, 1000))
						{
							MeasurResultTransmit(3, 1000);
						}else
						{
							MeasurResultTransmit(2, 1000);
						}
                        *AutoSetOrManual = 0;
                        Result[1] = 1;
                        Result[0] = 1;
                        return Result;
                    }
                }
                PWMSetCurrent(1, 100);
                My_Delay(500);
                GetMultimeter(0, 1000);
                sprintf((char *)StrTemp, "%1.2f%s", USART_Data.USART6_Data.US6_OutValCurrent, "mA");
                USART_Data.USART1_Data.US1_c_ValN4 = USART_Data.USART6_Data.US6_OutValCurrent;
                if(USART_Data.USART6_Data.US6_OutValCurrent <= USART_Data.USART1_Data.US1_c_Max_mA4
                        && USART_Data.USART6_Data.US6_OutValCurrent >= USART_Data.USART1_Data.US1_c_Min_mA4)//残余电压测试电流
                {
					StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "HL_T.HLT10.bco=", "65520", 0);
					comVariableBlock.HighLowDetectionResult |= SetStateStr[3];
					if(*AutoSetOrManual == 2)
                    {
						if(*OutWindowsTxt2((uint8_t *)StrTemp, 1, 0, 1000))
						{
							MeasurResultTransmit(3, 1000);
							*AutoSetOrManual = 0;
							Result[1] = 1;
							Result[0] = 1;
							return Result;
						}
					}
                    
                }
                else
                {
					StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "HL_T.HLT10.bco=", "63488", 0);
					comVariableBlock.HighLowDetectionResult |= SetStateStr[3];
                   

                    if(*AutoSetOrManual == 2)
                    { 
						if(*OutWindowsTxt2((uint8_t *)StrTemp, 0, 0, 1000))
						{
							MeasurResultTransmit(3, 1000);
						}else
						{
							MeasurResultTransmit(2, 1000);
						}
                        *AutoSetOrManual = 0;
                        Result[1] = 1;
                        Result[0] = 1;
                        return Result;
                    }
                }

                K_C_Load(0);
                K_V_OUT1(1);
				My_Delay(100);
                GetMultimeter(1, 1000);

                sprintf((char *)StrTemp, "%1.2f%s", USART_Data.USART6_Data.US6_OutValVoltageDC, "V");
                USART_Data.USART1_Data.US1_c_ValN5 = USART_Data.USART6_Data.US6_OutValVoltageDC;

                if(USART_Data.USART6_Data.US6_OutValVoltageDC <= USART_Data.USART1_Data.US1_c_Max_mA5
                        && USART_Data.USART6_Data.US6_OutValVoltageDC >= USART_Data.USART1_Data.US1_c_Min_mA5)//输出残余电压
                {
					StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "HL_T.HLT13.bco=", "65520", 0);
					comVariableBlock.HighLowDetectionResult |= SetStateStr[4];
					if(*AutoSetOrManual == 2)
                    {
						if(*OutWindowsTxt2((uint8_t *)StrTemp, 1, 0, 1000))
						{
							MeasurResultTransmit(3, 1000);
							*AutoSetOrManual = 0;
							Result[1] = 1;
							Result[0] = 1;
							return Result;
						}
					}
                    
                }
                else
                {
					StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "HL_T.HLT13.bco=", "63488", 0);
					comVariableBlock.HighLowDetectionResult |= SetStateStr[4];
                   

                    if(*AutoSetOrManual == 2)
                    { 
						if(*OutWindowsTxt2((uint8_t *)StrTemp, 0, 0, 1000))
						{
							MeasurResultTransmit(3, 1000);
						}else
						{
							MeasurResultTransmit(2, 1000);
						}
                        *AutoSetOrManual = 0;
                        Result[1] = 1;
                        Result[0] = 1;
                        return Result;
                    }
                }


                K_V_OUT1(0);//npn残余电压借入万用表
                K_OUTSW(0);
                K_LoadPower(0);
                PWMSetCurrent(1, 20);
                SensorInstructionTransmit("SetOutputStateOFF", 1000);

				
                SmallStep = 2;

            }
            else if(SmallStep == 2) //pnp
            {


                K_Load(1);
                PWMSetCurrent(0, 110);
                K_C_Load(1);
                K_OUTSW(1);
                K_LoadPower(1);
                K_OUTSET(0);
                SensorInstructionTransmit("SetOutputTypePNP", 1000);
                SensorInstructionTransmit("SetOutputStateOFF", 1000);
                My_Delay(100);
                GetMultimeter(0, 1000);//漏电电流


                sprintf((char *)StrTemp, "%1.3f%s", USART_Data.USART6_Data.US6_OutValCurrent, "mA");
                USART_Data.USART1_Data.US1_c_ValP1 = USART_Data.USART6_Data.US6_OutValCurrent;

                if(USART_Data.USART6_Data.US6_OutValCurrent <= USART_Data.USART1_Data.US1_c_Max_mA1 &&
                        USART_Data.USART6_Data.US6_OutValCurrent >= USART_Data.USART1_Data.US1_c_Min_mA1 )
                {
					StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "HL_T.HLT25.bco=", "65520", 0);
					comVariableBlock.HighLowDetectionResult |= SetStateStr[0];
					if(*AutoSetOrManual == 2)
                    {
						if(*OutWindowsTxt2((uint8_t *)StrTemp, 1, 0, 1000))
						{
							MeasurResultTransmit(3, 1000);
							*AutoSetOrManual = 0;
							Result[1] = 1;
							Result[0] = 1;
							return Result;
						}
					}
                    
                }
                else
                {
					StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "HL_T.HLT25.bco=", "63488", 0);
					comVariableBlock.HighLowDetectionResult |= SetStateStr[0];
                   

                    if(*AutoSetOrManual == 2)
                    { 
						if(*OutWindowsTxt2((uint8_t *)StrTemp, 0, 0, 1000))
						{
							MeasurResultTransmit(3, 1000);
						}else
						{
							MeasurResultTransmit(2, 1000);
						}
                        *AutoSetOrManual = 0;
                        Result[1] = 1;
                        Result[0] = 1;
                        return Result;
                    }
                }

                SensorInstructionTransmit("SetOutputStateON", 1000);
                My_Delay(1000);
                GetMultimeter(0, 1000);

                sprintf((char *)StrTemp, "%1.2f%s", USART_Data.USART6_Data.US6_OutValCurrent, "mA");
                USART_Data.USART1_Data.US1_c_ValP2 = USART_Data.USART6_Data.US6_OutValCurrent;

                if(USART_Data.USART6_Data.US6_OutValCurrent <= USART_Data.USART1_Data.US1_c_Max_mA2
                        && USART_Data.USART6_Data.US6_OutValCurrent >= USART_Data.USART1_Data.US1_c_Min_mA2)
                {
					StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "HL_T.HLT26.bco=", "65520", 0);
					comVariableBlock.HighLowDetectionResult |= SetStateStr[1];
					if(*AutoSetOrManual == 2)
                    {
						if(*OutWindowsTxt2((uint8_t *)StrTemp, 1, 0, 1000))
						{
							MeasurResultTransmit(3, 1000);
							*AutoSetOrManual = 0;
							Result[1] = 1;
							Result[0] = 1;
							return Result;
						}
					}
                    
                }
                else
                {
					StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "HL_T.HLT26.bco=", "63488", 0);
					comVariableBlock.HighLowDetectionResult |= SetStateStr[1];
                   

                    if(*AutoSetOrManual == 2)
                    { 
						if(*OutWindowsTxt2((uint8_t *)StrTemp, 0, 0, 1000))
						{
							MeasurResultTransmit(3, 1000);
						}else
						{
							MeasurResultTransmit(2, 1000);
						}
                        *AutoSetOrManual = 0;
                        Result[1] = 1;
                        Result[0] = 1;
                        return Result;
                    }
                }

                SensorInstructionTransmit("GetSelfTestResult", 2000);//sensor self-checking
				My_Delay(10);

                for(char i = 0, j = 0;USART_Data.USART4_Data.US4_receiveData[i] !=  '\0' 
				|| i==sizeof(USART_Data.USART4_Data.US4_receiveData); i++)
                {
                    if(USART_Data.USART4_Data.US4_receiveData[i] != 0x0A)
                    {
                        StrTemp[j++] = USART_Data.USART4_Data.US4_receiveData[i];
						StrTemp[j]='\0';
                    }
                }

                if(USART_Data.USART4_Data.US4_receiveData[0] == '0')
                {
					if(*AutoSetOrManual == 2)
                    {
						if(*OutWindowsTxt2((uint8_t *)StrTemp, 1, 0, 1000))
						{
							MeasurResultTransmit(3, 1000);
							*AutoSetOrManual = 0;
							Result[1] = 1;
							Result[0] = 1;
							return Result;
						}
					}
                }
                else
                {
                    if(*AutoSetOrManual == 2)
                    { 
						if(*OutWindowsTxt2((uint8_t *)StrTemp, 0, 0, 1000))
						{
							MeasurResultTransmit(3, 1000);
						}else
						{
							MeasurResultTransmit(2, 1000);
						}
                        *AutoSetOrManual = 0;
                        Result[1] = 1;
                        Result[0] = 1;
                        return Result;
                    }
                }

                K_Short(1);//pnp短路测试
                K_OUTSET(1);

                SensorInstructionTransmit("GetSelfTestResult", 2000);//sensor self-checking
				My_Delay(10);

                for(char i = 0, j = 0; i < USART_Data.USART4_Data.US4_receiveData[i] !=  '\0' 
				|| i==sizeof(USART_Data.USART4_Data.US4_receiveData); i++)
                {
                    if(USART_Data.USART4_Data.US4_receiveData[i] != 0x0A)
                    {
                        StrTemp[j++] = USART_Data.USART4_Data.US4_receiveData[i];
						StrTemp[j]='\0';
                    }
                }

                if(USART_Data.USART4_Data.US4_receiveData[0] == '1' && 
				USART_Data.USART4_Data.US4_receiveData[1]	=='6'
				)
                {
					if(*AutoSetOrManual == 2)
                    {
						if(*OutWindowsTxt2((uint8_t *)StrTemp, 1, 0, 1000))
						{
							MeasurResultTransmit(3, 1000);
							*AutoSetOrManual = 0;
							Result[1] = 1;
							Result[0] = 1;
							return Result;
						}
					}
                    
                }
                else
                {
                    if(*AutoSetOrManual == 2)
                    {
						if(*OutWindowsTxt2((uint8_t *)StrTemp, 0, 0, 1000))
						{
							MeasurResultTransmit(3, 1000);
						}else
						{
							MeasurResultTransmit(2, 1000);
						}
                        *AutoSetOrManual = 0;
                        Result[1] = 1;
                        Result[0] = 1;
                        return Result;
                    }
                }

                My_Delay(1000);//138行
                K_OUTSET(0);//带载
                My_Delay(300);


                SensorInstructionTransmit("GetSelfTestResult", 2000);//sensor self-checking
				My_Delay(10);

                for(char i = 0, j = 0; USART_Data.USART4_Data.US4_receiveData[i] !=  '\0' 
				|| i==sizeof(USART_Data.USART4_Data.US4_receiveData); i++)
                {
                    if(USART_Data.USART4_Data.US4_receiveData[i] != 0x0A)
                    {
                        StrTemp[j++] = USART_Data.USART4_Data.US4_receiveData[i];
						StrTemp[j]='\0';
                    }
                }

                if(USART_Data.USART4_Data.US4_receiveData[0] == '0')
                {
					if(*AutoSetOrManual == 2)
                    {
						if(*OutWindowsTxt2((uint8_t *)StrTemp, 1, 0, 1000))
						{
							MeasurResultTransmit(3, 1000);
							*AutoSetOrManual = 0;
							Result[1] = 1;
							Result[0] = 1;
							return Result;
						}
					}
                }
                else
                {
                    if(*AutoSetOrManual == 2)
                    {	
						if(*OutWindowsTxt2((uint8_t *)StrTemp, 0, 0, 1000))
						{
						MeasurResultTransmit(3, 1000);
						}else
						{
						 MeasurResultTransmit(2, 1000);
						}
                        *AutoSetOrManual = 0;
                        Result[1] = 1;
                        Result[0] = 1;
                        return Result;
                    }
                }



                GetMultimeter(0, 1000);

                sprintf((char *)StrTemp, "%1.2f%s", USART_Data.USART6_Data.US6_OutValCurrent, "mA");
                USART_Data.USART1_Data.US1_c_ValP3 = USART_Data.USART6_Data.US6_OutValCurrent;

                if(USART_Data.USART6_Data.US6_OutValCurrent <= USART_Data.USART1_Data.US1_c_Max_mA3
                        && USART_Data.USART6_Data.US6_OutValCurrent >= USART_Data.USART1_Data.US1_c_Min_mA3)
                {
					StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "HL_T.HLT27.bco=", "65520", 0);
					comVariableBlock.HighLowDetectionResult |= SetStateStr[2];
					if(*AutoSetOrManual == 2)
                    {
						if(*OutWindowsTxt2((uint8_t *)StrTemp, 1, 0, 1000))
						{
							MeasurResultTransmit(3, 1000);
							*AutoSetOrManual = 0;
							Result[1] = 1;
							Result[0] = 1;
							return Result;
						}
					}
                    
                }
                else
                {
					StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "HL_T.HLT27.bco=", "63488", 0);
					comVariableBlock.HighLowDetectionResult |= SetStateStr[2];
                    

                    if(*AutoSetOrManual == 2)
                    {
						if(*OutWindowsTxt2((uint8_t *)StrTemp, 0, 0, 1000))
						{
						MeasurResultTransmit(3, 1000);
						}else
						{
						MeasurResultTransmit(2, 1000);
						}
                        *AutoSetOrManual = 0;
                        Result[1] = 1;
                        Result[0] = 1;
                        return Result;
                    }
                }

                PWMSetCurrent(0, 100);
                My_Delay(500);

                GetMultimeter(0, 1000);

                sprintf((char *)StrTemp, "%1.2f%s", USART_Data.USART6_Data.US6_OutValCurrent, "mA");
                USART_Data.USART1_Data.US1_c_ValP4 = USART_Data.USART6_Data.US6_OutValCurrent;

                if(USART_Data.USART6_Data.US6_OutValCurrent <= USART_Data.USART1_Data.US1_c_Max_mA4
                        && USART_Data.USART6_Data.US6_OutValCurrent >= USART_Data.USART1_Data.US1_c_Min_mA4)
                {
					StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "HL_T.HLT28.bco=", "65520", 0);
					comVariableBlock.HighLowDetectionResult |= SetStateStr[3];
					if(*AutoSetOrManual == 2)
                    {
						if(*OutWindowsTxt2((uint8_t *)StrTemp, 1, 0, 1000))
						{
							MeasurResultTransmit(3, 1000);
							*AutoSetOrManual = 0;
							Result[1] = 1;
							Result[0] = 1;
							return Result;
							
						}
					}
                    
                }
                else
                {
					StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "HL_T.HLT28.bco=", "63488", 0);
					comVariableBlock.HighLowDetectionResult |= SetStateStr[3];
                    

                    if(*AutoSetOrManual == 2)
                    {
						if(*OutWindowsTxt2((uint8_t *)StrTemp, 0, 0, 1000))
						{
						MeasurResultTransmit(3, 1000);
						}else
						{
						MeasurResultTransmit(2, 1000);
						}
                        *AutoSetOrManual = 0;
                        Result[1] = 1;
                        Result[0] = 1;
                        return Result;
                    }
                }

                K_C_Load(0);
                K_V_OUT1(1);//接入万用表
                K_V_OUT2(1);//npn残余电压借入万用表
				My_Delay(100);
                GetMultimeter(1, 1000);

                sprintf((char *)StrTemp, "%1.2f%s", USART_Data.USART6_Data.US6_OutValVoltageDC, "V");
                USART_Data.USART1_Data.US1_c_ValP5 = USART_Data.USART6_Data.US6_OutValVoltageDC;

                if(USART_Data.USART6_Data.US6_OutValVoltageDC <= USART_Data.USART1_Data.US1_c_Max_mA5
                        && USART_Data.USART6_Data.US6_OutValVoltageDC >= USART_Data.USART1_Data.US1_c_Min_mA5)
                {
					StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "HL_T.HLT29.bco=", "65520", 0);
					comVariableBlock.HighLowDetectionResult |= SetStateStr[4];
					if(*AutoSetOrManual == 2)
                    {
						if(*OutWindowsTxt2((uint8_t *)StrTemp, 1, 0, 1000))
						{
							MeasurResultTransmit(3, 1000);
							*AutoSetOrManual = 0;
							Result[1] = 1;
							Result[0] = 1;
							return Result;
						}
					}
                    
                }
                else
                {
					StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "HL_T.HLT29.bco=", "63488", 0);
					comVariableBlock.HighLowDetectionResult |= SetStateStr[4];                   
                    if(*AutoSetOrManual == 2)
                    {
						if(*OutWindowsTxt2((uint8_t *)StrTemp, 0, 0, 1000))
						{
							MeasurResultTransmit(3, 1000);
						}else
						{
							MeasurResultTransmit(2, 1000);
						}
                        *AutoSetOrManual = 0;
                        Result[1] = 1;
                        Result[0] = 1;
                        return Result;
                    }
                }


                K_Load(0);
                K_OUTSET(0);
                K_V_OUT2(0);//npn残余电压借入万用表
                K_Short(0);//pnp短路测试
                K_V_OUT1(0);//npn残余电压借入万用表
                K_OUTSW(0);
                K_LoadPower(0);
                PWMSetCurrent(0, 20);
                SensorInstructionTransmit("SetOutputStateOFF", 1000);

				
				
				
                if(*AutoSetOrManual == 2)
                {
                    *AutoSetOrManual = 0;
                    SmallStep = 4;
                }
                else
                {
                    SmallStep = 3;
                }

				
            }else if(SmallStep==3)
			{
				
				
                SmallStep = 4;
                
                
                sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_c_ValN1); //
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "HL_T.HLT1.txt=", StrTemp, 1);
                sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_c_ValN2); //
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "HL_T.HLT4.txt=", StrTemp, 1);
                sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_c_ValN3); //
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "HL_T.HLT7.txt=", StrTemp, 1);
                sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_c_ValN4); //
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "HL_T.HLT10.txt=", StrTemp, 1);
                sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_c_ValN5); //
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "HL_T.HLT13.txt=", StrTemp, 1);
                sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_c_ValN6); //
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "HL_T.HLT16.txt=", StrTemp, 1);
                sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_c_ValN7); //
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "HL_T.HLT19.txt=", StrTemp, 1);
                sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_c_ValN8); //
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "HL_T.HLT22.txt=", StrTemp, 1);


                sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_c_ValP1); //
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "HL_T.HLT25.txt=", StrTemp, 1);
                sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_c_ValP2); //
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "HL_T.HLT26.txt=", StrTemp, 1);
                sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_c_ValP3); //
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "HL_T.HLT27.txt=", StrTemp, 1);
                sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_c_ValP4); //
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "HL_T.HLT28.txt=", StrTemp, 1);
                sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_c_ValP5); //
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "HL_T.HLT29.txt=", StrTemp, 1);



                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "page Detec", " ", 1);
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "Detec.backPage.val=", "4", 0);


                if((comVariableBlock.HighLowDetectionResult&0x1f) == 0x1f) //发送最总的结果
                {
                    StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "Detec.Succeed_txt.txt=", "测试成功  OK", 1);

                }
                else
                {
                    StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "Detec.Succeed_txt.txt=", "测试失败  NO", 1);
                }

                ScreenTransmit(&USART_Data, US->USART1_Data.US1_SendDataBuf, US->USART1_Data.US1_SendAutoAdd, 1000);
			
			
			}else if(SmallStep==4)
			{
				Step = 0;
				SmallStep=0;
                *AutoSetOrManual = 0;
                Result[1] = 0;
                Result[0] = 1;
                return Result;
			}
        }
        break;
    }

    Result[0] = 0;
    return Result;
}

void BeepBeep(unsigned char *num)
{

    if(*num > 0)
    {
        if(SYS_tickTime.sys_LEDTime_ms < 100)
        {
            BEEP(1);
        }
        else if(SYS_tickTime.sys_LEDTime_ms > 100 && SYS_tickTime.sys_LEDTime_ms < 200)
        {
           BEEP(0); 
        }
        else if(SYS_tickTime.sys_LEDTime_ms >= 200)
        {
			 BEEP(0);
			(*num)--;
            SYS_tickTime.sys_LEDTime_ms = 0;
        }
    }
}



void LEDState()
{
    static unsigned char MeasureResults1 = 0;
    static char StrTemp[50] = {0};
//	static  char *StrTemp_p;
//	static  char BeepTemp=0;
//	static  char MachineState=0xff;
    if(comVariableBlock.MeasureResults != MeasureResults1)
    {
        MeasureResults1 = comVariableBlock.MeasureResults;
        USART_Data.USART1_Data.US1_SendAutoAdd = 0;
        StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "SenTimFlag.val=1", " ", 1);//获取时间
        sprintf((char *)StrTemp, "总数：%d", comVariableBlock.NumOfQualifiedTotal);
        StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "main.mainT10.txt=", StrTemp, 1);
        sprintf((char *)StrTemp, "合格：%d", comVariableBlock.NumOfQualified);
        StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "main.mainT11.txt=", StrTemp, 1);
			
		if(comVariableBlock.NumOfQualified==0)
		{
			sprintf((char *)StrTemp, "合格率：%d %%",0);
		}else
		{
	sprintf((char *)StrTemp, "合格率：%1.0f %%",
			(float)comVariableBlock.NumOfQualified / (comVariableBlock.NumOfQualified + comVariableBlock.NumOfNQualified) * 100);			
		}

        StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "main.mainT12.txt=", StrTemp, 1);

        if(comVariableBlock.MeasureResults == ResultsTesting)
        {


        }
        else if(comVariableBlock.MeasureResults == ResultsSuccess)
        {
            StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "main.mainP1.pic=7", " ", 1);

           comVariableBlock.BeepControl = BEEP_SUCCESS;
//            SYS_tickTime.sys_LEDTime_ms = 0;
            LED_G3(1);
            LED_B3(0);

        }
        else if(comVariableBlock.MeasureResults == ResultsFail || comVariableBlock.MeasureResults==ResultsStop)
        {
            StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "main.mainP1.pic=5", " ", 1);
            comVariableBlock.BeepControl = BEEP_FAIL;
//            SYS_tickTime.sys_LEDTime_ms = 0;
            LED_R3(1);
            LED_B3(0);
        }

        ScreenTransmit(&USART_Data, USART_Data.USART1_Data.US1_SendDataBuf, USART_Data.USART1_Data.US1_SendAutoAdd, 1000);

    }

	

	

	
    if(comVariableBlock.StartRunLED)
    {
        comVariableBlock.StartRunLED = 0;
		LED_R2(0);
        LED_G2(1);
        USART_Data.USART1_Data.US1_SendAutoAdd = 0;
		
		
		if(comVariableBlock.MeasureResults == ResultsSuccess)
		{
StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "main.mainP1.pic=7", " ", 1);
		}else if(comVariableBlock.MeasureResults == ResultsFail || comVariableBlock.MeasureResults==ResultsStop)
		{
StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "main.mainP1.pic=5", " ", 1);
		
		}else if(comVariableBlock.MeasureResults == ResultsTesting)
		{
StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "main.mainP1.pic=6", " ", 1);
		}
		
        StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "main.mainP0.pic=7", " ", 1);
        sprintf((char *)StrTemp, "总数：%d", comVariableBlock.NumOfQualifiedTotal);
        StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "main.mainT10.txt=", StrTemp, 1);
        sprintf((char *)StrTemp, "合格：%d", comVariableBlock.NumOfQualified);
        StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "main.mainT11.txt=", StrTemp, 1);
		if(comVariableBlock.NumOfQualified==0)
		{
			sprintf((char *)StrTemp, "合格率：%d %%",0);
		}else
		{
			sprintf((char *)StrTemp, "合格率：%1.0f %%",
							(float)comVariableBlock.NumOfQualified / (comVariableBlock.NumOfQualified + comVariableBlock.NumOfNQualified) * 100);			
	    }
				
		StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "main.mainT12.txt=", StrTemp, 1);
		sprintf((char *)StrTemp, "ID:%s", comVariableBlock.ID_Sensor);
		StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "main.mainT15.txt=",StrTemp,1);//ID

		ScreenTransmit(&USART_Data, USART_Data.USART1_Data.US1_SendDataBuf, USART_Data.USART1_Data.US1_SendAutoAdd, 1000);
		

    }
	
	

if(SYS_tickTime.sys_SendDataToScreen_ms>1000)
{
	SYS_tickTime.sys_SendDataToScreen_ms=0;

	USART_Data.USART1_Data.US1_SendAutoAdd = 0;
	if(comVariableBlock.MachineSelfTestState==0)
	{
	StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "main.mainP2.pic=7", " ", 1);
	LED_G1(1);
	LED_R1(0);	
	}else
	{
	StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "main.mainP2.pic=5", " ", 1);
	LED_G1(0);
	LED_R1(1);
	}
	ScreenTransmit(&USART_Data, USART_Data.USART1_Data.US1_SendDataBuf, USART_Data.USART1_Data.US1_SendAutoAdd, 1000);	
}
		
}

void POWER_UP()
{
	static char StrTemp[100] = {0};
	 static char State = 0;//返回0是成功的，非0是失败的
	SetPower(0, 2, 1000);//消除第一次发送错误
	HAL_Delay(100);
	if( *SetPower(0, 2, 1000))
    {
        State |= 0x01;
    }
	
    if(*SetAutoDetecMultimeter(0, 1500))
    {
        State |= 0x02;
    }
	
    USART_Data.USART1_Data.US1_SendAutoAdd = 0;
    StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "main.communiVal.val=1", " ", 1);
    ScreenTransmit(&USART_Data, USART_Data.USART1_Data.US1_SendDataBuf, USART_Data.USART1_Data.US1_SendAutoAdd, 1000);
    HAL_Delay(200);//不能小于50ms,因为串口屏时间是50ms周期

    if(comVariableBlock.ScreenCommunicationState == 0)
    {
        State |= 0x04;
		LED_G2(0);
		LED_R2(1);
    }else
	{
		LED_G2(1);
		LED_R2(0);
	}


	comVariableBlock.MachineSelfTestState=State;

}

char SelfChecking()//运行自检
{

	char PowerOutState=0;
	static char OverFirstRime=0;
    static char State = 0;//返回0是成功的，非0是失败的
	static char SensorResult;
	static char StrTemp[100] = {0};
    State = 0;

	comVariableBlock.StopDetecFlag = 0;
    if( *SetPower(0, 2, 500))
    {
        State |= 0x01;
    }
	
    if(*SetAutoDetecMultimeter(0, 500))
    {
        State |= 0x02;
    }
	
    USART_Data.USART1_Data.US1_SendAutoAdd = 0;
    StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "main.communiVal.val=1", " ", 1);
    ScreenTransmit(&USART_Data, USART_Data.USART1_Data.US1_SendDataBuf, USART_Data.USART1_Data.US1_SendAutoAdd, 1000);
    HAL_Delay(200);//不能小于50ms,因为串口屏时间是50ms周期

    if(comVariableBlock.ScreenCommunicationState == 0)
    {
        State |= 0x04;
		LED_G2(0);
		LED_R2(1);
    }

    comVariableBlock.ScreenCommunicationState = 0;

    USART_Data.USART1_Data.US1_SendAutoAdd = 0;


    if(State != 0)
    {
        StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "page Detec", " ", 1);
        StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "Detec.backPage.val=", "3", 0);
    }
    else
    {
		//弹出自检错误的时候，自检正常了自己回到主页面
        StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "page main", " ", 1);
    }


    if(State == 0x03)
    {
        StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "Detec.Succeed_txt.txt=", "“台式万用表”和“程控电源”通讯失败", 1);
    }
    else if(State == 0x01)
    {
        StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "Detec.Succeed_txt.txt=", "“程控电源”通讯失败", 1);
    }
    else if(State == 0x02)
    {
        StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "Detec.Succeed_txt.txt=", "“台式万用表”通讯失败", 1);
  
	}
    else if(State == 0x07)
    {
        StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "Detec.Succeed_txt.txt=", "“台式万用表”和“程控电源”和“屏幕”通讯失败", 1);
	
	}else
	{
		/*
		000 无错误
		001 电源
		010 万用表
		011 电源和万用表
		100 屏幕
		101 屏幕和电源
		110 屏幕和万用表
		111 屏幕和万用表和电源
		*/
sprintf((char *)StrTemp, "操作失败！错误码%x", State);
StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "Detec.Succeed_txt.txt=", StrTemp, 1);
	
	}
comVariableBlock.MachineSelfTestState=State;
	ScreenTransmit(&USART_Data, USART_Data.USART1_Data.US1_SendDataBuf, USART_Data.USART1_Data.US1_SendAutoAdd, 100);

	if(State!=0)
	{
		comVariableBlock.BeepControl = BEEP_MachineSelf;
		return  State;	
	}

	
	KM_Reset();
	comVariableBlock.BeepControl = 0;
	comVariableBlock.DeviceStatus = DS_Non;
	
	SetPowerOut(1, 1, 100);
	PowerOutState = USART_Data.USART3_Data.US3_OutState;

	
	SetPower(24, 0, 100);
	SetPower(1, 1, 100);
	SetPowerOut(0, 1, 100);
	
	if(PowerOutState==0)//第一次开启电源要延时一下
	{
		HAL_Delay(2000);
	}
	

	
	HAL_Delay(100);
	if(*SensorInstructionTransmit("Test", 100))
	{		
		USART_Data.USART1_Data.US1_SendAutoAdd = 0;
		StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "main.mainT13.bco=64528", "" ,0);
		StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "main.mainT13.txt=", "SEN通讯:NO", 1);
		ScreenTransmit(&USART_Data,USART_Data.USART1_Data.US1_SendDataBuf,USART_Data.USART1_Data.US1_SendAutoAdd, 100);	
	}
	else
	{
//		HAL_Delay(50);
		USART_Data.USART1_Data.US1_SendAutoAdd = 0;
		StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "main.mainT13.bco=2024", "" ,0);
		StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "main.mainT13.txt=", "SEN通讯:OK", 1);		
		if(*SensorInstructionTransmit("CheckID", 100)||USART_Data.USART4_Data.US4_receiveData[24]!=0x0a)
		{
			sprintf((char *)StrTemp, "return ID error");
			StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "main.mainT15.txt=",StrTemp, 1);			
		}else
		{
			 memcpy(comVariableBlock.ID_Sensor,USART_Data.USART4_Data.US4_receiveData,24);/*保存ID*/
			if(OverFirstRime<1)
			{
				OverFirstRime++;
				comVariableBlock.NumOfQualifiedFlag=1;
			}else
			{
				if(fineStr( ID_Temp, (char *)&comVariableBlock.ID_Sensor))
				{
					comVariableBlock.NumOfQualifiedFlag=0;
				}else
				{
					comVariableBlock.NumOfQualifiedFlag=1;
				}		
			}
			fillStr(ID_Temp,(char *)comVariableBlock.ID_Sensor);
			sprintf((char *)StrTemp, "ID:%s", comVariableBlock.ID_Sensor);
			StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "main.mainT15.txt=",StrTemp, 1);	
		}
		ScreenTransmit(&USART_Data,USART_Data.USART1_Data.US1_SendDataBuf,USART_Data.USART1_Data.US1_SendAutoAdd, 100);	
	}


	//---------------------------------//亮灯
	USART_Data.USART1_Data.US1_SendAutoAdd = 0;
	StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "main.mainP1.pic=6", " ", 1);
	ScreenTransmit(&USART_Data,USART_Data.USART1_Data.US1_SendDataBuf,USART_Data.USART1_Data.US1_SendAutoAdd, 100);

	comVariableBlock.AutoSetOrManual = 1;
	
	MeasurResultTransmit(0, 100);//
	
	HAL_Delay(100);
	
//存储数据初始化-----------------------------------------------------------------------------
		USART_Data.USART1_Data.US1_b_Voltage0=0;
		USART_Data.USART1_Data.US1_b_Voltage2=0;
		USART_Data.USART1_Data.US1_b_Voltage3=0;
		USART_Data.USART1_Data.US1_b_Voltage6=0;
		USART_Data.USART1_Data.US1_CalibrationData[0]=0;
		USART_Data.USART1_Data.US1_CalibrationData[1]=0;
		USART_Data.USART1_Data.US1_CalibrationData[2]=0;
		USART_Data.USART1_Data.US1_CalibrationData[3]=0;
		USART_Data.USART1_Data.US1_CalibrationData[4]=0;
		USART_Data.USART1_Data.US1_CalibrationData[5]=0;
		USART_Data.USART1_Data.US1_CalibrationData[6]=0;
		USART_Data.USART1_Data.US1_CalibrationData[7]=0;
		USART_Data.USART1_Data.US1_CalibrationData[8]=0;
		USART_Data.USART1_Data.US1_CalibrationData[9]=0;
		USART_Data.USART1_Data.ConsumeCur=0;
		USART_Data.USART1_Data.US1_c_ValN1=0;
		USART_Data.USART1_Data.US1_c_ValN4=0;
		USART_Data.USART1_Data.US1_c_ValN5=0;
		USART_Data.USART1_Data.US1_c_ValN1=0;
		USART_Data.USART1_Data.US1_c_ValN4=0;
		USART_Data.USART1_Data.US1_c_ValN5=0;
//存储数据初始化-----------------------------------------------------------------------------
	

	
    return State;
}


void KM_Reset(void)
{
	LED_B3(1);
	LED_G3(0);
	LED_R3(0);
	BEEP(0);
	
	K_C_Power(0);
	K_PowerRv(0);
	K_Load(0);
	K_C_Load(0);
	K_OUTSW(0);
	K_LoadPower(0);
	K_OUTSET(0);
	K_Short(0);
	K_V_OUT2(0);
	K_V_OUT1(0);
	K_V_N(0);
	K_V_1(0);
	K_V_2(0);
	K_V_3(0);
	K_V_4(0);
	K_V_5(0);
	K_V_6(0);
	K_V_7(0);
	K_V_8(0);
	IN_Test(0);
	HAL_Delay(10);
}



char *ClealStrLetter(char *data,char letter)
{
	const char len=50;
	static	char returnData[len];
	for(int i=0,j=0;data[i] != '\0'|| data[i] == len-1;i++)
	{
		if(data[i] != letter)
		{
			returnData[j++]=data[i];
			returnData[j]='\0';
		}
		if(i==len-2)
		{
			returnData[len-1]='\0';
			break;
		}
	
	}

	return returnData;
}

char *Calibration(USART_DataType *US, unsigned char *AutoSetOrManual)
{
	static  char Result[2] = {0};
    static  char Step = 0; //大步
    static  char StrTemp[20] = {0};
	static  char *StrTemp_p;
	static  char SensorResult=0;
    unsigned short int DetectionResult=0;

    if(USART_Data.USART1_Data.PageNum != USART_Data.USART1_Data.PageNumChange)
    {
        Step = 0;
        USART_Data.USART1_Data.PageNumChange = USART_Data.USART1_Data.PageNum;
    }
	
    if(*AutoSetOrManual == 1)
    {
        *AutoSetOrManual = 2;
        Step = 2;

    }

    switch(Step)
    {
        case 0://查询
        {
			Step = 1;
            US->USART1_Data.US1_SendAutoAdd = 0;

            sprintf(StrTemp, "%d", USART_Data.USART1_Data.US1_CalibrationData[0]); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "Cali.CALT1.txt=", StrTemp, 1);

            sprintf(StrTemp, "%d", USART_Data.USART1_Data.US1_CalibrationData[1]); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "Cali.CALT2.txt=", StrTemp, 1);

            sprintf(StrTemp, "%d", USART_Data.USART1_Data.US1_CalibrationData[2]); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "Cali.CALT3.txt=", StrTemp, 1);

            sprintf(StrTemp, "%d", USART_Data.USART1_Data.US1_CalibrationData[3]); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "Cali.CALT4.txt=", StrTemp, 1);

            sprintf(StrTemp, "%d", USART_Data.USART1_Data.US1_CalibrationData[4]); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "Cali.CALT5.txt=", StrTemp, 1);

            sprintf(StrTemp, "%d", US->USART1_Data.US1_d_Max_Val); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "Cali.CALT6.txt=", StrTemp, 1);

            sprintf(StrTemp, "%d", US->USART1_Data.US1_d_Max_Va2); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "Cali.CALT7.txt=", StrTemp, 1);

            sprintf(StrTemp, "%d", US->USART1_Data.US1_d_Max_Va3); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "Cali.CALT8.txt=", StrTemp, 1);

            sprintf(StrTemp, "%d", US->USART1_Data.US1_d_Max_Va4); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "Cali.CALT9.txt=", StrTemp, 1);

            sprintf(StrTemp, "%d", US->USART1_Data.US1_d_Max_Va5); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "Cali.CALT10.txt=", StrTemp, 1);

            sprintf(StrTemp, "%d", US->USART1_Data.US1_d_Min_Val); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "Cali.CALT11.txt=", StrTemp, 1);

            sprintf(StrTemp, "%d", US->USART1_Data.US1_d_Min_Va2); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "Cali.CALT12.txt=", StrTemp, 1);

            sprintf(StrTemp, "%d", US->USART1_Data.US1_d_Min_Va3); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "Cali.CALT13.txt=", StrTemp, 1);

            sprintf(StrTemp, "%d", US->USART1_Data.US1_d_Min_Va4); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "Cali.CALT14.txt=", StrTemp, 1);

            sprintf(StrTemp, "%d", US->USART1_Data.US1_d_Min_Va5); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "Cali.CALT15.txt=", StrTemp, 1);

            sprintf(StrTemp, "%d", USART_Data.USART1_Data.US1_CalibrationData[5]); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "Cali.CALT16.txt=", StrTemp, 1);

            sprintf(StrTemp, "%d", USART_Data.USART1_Data.US1_CalibrationData[6]); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "Cali.CALT17.txt=", StrTemp, 1);

            sprintf(StrTemp, "%d", USART_Data.USART1_Data.US1_CalibrationData[7]); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "Cali.CALT18.txt=", StrTemp, 1);

            sprintf(StrTemp, "%d", USART_Data.USART1_Data.US1_CalibrationData[8]); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "Cali.CALT19.txt=", StrTemp, 1);

            sprintf(StrTemp, "%d", USART_Data.USART1_Data.US1_CalibrationData[9]); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "Cali.CALT20.txt=", StrTemp, 1);

            sprintf(StrTemp, "%d", US->USART1_Data.US1_d_Max_Va6); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "Cali.CALT21.txt=", StrTemp, 1);

            sprintf(StrTemp, "%d", US->USART1_Data.US1_d_Max_Va7); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "Cali.CALT22.txt=", StrTemp, 1);

            sprintf(StrTemp, "%d", US->USART1_Data.US1_d_Max_Va8); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "Cali.CALT23.txt=", StrTemp, 1);

            sprintf(StrTemp, "%d", US->USART1_Data.US1_d_Max_Va9); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "Cali.CALT24.txt=", StrTemp, 1);

            sprintf(StrTemp, "%d", US->USART1_Data.US1_d_Max_Va10); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "Cali.CALT25.txt=", StrTemp, 1);
			
			sprintf(StrTemp, "%d", US->USART1_Data.US1_d_Min_Va6); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "Cali.CALT26.txt=", StrTemp, 1);
			
			sprintf(StrTemp, "%d", US->USART1_Data.US1_d_Min_Va7); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "Cali.CALT27.txt=", StrTemp, 1);
			
			sprintf(StrTemp, "%d", US->USART1_Data.US1_d_Min_Va8); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "Cali.CALT28.txt=", StrTemp, 1);

			sprintf(StrTemp, "%d", US->USART1_Data.US1_d_Min_Va9); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "Cali.CALT29.txt=", StrTemp, 1);
			
			sprintf(StrTemp, "%d", US->USART1_Data.US1_d_Min_Va10); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "Cali.CALT30.txt=", StrTemp, 1);
			

			
            ScreenTransmit(&USART_Data, US->USART1_Data.US1_SendDataBuf, US->USART1_Data.US1_SendAutoAdd, 1000);
           
        }
        break;

        case 1://按键响应
        {
			if(US->USART1_Data.US1_ReceiDataSucce_Flag == 1)
            {
				US->USART1_Data.US1_ReceiDataSucce_Flag=0;
                Step = 0;
				if(US->USART1_Data.US1_CutApartBuf[0][0] == 'L')  //开始测试
                {
                    Step = 2;
                }
            }
            
        }
        break;

        case 2://测试流程
        {

			KM_Reset();
			USART_Data.USART1_Data.US1_SendAutoAdd = 0;	
			if(*SensorInstructionTransmit("Test", 1000))
			{
				if(*AutoSetOrManual == 2)
				{//自动模式下的
		
				}else
				{	//手动模式下的
StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "Detec.backPage.val=", "8", 0);
StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "Detec.Succeed_txt.txt=", "传感器主板通讯失败，请检查传感器连接是否正常。", 1);					
StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "page Detec", " ", 1);
ScreenTransmit(&USART_Data, USART_Data.USART1_Data.US1_SendDataBuf, USART_Data.USART1_Data.US1_SendAutoAdd, 1000);  
				Step=0;
				return 0;						
				}
			}
//			My_Delay(20);
            SensorResult = *SensorInstructionTransmit("Init", 1000);
			if(SensorResult == 0 
			&& USART_Data.USART4_Data.US4_receiveData[0]=='O' 
			&& USART_Data.USART4_Data.US4_receiveData[1]=='K')
			{
				if(*AutoSetOrManual == 2)
				{
					if(*OutWindowsTxt2((uint8_t *)"", 1, 0, 1000))
					{
						MeasurResultTransmit(3, 1000);
						*AutoSetOrManual = 0;
						Result[1] = 1;
						Result[0] = 1;
						return Result;
					}					
					
				}

			}else
			{
				if(*AutoSetOrManual == 2)
				{
					if(*OutWindowsTxt2((uint8_t *)"", 0, 0, 1000))
					{
					MeasurResultTransmit(3, 1000);
					}else
					{
					MeasurResultTransmit(2, 1000);
					}
					*AutoSetOrManual = 0;
					Result[1] = 1;
					Result[0] = 1;
					return Result;
				}
			}
			My_Delay(200);
			SensorResult = *SensorInstructionTransmit("GetDataJitter", 1000);
			StrTemp_p=ClealStrLetter((char *)USART_Data.USART4_Data.US4_receiveData,0x0A);
			USART_Data.USART1_Data.US1_CalibrationData[0]=atoi(StrTemp_p);
			if( USART_Data.USART1_Data.US1_CalibrationData[0]<US->USART1_Data.US1_d_Max_Val && 
				USART_Data.USART1_Data.US1_CalibrationData[0]>US->USART1_Data.US1_d_Min_Val )
			{ 
				DetectionResult|=0x01;
				StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "Cali.CALT1.bco=", "65520", 0);
				if(*AutoSetOrManual == 2)
				{
					if(*OutWindowsTxt2((uint8_t *)StrTemp_p, 1, 0, 1000))
					{
						MeasurResultTransmit(3, 1000);
						*AutoSetOrManual = 0;
						Result[1] = 1;
						Result[0] = 1;
						return Result;
					}					
				}

			
			}else
			{
				StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "Cali.CALT1.bco=", "63488", 0);
				if(*AutoSetOrManual == 2)
				{
					if(*OutWindowsTxt2((uint8_t *)StrTemp_p, 0, 0, 1000))
					{
						MeasurResultTransmit(3, 1000);
					}else
					{
						MeasurResultTransmit(2, 1000);
					}
					*AutoSetOrManual = 0;
					Result[1] = 1;
					Result[0] = 1;
					return Result;
				}
			}
			
			if(*SensorInstructionTransmit("CalibrateFineMode0200", CALIBRATION_TIME))//
			{
				if(*AutoSetOrManual == 2)
				{
					if(*OutWindowsTxt2("", 0, 0, 1000))
					{
						MeasurResultTransmit(3, 1000);
					}else
					{
						MeasurResultTransmit(2, 1000);
					}
					*AutoSetOrManual = 0;
					Result[1] = 1;
					Result[0] = 1;
					return Result;
				}
			
			}else//有消息回复
			{
				if(	USART_Data.USART4_Data.US4_receiveData[0]=='O'&&
				USART_Data.USART4_Data.US4_receiveData[1]=='K')
				{
					if(*AutoSetOrManual == 2)
					{
						if(*OutWindowsTxt2((uint8_t *)"", 1, 0, 1000))
						{
							MeasurResultTransmit(3, 1000);
							*AutoSetOrManual = 0;
							Result[1] = 1;
							Result[0] = 1;
							return Result;
						}					
					}
					
				}else
				{
					if(*AutoSetOrManual == 2)
					{
						OutWindowsTxt2(ClealStrLetter(USART_Data.USART4_Data.US4_receiveData,0x0a),0 , 0, 1000);
						MeasurResultTransmit(2, 1000);
						*AutoSetOrManual = 0;
						Result[1] = 1;
						Result[0] = 1;
						return Result;				
					}
				}
			}
			
			SensorResult = *SensorInstructionTransmit("GetSelfTestResult", 1000);
			My_Delay(10);		
				if(	USART_Data.USART4_Data.US4_receiveData[0]=='0')
				{
					if(*AutoSetOrManual == 2)
					{
						if(*OutWindowsTxt2((uint8_t *)"", 1, 0, 1000))
						{
							MeasurResultTransmit(3, 1000);
							*AutoSetOrManual = 0;
							Result[1] = 1;
							Result[0] = 1;
							return Result;
						}					
					}

					
				}else
				{
					if(*AutoSetOrManual == 2)
					{
						if(*OutWindowsTxt2((uint8_t *)ClealStrLetter((char *)USART_Data.USART4_Data.US4_receiveData,0x0A), 0, 0, 1000))
						{
							MeasurResultTransmit(3, 1000);
						}else
						{
							MeasurResultTransmit(2, 1000);
						}
						*AutoSetOrManual = 0;
						Result[1] = 1;
						Result[0] = 1;
						return Result;
					}				
				
				}
			SensorResult = *SensorInstructionTransmit("GetDac", 1000);
			StrTemp_p=ClealStrLetter((char *)USART_Data.USART4_Data.US4_receiveData,0x0A);
			USART_Data.USART1_Data.US1_CalibrationData[1]=atoi(StrTemp_p);	
			if( USART_Data.USART1_Data.US1_CalibrationData[1] < US->USART1_Data.US1_d_Max_Va2 &&
				USART_Data.USART1_Data.US1_CalibrationData[1] > US->USART1_Data.US1_d_Min_Va2)
			{ 
				DetectionResult|=0x02;				
				StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "Cali.CALT2.bco=", "65520", 0);
				if(*AutoSetOrManual == 2)
				{
					if(*OutWindowsTxt2((uint8_t *)StrTemp_p, 1, 0, 1000))
					{
							MeasurResultTransmit(3, 1000);
							*AutoSetOrManual = 0;
							Result[1] = 1;
							Result[0] = 1;
							return Result;
					}				
				}
			}else
			{
				StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "Cali.CALT2.bco=", "63488", 0);
				if(*AutoSetOrManual == 2)
				{
					if(*OutWindowsTxt2((uint8_t *)StrTemp_p, 0, 0, 1000))
					{
						MeasurResultTransmit(3, 1000);
					}else
					{
						MeasurResultTransmit(2, 1000);
					}
					*AutoSetOrManual = 0;
					Result[1] = 1;
					Result[0] = 1;
					return Result;
				}
			}
			
			My_Delay(200);
			SensorResult = *SensorInstructionTransmit("GetCurrent", 1000);
			StrTemp_p=ClealStrLetter((char *)USART_Data.USART4_Data.US4_receiveData,0x0A);
			USART_Data.USART1_Data.US1_CalibrationData[2] = atoi(StrTemp_p);
			if( USART_Data.USART1_Data.US1_CalibrationData[2]<US->USART1_Data.US1_d_Max_Va3 &&
				USART_Data.USART1_Data.US1_CalibrationData[2]>US->USART1_Data.US1_d_Min_Va3 )
			{ 
				DetectionResult|=0x04;
				StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "Cali.CALT3.bco=", "65520", 0);
				if(*AutoSetOrManual == 2)
				{
					if(*OutWindowsTxt2((uint8_t *)StrTemp_p, 1, 0, 1000))
					{
						MeasurResultTransmit(3, 1000);
						*AutoSetOrManual = 0;
						Result[1] = 1;
						Result[0] = 1;
						return Result;
					}					
				}

			
			}else
			{
				StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "Cali.CALT3.bco=", "63488", 0);
				if(*AutoSetOrManual == 2)
				{
					if(*OutWindowsTxt2((uint8_t *)StrTemp_p, 0, 0, 1000))
					{
						MeasurResultTransmit(3, 1000);
					}else
					{
						MeasurResultTransmit(2, 1000);
					}
					*AutoSetOrManual = 0;
					Result[1] = 1;
					Result[0] = 1;
					return Result;
				}
			}		
			My_Delay(200);
			SensorResult = *SensorInstructionTransmit("GetValue", 1000);
			
			StrTemp_p=ClealStrLetter((char *)USART_Data.USART4_Data.US4_receiveData,0x0A);
			USART_Data.USART1_Data.US1_CalibrationData[3]=atoi(StrTemp_p);
			if( USART_Data.USART1_Data.US1_CalibrationData[3]<US->USART1_Data.US1_d_Max_Va4&&
				USART_Data.USART1_Data.US1_CalibrationData[3]>US->USART1_Data.US1_d_Min_Va4)
			{ 
				DetectionResult|=0x08;
				StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "Cali.CALT4.bco=", "65520", 0);
				if(*AutoSetOrManual == 2)
				{
					if(*OutWindowsTxt2((uint8_t *)StrTemp_p, 1, 0, 1000))
					{
						MeasurResultTransmit(3, 1000);
						*AutoSetOrManual = 0;
						Result[1] = 1;
						Result[0] = 1;		
						return Result;
					}				
				}

			
			}else
			{
				StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "Cali.CALT4.bco=", "63488", 0);
				if(*AutoSetOrManual == 2)
				{
					if (*OutWindowsTxt2((uint8_t *)StrTemp_p, 0, 0, 1000))
					{
MeasurResultTransmit(3, 1000);		
					}else
					{
USART_Data.USART1_Data.US1_SendAutoAdd = 0;					
StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "page Detec", " ", 1);
StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "Detec.backPage.val=", "3", 0);
StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "Detec.Succeed_txt.txt=", "夹具的模组距离位置不合适，请重新调整。", 1);
ScreenTransmit(&USART_Data, USART_Data.USART1_Data.US1_SendDataBuf, USART_Data.USART1_Data.US1_SendAutoAdd, 1000);
MeasurResultTransmit(2, 1000);					
					
					}
					*AutoSetOrManual = 0;
					Result[1] = 1;
					Result[0] = 1;
					return Result;
				}
			}		
			
			My_Delay(100);
			SensorResult = *SensorInstructionTransmit("GetDataJitter", 1000);
			StrTemp_p=ClealStrLetter((char *)USART_Data.USART4_Data.US4_receiveData,0x0A);
			USART_Data.USART1_Data.US1_CalibrationData[4]=atoi(StrTemp_p);
			if( USART_Data.USART1_Data.US1_CalibrationData[4]<US->USART1_Data.US1_d_Max_Va5&&
				USART_Data.USART1_Data.US1_CalibrationData[4]>US->USART1_Data.US1_d_Min_Va5)
			{ 
				DetectionResult|=0x10;
				StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "Cali.CALT5.bco=", "65520", 0);
				if(*AutoSetOrManual == 2)
				{
					if(*OutWindowsTxt2((uint8_t *)StrTemp_p, 1, 0, 1000))
					{
						MeasurResultTransmit(3, 1000);
						*AutoSetOrManual = 0;
						Result[1] = 1;
						Result[0] = 1;
						return Result;
					
					}					
				}

			
			}else
			{
				StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "Cali.CALT5.bco=", "63488", 0);
				if(*AutoSetOrManual == 2)
				{
					if(*OutWindowsTxt2((uint8_t *)StrTemp_p, 0, 0, 1000))
					{
						MeasurResultTransmit(3, 1000);
					}else
					{
						MeasurResultTransmit(2, 1000);
					}
					*AutoSetOrManual = 0;
					Result[1] = 1;
					Result[0] = 1;
					return Result;
				}
			}	
			
			
	
			
			SensorResult = *SensorInstructionTransmit("SetMode0", 1000);

			if(SensorResult == 0 
			&& USART_Data.USART4_Data.US4_receiveData[0]=='H')
			{
				if(*AutoSetOrManual == 2)
				{
					if(*OutWindowsTxt2((uint8_t *)"", 1, 0, 1000))
					{
							MeasurResultTransmit(3, 1000);
							*AutoSetOrManual = 0;
							Result[1] = 1;
							Result[0] = 1;
							return Result;
					}				
				}

			}else
			{
				
				if(*AutoSetOrManual == 2)
				{
					if(*OutWindowsTxt2((uint8_t *)"", 0, 0, 1000))
					{
						MeasurResultTransmit(3, 1000);
					}else
					{
						MeasurResultTransmit(2, 1000);
					}
					*AutoSetOrManual = 0;
					Result[1] = 1;
					Result[0] = 1;
					return Result;
				}
			}
			My_Delay(500);
			SensorResult = *SensorInstructionTransmit("GetDataJitter", 1000);
			StrTemp_p=ClealStrLetter((char *)USART_Data.USART4_Data.US4_receiveData,0x0A);
			USART_Data.USART1_Data.US1_CalibrationData[5]=atoi(StrTemp_p);
			if( USART_Data.USART1_Data.US1_CalibrationData[5]<US->USART1_Data.US1_d_Max_Va6 &&
				USART_Data.USART1_Data.US1_CalibrationData[5]>US->USART1_Data.US1_d_Min_Va6)
			{ 
				DetectionResult|=0x20;
				StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "Cali.CALT16.bco=", "65520", 0);
				if(*AutoSetOrManual == 2)
				{
					if(*OutWindowsTxt2((uint8_t *)StrTemp_p, 1, 0, 1000))
					{
							MeasurResultTransmit(3, 1000);
							*AutoSetOrManual = 0;
							Result[1] = 1;
							Result[0] = 1;
							return Result;
					}				
				}

			
			}else
			{
				StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "Cali.CALT16.bco=", "63488", 0);
				if(*AutoSetOrManual == 2)
				{
					if(*OutWindowsTxt2((uint8_t *)StrTemp_p, 0, 0, 1000))
					{
						MeasurResultTransmit(3, 1000);
					}else
					{
						MeasurResultTransmit(2, 1000);
					}
					*AutoSetOrManual = 0;
					Result[1] = 1;
					Result[0] = 1;
					return Result;
				
				}
			}
		
			
			if(*SensorInstructionTransmit("CalibrateHspMode0149", CALIBRATION_TIME))
			{
				if(*AutoSetOrManual == 2)
				{
					if(*OutWindowsTxt2("", 0, 0, 1000))
					{
						MeasurResultTransmit(3, 1000);
					}else
					{
						MeasurResultTransmit(2, 1000);
					}
					*AutoSetOrManual = 0;
					Result[1] = 1;
					Result[0] = 1;
					return Result;
				}
			}else //有消息回复
			{
				if(	USART_Data.USART4_Data.US4_receiveData[0]=='O'&&
				USART_Data.USART4_Data.US4_receiveData[1]=='K')
				{
					if(*AutoSetOrManual == 2)
					{
						if(*OutWindowsTxt2((uint8_t *)"", 1, 0, 1000))
						{
							MeasurResultTransmit(3, 1000);
							*AutoSetOrManual = 0;
							Result[1] = 1;
							Result[0] = 1;
							return Result;
						}				
					}
				}else
				{
					if(*AutoSetOrManual == 2)
					{
						if(*OutWindowsTxt2(ClealStrLetter((char *)USART_Data.USART4_Data.US4_receiveData,0x0A), 0, 0, 1000))
						{
							MeasurResultTransmit(3, 1000);
						}else
						{
							MeasurResultTransmit(2, 1000);
						}
						*AutoSetOrManual = 0;
						Result[1] = 1;
						Result[0] = 1;
						return Result;
										
					}
				
				}
			}
			
			
			SensorResult = *SensorInstructionTransmit("GetSelfTestResult", 1000);
			My_Delay(10);
			
			if(	USART_Data.USART4_Data.US4_receiveData[0]=='0')
			{
				if(*AutoSetOrManual == 2)
				{
					if(*OutWindowsTxt2((uint8_t *)"", 1, 0, 1000))
					{
							MeasurResultTransmit(3, 1000);
							*AutoSetOrManual = 0;
							Result[1] = 1;
							Result[0] = 1;
							return Result;
					}				
				}
			}else
			{
				
				if(*AutoSetOrManual == 2)
				{
					if(*OutWindowsTxt2((uint8_t *)ClealStrLetter((char *)USART_Data.USART4_Data.US4_receiveData,0x0A), 0, 0, 1000))
					{
						MeasurResultTransmit(3, 1000);
					}else
					{
						MeasurResultTransmit(2, 1000);
					}
					*AutoSetOrManual = 0;
					Result[1] = 1;
					Result[0] = 1;
					return Result;
				}				
			
			}
				
			SensorResult = *SensorInstructionTransmit("GetDac", 1000);
			StrTemp_p=ClealStrLetter((char *)USART_Data.USART4_Data.US4_receiveData,0x0A);
			USART_Data.USART1_Data.US1_CalibrationData[6]  = atoi(StrTemp_p);
			if( USART_Data.USART1_Data.US1_CalibrationData[6] <US->USART1_Data.US1_d_Max_Va7 &&
				USART_Data.USART1_Data.US1_CalibrationData[6] >US->USART1_Data.US1_d_Min_Va7)
			{ 
				DetectionResult|=0x40;
				StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "Cali.CALT17.bco=", "65520", 0);
				
				if(*AutoSetOrManual == 2)
				{
					if(*OutWindowsTxt2((uint8_t *)StrTemp_p, 1, 0, 1000))
					{
						MeasurResultTransmit(3, 1000);
						*AutoSetOrManual = 0;
						Result[1] = 1;
						Result[0] = 1;
						return Result;
					}				
				}

			
			}else
			{
				StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "Cali.CALT17.bco=", "63488", 0);
				if(*AutoSetOrManual == 2)
				{
					if(*OutWindowsTxt2((uint8_t *)StrTemp_p, 0, 0, 1000))
					{
						MeasurResultTransmit(3, 1000);
					}else
					{
						MeasurResultTransmit(2, 1000);
					}
					*AutoSetOrManual = 0;
					Result[1] = 1;
					Result[0] = 1;
					return Result;
				}
			}			
			My_Delay(200);
			SensorResult = *SensorInstructionTransmit("GetCurrent", 1000);
			StrTemp_p=ClealStrLetter((char *)USART_Data.USART4_Data.US4_receiveData,0x0A);
			USART_Data.USART1_Data.US1_CalibrationData[7]=  atoi(StrTemp_p);
			if(USART_Data.USART1_Data.US1_CalibrationData[7] < US->USART1_Data.US1_d_Max_Va8 &&
			   USART_Data.USART1_Data.US1_CalibrationData[7] > US->USART1_Data.US1_d_Min_Va8 )
			{
				DetectionResult|=0x80;
				StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "Cali.CALT18.bco=", "65520", 0);	
				if(*AutoSetOrManual == 2)
				{
					if(*OutWindowsTxt2((uint8_t *)StrTemp_p, 1, 0, 1000))
					{
						MeasurResultTransmit(3, 1000);
						*AutoSetOrManual = 0;
						Result[1] = 1;
						Result[0] = 1;
						return Result;
					}				
				}				

			
			}else
			{
				StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "Cali.CALT18.bco=", "63488", 0);
				if(*AutoSetOrManual == 2)
				{
					if(*OutWindowsTxt2((uint8_t *)StrTemp_p, 0, 0, 1000))
					{
						MeasurResultTransmit(3, 1000);
					}else
					{
						MeasurResultTransmit(2, 1000);
					}
					*AutoSetOrManual = 0;
					Result[1] = 1;
					Result[0] = 1;
					return Result;
				}
			}		
			My_Delay(200);
			SensorResult = *SensorInstructionTransmit("GetValue", 1000);
			StrTemp_p=ClealStrLetter((char *)USART_Data.USART4_Data.US4_receiveData,0x0A);
			USART_Data.USART1_Data.US1_CalibrationData[8] = atoi(StrTemp_p);
			if(USART_Data.USART1_Data.US1_CalibrationData[8] <US->USART1_Data.US1_d_Max_Va9 &&
			   USART_Data.USART1_Data.US1_CalibrationData[8] >US->USART1_Data.US1_d_Min_Va9	)
			{ 
				DetectionResult|=0x100;
				StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "Cali.CALT19.bco=", "65520", 0);
				if(*AutoSetOrManual == 2)
				{
					if(*OutWindowsTxt2((uint8_t *)StrTemp_p, 1, 0, 1000))
					{
							MeasurResultTransmit(3, 1000);
							*AutoSetOrManual = 0;
							Result[1] = 1;
							Result[0] = 1;
							return Result;
					}				
				}
			}else
			{
				StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "Cali.CALT19.bco=", "63488", 0);
				if(*AutoSetOrManual == 2)
				{
					if(OutWindowsTxt2((uint8_t *)StrTemp_p, 0, 0, 1000))
					{
						MeasurResultTransmit(3, 1000);	
					}else
					{
USART_Data.USART1_Data.US1_SendAutoAdd = 0;					
StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "page Detec", " ", 1);
StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "Detec.backPage.val=", "3", 0);
StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "Detec.Succeed_txt.txt=", "夹具的模组距离位置不合适，请重新调整。", 1);
ScreenTransmit(&USART_Data, USART_Data.USART1_Data.US1_SendDataBuf, USART_Data.USART1_Data.US1_SendAutoAdd, 1000);
					MeasurResultTransmit(2, 1000);					
					}
					*AutoSetOrManual = 0;
					Result[1] = 1;
					Result[0] = 1;
					return Result;
				}
			}		
			
			My_Delay(100);
			SensorResult = *SensorInstructionTransmit("GetDataJitter", 1000);
			
			
			StrTemp_p=ClealStrLetter((char *)USART_Data.USART4_Data.US4_receiveData,0x0A);
			USART_Data.USART1_Data.US1_CalibrationData[9] =atoi(StrTemp_p);
			if( USART_Data.USART1_Data.US1_CalibrationData[9] <US->USART1_Data.US1_d_Max_Va10 &&
			    USART_Data.USART1_Data.US1_CalibrationData[9] >US->USART1_Data.US1_d_Min_Va10 )
			{ 
				DetectionResult|=0x200;
				StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "Cali.CALT20.bco=", "65520", 0);
				if(*AutoSetOrManual == 2)
				{
					if(*OutWindowsTxt2((uint8_t *)StrTemp_p, 1, 0, 1000))
					{
							MeasurResultTransmit(3, 1000);
							*AutoSetOrManual = 0;
							Result[1] = 1;
							Result[0] = 1;
							return Result;
					}				
				}

			
			}else
			{
				StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "Cali.CALT20.bco=", "63488", 0);
				if(*AutoSetOrManual == 2)
				{
					if(*OutWindowsTxt2((uint8_t *)StrTemp_p, 0, 0, 1000))
					{
						MeasurResultTransmit(3, 1000);
					}else
					{
						MeasurResultTransmit(2, 1000);
					}
					*AutoSetOrManual = 0;
					Result[1] = 1;
					Result[0] = 1;
					return Result;
				}
			}	
		

			
                if(*AutoSetOrManual == 2)
                {
                    *AutoSetOrManual = 0;
					ScreenTransmit(&USART_Data, USART_Data.USART1_Data.US1_SendDataBuf, USART_Data.USART1_Data.US1_SendAutoAdd, 1000);
					Result[0] = 1;
					Result[1] = 0;
					return Result;
                }
                else
                {	
					Step=0;		
					StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "Detec.backPage.val=", "8", 0);

					if((DetectionResult&0x3ff) == 0x3ff) //发送最总的结果
					{
						StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "Detec.Succeed_txt.txt=", "测试成功  OK", 1);
					}
					else
					{
						StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "Detec.Succeed_txt.txt=", "测试失败  NO", 1);
					}					
					StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoAdd++], "page Detec", " ", 1);
                }
				ScreenTransmit(&USART_Data, USART_Data.USART1_Data.US1_SendDataBuf, USART_Data.USART1_Data.US1_SendAutoAdd, 1000);  


				
        }
    }

    Result[0] = 0;
    return Result;
}








char *ButtonCheck(USART_DataType *US, unsigned char *AutoSetOrManual)
{
	static  char Result[2] = {0};
  static unsigned char Step = 0,smallStep=0; //大步
  static  char StrTemp[20] = {0};
	static  char *StrTemp_p;
	static  char SensorResult=0;
	static  char KEY_Times_1=0;
	static  char KEY_Times_0=0;
	static  char ModelFlag=0xff;

    if(*AutoSetOrManual == 1)
    {
        *AutoSetOrManual = 2;
        Step = 1;
		KEY_Times_1=0;
		KEY_Times_0=0;
    }
    switch(Step)
    {
        case 0://查询
        {
				USART_Data.USART1_Data.US1_SendAutoAdd = 0;

				if(*SensorInstructionTransmit("Test", 100))
				{
					
				StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "Button.ButtonT0.bco=64528", "" ,0);
				StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "Button.ButtonT0.txt=", "传感器连接失败" ,1);
								
				}
				else
				{
					
				StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "Button.ButtonT0.bco=2024", "" ,0);
				StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "Button.ButtonT0.txt=", "传感器连接成功" ,1);
								
						


				if(!(*SensorInstructionTransmit("GetCurrent", 100)))
				{
					StrTemp_p=ClealStrLetter((char *)USART_Data.USART4_Data.US4_receiveData,0x0A);
					if(ModelFlag==0)
					{
						sprintf((char *)StrTemp, "高速模式->电流:%s", StrTemp_p);
					}else if(ModelFlag==1)
					{
						sprintf((char *)StrTemp, "中速模式->电流:%s", StrTemp_p);
					}else
					{
						sprintf((char *)StrTemp, "电流:%s", StrTemp_p);
					}
					StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "ButtonT18.txt=",StrTemp, 1);
				}
				else
				{
					StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "ButtonT18.txt=","电流:0", 1);	
				}
				
				if(!(*SensorInstructionTransmit("GetValue", 10)))
				{
					StrTemp_p=ClealStrLetter((char *)USART_Data.USART4_Data.US4_receiveData,0x0A);
					if(ModelFlag==0)
					{
						sprintf((char *)StrTemp, "高速模式->数值:%s", StrTemp_p);
					}else if(ModelFlag==1)
					{
						sprintf((char *)StrTemp, "中速模式->数值:%s", StrTemp_p);
					}else
					{
						sprintf((char *)StrTemp, "数值:%s", StrTemp_p);
					}
					
					
					StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "ButtonT11.txt=",StrTemp, 1);
				}
				else
				{
					StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "ButtonT11.txt=","数值:0", 1);	
				}
				if(!(*SensorInstructionTransmit("GetDataJitter", 100)))
				{
					StrTemp_p=ClealStrLetter((char *)USART_Data.USART4_Data.US4_receiveData,0x0A);
					
					if(ModelFlag==0)
					{
						sprintf((char *)StrTemp, "高速模式->波动:%s", StrTemp_p);
					}else if(ModelFlag==1)
					{
						sprintf((char *)StrTemp, "中速模式->波动:%s", StrTemp_p);
					}else
					{
						sprintf((char *)StrTemp, "波动:%s", StrTemp_p);
					}
					StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "ButtonT12.txt=",StrTemp, 1);	
				}else
				{
					StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "ButtonT12.txt=","波动:0", 1);
				}
				
				if(*SensorInstructionTransmit("CheckID", 100)==0)
				{

					sprintf((char *)StrTemp, "ID:%s", ClealStrLetter((char *)USART_Data.USART4_Data.US4_receiveData,0x0A));
					StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "ButtonT13.txt=",StrTemp, 1);

					if (strcmp(ClealStrLetter((char *)USART_Data.USART4_Data.US4_receiveData,0x0A),(char *)comVariableBlock.ID_SreeFindScreen[0])== 0)
					{
					StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "Button.ButtonT14.bco=2024", "" ,0);
					}else
					{
					StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "Button.ButtonT14.bco=64528", "" ,0);
					}

					if (strcmp(ClealStrLetter((char *)USART_Data.USART4_Data.US4_receiveData,0x0A),(char *)comVariableBlock.ID_SreeFindScreen[1])== 0)
					{
					StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "Button.ButtonT15.bco=2024", "" ,0);
					}else
					{
					StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "Button.ButtonT15.bco=64528", "" ,0);
					}

					if (strcmp(ClealStrLetter((char *)USART_Data.USART4_Data.US4_receiveData,0x0A),(char *)comVariableBlock.ID_SreeFindScreen[2])== 0)
					{
					StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "Button.ButtonT16.bco=2024", "" ,0);
					}else
					{
					StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "Button.ButtonT16.bco=64528", "" ,0);
					}


					if (strcmp(ClealStrLetter((char *)USART_Data.USART4_Data.US4_receiveData,0x0A),(char *)comVariableBlock.ID_SreeFindScreen[3])== 0)
					{
					StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "Button.ButtonT17.bco=2024", "" ,0);
					}else
					{
					StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "Button.ButtonT17.bco=64528", "" ,0);
					}
					
				}
			
				

				if(*SensorInstructionTransmit("MEGA", 100)==0)
				{
					if(	USART_Data.USART4_Data.US4_receiveData[0]=='1')
					{ 
						StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "ButtonP5.pic=11", " ", 1);//
					}		
				}


				if(*SensorInstructionTransmit("MEGA", 100)==0)
				{
					if(	USART_Data.USART4_Data.US4_receiveData[0]=='0')
					{ 
						StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "ButtonP5.pic=10", " ", 1);//
					}			
				}
				
				if(*SensorInstructionTransmit("SET", 100)==0)
				{
					if(	USART_Data.USART4_Data.US4_receiveData[0]=='1')
					{ 
						StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "ButtonP4.pic=11", " ", 1);//
			
					}
					else
					{
						StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "ButtonP4.pic=10", " ", 1);//
					}
					
				}
				
				if(*SensorInstructionTransmit("MODE", 100)==0)
				{
					if(	USART_Data.USART4_Data.US4_receiveData[0]=='1')
					{ 
						StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "ButtonP1.pic=11", " ", 1);//
					}
					else
					{
						StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "ButtonP1.pic=10", " ", 1);//
					}				
				}
		
				if(*SensorInstructionTransmit("DOWN", 100)==0)
				{
					if(	USART_Data.USART4_Data.US4_receiveData[0]=='1')
					{ 
						StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "ButtonP2.pic=11", " ", 1);//
					}
					else
					{
						StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "ButtonP2.pic=10", " ", 1);//
					}	
					
				}
				if(*SensorInstructionTransmit("UP", 100)==0)
				{
					
					if(	USART_Data.USART4_Data.US4_receiveData[0]=='1')
					{ 
						StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "ButtonP3.pic=11", " ", 1);//
					}
					else
					{
						StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "ButtonP3.pic=10", " ", 1);//
					}				
				}
		
				if(*SensorInstructionTransmit("PRESET", 100)==0)
				{
					if(	USART_Data.USART4_Data.US4_receiveData[0]=='1')
					{ 
						StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "ButtonP0.pic=11", " ", 1);//
					}
					else
					{
						StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "ButtonP0.pic=10", " ", 1);//
					}	
					
				}
					
					
					
					
					
				}

				

				///连接失败后的
				

				

				if(US->USART1_Data.US1_ReceiDataSucce_Flag == 1)
				{
					US->USART1_Data.US1_ReceiDataSucce_Flag=0;

					if(strcmp((const char *)US->USART1_Data.US1_CutApartBuf[0], "KM_ON") == 0 )
					{
						K_V_6(0);
					}
					else if	(strcmp((const char *)US->USART1_Data.US1_CutApartBuf[0], "KM_OFF") == 0 )
					{
						K_V_6(1);
					}else if	(US->USART1_Data.US1_CutApartBuf[0][1]=='L' )
					{
						Motor = RANGE_PWM_MIN;
					
					}else if	(US->USART1_Data.US1_CutApartBuf[0][1]=='M' )
					{
					
					Motor = RANGE_PWM_MID;
					}else if	(US->USART1_Data.US1_CutApartBuf[0][1]=='R' )
					{
					
					Motor = RANGE_PWM_MAX;
					}else if	(US->USART1_Data.US1_CutApartBuf[0][3]=='H' )
					{
						if(!(*SensorInstructionTransmit("SetMode0", 100)))
						{
							ModelFlag=0;
						}
					
					}else if	(US->USART1_Data.US1_CutApartBuf[0][3]=='F' )
					{
						if(!(*SensorInstructionTransmit("SetMode1", 100)))
						{
							ModelFlag=1;
						}
					
					}
				}
				
				if(K_V_6_Read)
				{
					StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "Button.ButtonB5.txt=", "KM_OFF", 1);//
				}else{
					StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "Button.ButtonB5.txt=", "KM_ON", 1);//
				}

				
				HAL_Delay(1);
				if(SYS_tickTime.sys_MeasuringTime_ms>200)
				{
				SYS_tickTime.sys_MeasuringTime_ms=0;
				ScreenTransmit(&USART_Data, USART_Data.USART1_Data.US1_SendDataBuf, USART_Data.USART1_Data.US1_SendAutoAdd, 1000);	
				}	
			
        }
        break;

        case 1://按键响应
        {
			
			OutWindowsTxt2("", 2, 0, 1000);
USART_Data.USART1_Data.US1_SendAutoAdd = 0;
StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "mainP9.pic=10", " ", 1);//
StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "mainP4.pic=10", " ", 1);//
StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "mainP5.pic=10", " ", 1);//
StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "mainP6.pic=10", " ", 1);//
StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "mainP7.pic=10", " ", 1);//
StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "mainP8.pic=10", " ", 1);//
ScreenTransmit(&USART_Data, USART_Data.USART1_Data.US1_SendDataBuf, USART_Data.USART1_Data.US1_SendAutoAdd, 1000);
	
			
			
			
			//检测初始状态，看按键是不是常闭
			if(*SensorInstructionTransmit("SET", 100)==0)
			{
				if(	USART_Data.USART4_Data.US4_receiveData[0]=='0')
				{ 
					KEY_Times_0|= 0x04;
				}
			}
			if(*SensorInstructionTransmit("MODE", 100)==0)
			{
				if(	USART_Data.USART4_Data.US4_receiveData[0]=='0')
				{ 
					KEY_Times_0|= 0x08;
				}			
			}
			if(*SensorInstructionTransmit("DOWN", 100)==0)
			{
				if(	USART_Data.USART4_Data.US4_receiveData[0]=='0')
				{ 
					KEY_Times_0|= 0x10;
				}
			}
			if(*SensorInstructionTransmit("UP", 100)==0)
			{
				if(	USART_Data.USART4_Data.US4_receiveData[0]=='0')
				{ 
					KEY_Times_0|= 0x20;
				}
			}
			if(*SensorInstructionTransmit("PRESET", 100)==0)
			{
				if(	USART_Data.USART4_Data.US4_receiveData[0]=='0')
				{ 
					KEY_Times_0|= 0x40;
				}
			}
			
			
			KEY_Times_1= 0;
            SensorInstructionTransmit("Test", 100);
			My_Delay(10);
			SensorResult = *SensorInstructionTransmit("KeySet", 1000);
			My_Delay(10);
			Motor = RANGE_PWM_MIN;
			SYS_tickTime.sys_MeasuringTime_ms=0;
			Step=2;
            K_V_6(1); //通气阀
        }
        break;

        case 2://测试流程
        {
			USART_Data.USART1_Data.US1_SendAutoAdd = 0;
			
			Motor = RANGE_PWM_MAX;
			My_Delay(650);
			if(*SensorInstructionTransmit("MEGA", 100)==0)
			{
				if(	USART_Data.USART4_Data.US4_receiveData[0]=='0')
				{ 
		KEY_Times_1|= 0x02;
		KEY_Times_0|= 0x02;
				}			
			}	

			Motor = RANGE_PWM_MIN;
			My_Delay(650);
			if(*SensorInstructionTransmit("MEGA", 100)==0)
			{
				if(	USART_Data.USART4_Data.US4_receiveData[0]=='1')
				{ 
		KEY_Times_1|= 0x01;
		KEY_Times_0|= 0x01;
				}		
			}
			
			if(KEY_Times_1==0x03)//拨动开关，拨两边是好的时候才算是好的
			{
				StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "mainP9.pic=11", " ", 1);//
			
			}else
			{
				StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "mainP9.pic=10", " ", 1);//
			}

			
			if(*SensorInstructionTransmit("SET", 100)==0)
			{
				if(	USART_Data.USART4_Data.US4_receiveData[0]=='1')
				{ 
		KEY_Times_1|= 0x04;
		if((KEY_Times_1&KEY_Times_0)&0x04==0x04)
		{
			StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "mainP4.pic=11", " ", 1);//
		}
				}
				else
				{
	//    StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "testP2.pic=10", " ", 1);//
				}
				
			}
			
			if(*SensorInstructionTransmit("MODE", 100)==0)
			{
				if(	USART_Data.USART4_Data.US4_receiveData[0]=='1')
				{ 
	KEY_Times_1|= 0x08;
					if((KEY_Times_1&KEY_Times_0)&0x08==0x08)
					{
		StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "mainP7.pic=11", " ", 1);//							
					}

				}
				else
				{
	//    StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "testP3.pic=10", " ", 1);//

				}				
				
			}
	
			if(*SensorInstructionTransmit("DOWN", 100)==0)
			{
				
				if(	USART_Data.USART4_Data.US4_receiveData[0]=='1')
				{ 
	KEY_Times_1|= 0x10;
		if((KEY_Times_1&KEY_Times_0)&0x10==0x10)
		{
		StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "mainP6.pic=11", " ", 1);//
				
		}			

				}
				else
				{
	//    StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "testP4.pic=10", " ", 1);//

				}	
				
			}
			if(*SensorInstructionTransmit("UP", 100)==0)
			{
				
					if(	USART_Data.USART4_Data.US4_receiveData[0]=='1')
				{ 
	KEY_Times_1|= 0x20;
					if((KEY_Times_1&KEY_Times_0)&0x20==0x20)
					{
		StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "mainP5.pic=11", " ", 1);//	
					}

				}
				else
				{
	//    StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "testP5.pic=10", " ", 1);//

				}				
				
			}
	
			if(*SensorInstructionTransmit("PRESET", 100)==0)
			{
				
				if(	USART_Data.USART4_Data.US4_receiveData[0]=='1')
				{ 
	KEY_Times_1|= 0x40;
						if((KEY_Times_1&KEY_Times_0)&0x40==0x40)
						{
	StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "mainP8.pic=11", " ", 1);//
							
						}
	
				}
				else
				{
	//    StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "testP6.pic=10", " ", 1);//

				}	
				
			}
			
ScreenTransmit(&USART_Data, USART_Data.USART1_Data.US1_SendDataBuf, USART_Data.USART1_Data.US1_SendAutoAdd, 1000);

			K_V_6(0); 
			Motor = RANGE_PWM_MID;//范围84-99	
			
			 *AutoSetOrManual = 0;
			Step=0;
			sprintf(StrTemp, "0x%X" ,KEY_Times_1); 
			My_Delay(500);
			if((KEY_Times_1&KEY_Times_0)==0x7f)
			{ 
				if(*OutWindowsTxt2(StrTemp, 1, 0, 1000))
				{
					MeasurResultTransmit(3, 1000);
					Result[1] = 1;
					Result[0] = 1;
					return Result;
				}	
				Result[1] = 0;
				Result[0] = 1;
				return Result;
			
			}else
			{
				if(*OutWindowsTxt2(StrTemp, 0, 0, 1000))
				{
					Result[1] = 1;
					Result[0] = 1;
					MeasurResultTransmit(3, 1000);
					return Result;
				}
				MeasurResultTransmit(2, 1000);
				Result[1] = 1;
				Result[0] = 1;
				return Result;
			}
        }
    }

    Result[0] = 0;
    return Result;
}








char PageMain(USART_DataType *US, unsigned char *Start)//
{
    char *Result;

    if(USART_Data.USART1_Data.PageNum != USART_Data.USART1_Data.PageNumChange)
    {
        USART_Data.USART1_Data.PageNumChange = USART_Data.USART1_Data.PageNum;
//		HAL_Delay(100);
    }

    if(*Start == 1)
    {
        *Start = 0;
        comVariableBlock.MainStep = MS_SelfChecking;
    }

    LEDState();

    switch(comVariableBlock.MainStep)
    {
        case MS_SelfChecking:
        { 
            if(SelfChecking())
            {
                comVariableBlock.MainStep = MS_SaveData;
                return 0;
            }
			comVariableBlock.AutoSetOrManual=1;
            comVariableBlock.MainStep = MS_PageKeyVoltage_T;
        }
        break;

        case MS_PageKeyVoltage_T:
        {
            if((Result = PageKeyVoltage_T(&USART_Data, &comVariableBlock.AutoSetOrManual))[0])
            {	
                if(Result[1])
                {
                    comVariableBlock.MainStep = MS_SaveData;
                }
                else
                {
                    comVariableBlock.MainStep = MS_PageReversePower_T;
					comVariableBlock.AutoSetOrManual = 1;
                }
            }
        }
        break;
		
		case MS_PageReversePower_T:
		{
            if((Result = PageReversePower_T(&USART_Data, &comVariableBlock.AutoSetOrManual))[0])
            {
                if(Result[1])
                {
                    comVariableBlock.MainStep = MS_SaveData;
                }
                else
                {
                    comVariableBlock.MainStep = MS_Calibration;
                    comVariableBlock.AutoSetOrManual = 1;
                }
            }
		
		}break;

        case MS_Calibration:
        {
            if((Result = Calibration(&USART_Data ,&comVariableBlock.AutoSetOrManual))[0]  )
            {
                if(Result[1])
                {
                    comVariableBlock.MainStep = MS_SaveData;
                }
                else
                {
                    comVariableBlock.MainStep = MS_NixieTube;
                    comVariableBlock.AutoSetOrManual = 1;
                }
            }

        }
        break;
		
        case MS_NixieTube:
        {
            if((Result =NixieTube(&USART_Data))[0]  )
            {
                if(Result[1])
                {
                    comVariableBlock.MainStep = MS_SaveData;
                }
                else
                {
                    comVariableBlock.MainStep = MS_PageCurConsume_T;
					comVariableBlock.AutoSetOrManual=1;
                }
            }
        }
        break;

        case MS_PageCurConsume_T:
        {
            if((Result =PageCurConsume_T(&USART_Data, &comVariableBlock.AutoSetOrManual))[0] )
            {
                if(Result[1])
                {
                    comVariableBlock.MainStep = MS_SaveData;
                }
                else
                {
                    comVariableBlock.MainStep = MS_ExternalInputLine;
                    comVariableBlock.AutoSetOrManual = 1;
                }
            }
        }
        break;

        case MS_ExternalInputLine:
        {
            if((Result =ExternalInputLine())[0] )
            {
                if(Result[1])
                {
                    comVariableBlock.MainStep = MS_SaveData;
                }
                else
                {
                    comVariableBlock.MainStep = MS_HighLowLoad;
					comVariableBlock.AutoSetOrManual=1;
                }

            }

        }
        break;
        case MS_HighLowLoad:
        {
            if((Result = HighLowLoad(&USART_Data, &comVariableBlock.AutoSetOrManual))[0])
            {
                if(Result[1])
                {
                    comVariableBlock.MainStep = MS_SaveData;
                }
                else
                {
                    comVariableBlock.MainStep = MS_ButtonCheck;
					comVariableBlock.AutoSetOrManual=1;
                }
            }

        }
        break;
		case MS_ButtonCheck:
		{
            if((Result = ButtonCheck(&USART_Data, &comVariableBlock.AutoSetOrManual))[0])
            {
                if(Result[1])
                {
                    comVariableBlock.MainStep = MS_SaveData;
                }
                else
                {
                    comVariableBlock.MainStep = MS_SaveData;
                    MeasurResultTransmit(1, 1000);
                }
            }
		}break;

        case MS_SaveData:
        {
            SaveDataExScreen();
            comVariableBlock.MainStep = MS_non;
        }
        break;
    }

    return 0;
}

	

unsigned int calibrationArrayValue[5]={25000,28000,31000,35000,38000};
float calibrationArrayCurrent[5]={0,0,0,0,0};

char *Setting(USART_DataType *US, unsigned char *AutoSetOrManual)
{
	static char step=0,smallStep=0;
	static char Result[2] = {0};
	static unsigned char i=0,SaveResult=0,ProgressVal=0;
	float Average_X=0;
	float Average_Y=0;
	float ResultVariable0=0;
	float ResultVariable1=0;
	static  char StrTemp[50]={0};

	static char ArrayValueLen=sizeof(calibrationArrayValue)/sizeof(calibrationArrayValue[0]);
	static char ArrayCurrentLen=sizeof(calibrationArrayCurrent)/sizeof(calibrationArrayCurrent[0]);
	

	
    if(*AutoSetOrManual == 1)
    {
        *AutoSetOrManual = 2;
        step = 0;
        smallStep = 0;
    }
	
	switch(step)
	{
		case 0:
		{
		My_Delay(100);	
		step=1;	
		USART_Data.USART1_Data.US1_SendAutoAdd = 0;				
		sprintf(StrTemp, "%s%0.3f","NPN_A=" ,comVariableBlock.Coefficient_NPN_A); //Setting.SettingT10
		StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "Setting.SettingT10.txt=",StrTemp, 1);
		sprintf(StrTemp, "%s%0.2f","NPN_B=",comVariableBlock.Coefficient_NPN_B); //
		StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "Setting.SettingT11.txt=",StrTemp, 1);
		sprintf(StrTemp, "%s%0.3f","PNP_A=",comVariableBlock.Coefficient_PNP_A); //
		StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "Setting.SettingT12.txt=",StrTemp, 1);
		sprintf(StrTemp, "%s%0.2f","PNP_B=",comVariableBlock.Coefficient_PNP_B); //
		StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "Setting.SettingT13.txt=",StrTemp, 1);		
		ScreenTransmit(&USART_Data, USART_Data.USART1_Data.US1_SendDataBuf, USART_Data.USART1_Data.US1_SendAutoAdd, 1000);
		
		}break;
		
		case 1:
		{
			if(strcmp((const char *)US->USART1_Data.US1_CutApartBuf[0], "SettingCoef") == 0 )
			{
				US->USART1_Data.US1_CutApartBuf[0][0]='\0';
				step=2;
				smallStep=0;
				SaveResult=0;
				ProgressVal=0;
				GetMultimeter(0, 1000);
				i=0;
			}
		
		}break;
		case 2:
		{
			
			USART_Data.USART1_Data.US1_SendAutoAdd = 0;	
			if(smallStep==0)
			{

				htim2.Instance->CCR3 = calibrationArrayValue[i];
				if(*SensorInstructionTransmit("Test", 100))
				{
				SaveResult|=0x01;
				}
				My_Delay(10);
				if(*SensorInstructionTransmit("SetOutputStateON", 100))
				{
				SaveResult|=0x02;
				}
				My_Delay(10);
				
				if(*SensorInstructionTransmit("SetOutputTypeNPN", 100))
				{
				SaveResult|=0x04;
				}
				K_Load(0);
				K_OUTSW(1);
				K_OUTSET(0);
				K_LoadPower(1);
				K_C_Load(1);
				My_Delay(3000);
				if(*GetMultimeter(0, 1000))
				{
					SaveResult|=0x08;
				}
				calibrationArrayCurrent[i]=USART_Data.USART6_Data.US6_OutValCurrent;
				i++;
				ProgressVal+=10;
				if(i>=ArrayValueLen)
				{
					for(int jj=0;jj<ArrayValueLen;jj++)
					{
						ResultVariable0+=calibrationArrayValue[jj];
					}
					
					Average_X=ResultVariable0/ArrayValueLen;
					ResultVariable0=0;
					for(int jj=0;jj<ArrayCurrentLen;jj++)
					{
						ResultVariable0+=calibrationArrayCurrent[jj];
					}
					Average_Y=ResultVariable0/ArrayCurrentLen;
					
					for(int jj=0;jj<ArrayCurrentLen;jj++)
					{
						ResultVariable0+=(calibrationArrayValue[jj]-Average_X)*(calibrationArrayCurrent[jj]-Average_Y);
						ResultVariable1+=(calibrationArrayValue[jj]-Average_X)*(calibrationArrayValue[jj]-Average_X);
					}
					comVariableBlock.Coefficient_NPN_A=ResultVariable0/ResultVariable1;
					comVariableBlock.Coefficient_NPN_B=Average_Y-comVariableBlock.Coefficient_NPN_A*Average_X;
					smallStep=1;
					i=0;
				}
				
			}else if(smallStep==1)
			{
				htim9.Instance->CCR2 = calibrationArrayValue[i];
				if(*SensorInstructionTransmit("Test", 100))
				{
				
					SaveResult|=0x10;
				}
				My_Delay(10);
				if(*SensorInstructionTransmit("SetOutputStateON", 100))
				{
					SaveResult|=0x20;
				}
				My_Delay(10);
				if(*SensorInstructionTransmit("SetOutputTypePNP", 100))
				{
					SaveResult|=0x40;
				}
				K_Load(1);
				K_OUTSW(1);
				K_OUTSET(0);
				K_LoadPower(1);
				K_C_Load(1);
				My_Delay(3000);
				if(*GetMultimeter(0, 1000))
				{
					SaveResult|=0x80;
				}
				calibrationArrayCurrent[i]=USART_Data.USART6_Data.US6_OutValCurrent;
				i++;
				ProgressVal+=10;
				if(i>=ArrayValueLen)
				{
					ResultVariable0=0;
					for(int jj=0;jj<ArrayValueLen;jj++)
					{
						ResultVariable0+=calibrationArrayValue[jj];
					}
					Average_X=ResultVariable0/ArrayValueLen;
					ResultVariable0=0;
					for(int jj=0;jj<ArrayCurrentLen;jj++)
					{
						ResultVariable0+=calibrationArrayCurrent[jj];
					}
					Average_Y=ResultVariable0/ArrayCurrentLen;
					ResultVariable0=0;
					ResultVariable1=0;
					for(int jj=0;jj<ArrayCurrentLen;jj++)
					{
						ResultVariable0+=(calibrationArrayValue[jj]-Average_X)*(calibrationArrayCurrent[jj]-Average_Y);
						ResultVariable1+=(calibrationArrayValue[jj]-Average_X)*(calibrationArrayValue[jj]-Average_X);
					}
					comVariableBlock.Coefficient_PNP_A=ResultVariable0/ResultVariable1;
					comVariableBlock.Coefficient_PNP_B=Average_Y-comVariableBlock.Coefficient_PNP_A*Average_X;
					smallStep=2;
				}
			}else if(smallStep==2)
			{
				
				step=0;
				smallStep=0;

				
				K_Load(0);//复位
				K_OUTSW(0);
				K_OUTSET(0);
				K_LoadPower(0);
				K_C_Load(0);	
				

StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "page Detec", " ", 1);
StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "Detec.backPage.val=", "6", 0);				
if( SaveResult !=0x00||
	comVariableBlock.Coefficient_PNP_A>=0 ||comVariableBlock.Coefficient_PNP_B >500 ||	
comVariableBlock.Coefficient_NPN_A>=0 ||comVariableBlock.Coefficient_NPN_B >500 )
{
if(SaveResult !=0x00)
{
StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "Detec.Succeed_txt.txt=", "校准失败!数字万用表数据读取错误，请检查数字万用表连接和是否正常。" ,1);

}else
{
StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "Detec.Succeed_txt.txt=", "校准失败!" ,1);
}
}
else
{
comVariableBlock.SaveDataFlag=1;
StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "Detec.Succeed_txt.txt=", "校准成功" ,1);
}


			}
			
sprintf(StrTemp, "%d%%" ,ProgressVal); //Setting.SettingT10
StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "Setting.SettingT0.txt=",StrTemp,1);	
sprintf(StrTemp, "%d" ,ProgressVal); //Setting.SettingT10
StringChangeLine(USART_Data.USART1_Data.US1_SendDataBuf[USART_Data.USART1_Data.US1_SendAutoAdd++], "Setting.SettingJ0.val=",StrTemp,0);		
ScreenTransmit(&USART_Data, USART_Data.USART1_Data.US1_SendDataBuf, USART_Data.USART1_Data.US1_SendAutoAdd, 1000);		
		}break;
	}
	
	return Result;

}



//#define ID_ROW 10
//#define ID_LINE 5
// char ID_Temp[ID_LINE][ID_ROW];



//找到相同的就返回1
//没找到相同的就返回0
int fineStr( char  (*p)[ID_ROW], char *fineGoal)
{
	int i;
	for(i=0;i<ID_LINE;i++)
	{
		if (strcmp(p[i],fineGoal)== 0)
		{
			comVariableBlock.ID_FineRowCoordinate=i;
//			comVariableBlock.ID_SameFlag=1;
			return 1;
		}	
	}
//	comVariableBlock.ID_SameFlag=0;
	return 0;
}

int fillStr(char  (*p)[ID_ROW], char *fineGoal)
{
	static char i=0;
	int j=0;
	for(j=0;j<ID_LINE;j++)//找到就不填充
	{
		if (strcmp(p[j],fineGoal)== 0)
		{
			return 1;
		}	
	}
	strcpy(p[i],fineGoal);
	comVariableBlock.ID_RowCoordinate=i;
	i++;
	if(i==ID_LINE)
	{
		i=0;
	}
}



