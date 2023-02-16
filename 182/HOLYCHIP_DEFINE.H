
#ifndef __HOLYCHIP_DEFINE__
#define __HOLYCHIP_DEFINE__

//#include <pic16p235l.h>
#include <hc18p110l.h>


#define LOW		0
#define HIGH	1
#define FALSE	0
#define TRUE	1


typedef unsigned char BOOL;
#define asm(szCmd) __asm__(#szCmd);		//��Ƕ����������asm(sleep)���治��Ҫ�ټӡ�;��
//c: LOW/HIGH
#define SBIT(a, b, c) a = ( c ? (a|(0x01<<b)) : (a&(0xff-(0x01<<b))) )
//		SBIT(a, b, c)�˺�����������PORT�ڵ���λ������
//		a=portX�ڣ�X=A/B/C/D/E/F��
//		b=PORT�ڣ�0��1��2��3��4��5��6��7��
//		c=�����ƽ��0��1��Ӧ�͵�ƽ�͸ߵ�ƽ��

#define GBIT(a, b) (a&(0x01<<b))
//		GBIT(a, b)   �˺����������õ�PORT�ڵ�ƽ�仯
//		a=portX�ڣ�X=A/B/C/D/E/F��
//		b=PORT�ڣ�0��1��2��3��4��5��6��7��

#endif