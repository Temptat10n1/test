
#include "holychip_define.h"
#include "inital.h"


////////////////////////////////////////////////////////////////////////
////////////////////////////	 端口初始化	////////////////////////////
////////////////////////////////////////////////////////////////////////
void inital(void)
{


	TRISA=0b11101110;			//1110 1110 输入输出设置  1=输入，0=输出
	TRISB=0b10111110;			//1011 1110 输入输出设置  1=输入，0=输出
	PORTA=0b00010000;			//0001 0001
	PORTB=0b01000000;			//0110 0000 PORT口输出高低电平设置  1=高电平，0=低电平
	
	ANSEL=0X00;
	WPUA =0Xff;			//1110 1110上拉设置 1=DISABLED PULL-UP  ;0=PULL-UP
	WPUB =0b11011111;			//1001 1110上拉设置 1=DISABLED PULL-UP  ;0=PULL-UP
	//AUXR=0X00;
	IOCB =0X28;            //0010 1000 PORTB电平变化中断,0 = 该端口禁止电平变化中断,1 = 该端口使能电平变化中断
	ADCON0=61;			//内部Vdd，AN0
	ADCON1=50;
/*					;9Fh 	Bit7 	Bit6 	Bit5 	Bit4 	Bit3 Bit2 Bit1		Bit 0
					;ADCON1 ADFM 	ADCS2 	ADCS1 	ADCS0 	- 	- 	- 	ADREF	
					
					;ADC 时钟源 	ADCS[2:0] 典型值
					;	Fosc 	000 	2us
					;	Fosc/2 	001 	4us
					;	Fosc/4  010 	8us
					;	Fosc/8  011 	16us
					;	Fosc/16 100 	32us
					;	Fosc/32 101 	64us
					;	Fosc/64 110 	128us
					;	FRC 	111 	视RC 的值而定
					;ADFM 数据格式
					;0 ADRESH[7:0]:ADRESL[7:4]
					
					;1 ADRESH[1:0]:ADRESL[7:0]	
					;1Fh 	Bit7 Bit6 Bit5 Bit4 Bit3 Bit2 Bit1 Bit0
					;ADCON0    - VHS1 VHS0 CHS2 CHS1 CHS0 ADON ADEN
						
					;ADREF VHS[1:0] 参考电压	CHS [2:0] 模拟通道	
					;0 00 内部2.0V			000 AN0
					;0 01 内部3.0V			001 AN1
					;0 10 内部4.0V			010 AN2
					;0 11 内部VDD			011 AN3
					;1 xx 外部参考电压		100 AN4
					;				101 AN5			
					;				110 保留
					;
*/							
}

////////////////////////////////////////////////////////////////////////
////////////////////////	系统初始化 		////////////////////////////
////////////////////////////////////////////////////////////////////////
void sysinitial(void)
{
	//INTCON=0x00;
	INTCON=0x28;//0010 1000 = 使能所有未屏蔽的中断,1 = 使能PORTB电平变化中断,T0IF：Timer0,1 = Timer0计数寄存器溢出（必须由软件清0）PEIE
	//T2=0x00;
	OSCCON=0X80;
	//OPTION=0X8f;
	OPTION=0X88;
	PCON=0XD0;
	//PR2=0X63;
	//T2CON=0X00;
	PEIE=1;//使能所有未屏蔽的外设中断
	T0IE=1;
	
	PIE1=2;			//打开T2中断
	T2CON=0b00110100;	//设置T2分频1:64
	PR2=124;		//0.25*64*(PR+1)=4MS进一次T2中断
}
