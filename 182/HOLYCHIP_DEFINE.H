
#ifndef __HOLYCHIP_DEFINE__
#define __HOLYCHIP_DEFINE__

//#include <pic16p235l.h>
#include <hc18p110l.h>


#define LOW		0
#define HIGH	1
#define FALSE	0
#define TRUE	1


typedef unsigned char BOOL;
#define asm(szCmd) __asm__(#szCmd);		//内嵌汇编语句例：asm(sleep)后面不需要再加‘;’
//c: LOW/HIGH
#define SBIT(a, b, c) a = ( c ? (a|(0x01<<b)) : (a&(0xff-(0x01<<b))) )
//		SBIT(a, b, c)此函数是用来对PORT口单独位操作，
//		a=portX口（X=A/B/C/D/E/F）
//		b=PORT口（0、1、2、3、4、5、6、7）
//		c=输出电平（0、1对应低电平和高电平）

#define GBIT(a, b) (a&(0x01<<b))
//		GBIT(a, b)   此函数是用来得到PORT口电平变化
//		a=portX口（X=A/B/C/D/E/F）
//		b=PORT口（0、1、2、3、4、5、6、7）

#endif