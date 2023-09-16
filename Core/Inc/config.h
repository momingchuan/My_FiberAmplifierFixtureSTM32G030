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

#ifndef __CONFIG_H__
#define __CONFIG_H__

#ifdef __cplusplus
extern "C" {
#endif


	#define CutApartBufLen 50
	
	
#define RECEIVE_REAL_DATA 100
#define CLEAN_BUF_DATA 50
	
#define SendDataBuf_Len 200
	
#define  RECEIVE_DATA_BUF_LEN_USART1 1000/*buf缓冲的长度*/
	
#define  RECEIVE_DATA_BUF_LEN_USART3 50/*buf缓冲的长度*/

#define  RECEIVE_DATA_BUF_LEN_USART4 RECEIVE_REAL_DATA/*buf缓冲的长度*/	
	
#define  RECEIVE_DATA_BUF_LEN_USART6 RECEIVE_REAL_DATA/*buf缓冲的长度*/	
	
typedef unsigned char u8;
typedef unsigned short int u16;
typedef unsigned int u32;
	
	typedef enum _pageNumType
	{
		page_main,
		page_CurConsume_T,
		page_KV_T,
		page_HL_T,
		page_Setting,
		page_Data,
		page_Button,
		page_Calibration,
		page_NNNNNNNO,
	
	}pageNumType;
	
//
	typedef enum _MeasureResults
	{
		ResultsTesting,
		ResultsSuccess,
		ResultsFail,
		ResultsStop,
		ResultsNULL,
		
	}MeasureResultsType;
	
	typedef enum _DeviceStatus
	{
		DS_Error_USART4,
		DS_Non,

		
	}DeviceStatusType;
	

    typedef enum _MainStep
	{
		MS_SelfChecking,
		MS_PageKeyVoltage_T,
		MS_PageReversePower_T,
		MS_Calibration,
		MS_NixieTube,
		MS_PageCurConsume_T,
		MS_ExternalInputLine,
		MS_HighLowLoad,
		MS_ButtonCheck,
		MS_SaveData,
		MS_non
		
	}MainStepType;
	
	typedef struct _USART_DataType
	{
//		char SeparatorString;
		
		struct 
		{
			
			
			//page页面
			pageNumType PageNum;
			pageNumType PageNumChange;
			
			//page a 消耗电流
			float US1_a_Voltage;/*电压*/
			float US1_a_Max_mA; /*最大电流*/
			float US1_a_Min_mA; /*最小电流*/
			//page b 关键电压
			
			float US1_b_Voltage0;/*电压*/
			float US1_b_Voltage1;/*电压*/
			float US1_b_Voltage2;/*电压*/
			float US1_b_Voltage3;/*电压*/
			float US1_b_Voltage4;/*电压*/
			float US1_b_Voltage5;/*电压*/
			float US1_b_Voltage6;/*电压*/
			float US1_b_Voltage7;/*电压*/
			
			float US1_b_Min_mA0; /*最小电流*/
			float US1_b_Min_mA1; /*最小电流*/
			float US1_b_Min_mA2; /*最小电流*/
			float US1_b_Min_mA3; /*最小电流*/
			float US1_b_Min_mA4; /*最小电流*/
			float US1_b_Min_mA5; /*最小电流*/
			float US1_b_Min_mA6; /*最小电流*/
			float US1_b_Min_mA7; /*最小电流*/
			
			float US1_b_Max_mA0; /*最大电流*/
			float US1_b_Max_mA1; /*最大电流*/
			float US1_b_Max_mA2; /*最大电流*/
			float US1_b_Max_mA3; /*最大电流*/
			float US1_b_Max_mA4; /*最大电流*/
			float US1_b_Max_mA5; /*最大电流*/
			float US1_b_Max_mA6; /*最大电流*/
			float US1_b_Max_mA7; /*最大电流*/
			
			//page c 高低负载
			float US1_c_ValN1;/*值 漏电电流*/
			float US1_c_ValN2;/*值*/
			float US1_c_ValN3;/*值*/
			float US1_c_ValN4;/*值 残余电压测试电流*/
			float US1_c_ValN5;/*值 输出残余电压*/
			float US1_c_ValN6;/*值*/
			float US1_c_ValN7;/*值*/
			float US1_c_ValN8;/*值*/
			
			float US1_c_ValP1;/*值 漏电电流*/
			float US1_c_ValP2;/*值*/
			float US1_c_ValP3;/*值*/
			float US1_c_ValP4;/*值 残余电压测试电流*/
			float US1_c_ValP5;/*值 输出残余电压*/
			float US1_c_ValP6;/*值*/
			float US1_c_ValP7;/*值*/
			float US1_c_ValP8;/*值*/
			
			float US1_c_Min_mA1; /*最小值*/
			float US1_c_Min_mA2; /*最小值*/
			float US1_c_Min_mA3; /*最小值*/
			float US1_c_Min_mA4; /*最小值*/
			float US1_c_Min_mA5; /*最小值*/
			float US1_c_Min_mA6; /*最小值*/
			float US1_c_Min_mA7; /*最小值*/
			float US1_c_Min_mA8; /*最小值*/
			
			float US1_c_Max_mA1; /*最小值*/
			float US1_c_Max_mA2; /*最小值*/
			float US1_c_Max_mA3; /*最小值*/
			float US1_c_Max_mA4; /*最小值*/
			float US1_c_Max_mA5; /*最小值*/
			float US1_c_Max_mA6; /*最小值*/
			float US1_c_Max_mA7; /*最小值*/
			float US1_c_Max_mA8; /*最小值*/
			
			



//page d 校准页面

			unsigned short int US1_d_Min_Val; /*校准1*/
			unsigned short int US1_d_Min_Va2; /*校准2*/
			unsigned short int US1_d_Min_Va3; /*校准3*/
			unsigned short int US1_d_Min_Va4; /*校准4*/
			unsigned short int US1_d_Min_Va5; /*校准5*/
			unsigned short int US1_d_Min_Va6; /*校准6*/
			unsigned short int US1_d_Min_Va7; /*校准7*/
			unsigned short int US1_d_Min_Va8; /*校准8*/
			unsigned short int US1_d_Min_Va9; /*校准9*/
			unsigned short int US1_d_Min_Va10; /*校准10*/
			unsigned short int US1_d_Min_Va11; /*校准11*/
			
			
			unsigned short int US1_d_Max_Val; /*校准1*/
			unsigned short int US1_d_Max_Va2; /*校准2*/
			unsigned short int US1_d_Max_Va3; /*校准3*/
			unsigned short int US1_d_Max_Va4; /*校准4*/
			unsigned short int US1_d_Max_Va5; /*校准5*/
			unsigned short int US1_d_Max_Va6; /*校准6*/
			unsigned short int US1_d_Max_Va7; /*校准7*/
			unsigned short int US1_d_Max_Va8; /*校准8*/
			unsigned short int US1_d_Max_Va9; /*校准9*/
			unsigned short int US1_d_Max_Va10; /*校准10*/
			unsigned short int US1_d_Max_Va11; /*校准11*/
			


//数据---------------------------------------------------------------

		   int  US1_CalibrationData[20];//校准数据
/*0-3
			FINE模式DAC
			FINE模式光源驱动电流
			FINE模式采集数值
			FINE模式数据波动
4-7
			HSP模式DAC
			HSP模式光源驱动电流
			HSP模式采集数值
			HSP模式数据波动
4-7
*/

unsigned int  ResidualVoltageData[2];//残余电压数据
/*[0]残余电压测试电流
[1]残余电压
*/

float  ConsumeCur;//消耗电流

//数据---------------------------------------------------------------


			char US1_CutApartBuf[20][CutApartBufLen];//分割缓冲
		
			
			char US1_SendDataBuf[50][SendDataBuf_Len];
			unsigned char US1_SendAutoAdd;//发送自增变量
			unsigned char US1_Send_Flag;//发送标志位
			unsigned char US1_SendDataSucce_Flag;/*发送成功标记为*/
			unsigned char US1_ReceiDataSucce_Flag;//接收成功标记位
//			unsigned char US1_ReceiDataSucceCount;/*接收计数*/
			unsigned char US1_ReceiveDataStr[RECEIVE_DATA_BUF_LEN_USART1];

		
		}USART1_Data;//SCREEN
	
		
		struct 
		{
			unsigned char US2_SendDataSucce_Flag;/*发送成功标记为*/
			
		}USART2_Data;
		
		struct 
		{
			float US3_OutValCurrent;/*输出电流的数值*/
			float US3_OutValVoltage;/*输出电压的数值*/
			float US3_OutValPower;  /*输出功率的数值*/
			unsigned char US3_OutState;
			
			char US3_SendDataBuf[10][SendDataBuf_Len];
			unsigned char US3_ReceiDataSucce_Flag;
			unsigned char US3_SendAutoIncrement;//发送自增变量
			unsigned char US3_Send_Flag;//发送标志位
			unsigned char US3_SendDataSucce_Flag;/*发送成功标记为*/
			unsigned char US3_ReceiDataSucceCount;/*接收计数*/
			unsigned char US3_ReceiveDataStr[20][20];
			float         US3_ReceiveDataNum[20];
			
		}USART3_Data;//POWER
		
		struct 
		{

			unsigned char US4_SendDataSucce_Flag;/*发送成功标记为*/
			unsigned char US4_ReceiDataSucce_Flag;/*接收成功标记为*/
			unsigned char US4_receiveData[RECEIVE_REAL_DATA];
			
		}USART4_Data;//SENSOR
		struct 
		{
			float US6_OutValCurrent;/*输出电流的数值*/
			float US6_OutValVoltageDC;/*输出DC电压的数值*/
			float US6_OutValVoltageAC;/*输出AC电压的数值*/
			
			char US6_SendDataBuf[10][SendDataBuf_Len];
			unsigned char US6_SendAutoIncrement;//发送自增变量
			unsigned char US6_Send_Flag;//发送标志位
			unsigned char US6_SendDataSucce_Flag;/*发送成功标记为*/
			unsigned char US6_ReceiDataSucce_Flag;
			unsigned char US6_ReceiDataSucceCount;/*接收计数*/
			unsigned char US6_ReceiveDataStr[20][20];
			float         US6_ReceiveDataNum[20];
			
		}USART6_Data;//MULTIMETER
		
	
	}USART_DataType;
	

	
	
	typedef struct _SYStickTime
	{
		unsigned int sys_ReceiveData_ms; 
		
		unsigned int sys_sendTime_ms; 
		unsigned int sys_WaitOutTime_ms;
		unsigned int sys_MeasuringTime_ms;
		unsigned int sys_LEDTime_ms;
		unsigned int sys_Test_ms;
		unsigned int sys_SendDataToScreen_ms;

	}SYStickTimeType;


typedef struct _comVariableBlockType
{
	unsigned char *SaveDATA_BUF; 
	unsigned short int SaveDATA_BUF_Len; 
	unsigned char SaveDataFlag;
	unsigned char KeyPointVoltageResult;
	unsigned char HighLowDetectionResult;
	unsigned char NixieTubeResult;
	unsigned char ExternalInputLineResult;
	unsigned char AutoSetOrManual;  //0为手动，非0为自动
	unsigned char StartDetecFlag;  //启动检测，1为检测
	unsigned char StopDetecFlag;  //1是停止
	unsigned char StartRunLED;  //开启跑main函数
	unsigned char BeepControl;  //
	
	DeviceStatusType DeviceStatus;//设备状态
	MainStepType MainStep;
//	unsigned char StartCountTimeFlag;  //
	
	unsigned char ScreenCommunicationState;  //
	
	unsigned char MachineSelfTestState;
	
	
	MeasureResultsType MeasureResults;
	
	unsigned short int TimYear;
	unsigned short int TimMonth;
	unsigned short int TimDay;
	unsigned short int TimHour;
	unsigned short int TimMinute;
	unsigned short int TimSecond;
	
	
unsigned short int DataException;
//读取数据校准电流系数异常

	
	unsigned char SDInsertState;
	unsigned char ID_SreeFindScreen[4][50];
	unsigned char ID_BUF[20][25];
	unsigned char ID_Sensor[50];
	unsigned char ID_SensorChanged[50];
//	unsigned char ID_SameFlag;//1是相同，0不相同
	 char ID_RowCoordinate;
	unsigned char ID_FineRowCoordinate;//记录找到id的定位数组下标
	unsigned short int NumOfNQualified;//不通过
	unsigned short int NumOfQualified;//通过
	unsigned short int NumOfQualifiedTotal;//总数
	unsigned short int NumOfQualifiedFlag;//
//	unsigned short int NumOfProducts;

	unsigned char  Progress;//进度条
	float ProgressCoefficient;
	
	unsigned int OutputPWM_Num;
	float Coefficient_PNP_A;
	float Coefficient_PNP_B;
	float Coefficient_NPN_A;
	float Coefficient_NPN_B;

}comVariableBlockType;

extern SYStickTimeType  SYS_tickTime;
extern USART_DataType USART_Data;
//extern DATA_storeType DATA_store;	
extern comVariableBlockType comVariableBlock;

#ifdef __cplusplus
}
#endif
#endif /*__ GPIO_H__ */

