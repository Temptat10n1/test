
#include "holychip_define.h"
#include "subroutine.h"
////////////////////////////////////////////////////////////////////////
////////////////////////////	  �ӳ���	////////////////////////////
////////////////////////////////////////////////////////////////////////
//******************************��ʱ�ӳ���******************************
void delay(unsigned int time)		
{
	unsigned int j=0;
	for(;time>0;time--)
	{
		for(j=0;j<1000;j++)
		{
			;
		}
	}
}
/*
uS��ʱ����������������� unsigned char t���޷���ֵ
 unsigned char �Ƕ����޷����ַ���������ֵ�ķ�Χ��
 0~255 ����ʹ�þ���12M����ȷ��ʱ��ʹ�û��,������ʱ
 �������� T=tx2+5 uS 
------------------------------------------------*/
void DelayUs2x(unsigned char t)
{   
 while(--t);
}
/*------------------------------------------------
 mS��ʱ����������������� unsigned char t���޷���ֵ
 unsigned char �Ƕ����޷����ַ���������ֵ�ķ�Χ��
 0~255 ����ʹ�þ���12M����ȷ��ʱ��ʹ�û��
------------------------------------------------*/
void DelayMs(unsigned char t)
{
     
 while(t--)
 {
     //������ʱ1mS
     DelayUs2x(245);
	 DelayUs2x(245);
 }
}

//*****************************������ӳ���*****************************
void running_light_1(void)			
{
		SBIT(PORTC, 0, LOW);
		delay(20);
		SBIT(PORTC, 0, HIGH);
		SBIT(PORTC, 1, 0);
		delay(20);
		SBIT(PORTC, 1, 1);
		SBIT(PORTC, 2, 0);
		delay(20);
		SBIT(PORTC, 2, 1);
		SBIT(PORTC, 3, 0);
		delay(20);
		SBIT(PORTC, 3, 1);
		SBIT(PORTC, 4, 0);
		delay(20);
		SBIT(PORTC, 4, 1);
		SBIT(PORTC, 5, 0);
		delay(20);
		SBIT(PORTC, 5, 1);
		SBIT(PORTC, 6, 0);
		delay(20);
		SBIT(PORTC, 6, 1);
		SBIT(PORTC, 7, 0);
		delay(20);
		SBIT(PORTC, 7, 1);
		SBIT(PORTC, 6, 0);
		delay(20);
		SBIT(PORTC, 6, 1);
		SBIT(PORTC, 5, 0);
		delay(20);
		SBIT(PORTC, 5, 1);
		SBIT(PORTC, 4, 0);
		delay(20);
		SBIT(PORTC, 4, 1);
		SBIT(PORTC, 3, 0);
		delay(20);
		SBIT(PORTC, 3, 1);
		SBIT(PORTC, 2, 0);
		delay(20);
		SBIT(PORTC, 2, 1);
		SBIT(PORTC, 1, 0);
		delay(20);
		SBIT(PORTC, 1, 1);
		SBIT(PORTC, 0, 0);
		delay(20);
		SBIT(PORTC, 0, 1);
		delay(20);
}
void running_light_2(void)
{
		PORTC=0XFF;
		SBIT(PORTC, 0, 0);
		SBIT(PORTC, 7, 0);
		delay(20);	
		SBIT(PORTC, 1, 0);
		SBIT(PORTC, 6, 0);
		delay(20);	
		SBIT(PORTC, 2, 0);
		SBIT(PORTC, 5, 0);
		delay(20);	
		SBIT(PORTC, 3, 0);
		SBIT(PORTC, 4, 0);
		delay(20);	
		SBIT(PORTC, 3, 1);
		SBIT(PORTC, 4, 1);
		delay(20);	
		SBIT(PORTC, 2, 1);
		SBIT(PORTC, 5, 1);
		delay(20);	
		SBIT(PORTC, 1, 1);
		SBIT(PORTC, 6, 1);
		delay(20);	
		SBIT(PORTC, 0, 1);
		SBIT(PORTC, 7, 1);
		delay(20);	
}
