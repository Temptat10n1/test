
////////////////////////////////////////////////////////////////////////
////////////////////////////	  ͷ�ļ�	////////////////////////////
////////////////////////////////////////////////////////////////////////

#include "holychip_define.h"
#include "inital.h"
//#include "adc.h"

////////////////////////////////////////////////////////////////////////
////////////////////////////	  ��������	////////////////////////////
////////////////////////////////////////////////////////////////////////
#define uchar unsigned char
#define uint unsigned int
//uint adc_sum=0;
uint adc_value,databuf;

uchar Time_Seep=0;

///*******************************************************
#define	PWM_FULL			100
#define	PWM_EMPTY			0
#define	PWM_HIGH			1
#define	PWM_LOW				0
#define	KEY_SHORT_TIME		50	//n*2ms=200ms
#define	POWEROFF_TIME		120	//n*500ms=60s	�ػ�ʱ��
uchar Pwm1_Count,Pwm2_Count;
uchar Pwm1_Duty_Ratio[5]={0,0,16,31,16},Pwm2_Duty_Ratio[5]={0,0,16,31,37};
uchar Gear4_temp;
uchar Gear;
uchar time_2ms,Time_500MS,Red_Flash=0;
uchar key_press_time,Key_Mode;
///*******************************************************
typedef struct{
                 unsigned bit0:1;
   				 unsigned bit1:1;
    			 unsigned bit2:1;
  				 unsigned bit3:1;
    			 unsigned bit4:1;
   				 unsigned bit5:1;
    			 unsigned bit6:1; 
   				 unsigned bit7:1;
                 }struct_type;
typedef union
{
    struct_type bit_value;
    uchar byte_value;
}flag_type;
flag_type flag1,flag2;
///*******************************************************
///*******************************************************
#define charg_flag   (flag1.bit_value.bit0)

#define BattLow    (flag1.bit_value.bit6) 
#define BattHigh   (flag1.bit_value.bit7)


#define red_flash_count_flag	(flag1.bit_value.bit0) 
#define time_2ms_flag   		(flag1.bit_value.bit7)  
///*******************************************************
///*******************************************************


////////////////////////////////////////
/////////////////////////////////////////////////////////////////////

//******************************��ʱ�ӳ���******************************
/*
uS��ʱ����������������� unsigned char t���޷���ֵ
 unsigned char �Ƕ����޷����ַ���������ֵ�ķ�Χ��
 0~255 ��ȷ��ʱ��ʹ�û��,������ʱ
------------------------------------------------*/
void DelayUs2x(unsigned char t)
{   
 while(--t);
}
/*------------------------------------------------
 mS��ʱ����������������� unsigned int t���޷���ֵ
 unsigned int �Ƕ����޷����ַ���������ֵ�ķ�Χ��
 0~1024 ��ȷ��ʱ��ʹ�û��
------------------------------------------------*/
void DelayMs(unsigned int t)
{
     
 while(t--)
 {
     //������ʱ1mS
     DelayUs2x(120);
	 DelayUs2x(125);
 }
}
////////////////////////////////////////////////////////////////////
#define	RED			PORTA4//2#//
#define	dc_in		PORTB3//6#
#define	BLUE		PORTB6//7#
//#define	key			PORTB7//3#//KEY
#define	key			PORTB5//3#//KEY
#define	PWM2		PORTB0//5#
#define	PWM1		PORTA0//4#//LED
//******************************************************
//******************************************************
void adc_get()
{
	uchar b=0;
	databuf=0;
	adc_value=0;
	
//	ANSEL=0b00001000;		//0010 0000 //1=AD��simulation models��0=I/O��digital models��
//	ADCON1=0b01010000;	//ADC���ݴ�Ÿ�ʽѡ,ADC���ɼ����ݣ���ѡ����ʽΪ�����ʱ��ADC����ֻ��Ϊ12λ
//	ADCKCS=	0x00;
//	ADCON0=0b00001101;	//�ο���ѹѡ���ڲ�2V��ͨ��ѡ��3������ADEN
		
	ADCON1=0b01010000;	//ADC���ݴ�Ÿ�ʽѡ,ADC���ɼ����ݣ���ѡ����ʽΪ�����ʱ��ADC����ֻ��Ϊ12λ
	ADCKCS=	0x00;
	ADCON0=0b00010101;	//�ο���ѹѡ���ڲ�2V��ͨ��ѡ��3������ADEN
		
	for(b=0;b<16;b++)
		{
		DelayUs2x(35);		//�ȴ�ADC�ȶ�
		ADON=1;	//����ADON			
		//asm(clrwdt);
		DelayUs2x(35);		//�ȴ�ADC�ȶ�
		//asm(clrwdt);	
		while(ADON!=0);
//		ADEN=0;
//		ADON=0;
		databuf=ADRESH;
		databuf=(databuf<<4)|(ADRESL>>4);
		adc_value=databuf+adc_value;
		databuf=0;
		}
	adc_value=adc_value>>4;					//ƽ��ֵ
	ADCON0=0x00;
}
//*****************************************************
//////////////////////////////////////////////////
void KeyScan()
{
	key_press_time++;
	if(key)
	{
		if(key_press_time>=KEY_SHORT_TIME)
			Key_Mode=1;
		key_press_time=0;
	}
	else
	{
		Time_Seep=0;
		
	}
	if(key_press_time>=200)
		key_press_time=200;
}
void RedFlash()
{
	RED=Red_Flash%2;
	if(Red_Flash>=9)
	{
		red_flash_count_flag=0;
		Red_Flash=0;
		Gear=0;
	}
}
void AdjustGear()
{

	if(Gear!=0)
	{
		Time_Seep=0;
		if(BattLow)//�ŵ�ʱû��ػ�
		{
			BLUE=1;
			//Key_Mode=0;
			red_flash_count_flag=1;
			RedFlash();
		}
		if(Time_500MS>=POWEROFF_TIME)//ʱ�䵽�ػ�
		{
			BLUE=1;
			Gear=0;
		}
	}
	if(Key_Mode)
	{
		Key_Mode=0;
		Gear++;
		if(Gear==5)
			Gear=0;
	
		time_2ms=0;
		Time_500MS=0;
		
		
		if(Gear==1)
		{
			//��һ�ΰ���������д������
			if(BattLow==0)
				BLUE=0;
			//��һ�ΰ���������д������
		}
		if(Gear==0)
		{
			//�������ػ�д������
			BLUE=1;
			//�������ػ�д������
		}
	}
}

///////////////////////////////////////////////
void ChIntput()
{	
	if(dc_in)
	{
		Time_Seep=0;
		if(!charg_flag)
		{
			charg_flag=1;
			Gear=0;
			BLUE=1;
			BattHigh=0;
			BattLow=0;
		}
		adc_get();
		if(adc_value>0x85c)//4.18V//2140
		{
			BattHigh=1;
		}
		if(BattHigh)
		{
			RedFlash();
			red_flash_count_flag=1;
		}
		else
		{
			RED=0;
			red_flash_count_flag=0;
		}

	}
	else
		charg_flag=0;

}
/*********************************************************************/
void batt_test()//��ص�ѹ���
{
	if(!dc_in && Gear !=0)//  && KeyDisp && !Out_Test)
	{
		Time_Seep=0;
		adc_get();
		if(!BattLow)
		{
			if(adc_value<0x600)//3V//1536
			{
				BattLow=1;
			
			}
	
		}
	}
		

}
/*********************************************************************/
void SleepMode()
{
	Time_Seep++;
	if(Time_Seep>50)
	{
		Time_Seep=0;
		BLUE=1;
		RED=1;
		PWM1=0;
		PWM2=0;
		
		ADIE=0;
		ADEN=0;
		ADON=0;	
		//KeyDisp=0;	
		PIE1=0X00;			//��AD�ж�0100 0000
		WDTENS=0;
		GIE=0;
		T0IE=0;
		RBIE=1;
		PEIE=0;
		IOCB3=1;
		IOCB5=1;
		INTE=0;
		asm(nop);
		asm(SLEEP);
		asm(nop);
		GIE=1;
		IOCB3=0;
		IOCB5=0;
		T0IE=1;
		RBIE=0;
		WDTENS=1;
		PIE1=0X40;			//ʹ��AD�ж�0100 0000
		


	}
	
}



void initValue()
{
	flag1.byte_value=0b00000000;
	flag2.byte_value=0b00000000;
	
	Time_Seep=0;
	
	Key_Mode=0;
	key_press_time=0;
	
	Pwm1_Count=0;
	Pwm2_Count=50;
	Gear4_temp=0;
	Gear=0;
}

//////////////////////////////////////////////////////
//******************************************************
////////////////////////////////////////////////////////////////////////
////////////////////////////	  ������	////////////////////////////
////////////////////////////////////////////////////////////////////////
void main(void)
{
	inital();				//�˿ڳ�ʼ��
	DelayMs(100);			//��ʱ�ȴ�ϵͳ�����ȶ�
	sysinitial();			//ϵͳ��ʼ��
	initValue();
	BattLow=0;
	PWM2=PWM_HIGH;
	PWM1=PWM_LOW;
	GIE=1;
	while(1)
	{
		if(time_2ms_flag)
		{
			time_2ms_flag=0;
			asm(clrwdt);
			
			KeyScan();
			AdjustGear();		
			batt_test();
			ChIntput();
			SleepMode();
		}
	}
}


//*****************************�жϷ������*****************************
void Intr(void) __interrupt
{
	if(RBIF)
	{
		RBIF=0;
		RBIE=0;
		PEIE=0;
	}

	if(T0IF)	//30us��һ��
	{
		
		T0IF=0;
		T0=160;	//T0����ֵ	

		if(Gear==5)
			Gear=0;
		Pwm1_Count++;
		if(Pwm1_Count==PWM_FULL)
			Pwm1_Count=PWM_EMPTY;
		if(Pwm1_Count<Pwm1_Duty_Ratio[Gear])
			PWM1=PWM_HIGH;
		else
			PWM1=PWM_LOW;
			
		Pwm2_Count++;
		if(Pwm2_Count==PWM_FULL)
			Pwm2_Count=PWM_EMPTY;
		if(Pwm2_Count<Pwm2_Duty_Ratio[Gear])
			PWM2=PWM_HIGH;
		else
			PWM2=PWM_LOW;
		

	}
	if(T2IF)	//2ms��һ��
	{
		T2IF=0;
		time_2ms_flag=1;
		time_2ms++;
		if(time_2ms>=250)//500ms
		{
			time_2ms=0;
			Time_500MS++;
			if(red_flash_count_flag)
				Red_Flash++;
			else
				Red_Flash=0;
		}
		
		Gear4_temp++;
		if(Gear4_temp==196)
			Gear4_temp=0;
		if(Gear4_temp<170)
			Pwm1_Duty_Ratio[4]=17;
		else if(Gear4_temp<172)
			Pwm1_Duty_Ratio[4]=31;
		else if(Gear4_temp<195)
			Pwm1_Duty_Ratio[4]=37;
		else if(Gear4_temp<196)
			Pwm1_Duty_Ratio[4]=21;
	}
}

//		if(PWM1)
//			PWM1=PWM_LOW;
//		else
//			PWM1=PWM_HIGH;