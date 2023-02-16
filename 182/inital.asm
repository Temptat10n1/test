;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (CYGWIN)
;--------------------------------------------------------
; PIC port for the 14-bit core
;--------------------------------------------------------
;	.file	"inital.c"
	list	p=18p110l
	radix dec
	include "p18p110l.inc"
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	_STATUSbits
	extern	_PORTAbits
	extern	_PORTBbits
	extern	_INTCONbits
	extern	_PIR1bits
	extern	_PIR2bits
	extern	_T1CONbits
	extern	_T2CONbits
	extern	_WPUBbits
	extern	_IOCBbits
	extern	_CCP1CONbits
	extern	_PR1CONbits
	extern	_CCP2CONbits
	extern	_ADCON0bits
	extern	_OPTIONbits
	extern	_TRISAbits
	extern	_TRISBbits
	extern	_ADCKCSbits
	extern	_PIE1bits
	extern	_PIE2bits
	extern	_PCONbits
	extern	_T1GCONbits
	extern	_OSCCONbits
	extern	_WPUAbits
	extern	_PMCONbits
	extern	_ANSELbits
	extern	_ADCON1bits
	extern	_INDF
	extern	_T0
	extern	_PCL
	extern	_STATUS
	extern	_FSR
	extern	_PORTA
	extern	_PORTB
	extern	_PCLATH
	extern	_INTCON
	extern	_PIR1
	extern	_PIR2
	extern	_T1L
	extern	_T1H
	extern	_T1CON
	extern	_T2
	extern	_T2CON
	extern	_WPUB
	extern	_IOCB
	extern	_CCPR1L
	extern	_CCPR1H
	extern	_CCP1CON
	extern	_PR1L
	extern	_PR1CON
	extern	_CCPR2L
	extern	_CCPR2H
	extern	_CCP2CON
	extern	_ADRESH
	extern	_ADCON0
	extern	_OPTION
	extern	_TRISA
	extern	_TRISB
	extern	_ADCKCS
	extern	_PIE1
	extern	_PIE2
	extern	_PCON
	extern	_T1GCON
	extern	_OSCCON
	extern	_PR2
	extern	_WPUA
	extern	_PMDATL
	extern	_PMDATH
	extern	_PMADRL
	extern	_PMADRH
	extern	_PMCON
	extern	_ANSEL
	extern	_ADRESL
	extern	_ADCON1

	extern PSAVE
	extern SSAVE
	extern WSAVE
	extern STK12
	extern STK11
	extern STK10
	extern STK09
	extern STK08
	extern STK07
	extern STK06
	extern STK05
	extern STK04
	extern STK03
	extern STK02
	extern STK01
	extern STK00
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	global	_sysinitial
	global	_inital

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;	udata_ovr
;--------------------------------------------------------
; code
;--------------------------------------------------------
code_inital	code
;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
S_inital__sysinitial	code
_sysinitial:
; 2 exit points
;	.line	62; "inital.c"	INTCON=0x28;//0010 1000 = 使能所有未屏蔽的中断,1 = 使能PORTB电平变化中断,T0IF：Timer0,1 = Timer0计数寄存器溢出（必须由软件清0）PEIE
	MOVLW	0x28
	BANKSEL	_INTCON
	MOVWF	_INTCON
;	.line	64; "inital.c"	OSCCON=0X80;
	MOVLW	0x80
	BANKSEL	_OSCCON
	MOVWF	_OSCCON
;	.line	66; "inital.c"	OPTION=0X88;
	MOVLW	0x88
	MOVWF	_OPTION
;	.line	67; "inital.c"	PCON=0XD0;
	MOVLW	0xd0
	MOVWF	_PCON
;	.line	70; "inital.c"	PEIE=1;//使能所有未屏蔽的外设中断
	BANKSEL	_INTCONbits
	BSF	_INTCONbits,6
;	.line	71; "inital.c"	T0IE=1;
	BSF	_INTCONbits,5
;	.line	73; "inital.c"	PIE1=2;			//打开T2中断
	MOVLW	0x02
	BANKSEL	_PIE1
	MOVWF	_PIE1
;	.line	74; "inital.c"	T2CON=0b00110100;	//设置T2分频1:64
	MOVLW	0x34
	BANKSEL	_T2CON
	MOVWF	_T2CON
;	.line	75; "inital.c"	PR2=124;		//0.25*64*(PR+1)=4MS进一次T2中断
	MOVLW	0x7c
	BANKSEL	_PR2
	MOVWF	_PR2
	RETURN	
; exit point of _sysinitial

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
S_inital__inital	code
_inital:
; 2 exit points
;	.line	13; "inital.c"	TRISA=0b11101110;			//1110 1110 输入输出设置  1=输入，0=输出
	MOVLW	0xee
	BANKSEL	_TRISA
	MOVWF	_TRISA
;	.line	14; "inital.c"	TRISB=0b10111110;			//1011 1110 输入输出设置  1=输入，0=输出
	MOVLW	0xbe
	MOVWF	_TRISB
;	.line	15; "inital.c"	PORTA=0b00010000;			//0001 0001
	MOVLW	0x10
	BANKSEL	_PORTA
	MOVWF	_PORTA
;	.line	16; "inital.c"	PORTB=0b01000000;			//0110 0000 PORT口输出高低电平设置  1=高电平，0=低电平
	MOVLW	0x40
	MOVWF	_PORTB
;	.line	18; "inital.c"	ANSEL=0X00;
	BANKSEL	_ANSEL
	CLRF	_ANSEL
;	.line	19; "inital.c"	WPUA =0Xff;			//1110 1110上拉设置 1=DISABLED PULL-UP  ;0=PULL-UP
	MOVLW	0xff
	MOVWF	_WPUA
;	.line	20; "inital.c"	WPUB =0b11011111;			//1001 1110上拉设置 1=DISABLED PULL-UP  ;0=PULL-UP
	MOVLW	0xdf
	BANKSEL	_WPUB
	MOVWF	_WPUB
;	.line	22; "inital.c"	IOCB =0X28;            //0010 1000 PORTB电平变化中断,0 = 该端口禁止电平变化中断,1 = 该端口使能电平变化中断
	MOVLW	0x28
	MOVWF	_IOCB
;	.line	23; "inital.c"	ADCON0=61;			//内部Vdd，AN0
	MOVLW	0x3d
	MOVWF	_ADCON0
;	.line	24; "inital.c"	ADCON1=50;
	MOVLW	0x32
	BANKSEL	_ADCON1
	MOVWF	_ADCON1
	RETURN	
; exit point of _inital


;	code size estimation:
;	   37+   11 =    48 instructions (  118 byte)

	end
