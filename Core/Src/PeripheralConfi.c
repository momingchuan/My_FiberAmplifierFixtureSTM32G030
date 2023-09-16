#include "PeripheralConfi.h"
#include "gpio.h"
#include "main.h"	

PWR_PVDTypeDef My_PVD_Type;


void PWR_PVD(void)
{
	__HAL_RCC_PWR_CLK_ENABLE();
	My_PVD_Type.PVDLevel=PWR_PVDLEVEL_7;
	My_PVD_Type.Mode=PWR_PVD_MODE_IT_RISING_FALLING;
	HAL_PWR_ConfigPVD(&My_PVD_Type);
	HAL_PWR_EnablePVD();
	 HAL_NVIC_SetPriority(PVD_IRQn, 0, 0);
    HAL_NVIC_EnableIRQ(PVD_IRQn);
}


void HAL_PWR_PVDCallback()
{
	//电压检测，掉电的时候可以加入要执行的动作
	
}











