
#include "holychip_define.h"
#include "adc.h"
//#define uint unsigned int
//unsigned int databuf=0;
//unsigned int voult_buf=0;
//unsigned char b;
//uint adc_sum=0;
//uint adc_value=0;
// 函数名：void delay_us(unsigned int x)
// 函数功能：延时
// 输入：延时时间 unsigned int
// 输出：无
void delay_us(unsigned int t)
{
 while(--t);

}
//┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
//┃ADC处理								  						  ┃
//┃Version:V1.00										 		  ┃
//┃Functio:AD初始化数据赋值处理		 						  ┃
//┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
/*void adc_get()
//void adc_get(unsigned char AD_TD)//ADC初始化 AD_TD通道选择 AD_TD=1对应通道0 AD_TD=7对应通道7 没有通道5
{

	ANSEL=0X20;		//1=AD（simulation models）0=I/O（digital models）
	ADCON0=0x14;	//参考电压选择，通道选择5
	ADCON1=0x00;	//ADC数据存放格式选,ADC所采集数据，当选择存格式为左对齐时，ADC精度只能为12位
	ADCKCS=	0x00;
	databuf=0;
	adc_value=0;
	for(b=0;b<16;b++)
		{
		ADEN=1;					//启动ADEN
		delay_us(100);		//等待ADC稳定
		ADON=1;	//启动ADON			
			
		while(ADON!=0);
		ADEN=0;
		ADON=0;
		databuf=ADRESH;
		databuf=(databuf<<4)|(ADRESL>>4);
		adc_value=databuf+adc_value;
		databuf=0;
		}
	adc_value=adc_value/16;					//平均值
	PIE1=0X00;			//关AD中断0100 0000
	ADRESL=0x00;
	ADRESH=0x00;
	ADCON0=0x00;
}*/
