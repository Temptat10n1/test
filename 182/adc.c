
#include "holychip_define.h"
#include "adc.h"
//#define uint unsigned int
//unsigned int databuf=0;
//unsigned int voult_buf=0;
//unsigned char b;
//uint adc_sum=0;
//uint adc_value=0;
// ��������void delay_us(unsigned int x)
// �������ܣ���ʱ
// ���룺��ʱʱ�� unsigned int
// �������
void delay_us(unsigned int t)
{
 while(--t);

}
//������������������������������������������������������������������
//��ADC����								  						  ��
//��Version:V1.00										 		  ��
//��Functio:AD��ʼ�����ݸ�ֵ����		 						  ��
//������������������������������������������������������������������
/*void adc_get()
//void adc_get(unsigned char AD_TD)//ADC��ʼ�� AD_TDͨ��ѡ�� AD_TD=1��Ӧͨ��0 AD_TD=7��Ӧͨ��7 û��ͨ��5
{

	ANSEL=0X20;		//1=AD��simulation models��0=I/O��digital models��
	ADCON0=0x14;	//�ο���ѹѡ��ͨ��ѡ��5
	ADCON1=0x00;	//ADC���ݴ�Ÿ�ʽѡ,ADC���ɼ����ݣ���ѡ����ʽΪ�����ʱ��ADC����ֻ��Ϊ12λ
	ADCKCS=	0x00;
	databuf=0;
	adc_value=0;
	for(b=0;b<16;b++)
		{
		ADEN=1;					//����ADEN
		delay_us(100);		//�ȴ�ADC�ȶ�
		ADON=1;	//����ADON			
			
		while(ADON!=0);
		ADEN=0;
		ADON=0;
		databuf=ADRESH;
		databuf=(databuf<<4)|(ADRESL>>4);
		adc_value=databuf+adc_value;
		databuf=0;
		}
	adc_value=adc_value/16;					//ƽ��ֵ
	PIE1=0X00;			//��AD�ж�0100 0000
	ADRESL=0x00;
	ADRESH=0x00;
	ADCON0=0x00;
}*/
