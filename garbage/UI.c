#include "UI.h"




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

char *PageCurConsume_T(USART_DataType *US, unsigned char *AutoSetOrManual) //测试消耗电流
{
    static  char Result[2] = {0};
    static unsigned char Step = 0; //大步
    static unsigned char SmallStep = 1; //小步
    static  char StrTemp[20] = {0};
    static  char KeyStrTemp[20] = {0}; //按键字符串

    if(USART_Data.USART1_Data.PageNum != USART_Data.USART1_Data.PageNumChange)
    {
        Step = 0;
        SmallStep = 1;
        USART_Data.USART1_Data.PageNumChange = USART_Data.USART1_Data.PageNum;
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
            SetPowerOut(1, 0, 1000);
            Step = 1;
        }
        break;

        case 1://发送结果,
        {
            Step = 2;
            US->USART1_Data.US1_SendAutoIncrement = 0;
            memset(US->USART1_Data.US1_SendDataBuf, 0, sizeof(US->USART1_Data.US1_SendDataBuf));

            if(HAL_GPIO_ReadPin(K_C_power_GPIO_Port, K_C_power_Pin) == GPIO_PIN_SET)
            {

                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoIncrement++], "CC_T.CCB1.txt=", "KM_ON", 1);
            }
            else
            {

                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoIncrement++], "CC_T.CCB1.txt=", "KM_OFF", 1);
            }

            if(US->USART3_Data.US3_OutState == 1)
            {
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoIncrement++], "CC_T.CCB2.txt=", "Power_ON", 1);
            }
            else
            {
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoIncrement++], "CC_T.CCB2.txt=", "Power_OFF", 1);
            }

            if(HAL_GPIO_ReadPin(K_powerRv_GPIO_Port, K_powerRv_Pin) == GPIO_PIN_SET)
            {
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoIncrement++], "CC_T.CCB3.txt=", "开启反接", 1);
            }
            else
            {
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoIncrement++], "CC_T.CCB3.txt=", "关闭反接", 1);
            }


            memset(StrTemp, 0, sizeof(StrTemp)); //擦除
            sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_a_Max_mA); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoIncrement++], "CCTxt0.txt=", StrTemp, 1);
            memset(StrTemp, 0, sizeof(StrTemp)); //擦除
            sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_a_Min_mA); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoIncrement++], "CCTxt1.txt=", StrTemp, 1);
            memset(StrTemp, 0, sizeof(StrTemp)); //擦除
            sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_a_Voltage); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoIncrement++], "CCTxt2.txt=", StrTemp, 1);

            ScreenTransmit(&USART_Data, US->USART1_Data.US1_SendDataBuf, US->USART1_Data.US1_SendAutoIncrement, 1000);
        }
        break;

        case 2://按键响应
        {
            if(strcmp((const char *)KeyStrTemp, US->USART1_Data.US1_CutApartBuf[0]) != 0 )
            {
                Step = 0;
                strcpy(KeyStrTemp, US->USART1_Data.US1_CutApartBuf[0]);

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
                K_C_Power(1);//开启电流检测

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
                    SmallStep = 3;
                    K_C_Power(1);//开启电流检测
                    SensorInstructionTransmit("TurnOnAllSeg", 1000);
                    SensorInstructionTransmit("TurnOnTheLed", 1000);
                    SetPower(0, 2, 1000);//去读输出参数
                    GetMultimeter(0, 1000);//读取电流
                    K_C_Power(0);//关闭电流检测
                }
            }
            else if( SmallStep == 3)//测试完成，发送结果到显示器
            {
                SmallStep = 1;
                Step = 0;
                US->USART1_Data.US1_SendAutoIncrement = 0;
                memset(US->USART1_Data.US1_SendDataBuf, 0, sizeof(US->USART1_Data.US1_SendDataBuf));
                memset(StrTemp, 0, sizeof(StrTemp)); //擦除
                sprintf(StrTemp, "%0.3fV", US->USART3_Data.US3_OutValVoltage); //
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoIncrement++],
                                 "CCTxt3.txt=", StrTemp, 1);
                memset(StrTemp, 0, sizeof(StrTemp)); //擦除
                sprintf(StrTemp, "%0.3fA", US->USART3_Data.US3_OutValCurrent); //
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoIncrement++],
                                 "CCTxt4.txt=", StrTemp, 1);
                memset(StrTemp, 0, sizeof(StrTemp)); //擦除
                sprintf(StrTemp, "%0.3fW", US->USART3_Data.US3_OutValPower); //
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoIncrement++],
                                 "CCTxt5.txt=", StrTemp, 1);
                memset(StrTemp, 0, sizeof(StrTemp)); //擦除
                sprintf(StrTemp, "%0.3fmA", US->USART6_Data.US6_OutValCurrent); //
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoIncrement++],
                                 "CCTxt6.txt=", StrTemp, 1);

                if(*AutoSetOrManual == 0)
                {
                    StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoIncrement++], "page Detec", " ", 1);
                    StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoIncrement++], "Detec.backPage.val=", "1", 0);
                }

                sprintf((char *)StrTemp, "%1.2f%s", US->USART6_Data.US6_OutValCurrent, "mA");

                if(US->USART6_Data.US6_OutValCurrent > US->USART1_Data.US1_a_Min_mA &&
                        US->USART6_Data.US6_OutValCurrent < US->USART1_Data.US1_a_Max_mA )//通过
                {
                    StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoIncrement++], "Detec.Succeed_txt.txt=", "测试成功  OK", 1);
                    OutWindowsTxt2((uint8_t *)StrTemp, 1, 0, 1000);
                }
                else//失败
                {
                    OutWindowsTxt2((uint8_t *)StrTemp, 0, 0, 1000);
                    StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoIncrement++], "Detec.Succeed_txt.txt=", "测试失败  NO", 1);

                    if(*AutoSetOrManual == 2)
                    {
                        MeasurResultTransmit(2, 1000);
                        *AutoSetOrManual = 0;
                        Result[1] = 1;
                        Result[0] = 1;
                        return Result;
                    }

                }

                ScreenTransmit(&USART_Data, US->USART1_Data.US1_SendDataBuf, US->USART1_Data.US1_SendAutoIncrement, 1000);
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
    K_PowerRv(1);
    HAL_Delay(1000);
    K_PowerRv(0);
    HAL_Delay(1000);
    SensorInstructionTransmit("GetSelfTestResult", 2000);//sensor self-checking

    if(USART_Data.USART4_Data.US4_receiveData[0] == '0')
    {
        OutWindowsTxt2("",1, 0, 1000);
    }
    else
    {
        OutWindowsTxt2("",0, 0, 1000);
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
    static  char KeyStrTemp[20] = {0}; //按键变化字符串
    static unsigned char SequenceStrManual[10] = {8, 10, 0, 2, 4, 0, 0, 5, 0}; //执行顺序
    static unsigned char SequenceStrAuto[10] = {2, 3, 4, 5, 6, 7, 8, 9, 10};
    static unsigned char *SequenceStrBuf;
    unsigned char NumStrTemp[20] = {0}; //数字转换



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
    }

    switch(Step)
    {
        case 0://查询
        {
            Step = 1;
            US->USART1_Data.US1_SendAutoIncrement = 0;
            memset(US->USART1_Data.US1_SendDataBuf, 0, sizeof(US->USART1_Data.US1_SendDataBuf));

            if(HAL_GPIO_ReadPin(K_V_N_GPIO_Port, K_V_N_Pin) == GPIO_PIN_SET)
            {
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoIncrement++], "KV_T.KVB1.txt=", "KMN_ON", 1);

            }
            else
            {
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoIncrement++], "KV_T.KVB1.txt=", "KMN_OFF", 1);
            }

            if(HAL_GPIO_ReadPin(K_V_1_GPIO_Port, K_V_1_Pin) == GPIO_PIN_SET)
            {

                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoIncrement++], "KV_T.KVB2.txt=", "KM1_ON", 1);
            }
            else
            {

                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoIncrement++], "KV_T.KVB2.txt=", "KM1_OFF", 1);
            }

            if(HAL_GPIO_ReadPin(K_V_2_GPIO_Port, K_V_2_Pin) == GPIO_PIN_SET)
            {
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoIncrement++], "KV_T.KVB3.txt=", "KM2_ON", 1);

            }
            else
            {
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoIncrement++], "KV_T.KVB3.txt=", "KM2_OFF", 1);

            }

            if(HAL_GPIO_ReadPin(K_V_3_GPIO_Port, K_V_3_Pin) == GPIO_PIN_SET)
            {
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoIncrement++], "KV_T.KVB4.txt=", "KM3_ON", 1);

            }
            else
            {
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoIncrement++], "KV_T.KVB4.txt=", "KM3_OFF", 1);
            }

            if(HAL_GPIO_ReadPin(K_V_4_GPIO_Port, K_V_4_Pin) == GPIO_PIN_SET)
            {
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoIncrement++], "KV_T.KVB5.txt=", "KM4_ON", 1);

            }
            else
            {
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoIncrement++], "KV_T.KVB5.txt=", "KM4_OFF", 1);
            }

            if(HAL_GPIO_ReadPin(K_V_5_GPIO_Port, K_V_5_Pin) == GPIO_PIN_SET)
            {
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoIncrement++], "KV_T.KVB6.txt=", "KM5_ON", 1);

            }
            else
            {
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoIncrement++], "KV_T.KVB6.txt=", "KM5_OFF", 1);

            }

            if(HAL_GPIO_ReadPin(K_V_6_GPIO_Port, K_V_6_Pin) == GPIO_PIN_SET)
            {
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoIncrement++], "KV_T.KVB7.txt=", "KM6_ON", 1);
            }
            else
            {
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoIncrement++], "KV_T.KVB7.txt=", "KM6_OFF", 1);

            }

            if(HAL_GPIO_ReadPin(K_V_7_GPIO_Port, K_V_7_Pin) == GPIO_PIN_SET)
            {
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoIncrement++], "KV_T.KVB8.txt=", "KM7_ON", 1);

            }
            else
            {
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoIncrement++], "KV_T.KVB8.txt=", "KM7_OFF", 1);

            }

            if(HAL_GPIO_ReadPin(K_V_8_GPIO_Port, K_V_8_Pin) == GPIO_PIN_SET)
            {
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoIncrement++], "KV_T.KVB9.txt=", "KM8_ON", 1);
            }
            else
            {
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoIncrement++], "KV_T.KVB9.txt=", "KM8_OFF", 1);

            }



            memset(StrTemp, 0, sizeof(StrTemp));
            sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_b_Max_mA0); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoIncrement++], "KV_T.KVT2.txt=", StrTemp, 1);
            memset(StrTemp, 0, sizeof(StrTemp));
            sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_b_Min_mA0); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoIncrement++], "KV_T.KVT3.txt=", StrTemp, 1);
            memset(StrTemp, 0, sizeof(StrTemp));
            sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_b_Max_mA1); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoIncrement++], "KV_T.KVT5.txt=", StrTemp, 1);
            memset(StrTemp, 0, sizeof(StrTemp));
            sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_b_Min_mA1); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoIncrement++], "KV_T.KVT6.txt=", StrTemp, 1);
            memset(StrTemp, 0, sizeof(StrTemp));
            sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_b_Max_mA2); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoIncrement++], "KV_T.KVT8.txt=", StrTemp, 1);
            memset(StrTemp, 0, sizeof(StrTemp));
            sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_b_Min_mA2); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoIncrement++], "KV_T.KVT9.txt=", StrTemp, 1);
            memset(StrTemp, 0, sizeof(StrTemp));
            sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_b_Max_mA3); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoIncrement++], "KV_T.KVT11.txt=", StrTemp, 1);
            memset(StrTemp, 0, sizeof(StrTemp));
            sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_b_Min_mA3); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoIncrement++], "KV_T.KVT12.txt=", StrTemp, 1);
            memset(StrTemp, 0, sizeof(StrTemp));
            sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_b_Max_mA4); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoIncrement++], "KV_T.KVT14.txt=", StrTemp, 1);
            memset(StrTemp, 0, sizeof(StrTemp));
            sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_b_Min_mA4); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoIncrement++], "KV_T.KVT15.txt=", StrTemp, 1);
            memset(StrTemp, 0, sizeof(StrTemp));
            sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_b_Max_mA5); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoIncrement++], "KV_T.KVT17.txt=", StrTemp, 1);
            memset(StrTemp, 0, sizeof(StrTemp));
            sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_b_Min_mA5); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoIncrement++], "KV_T.KVT18.txt=", StrTemp, 1);
            memset(StrTemp, 0, sizeof(StrTemp));
            sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_b_Max_mA6); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoIncrement++], "KV_T.KVT20.txt=", StrTemp, 1);
            memset(StrTemp, 0, sizeof(StrTemp));
            sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_b_Min_mA6); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoIncrement++], "KV_T.KVT21.txt=", StrTemp, 1);
            memset(StrTemp, 0, sizeof(StrTemp));
            sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_b_Max_mA7); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoIncrement++], "KV_T.KVT23.txt=", StrTemp, 1);
            memset(StrTemp, 0, sizeof(StrTemp));
            sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_b_Min_mA7); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoIncrement++], "KV_T.KVT24.txt=", StrTemp, 1);

            ScreenTransmit(&USART_Data, US->USART1_Data.US1_SendDataBuf, US->USART1_Data.US1_SendAutoIncrement, 1000);

        }
        break;

        case 1://按键响应
        {
            if(strcmp((const char *)KeyStrTemp, US->USART1_Data.US1_CutApartBuf[0]) != 0 )
            {
                strcpy(KeyStrTemp, US->USART1_Data.US1_CutApartBuf[0]);
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
//				HAL_Delay(50);
                GetMultimeter(1, 2000);
                US->USART1_Data.US1_b_Voltage0 = US->USART6_Data.US6_ReceiveDataNum[0];//保存
                sprintf((char *)NumStrTemp, "%1.2f%s", US->USART1_Data.US1_b_Voltage0, "V");

                if (US->USART1_Data.US1_b_Voltage0	>= US->USART1_Data.US1_b_Min_mA0
                        && US->USART1_Data.US1_b_Voltage0	<= US->USART1_Data.US1_b_Max_mA0 	)
                {
                    comVariableBlock.KeyPointVoltageResult |= SetStateStr[0];
                    OutWindowsTxt2(NumStrTemp, 1, 0, 1000);
                }
                else
                {
                    comVariableBlock.KeyPointVoltageResult &= ResetStateStr[0];
                    OutWindowsTxt2(NumStrTemp, 0, 0, 1000);

                    if(*AutoSetOrManual == 2)
                    {
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
//                HAL_Delay(50);
                GetMultimeter(1, 2000);
                US->USART1_Data.US1_b_Voltage1 = US->USART6_Data.US6_ReceiveDataNum[0];
                sprintf((char *)NumStrTemp, "%1.2f%s", US->USART1_Data.US1_b_Voltage1, "V");

                if (US->USART1_Data.US1_b_Voltage1	>= US->USART1_Data.US1_b_Min_mA1
                        && US->USART1_Data.US1_b_Voltage1	<= US->USART1_Data.US1_b_Max_mA1 	)
                {
                    comVariableBlock.KeyPointVoltageResult |= SetStateStr[1];
                    OutWindowsTxt2(NumStrTemp, 1, 0, 1000);
                }
                else
                {
                    comVariableBlock.KeyPointVoltageResult &= ResetStateStr[1];
                    OutWindowsTxt2(NumStrTemp, 0, 0, 1000);

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
//                HAL_Delay(50);
                GetMultimeter(1, 2000);
                US->USART1_Data.US1_b_Voltage2 = US->USART6_Data.US6_ReceiveDataNum[0];
                sprintf((char *)NumStrTemp, "%1.2f%s", US->USART1_Data.US1_b_Voltage2, "V");

                if (US->USART1_Data.US1_b_Voltage2	>= US->USART1_Data.US1_b_Min_mA2
                        && US->USART1_Data.US1_b_Voltage2	<= US->USART1_Data.US1_b_Max_mA2 	)
                {
                    OutWindowsTxt2(NumStrTemp, 1, 0, 1000);
                    comVariableBlock.KeyPointVoltageResult |= SetStateStr[2];
                }
                else
                {
                    comVariableBlock.KeyPointVoltageResult &= ResetStateStr[2];
                    OutWindowsTxt2(NumStrTemp, 0, 0, 1000);

                    if(*AutoSetOrManual == 2)
                    {
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
//                HAL_Delay(50);
                GetMultimeter(1, 2000);
                US->USART1_Data.US1_b_Voltage3 = US->USART6_Data.US6_ReceiveDataNum[0];
                sprintf((char *)NumStrTemp, "%1.2f%s", US->USART1_Data.US1_b_Voltage3, "V");

                if (US->USART1_Data.US1_b_Voltage3	>= US->USART1_Data.US1_b_Min_mA3
                        && US->USART1_Data.US1_b_Voltage3	<= US->USART1_Data.US1_b_Max_mA3 	)
                {
                    OutWindowsTxt2(NumStrTemp, 1, 0, 1000);
                    comVariableBlock.KeyPointVoltageResult |= SetStateStr[3];
                }
                else
                {
                    comVariableBlock.KeyPointVoltageResult &= ResetStateStr[3];
                    OutWindowsTxt2(NumStrTemp, 0, 0, 1000);

                    if(*AutoSetOrManual == 2)
                    {
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
//                HAL_Delay(50);
                GetMultimeter(1, 2000);
                US->USART1_Data.US1_b_Voltage4 = US->USART6_Data.US6_ReceiveDataNum[0];

                sprintf((char *)NumStrTemp, "%1.2f%s", US->USART1_Data.US1_b_Voltage4, "V");

                if (US->USART1_Data.US1_b_Voltage4	>= US->USART1_Data.US1_b_Min_mA4
                        && US->USART1_Data.US1_b_Voltage4	<= US->USART1_Data.US1_b_Max_mA4	)
                {
                    OutWindowsTxt2(NumStrTemp, 2, 0, 1000);
                    comVariableBlock.KeyPointVoltageResult |= SetStateStr[4];
                }
                else
                {
                    comVariableBlock.KeyPointVoltageResult &= ResetStateStr[4];
                    OutWindowsTxt2(NumStrTemp, 2, 0, 1000);
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
                K_V_6(1);
                K_V_7(0);
                K_V_8(0);
//                HAL_Delay(50);
                GetMultimeter(1, 2000);
                US->USART1_Data.US1_b_Voltage5 = US->USART6_Data.US6_ReceiveDataNum[0];
                sprintf((char *)NumStrTemp, "%1.2f%s", US->USART1_Data.US1_b_Voltage5, "V");

                if (US->USART1_Data.US1_b_Voltage5	>= US->USART1_Data.US1_b_Min_mA5
                        && US->USART1_Data.US1_b_Voltage5	<= US->USART1_Data.US1_b_Max_mA5	)
                {
                    OutWindowsTxt2(NumStrTemp, 2, 0, 1000);
                    comVariableBlock.KeyPointVoltageResult |= SetStateStr[5];
                }
                else
                {
                    comVariableBlock.KeyPointVoltageResult &= ResetStateStr[5];
                    OutWindowsTxt2(NumStrTemp, 2, 0, 1000);
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

                HAL_Delay(100);
                GetMultimeter(1, 2000);
                US->USART1_Data.US1_b_Voltage6 = US->USART6_Data.US6_ReceiveDataNum[0];
                sprintf((char *)NumStrTemp, "%1.2f%s", US->USART1_Data.US1_b_Voltage6, "V");

                if (US->USART1_Data.US1_b_Voltage6	>= US->USART1_Data.US1_b_Min_mA6
                        && US->USART1_Data.US1_b_Voltage6	<= US->USART1_Data.US1_b_Max_mA6 	)
                {
                    OutWindowsTxt2(NumStrTemp, 1, 1, 1000);
                    comVariableBlock.KeyPointVoltageResult |= SetStateStr[6];
                }
                else
                {
                    comVariableBlock.KeyPointVoltageResult &= ResetStateStr[6];
                    OutWindowsTxt2(NumStrTemp, 0, 1, 1000);

                    if(*AutoSetOrManual == 2)
                    {
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
                HAL_Delay(50);
                GetMultimeter(1, 2000);
                US->USART1_Data.US1_b_Voltage7 = US->USART6_Data.US6_ReceiveDataNum[0];
                sprintf((char *)NumStrTemp, "%1.2f%s", US->USART1_Data.US1_b_Voltage7, "V");

                if (US->USART1_Data.US1_b_Voltage7	>= US->USART1_Data.US1_b_Min_mA7
                        && US->USART1_Data.US1_b_Voltage7	<= US->USART1_Data.US1_b_Max_mA7	)
                {
                    OutWindowsTxt2(NumStrTemp, 2, 0, 1000);
                    comVariableBlock.KeyPointVoltageResult |= SetStateStr[7];
                }
                else
                {
                    comVariableBlock.KeyPointVoltageResult &= ResetStateStr[7];
                    OutWindowsTxt2(NumStrTemp, 2, 0, 1000);
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
                US->USART1_Data.US1_SendAutoIncrement = 0;
                memset(US->USART1_Data.US1_SendDataBuf, 0, sizeof(US->USART1_Data.US1_SendDataBuf));
                memset(StrTemp, 0, sizeof(StrTemp));
                sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_b_Voltage0); //
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoIncrement++], "KV_T.KVT1.txt=", StrTemp, 1);
                memset(StrTemp, 0, sizeof(StrTemp));
                sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_b_Voltage1); //
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoIncrement++], "KV_T.KVT4.txt=", StrTemp, 1);
                memset(StrTemp, 0, sizeof(StrTemp));
                sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_b_Voltage2); //
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoIncrement++], "KV_T.KVT7.txt=", StrTemp, 1);
                memset(StrTemp, 0, sizeof(StrTemp));
                sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_b_Voltage3); //
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoIncrement++], "KV_T.KVT10.txt=", StrTemp, 1);
                memset(StrTemp, 0, sizeof(StrTemp));
                sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_b_Voltage4); //
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoIncrement++], "KV_T.KVT13.txt=", StrTemp, 1);
                memset(StrTemp, 0, sizeof(StrTemp));
                sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_b_Voltage5); //
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoIncrement++], "KV_T.KVT16.txt=", StrTemp, 1);
                memset(StrTemp, 0, sizeof(StrTemp));
                sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_b_Voltage6); //
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoIncrement++], "KV_T.KVT19.txt=", StrTemp, 1);
                memset(StrTemp, 0, sizeof(StrTemp));
                sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_b_Voltage7); //
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoIncrement++], "KV_T.KVT22.txt=", StrTemp, 1);



                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoIncrement++], "page Detec", " ", 1);
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoIncrement++], "Detec.backPage.val=", "2", 0);


                if(comVariableBlock.KeyPointVoltageResult == 0xff) //发送最总的结果
                {
                    StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoIncrement++], "Detec.Succeed_txt.txt=", "测试成功  OK", 1);

                }
                else
                {
                    StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoIncrement++], "Detec.Succeed_txt.txt=", "测试失败  NO", 1);
                }

                ScreenTransmit(&USART_Data, US->USART1_Data.US1_SendDataBuf, US->USART1_Data.US1_SendAutoIncrement, 1000);
                memset(US->USART1_Data.US1_CutApartBuf, 0, sizeof(US->USART1_Data.US1_CutApartBuf));	//擦除缓冲

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
                HAL_Delay(30);

                if((IO_IN_GPIO_Port[i]->IDR & IO_IN_Pin[i]) == (uint32_t)GPIO_PIN_RESET)
                {
                    comVariableBlock.NixieTubeResult |= SetStateStr[i];
                    OutWindowsTxt2("", 1, 0, 1000);
                }
                else
                {
                    OutWindowsTxt2("", 0, 0, 1000);
                    comVariableBlock.NixieTubeResult &= ResetStateStr[i];
                    MeasurResultTransmit(2, 1000);
                    Result[1] = 1;
                    Result[0] = 1;
                    return Result;
                }

                NixieTubeTransmit(i, 1, 1000);
                HAL_Delay(10);
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
        OutWindowsTxt2("", 1, 0, 1000);
    }
    else
    {
        OutWindowsTxt2("", 0, 0, 1000);
        MeasurResultTransmit(2, 1000);
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
    static unsigned char Step = 0; //大步
    static unsigned char SmallStep = 1; //小步
    static  char StrTemp[20] = {0};
    static  char KeyStrTemp[20] = {0}; //按键变化字符串


    if(USART_Data.USART1_Data.PageNum != USART_Data.USART1_Data.PageNumChange)
    {
        Step = 0;
        USART_Data.USART1_Data.PageNumChange = USART_Data.USART1_Data.PageNum;
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
            US->USART1_Data.US1_SendAutoIncrement = 0;
            memset(US->USART1_Data.US1_SendDataBuf, 0, sizeof(US->USART1_Data.US1_SendDataBuf));

            if(HAL_GPIO_ReadPin(K_LoadPower_GPIO_Port, K_LoadPower_Pin) == GPIO_PIN_SET)
            {
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoIncrement++], "HL_T.HLB1.txt=", "Power_ON", 1);

            }
            else
            {
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoIncrement++], "HL_T.HLB1.txt=", "Power_OFF", 1);
            }

            if(HAL_GPIO_ReadPin(K_Load_GPIO_Port, K_Load_Pin) == GPIO_PIN_SET)
            {

                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoIncrement++], "HL_T.HLB2.txt=", "load_ON", 1);
            }
            else
            {

                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoIncrement++], "HL_T.HLB2.txt=", "load_OFF", 1);
            }

            if(HAL_GPIO_ReadPin(K_C_Load_GPIO_Port, K_C_Load_Pin) == GPIO_PIN_SET)
            {
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoIncrement++], "HL_T.HLB3.txt=", "Cload_ON", 1);
            }
            else
            {
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoIncrement++], "HL_T.HLB3.txt=", "Cload_OFF", 1);
            }

            if(HAL_GPIO_ReadPin(K_OUTSW_GPIO_Port, K_OUTSW_Pin) == GPIO_PIN_SET)
            {
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoIncrement++], "HL_T.HLB4.txt=", "OutSW_ON", 1);
            }
            else
            {
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoIncrement++], "HL_T.HLB4.txt=", "OutSW_OFF", 1);
            }

            if(HAL_GPIO_ReadPin(K_OUTSEL_GPIO_Port, K_OUTSEL_Pin) == GPIO_PIN_SET)
            {
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoIncrement++], "HL_T.HLB5.txt=", "OutSEL_ON", 1);
            }
            else
            {
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoIncrement++], "HL_T.HLB5.txt=", "OutSEL_OFF", 1);
            }

            if(HAL_GPIO_ReadPin(K_Short_GPIO_Port, K_Short_Pin) == GPIO_PIN_SET)
            {
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoIncrement++], "HL_T.HLB6.txt=", "Short_ON", 1);
            }
            else
            {
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoIncrement++], "HL_T.HLB6.txt=", "Short_OFF", 1);
            }

            if(HAL_GPIO_ReadPin(K_V_OUT1_GPIO_Port, K_V_OUT1_Pin) == GPIO_PIN_SET)
            {
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoIncrement++], "HL_T.HLB7.txt=", "VOut1_ON", 1);
            }
            else
            {
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoIncrement++], "HL_T.HLB7.txt=", "VOut1_OFF", 1);
            }

            if(HAL_GPIO_ReadPin(K_V_OUT2_GPIO_Port, K_V_OUT2_Pin) == GPIO_PIN_SET)
            {
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoIncrement++], "HL_T.HLB8.txt=", "VOut2_ON", 1);
            }
            else
            {
                StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoIncrement++], "HL_T.HLB8.txt=", "VOut2_OFF", 1);
            }

            memset(StrTemp, 0, sizeof(StrTemp));
            sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_c_Max_mA); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoIncrement++], "HL_T.HLT2.txt=", StrTemp, 1);
            memset(StrTemp, 0, sizeof(StrTemp));
            sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_c_Min_mA); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoIncrement++], "HL_T.HLT3.txt=", StrTemp, 1);
            memset(StrTemp, 0, sizeof(StrTemp));
            sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_c_Max_V); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoIncrement++], "HL_T.HLT5.txt=", StrTemp, 1);
            memset(StrTemp, 0, sizeof(StrTemp));
            sprintf(StrTemp, "%0.3f", US->USART1_Data.US1_c_Min_V); //
            StringChangeLine(US->USART1_Data.US1_SendDataBuf[US->USART1_Data.US1_SendAutoIncrement++], "HL_T.HLT6.txt=", StrTemp, 1);


            ScreenTransmit(&USART_Data, US->USART1_Data.US1_SendDataBuf, US->USART1_Data.US1_SendAutoIncrement, 1000);


        }
        break;

        case 1://按键响应
        {
            if(strcmp((const char *)KeyStrTemp, US->USART1_Data.US1_CutApartBuf[0]) != 0 )
            {
                strcpy(KeyStrTemp, US->USART1_Data.US1_CutApartBuf[0]);
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
                }

            }
        }
        break;

        case 2:
        {

            if(SmallStep == 1) //npn
            {
                K_Load(0);
                PWMSetCurrent(1, 110);
                K_C_Load(1);
                K_OUTSW(1);
                K_LoadPower(1);
                K_OUTSET(0);
                SensorInstructionTransmit("SetOutputTypeNPN", 1000);
                SensorInstructionTransmit("SetOutputStateOFF", 1000);
                HAL_Delay(100);
                GetMultimeter(0, 1000);

                memset(StrTemp, 0, sizeof(StrTemp));
                sprintf((char *)StrTemp, "%1.2f%s", USART_Data.USART6_Data.US6_OutValCurrent, "mA");

                if(USART_Data.USART6_Data.US6_OutValCurrent < (float)0.1)
                {
                    OutWindowsTxt2((uint8_t *)StrTemp, 1, 0, 1000);
                }
                else
                {
                    OutWindowsTxt2((uint8_t *)StrTemp, 0, 0, 1000);

                    if(*AutoSetOrManual == 2)
                    {
                        *AutoSetOrManual = 0;
                        MeasurResultTransmit(2, 1000);
                        Result[1] = 1;
                        Result[0] = 1;
                        return Result;
                    }
                }

                SensorInstructionTransmit("SetOutputStateON", 1000);
                HAL_Delay(1000);
                GetMultimeter(0, 1000);
                memset(StrTemp, 0, sizeof(StrTemp));
                sprintf((char *)StrTemp, "%1.2f%s", USART_Data.USART6_Data.US6_OutValCurrent, "mA");

                if(USART_Data.USART6_Data.US6_OutValCurrent < 113 && USART_Data.USART6_Data.US6_OutValCurrent > 107)
                {
                    OutWindowsTxt2((uint8_t *)StrTemp, 1, 0, 1000);
                }
                else
                {
                    OutWindowsTxt2((uint8_t *)StrTemp, 0, 0, 1000);

                    if(*AutoSetOrManual == 2)
                    {
                        *AutoSetOrManual = 0;
                        MeasurResultTransmit(2, 1000);
                        Result[1] = 1;
                        Result[0] = 1;
                        return Result;
                    }
                }

                SensorInstructionTransmit("GetSelfTestResult", 2000);//sensor self-checking
                memset(StrTemp, 0, sizeof(StrTemp));

                for(char i = 0, j = 0; i < sizeof(USART_Data.USART4_Data.US4_receiveData); i++)
                {
                    if(USART_Data.USART4_Data.US4_receiveData[i] != 0x0A)
                    {
                        StrTemp[j++] = USART_Data.USART4_Data.US4_receiveData[i];
                    }
                }

                if(USART_Data.USART4_Data.US4_receiveData[0] == '0')
                {
                    OutWindowsTxt2((uint8_t *)StrTemp, 1, 0, 1000);
                }
                else
                {
                    OutWindowsTxt2((uint8_t *)StrTemp, 0, 0, 1000);

                    if(*AutoSetOrManual == 2)
                    {
                        *AutoSetOrManual = 0;
                        MeasurResultTransmit(2, 1000);
                        Result[1] = 1;
                        Result[0] = 1;
                        return Result;
                    }
                }

                K_Short(0);//npn短路测试
                K_OUTSET(1);

                SensorInstructionTransmit("GetSelfTestResult", 2000);//sensor self-checking
                memset(StrTemp, 0, sizeof(StrTemp));

                for(char i = 0, j = 0; i < sizeof(USART_Data.USART4_Data.US4_receiveData); i++)
                {
                    if(USART_Data.USART4_Data.US4_receiveData[i] != 0x0A)
                    {
                        StrTemp[j++] = USART_Data.USART4_Data.US4_receiveData[i];
                    }
                }

                if(USART_Data.USART4_Data.US4_receiveData[0] == '0')
                {
                    OutWindowsTxt2((uint8_t *)StrTemp, 1, 0, 1000);
                }
                else
                {
                    OutWindowsTxt2((uint8_t *)StrTemp, 0, 0, 1000);

                    if(*AutoSetOrManual == 2)
                    {
                        *AutoSetOrManual = 0;
                        MeasurResultTransmit(2, 1000);
                        Result[1] = 1;
                        Result[0] = 1;
                        return Result;
                    }
                }

                HAL_Delay(1000);//138行
                K_OUTSET(0);
				HAL_Delay(50);


                SensorInstructionTransmit("GetSelfTestResult", 2000);//sensor self-checking
                memset(StrTemp, 0, sizeof(StrTemp));

                for(char i = 0, j = 0; i < sizeof(USART_Data.USART4_Data.US4_receiveData); i++)
                {
                    if(USART_Data.USART4_Data.US4_receiveData[i] != 0x0A)
                    {
                        StrTemp[j++] = USART_Data.USART4_Data.US4_receiveData[i];
                    }
                }

                if(USART_Data.USART4_Data.US4_receiveData[0] == '0')
                {
                    OutWindowsTxt2((uint8_t *)StrTemp, 1, 0, 1000);
                }
                else
                {
                    OutWindowsTxt2((uint8_t *)StrTemp, 0, 0, 1000);

                    if(*AutoSetOrManual == 2)
                    {
                        *AutoSetOrManual = 0;
                        MeasurResultTransmit(2, 1000);
                        Result[1] = 1;
                        Result[0] = 1;
                        return Result;
                    }
                }
				
				
				
                GetMultimeter(0, 1000);
                memset(StrTemp, 0, sizeof(StrTemp));
                sprintf((char *)StrTemp, "%1.2f%s", USART_Data.USART6_Data.US6_OutValCurrent, "mA");

                if(USART_Data.USART6_Data.US6_OutValCurrent < 113 && USART_Data.USART6_Data.US6_OutValCurrent > 107)
                {
                    OutWindowsTxt2((uint8_t *)StrTemp, 1, 0, 1000);
                }
                else
                {
                    OutWindowsTxt2((uint8_t *)StrTemp, 0, 0, 1000);

                    if(*AutoSetOrManual == 2)
                    {
                        *AutoSetOrManual = 0;
                        MeasurResultTransmit(2, 1000);
                        Result[1] = 1;
                        Result[0] = 1;
                        return Result;
                    }
                }
				
				PWMSetCurrent(1, 100);
				HAL_Delay(500);
				
                GetMultimeter(0, 1000);
                memset(StrTemp, 0, sizeof(StrTemp));
                sprintf((char *)StrTemp, "%1.2f%s", USART_Data.USART6_Data.US6_OutValCurrent, "mA");

                if(USART_Data.USART6_Data.US6_OutValCurrent < 103 && USART_Data.USART6_Data.US6_OutValCurrent > 97)
                {
                    OutWindowsTxt2((uint8_t *)StrTemp, 1, 0, 1000);
                }
                else
                {
                    OutWindowsTxt2((uint8_t *)StrTemp, 0, 0, 1000);

                    if(*AutoSetOrManual == 2)
                    {
                        *AutoSetOrManual = 0;
                        MeasurResultTransmit(2, 1000);
                        Result[1] = 1;
                        Result[0] = 1;
                        return Result;
                    }
                }
				K_C_Load(0);
				K_V_OUT1(1);
				
				GetMultimeter(1, 1000);
                memset(StrTemp, 0, sizeof(StrTemp));
                sprintf((char *)StrTemp, "%1.2f%s", USART_Data.USART6_Data.US6_OutValVoltageDC, "V");

                if(USART_Data.USART6_Data.US6_OutValVoltageDC < (float)0.95 && USART_Data.USART6_Data.US6_OutValVoltageDC > (float)0.6)
                {
                    OutWindowsTxt2((uint8_t *)StrTemp, 1, 0, 1000);
                }
                else
                {
                    OutWindowsTxt2((uint8_t *)StrTemp, 0, 0, 1000);

                    if(*AutoSetOrManual == 2)
                    {
                        *AutoSetOrManual = 0;
                        MeasurResultTransmit(2, 1000);
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
                HAL_Delay(100);
                GetMultimeter(0, 1000);//漏电电流

                memset(StrTemp, 0, sizeof(StrTemp));
                sprintf((char *)StrTemp, "%1.2f%s", USART_Data.USART6_Data.US6_OutValCurrent, "mA");

                if(USART_Data.USART6_Data.US6_OutValCurrent < (float)0.1)
                {
                    OutWindowsTxt2((uint8_t *)StrTemp, 1, 0, 1000);
                }
                else
                {
                    OutWindowsTxt2((uint8_t *)StrTemp, 0, 0, 1000);

                    if(*AutoSetOrManual == 2)
                    {
                        *AutoSetOrManual = 0;
                        MeasurResultTransmit(2, 1000);
                        Result[1] = 1;
                        Result[0] = 1;
                        return Result;
                    }
                }

                SensorInstructionTransmit("SetOutputStateON", 1000);
                HAL_Delay(1000);
                GetMultimeter(0, 1000);
                memset(StrTemp, 0, sizeof(StrTemp));
                sprintf((char *)StrTemp, "%1.2f%s", USART_Data.USART6_Data.US6_OutValCurrent, "mA");

                if(USART_Data.USART6_Data.US6_OutValCurrent < 113 && USART_Data.USART6_Data.US6_OutValCurrent > 107)
                {
                    OutWindowsTxt2((uint8_t *)StrTemp, 1, 0, 1000);
                }
                else
                {
                    OutWindowsTxt2((uint8_t *)StrTemp, 0, 0, 1000);

                    if(*AutoSetOrManual == 2)
                    {
                        *AutoSetOrManual = 0;
                        MeasurResultTransmit(2, 1000);
                        Result[1] = 1;
                        Result[0] = 1;
                        return Result;
                    }
                }

                SensorInstructionTransmit("GetSelfTestResult", 2000);//sensor self-checking
                memset(StrTemp, 0, sizeof(StrTemp));

                for(char i = 0, j = 0; i < sizeof(USART_Data.USART4_Data.US4_receiveData); i++)
                {
                    if(USART_Data.USART4_Data.US4_receiveData[i] != 0x0A)
                    {
                        StrTemp[j++] = USART_Data.USART4_Data.US4_receiveData[i];
                    }
                }

                if(USART_Data.USART4_Data.US4_receiveData[0] == '0')
                {
                    OutWindowsTxt2((uint8_t *)StrTemp, 1, 0, 1000);
                }
                else
                {
                    OutWindowsTxt2((uint8_t *)StrTemp, 0, 0, 1000);

                    if(*AutoSetOrManual == 2)
                    {
                        *AutoSetOrManual = 0;
                        MeasurResultTransmit(2, 1000);
                        Result[1] = 1;
                        Result[0] = 1;
                        return Result;
                    }
                }

                K_Short(1);//pnp短路测试
                K_OUTSET(1);

                SensorInstructionTransmit("GetSelfTestResult", 2000);//sensor self-checking
                memset(StrTemp, 0, sizeof(StrTemp));

                for(char i = 0, j = 0; i < sizeof(USART_Data.USART4_Data.US4_receiveData); i++)
                {
                    if(USART_Data.USART4_Data.US4_receiveData[i] != 0x0A)
                    {
                        StrTemp[j++] = USART_Data.USART4_Data.US4_receiveData[i];
                    }
                }

                if(USART_Data.USART4_Data.US4_receiveData[0] == '0')
                {
                    OutWindowsTxt2((uint8_t *)StrTemp, 1, 0, 1000);
                }
                else
                {
                    OutWindowsTxt2((uint8_t *)StrTemp, 0, 0, 1000);

                    if(*AutoSetOrManual == 2)
                    {
                        *AutoSetOrManual = 0;
                        MeasurResultTransmit(2, 1000);
                        Result[1] = 1;
                        Result[0] = 1;
                        return Result;
                    }
                }

                HAL_Delay(1000);//138行
                K_OUTSET(0);
				HAL_Delay(50);


                SensorInstructionTransmit("GetSelfTestResult", 2000);//sensor self-checking
                memset(StrTemp, 0, sizeof(StrTemp));

                for(char i = 0, j = 0; i < sizeof(USART_Data.USART4_Data.US4_receiveData); i++)
                {
                    if(USART_Data.USART4_Data.US4_receiveData[i] != 0x0A)
                    {
                        StrTemp[j++] = USART_Data.USART4_Data.US4_receiveData[i];
                    }
                }

                if(USART_Data.USART4_Data.US4_receiveData[0] == '0')
                {
                    OutWindowsTxt2((uint8_t *)StrTemp, 1, 0, 1000);
                }
                else
                {
                    OutWindowsTxt2((uint8_t *)StrTemp, 0, 0, 1000);

                    if(*AutoSetOrManual == 2)
                    {
                        *AutoSetOrManual = 0;
                        MeasurResultTransmit(2, 1000);
                        Result[1] = 1;
                        Result[0] = 1;
                        return Result;
                    }
                }
				
				
				
                GetMultimeter(0, 1000);
                memset(StrTemp, 0, sizeof(StrTemp));
                sprintf((char *)StrTemp, "%1.2f%s", USART_Data.USART6_Data.US6_OutValCurrent, "mA");

                if(USART_Data.USART6_Data.US6_OutValCurrent < 113 && USART_Data.USART6_Data.US6_OutValCurrent > 107)
                {
                    OutWindowsTxt2((uint8_t *)StrTemp, 1, 0, 1000);
                }
                else
                {
                    OutWindowsTxt2((uint8_t *)StrTemp, 0, 0, 1000);

                    if(*AutoSetOrManual == 2)
                    {
                        *AutoSetOrManual = 0;
                        MeasurResultTransmit(2, 1000);
                        Result[1] = 1;
                        Result[0] = 1;
                        return Result;
                    }
                }
				
				PWMSetCurrent(0, 100);
				HAL_Delay(500);
				
                GetMultimeter(0, 1000);
                memset(StrTemp, 0, sizeof(StrTemp));
                sprintf((char *)StrTemp, "%1.2f%s", USART_Data.USART6_Data.US6_OutValCurrent, "mA");

                if(USART_Data.USART6_Data.US6_OutValCurrent < 103 && USART_Data.USART6_Data.US6_OutValCurrent > 97)
                {
                    OutWindowsTxt2((uint8_t *)StrTemp, 1, 0, 1000);
                }
                else
                {
                    OutWindowsTxt2((uint8_t *)StrTemp, 0, 0, 1000);

                    if(*AutoSetOrManual == 2)
                    {
                        *AutoSetOrManual = 0;
                        MeasurResultTransmit(2, 1000);
                        Result[1] = 1;
                        Result[0] = 1;
                        return Result;
                    }
                }
				K_C_Load(0);
				K_V_OUT1(1);//接入万用表
				K_V_OUT2(1);//npn残余电压借入万用表	
				
				GetMultimeter(1, 1000);
                memset(StrTemp, 0, sizeof(StrTemp));
                sprintf((char *)StrTemp, "%1.2f%s", USART_Data.USART6_Data.US6_OutValVoltageDC, "V");

                if(USART_Data.USART6_Data.US6_OutValVoltageDC < (float)0.95 && USART_Data.USART6_Data.US6_OutValVoltageDC > (float)0.6)
                {
                    OutWindowsTxt2((uint8_t *)StrTemp, 1, 0, 1000);
                }
                else
                {
                    OutWindowsTxt2((uint8_t *)StrTemp, 0, 0, 1000);

                    if(*AutoSetOrManual == 2)
                    {
                        *AutoSetOrManual = 0;
                        MeasurResultTransmit(2, 1000);
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



void LEDState()
{
    LED_G2(1);
	if(comVariableBlock.MeasureResults == ResultsTesting)
	{
	
	}else if(comVariableBlock.MeasureResults == ResultsSuccess)
	{
	
	}else if(comVariableBlock.MeasureResults == ResultsFail)
	{
	
	
	}
}

char PageMain(USART_DataType *US, unsigned char *Start)//
{
    static unsigned char Step = 0; //大步
    char *Result;

    if(USART_Data.USART1_Data.PageNum != USART_Data.USART1_Data.PageNumChange)
    {
        USART_Data.USART1_Data.PageNumChange = USART_Data.USART1_Data.PageNum;
    }


    if(*Start == 1)
    {
        *Start = 0;
        Step = 0;
    }


    LEDState();


    switch(Step)
    {
        case 0:
        {
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



            Step = 1;
            SetPower(24, 0, 1000);
            SetPower(1, 1, 1000);
            SetPowerOut(0, 1, 1000);
            comVariableBlock.AutoSetOrManual = 1;
            MeasurResultTransmit(0, 1000);
        }
        break;

        case 1:
        {

            if((Result = PageKeyVoltage_T(&USART_Data, &comVariableBlock.AutoSetOrManual))[0])
            {
                if(Result[1])
                {
                    Step = 100;
                    return 0;

                }
                else
                {
                    Step = 2;
                }
            }
        }
        break;

        case 2:
        {
            if((Result = NixieTube(&USART_Data))[0])
            {

                if(Result[1])
                {
                    Step = 100;
                    return 0;

                }
                else
                {
                    Step = 3;
                    comVariableBlock.AutoSetOrManual = 1;
                }
            }

        }
        break;

        case 3:
        {
            if((Result = PageCurConsume_T(&USART_Data, &comVariableBlock.AutoSetOrManual))[0])
            {
                if(Result[1])
                {
                    Step = 100;
                    return 0;

                }
                else
                {
                    Step = 4;
                }
            }
        }
        break;

        case 4:
        {
            if((Result = ExternalInputLine())[0])
            {
                if(Result[1])
                {
                    Step = 100;
                    return 0;
                }
                else
                {
                    Step = 5;
                    comVariableBlock.AutoSetOrManual = 1;
                }
            }

        }
        break;

        case 5:
        {

            if((Result = HighLowLoad(&USART_Data, &comVariableBlock.AutoSetOrManual))[0])
            {

                if(Result[1])
                {
                    Step = 100;
                    return 0;

                }
                else
                {
                    Step = 7;
                }

            }

        }
        break;


        case 7:
        {

            if((Result = PageReversePower_T(&USART_Data, &comVariableBlock.AutoSetOrManual))[0])
            {
                if(Result[1])
                {
                    Step = 100;
                    return 0;

                }
                else
                {
                    Step = 8;
                    MeasurResultTransmit(1, 1000);
                }
            }

        }
        break;
    }

    return 0;
}










