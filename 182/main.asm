;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (CYGWIN)
;--------------------------------------------------------
; PIC port for the 14-bit core
;--------------------------------------------------------
;	.file	"main.c"
	list	p=18p110l
	radix dec
	include "p18p110l.inc"
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	_inital
	extern	_sysinitial
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
	extern	___sdcc_saved_fsr
	extern	__sdcc_gsinit_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	global	_DelayUs2x
	global	_DelayMs
	global	_adc_get
	global	_KeyScan
	global	_RedFlash
	global	_AdjustGear
	global	_ChIntput
	global	_batt_test
	global	_SleepMode
	global	_initValue
	global	_main
	global	_Intr
	global	_adc_value
	global	_databuf
	global	_Time_Seep
	global	_Pwm1_Count
	global	_Pwm2_Count
	global	_Pwm1_Duty_Ratio
	global	_Pwm2_Duty_Ratio
	global	_Gear4_temp
	global	_Gear
	global	_time_2ms
	global	_Time_500MS
	global	_Red_Flash
	global	_key_press_time
	global	_Key_Mode
	global	_flag1
	global	_flag2

	global PSAVE
	global SSAVE
	global WSAVE
	global STK12
	global STK11
	global STK10
	global STK09
	global STK08
	global STK07
	global STK06
	global STK05
	global STK04
	global STK03
	global STK02
	global STK01
	global STK00

sharebank udata_ovr 0x0040
PSAVE	res 1
SSAVE	res 1
WSAVE	res 1
STK12	res 1
STK11	res 1
STK10	res 1
STK09	res 1
STK08	res 1
STK07	res 1
STK06	res 1
STK05	res 1
STK04	res 1
STK03	res 1
STK02	res 1
STK01	res 1
STK00	res 1

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
UD_main_0	udata
_adc_value	res	2

UD_main_1	udata
_databuf	res	2

UD_main_2	udata
_Pwm1_Count	res	1

UD_main_3	udata
_Pwm2_Count	res	1

UD_main_4	udata
_Gear4_temp	res	1

UD_main_5	udata
_Gear	res	1

UD_main_6	udata
_time_2ms	res	1

UD_main_7	udata
_Time_500MS	res	1

UD_main_8	udata
_key_press_time	res	1

UD_main_9	udata
_Key_Mode	res	1

UD_main_10	udata
_flag1	res	1

UD_main_11	udata
_flag2	res	1

;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_main_0	udata
r0x101B	res	1
r0x101C	res	1
r0x101E	res	1
r0x101D	res	1
r0x101F	res	1
r0x1020	res	1
r0x1021	res	1
r0x1023	res	1
r0x1024	res	1
r0x1025	res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

ID_main_0	idata
_Time_Seep
	db	0x00


ID_main_1	idata
_Pwm1_Duty_Ratio
	db	0x00
	db	0x00
	db	0x10
	db	0x1f
	db	0x10


ID_main_2	idata
_Pwm2_Duty_Ratio
	db	0x00
	db	0x00
	db	0x10
	db	0x1f
	db	0x25


ID_main_3	idata
_Red_Flash
	db	0x00

;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;	udata_ovr
;--------------------------------------------------------
; reset vector 
;--------------------------------------------------------
STARTUP	code 0x0000
	nop
	goto	__sdcc_gsinit_startup
;--------------------------------------------------------
; interrupt and initialization code
;--------------------------------------------------------
c_interrupt	code	0x0004
__sdcc_interrupt:
;***
;  pBlock Stats: dbName = I
;***
;3 compiler assigned registers:
;   r0x1023
;   r0x1024
;   r0x1025
;; Starting pCode block
_Intr:
; 0 exit points
;	.line	358; "main.c"	void Intr(void) __interrupt
	MOVWF	WSAVE
	SWAPF	STATUS,W
	CLRF	STATUS
	MOVWF	SSAVE
	MOVF	PCLATH,W
	CLRF	PCLATH
	MOVWF	PSAVE
	MOVF	FSR,W
	BANKSEL	___sdcc_saved_fsr
	MOVWF	___sdcc_saved_fsr
;	.line	360; "main.c"	if(RBIF)
	BANKSEL	_INTCONbits
	BTFSS	_INTCONbits,0
	GOTO	_00242_DS_
;	.line	362; "main.c"	RBIF=0;
	BCF	_INTCONbits,0
;	.line	363; "main.c"	RBIE=0;
	BCF	_INTCONbits,3
;	.line	364; "main.c"	PEIE=0;
	BCF	_INTCONbits,6
_00242_DS_:
;	.line	367; "main.c"	if(T0IF)	//30us进一次
	BANKSEL	_INTCONbits
	BTFSS	_INTCONbits,2
	GOTO	_00256_DS_
;	.line	370; "main.c"	T0IF=0;
	BCF	_INTCONbits,2
;	.line	371; "main.c"	T0=160;	//T0赋初值	
	MOVLW	0xa0
	MOVWF	_T0
;	.line	373; "main.c"	if(Gear==5)
	BANKSEL	_Gear
	MOVF	_Gear,W
;	.line	374; "main.c"	Gear=0;
	XORLW	0x05
;	.line	375; "main.c"	Pwm1_Count++;
	BTFSC	STATUS,2
	CLRF	_Gear
	BANKSEL	_Pwm1_Count
	INCF	_Pwm1_Count,F
;	.line	376; "main.c"	if(Pwm1_Count==PWM_FULL)
	MOVF	_Pwm1_Count,W
;	.line	377; "main.c"	Pwm1_Count=PWM_EMPTY;
	XORLW	0x64
;	.line	378; "main.c"	if(Pwm1_Count<Pwm1_Duty_Ratio[Gear])
	BTFSC	STATUS,2
	CLRF	_Pwm1_Count
	BANKSEL	_Gear
	MOVF	_Gear,W
	ADDLW	(_Pwm1_Duty_Ratio + 0)
	BANKSEL	r0x1023
	MOVWF	r0x1023
	MOVLW	high (_Pwm1_Duty_Ratio + 0)
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x1024
	MOVF	r0x1023,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1024
	BTFSC	r0x1024,0
	BSF	STATUS,7
	BANKSEL	INDF
	MOVF	INDF,W
	BANKSEL	r0x1025
	MOVWF	r0x1025
	BANKSEL	_Pwm1_Count
	SUBWF	_Pwm1_Count,W
	BTFSC	STATUS,0
	GOTO	_00248_DS_
;;genSkipc:3257: created from rifx:0x782c64
;	.line	379; "main.c"	PWM1=PWM_HIGH;
	BANKSEL	_PORTAbits
	BSF	_PORTAbits,0
	GOTO	_00249_DS_
_00248_DS_:
;	.line	381; "main.c"	PWM1=PWM_LOW;
	BANKSEL	_PORTAbits
	BCF	_PORTAbits,0
_00249_DS_:
;	.line	383; "main.c"	Pwm2_Count++;
	BANKSEL	_Pwm2_Count
	INCF	_Pwm2_Count,F
;	.line	384; "main.c"	if(Pwm2_Count==PWM_FULL)
	MOVF	_Pwm2_Count,W
;	.line	385; "main.c"	Pwm2_Count=PWM_EMPTY;
	XORLW	0x64
;	.line	386; "main.c"	if(Pwm2_Count<Pwm2_Duty_Ratio[Gear])
	BTFSC	STATUS,2
	CLRF	_Pwm2_Count
	BANKSEL	_Gear
	MOVF	_Gear,W
	ADDLW	(_Pwm2_Duty_Ratio + 0)
	BANKSEL	r0x1023
	MOVWF	r0x1023
	MOVLW	high (_Pwm2_Duty_Ratio + 0)
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x1024
	MOVF	r0x1023,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1024
	BTFSC	r0x1024,0
	BSF	STATUS,7
	BANKSEL	INDF
	MOVF	INDF,W
	BANKSEL	r0x1025
	MOVWF	r0x1025
	BANKSEL	_Pwm2_Count
	SUBWF	_Pwm2_Count,W
	BTFSC	STATUS,0
	GOTO	_00253_DS_
;;genSkipc:3257: created from rifx:0x782c64
;	.line	387; "main.c"	PWM2=PWM_HIGH;
	BANKSEL	_PORTBbits
	BSF	_PORTBbits,0
	GOTO	_00256_DS_
_00253_DS_:
;	.line	389; "main.c"	PWM2=PWM_LOW;
	BANKSEL	_PORTBbits
	BCF	_PORTBbits,0
_00256_DS_:
;	.line	393; "main.c"	if(T2IF)	//2ms进一次
	BANKSEL	_PIR1bits
	BTFSS	_PIR1bits,1
	GOTO	_00277_DS_
;	.line	395; "main.c"	T2IF=0;
	BCF	_PIR1bits,1
;	.line	396; "main.c"	time_2ms_flag=1;
	BANKSEL	_flag1
	BSF	_flag1,7
;	.line	397; "main.c"	time_2ms++;
	BANKSEL	_time_2ms
	INCF	_time_2ms,F
;;unsigned compare: left < lit(0xFA=250), size=1
;	.line	398; "main.c"	if(time_2ms>=250)//500ms
	MOVLW	0xfa
	SUBWF	_time_2ms,W
	BTFSS	STATUS,0
	GOTO	_00261_DS_
;;genSkipc:3257: created from rifx:0x782c64
;	.line	400; "main.c"	time_2ms=0;
	CLRF	_time_2ms
;	.line	401; "main.c"	Time_500MS++;
	BANKSEL	_Time_500MS
	INCF	_Time_500MS,F
;	.line	402; "main.c"	if(red_flash_count_flag)
	BANKSEL	_flag1
	BTFSS	_flag1,0
	GOTO	_00258_DS_
;	.line	403; "main.c"	Red_Flash++;
	BANKSEL	_Red_Flash
	INCF	_Red_Flash,F
	GOTO	_00261_DS_
_00258_DS_:
;	.line	405; "main.c"	Red_Flash=0;
	BANKSEL	_Red_Flash
	CLRF	_Red_Flash
_00261_DS_:
;	.line	408; "main.c"	Gear4_temp++;
	BANKSEL	_Gear4_temp
	INCF	_Gear4_temp,F
;	.line	409; "main.c"	if(Gear4_temp==196)
	MOVF	_Gear4_temp,W
;	.line	410; "main.c"	Gear4_temp=0;
	XORLW	0xc4
;	.line	411; "main.c"	if(Gear4_temp<170)
	BTFSC	STATUS,2
	CLRF	_Gear4_temp
	MOVLW	0xaa
	SUBWF	_Gear4_temp,W
	BTFSC	STATUS,0
	GOTO	_00273_DS_
;;genSkipc:3257: created from rifx:0x782c64
;;gen.c:6559: size=0, offset=0, AOP_TYPE(res)=8
;	.line	412; "main.c"	Pwm1_Duty_Ratio[4]=17;
	MOVLW	0x11
	BANKSEL	_Pwm1_Duty_Ratio
	MOVWF	(_Pwm1_Duty_Ratio + 4)
	GOTO	_00277_DS_
;;unsigned compare: left < lit(0xAC=172), size=1
_00273_DS_:
;	.line	413; "main.c"	else if(Gear4_temp<172)
	MOVLW	0xac
	BANKSEL	_Gear4_temp
	SUBWF	_Gear4_temp,W
	BTFSC	STATUS,0
	GOTO	_00270_DS_
;;genSkipc:3257: created from rifx:0x782c64
;;gen.c:6559: size=0, offset=0, AOP_TYPE(res)=8
;	.line	414; "main.c"	Pwm1_Duty_Ratio[4]=31;
	MOVLW	0x1f
	BANKSEL	_Pwm1_Duty_Ratio
	MOVWF	(_Pwm1_Duty_Ratio + 4)
	GOTO	_00277_DS_
;;unsigned compare: left < lit(0xC3=195), size=1
_00270_DS_:
;	.line	415; "main.c"	else if(Gear4_temp<195)
	MOVLW	0xc3
	BANKSEL	_Gear4_temp
	SUBWF	_Gear4_temp,W
	BTFSC	STATUS,0
	GOTO	_00267_DS_
;;genSkipc:3257: created from rifx:0x782c64
;;gen.c:6559: size=0, offset=0, AOP_TYPE(res)=8
;	.line	416; "main.c"	Pwm1_Duty_Ratio[4]=37;
	MOVLW	0x25
	BANKSEL	_Pwm1_Duty_Ratio
	MOVWF	(_Pwm1_Duty_Ratio + 4)
	GOTO	_00277_DS_
;;unsigned compare: left < lit(0xC4=196), size=1
_00267_DS_:
;	.line	417; "main.c"	else if(Gear4_temp<196)
	MOVLW	0xc4
	BANKSEL	_Gear4_temp
	SUBWF	_Gear4_temp,W
	BTFSC	STATUS,0
	GOTO	_00277_DS_
;;genSkipc:3257: created from rifx:0x782c64
;;gen.c:6559: size=0, offset=0, AOP_TYPE(res)=8
;	.line	418; "main.c"	Pwm1_Duty_Ratio[4]=21;
	MOVLW	0x15
	BANKSEL	_Pwm1_Duty_Ratio
	MOVWF	(_Pwm1_Duty_Ratio + 4)
_00277_DS_:
	BANKSEL	___sdcc_saved_fsr
	MOVF	___sdcc_saved_fsr,W
	BANKSEL	FSR
	MOVWF	FSR
	MOVF	PSAVE,W
	MOVWF	PCLATH
	CLRF	STATUS
	SWAPF	SSAVE,W
	MOVWF	STATUS
	SWAPF	WSAVE,F
	SWAPF	WSAVE,W
END_OF_INTERRUPT:
	RETFIE	

;--------------------------------------------------------
; code
;--------------------------------------------------------
code_main	code
;***
;  pBlock Stats: dbName = M
;***
;has an exit
;functions called:
;   _inital
;   _DelayMs
;   _sysinitial
;   _initValue
;   _KeyScan
;   _AdjustGear
;   _batt_test
;   _ChIntput
;   _SleepMode
;   _inital
;   _DelayMs
;   _sysinitial
;   _initValue
;   _KeyScan
;   _AdjustGear
;   _batt_test
;   _ChIntput
;   _SleepMode
;1 compiler assigned register :
;   STK00
;; Starting pCode block
S_main__main	code
_main:
; 2 exit points
;	.line	332; "main.c"	inital();				//端口初始化
	CALL	_inital
;	.line	333; "main.c"	DelayMs(100);			//延时等待系统供电稳定
	MOVLW	0x64
	MOVWF	STK00
	MOVLW	0x00
	CALL	_DelayMs
;	.line	334; "main.c"	sysinitial();			//系统初始化
	CALL	_sysinitial
;	.line	335; "main.c"	initValue();
	CALL	_initValue
;	.line	336; "main.c"	BattLow=0;
	BANKSEL	_flag1
	BCF	_flag1,6
;	.line	337; "main.c"	PWM2=PWM_HIGH;
	BANKSEL	_PORTBbits
	BSF	_PORTBbits,0
;	.line	338; "main.c"	PWM1=PWM_LOW;
	BCF	_PORTAbits,0
;	.line	339; "main.c"	GIE=1;
	BSF	_INTCONbits,7
_00236_DS_:
;	.line	342; "main.c"	if(time_2ms_flag)
	BANKSEL	_flag1
	BTFSS	_flag1,7
	GOTO	_00236_DS_
;	.line	344; "main.c"	time_2ms_flag=0;
	BCF	_flag1,7
	clrwdt
;	.line	347; "main.c"	KeyScan();
	CALL	_KeyScan
;	.line	348; "main.c"	AdjustGear();		
	CALL	_AdjustGear
;	.line	349; "main.c"	batt_test();
	CALL	_batt_test
;	.line	350; "main.c"	ChIntput();
	CALL	_ChIntput
;	.line	351; "main.c"	SleepMode();
	CALL	_SleepMode
	GOTO	_00236_DS_
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
S_main__initValue	code
_initValue:
; 2 exit points
;;gen.c:6559: size=0, offset=0, AOP_TYPE(res)=8
;	.line	311; "main.c"	flag1.byte_value=0b00000000;
	BANKSEL	_flag1
	CLRF	(_flag1 + 0)
;;gen.c:6559: size=0, offset=0, AOP_TYPE(res)=8
;	.line	312; "main.c"	flag2.byte_value=0b00000000;
	BANKSEL	_flag2
	CLRF	(_flag2 + 0)
;	.line	314; "main.c"	Time_Seep=0;
	BANKSEL	_Time_Seep
	CLRF	_Time_Seep
;	.line	316; "main.c"	Key_Mode=0;
	BANKSEL	_Key_Mode
	CLRF	_Key_Mode
;	.line	317; "main.c"	key_press_time=0;
	BANKSEL	_key_press_time
	CLRF	_key_press_time
;	.line	319; "main.c"	Pwm1_Count=0;
	BANKSEL	_Pwm1_Count
	CLRF	_Pwm1_Count
;	.line	320; "main.c"	Pwm2_Count=50;
	MOVLW	0x32
	BANKSEL	_Pwm2_Count
	MOVWF	_Pwm2_Count
;	.line	321; "main.c"	Gear4_temp=0;
	BANKSEL	_Gear4_temp
	CLRF	_Gear4_temp
;	.line	322; "main.c"	Gear=0;
	BANKSEL	_Gear
	CLRF	_Gear
	RETURN	
; exit point of _initValue

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
S_main__SleepMode	code
_SleepMode:
; 2 exit points
;	.line	268; "main.c"	Time_Seep++;
	BANKSEL	_Time_Seep
	INCF	_Time_Seep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x33=51), size=1
;	.line	269; "main.c"	if(Time_Seep>50)
	MOVLW	0x33
	SUBWF	_Time_Seep,W
	BTFSS	STATUS,0
	GOTO	_00224_DS_
;;genSkipc:3257: created from rifx:0x782c64
;	.line	271; "main.c"	Time_Seep=0;
	CLRF	_Time_Seep
;	.line	272; "main.c"	BLUE=1;
	BANKSEL	_PORTBbits
	BSF	_PORTBbits,6
;	.line	273; "main.c"	RED=1;
	BSF	_PORTAbits,4
;	.line	274; "main.c"	PWM1=0;
	BCF	_PORTAbits,0
;	.line	275; "main.c"	PWM2=0;
	BCF	_PORTBbits,0
;	.line	277; "main.c"	ADIE=0;
	BANKSEL	_PIE1bits
	BCF	_PIE1bits,6
;	.line	278; "main.c"	ADEN=0;
	BANKSEL	_ADCON0bits
	BCF	_ADCON0bits,0
;	.line	279; "main.c"	ADON=0;	
	BCF	_ADCON0bits,1
;	.line	281; "main.c"	PIE1=0X00;			//关AD中断0100 0000
	BANKSEL	_PIE1
	CLRF	_PIE1
;	.line	282; "main.c"	WDTENS=0;
	BCF	_PCONbits,4
;	.line	283; "main.c"	GIE=0;
	BANKSEL	_INTCONbits
	BCF	_INTCONbits,7
;	.line	284; "main.c"	T0IE=0;
	BCF	_INTCONbits,5
;	.line	285; "main.c"	RBIE=1;
	BSF	_INTCONbits,3
;	.line	286; "main.c"	PEIE=0;
	BCF	_INTCONbits,6
;	.line	287; "main.c"	IOCB3=1;
	BSF	_IOCBbits,3
;	.line	288; "main.c"	IOCB5=1;
	BSF	_IOCBbits,5
;	.line	289; "main.c"	INTE=0;
	BCF	_INTCONbits,4
	nop
	SLEEP
	nop
;	.line	293; "main.c"	GIE=1;
	BANKSEL	_INTCONbits
	BSF	_INTCONbits,7
;	.line	294; "main.c"	IOCB3=0;
	BCF	_IOCBbits,3
;	.line	295; "main.c"	IOCB5=0;
	BCF	_IOCBbits,5
;	.line	296; "main.c"	T0IE=1;
	BSF	_INTCONbits,5
;	.line	297; "main.c"	RBIE=0;
	BCF	_INTCONbits,3
;	.line	298; "main.c"	WDTENS=1;
	BANKSEL	_PCONbits
	BSF	_PCONbits,4
;	.line	299; "main.c"	PIE1=0X40;			//使能AD中断0100 0000
	MOVLW	0x40
	MOVWF	_PIE1
_00224_DS_:
	RETURN	
; exit point of _SleepMode

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _adc_get
;   _adc_get
;; Starting pCode block
S_main__batt_test	code
_batt_test:
; 2 exit points
;	.line	248; "main.c"	if(!dc_in && Gear !=0)//  && KeyDisp && !Out_Test)
	BANKSEL	_PORTBbits
	BTFSC	_PORTBbits,3
	GOTO	_00203_DS_
	MOVLW	0x00
	BANKSEL	_Gear
	IORWF	_Gear,W
	BTFSC	STATUS,2
	GOTO	_00203_DS_
;	.line	250; "main.c"	Time_Seep=0;
	BANKSEL	_Time_Seep
	CLRF	_Time_Seep
;	.line	251; "main.c"	adc_get();
	CALL	_adc_get
;	.line	252; "main.c"	if(!BattLow)
	BANKSEL	_flag1
	BTFSC	_flag1,6
	GOTO	_00203_DS_
;;unsigned compare: left < lit(0x600=1536), size=2
;	.line	254; "main.c"	if(adc_value<0x600)//3V//1536
	MOVLW	0x06
	BANKSEL	_adc_value
	SUBWF	(_adc_value + 1),W
	BTFSS	STATUS,2
	GOTO	_00217_DS_
	MOVLW	0x00
	SUBWF	_adc_value,W
_00217_DS_:
	BTFSC	STATUS,0
	GOTO	_00203_DS_
;;genSkipc:3257: created from rifx:0x782c64
;	.line	256; "main.c"	BattLow=1;
	BANKSEL	_flag1
	BSF	_flag1,6
_00203_DS_:
	RETURN	
; exit point of _batt_test

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _adc_get
;   _RedFlash
;   _adc_get
;   _RedFlash
;; Starting pCode block
S_main__ChIntput	code
_ChIntput:
; 2 exit points
;	.line	213; "main.c"	if(dc_in)
	BANKSEL	_PORTBbits
	BTFSS	_PORTBbits,3
	GOTO	_00175_DS_
;	.line	215; "main.c"	Time_Seep=0;
	BANKSEL	_Time_Seep
	CLRF	_Time_Seep
;	.line	216; "main.c"	if(!charg_flag)
	BANKSEL	_flag1
	BTFSC	_flag1,0
	GOTO	_00168_DS_
;	.line	218; "main.c"	charg_flag=1;
	BSF	_flag1,0
;	.line	219; "main.c"	Gear=0;
	BANKSEL	_Gear
	CLRF	_Gear
;	.line	220; "main.c"	BLUE=1;
	BANKSEL	_PORTBbits
	BSF	_PORTBbits,6
;	.line	221; "main.c"	BattHigh=0;
	BANKSEL	_flag1
	BCF	_flag1,7
;	.line	222; "main.c"	BattLow=0;
	BCF	_flag1,6
_00168_DS_:
;	.line	224; "main.c"	adc_get();
	CALL	_adc_get
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x85D=2141), size=2
;	.line	225; "main.c"	if(adc_value>0x85c)//4.18V//2140
	MOVLW	0x08
	BANKSEL	_adc_value
	SUBWF	(_adc_value + 1),W
	BTFSS	STATUS,2
	GOTO	_00191_DS_
	MOVLW	0x5d
	SUBWF	_adc_value,W
_00191_DS_:
	BTFSS	STATUS,0
	GOTO	_00170_DS_
;;genSkipc:3257: created from rifx:0x782c64
;	.line	227; "main.c"	BattHigh=1;
	BANKSEL	_flag1
	BSF	_flag1,7
_00170_DS_:
;	.line	229; "main.c"	if(BattHigh)
	BANKSEL	_flag1
	BTFSS	_flag1,7
	GOTO	_00172_DS_
;	.line	231; "main.c"	RedFlash();
	CALL	_RedFlash
;	.line	232; "main.c"	red_flash_count_flag=1;
	BANKSEL	_flag1
	BSF	_flag1,0
	GOTO	_00177_DS_
_00172_DS_:
;	.line	236; "main.c"	RED=0;
	BANKSEL	_PORTAbits
	BCF	_PORTAbits,4
;	.line	237; "main.c"	red_flash_count_flag=0;
	BANKSEL	_flag1
	BCF	_flag1,0
	GOTO	_00177_DS_
_00175_DS_:
;	.line	242; "main.c"	charg_flag=0;
	BANKSEL	_flag1
	BCF	_flag1,0
_00177_DS_:
	RETURN	
; exit point of _ChIntput

;***
;  pBlock Stats: dbName = C
;***
;functions called:
;   _RedFlash
;   _RedFlash
;; Starting pCode block
S_main__AdjustGear	code
_AdjustGear:
; 0 exit points
;	.line	167; "main.c"	if(Gear!=0)
	MOVLW	0x00
	BANKSEL	_Gear
	IORWF	_Gear,W
	BTFSC	STATUS,2
	GOTO	_00151_DS_
;	.line	169; "main.c"	Time_Seep=0;
	BANKSEL	_Time_Seep
	CLRF	_Time_Seep
;	.line	170; "main.c"	if(BattLow)//放电时没电关机
	BANKSEL	_flag1
	BTFSS	_flag1,6
	GOTO	_00147_DS_
;	.line	172; "main.c"	BLUE=1;
	BANKSEL	_PORTBbits
	BSF	_PORTBbits,6
;	.line	174; "main.c"	red_flash_count_flag=1;
	BANKSEL	_flag1
	BSF	_flag1,0
;	.line	175; "main.c"	RedFlash();
	CALL	_RedFlash
;;unsigned compare: left < lit(0x78=120), size=1
_00147_DS_:
;	.line	177; "main.c"	if(Time_500MS>=POWEROFF_TIME)//时间到关机
	MOVLW	0x78
	BANKSEL	_Time_500MS
	SUBWF	_Time_500MS,W
	BTFSS	STATUS,0
	GOTO	_00151_DS_
;;genSkipc:3257: created from rifx:0x782c64
;	.line	179; "main.c"	BLUE=1;
	BANKSEL	_PORTBbits
	BSF	_PORTBbits,6
;	.line	180; "main.c"	Gear=0;
	BANKSEL	_Gear
	CLRF	_Gear
_00151_DS_:
;	.line	183; "main.c"	if(Key_Mode)
	MOVLW	0x00
	BANKSEL	_Key_Mode
	IORWF	_Key_Mode,W
	BTFSC	STATUS,2
	GOTO	_00002_DS_
;	.line	185; "main.c"	Key_Mode=0;
	CLRF	_Key_Mode
;	.line	186; "main.c"	Gear++;
	BANKSEL	_Gear
	INCF	_Gear,F
;	.line	187; "main.c"	if(Gear==5)
	MOVF	_Gear,W
;	.line	188; "main.c"	Gear=0;
	XORLW	0x05
;	.line	190; "main.c"	time_2ms=0;
	BTFSC	STATUS,2
	CLRF	_Gear
	BANKSEL	_time_2ms
	CLRF	_time_2ms
;	.line	191; "main.c"	Time_500MS=0;
	BANKSEL	_Time_500MS
	CLRF	_Time_500MS
;	.line	194; "main.c"	if(Gear==1)
	BANKSEL	_Gear
	MOVF	_Gear,W
	XORLW	0x01
	BTFSS	STATUS,2
;	.line	197; "main.c"	if(BattLow==0)
	GOTO	_00001_DS_
;	.line	198; "main.c"	BLUE=0;
	BANKSEL	_flag1
	BTFSC	_flag1,6
	GOTO	_00001_DS_
;	.line	201; "main.c"	if(Gear==0)
	BANKSEL	_PORTBbits
	BCF	_PORTBbits,6
_00001_DS_:
	MOVLW	0x00
;	.line	204; "main.c"	BLUE=1;
	BANKSEL	_Gear
	IORWF	_Gear,W
	BTFSS	STATUS,2
	GOTO	_00002_DS_
	BANKSEL	_PORTBbits
	BSF	_PORTBbits,6
_00002_DS_:
	RETURN	

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x101B
;; Starting pCode block
S_main__RedFlash	code
_RedFlash:
; 2 exit points
;	.line	156; "main.c"	RED=Red_Flash%2;
	MOVLW	0x01
	BANKSEL	_Red_Flash
	ANDWF	_Red_Flash,W
	BANKSEL	r0x101B
	MOVWF	r0x101B
	RRF	r0x101B,W
	BTFSC	STATUS,0
	GOTO	_00003_DS_
	BANKSEL	_PORTAbits
	BCF	_PORTAbits,4
_00003_DS_:
	BTFSS	STATUS,0
	GOTO	_00004_DS_
	BANKSEL	_PORTAbits
	BSF	_PORTAbits,4
;;unsigned compare: left < lit(0x9=9), size=1
_00004_DS_:
;	.line	157; "main.c"	if(Red_Flash>=9)
	MOVLW	0x09
	BANKSEL	_Red_Flash
	SUBWF	_Red_Flash,W
	BTFSS	STATUS,0
	GOTO	_00141_DS_
;;genSkipc:3257: created from rifx:0x782c64
;	.line	159; "main.c"	red_flash_count_flag=0;
	BANKSEL	_flag1
	BCF	_flag1,0
;	.line	160; "main.c"	Red_Flash=0;
	BANKSEL	_Red_Flash
	CLRF	_Red_Flash
;	.line	161; "main.c"	Gear=0;
	BANKSEL	_Gear
	CLRF	_Gear
_00141_DS_:
	RETURN	
; exit point of _RedFlash

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
S_main__KeyScan	code
_KeyScan:
; 2 exit points
;	.line	139; "main.c"	key_press_time++;
	BANKSEL	_key_press_time
	INCF	_key_press_time,F
;	.line	140; "main.c"	if(key)
	BANKSEL	_PORTBbits
	BTFSS	_PORTBbits,5
	GOTO	_00130_DS_
;;unsigned compare: left < lit(0x32=50), size=1
;	.line	142; "main.c"	if(key_press_time>=KEY_SHORT_TIME)
	MOVLW	0x32
	BANKSEL	_key_press_time
	SUBWF	_key_press_time,W
	BTFSS	STATUS,0
	GOTO	_00128_DS_
;;genSkipc:3257: created from rifx:0x782c64
;	.line	143; "main.c"	Key_Mode=1;
	MOVLW	0x01
	BANKSEL	_Key_Mode
	MOVWF	_Key_Mode
_00128_DS_:
;	.line	144; "main.c"	key_press_time=0;
	BANKSEL	_key_press_time
	CLRF	_key_press_time
	GOTO	_00131_DS_
_00130_DS_:
;	.line	148; "main.c"	Time_Seep=0;
	BANKSEL	_Time_Seep
	CLRF	_Time_Seep
;;unsigned compare: left < lit(0xC8=200), size=1
_00131_DS_:
;	.line	151; "main.c"	if(key_press_time>=200)
	MOVLW	0xc8
	BANKSEL	_key_press_time
	SUBWF	_key_press_time,W
	BTFSS	STATUS,0
	GOTO	_00134_DS_
;;genSkipc:3257: created from rifx:0x782c64
;	.line	152; "main.c"	key_press_time=200;
	MOVLW	0xc8
	MOVWF	_key_press_time
_00134_DS_:
	RETURN	
; exit point of _KeyScan

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _DelayUs2x
;   _DelayUs2x
;   _DelayUs2x
;   _DelayUs2x
;6 compiler assigned registers:
;   r0x101D
;   r0x101E
;   r0x101F
;   r0x1020
;   r0x1021
;   r0x1022
;; Starting pCode block
S_main__adc_get	code
_adc_get:
; 2 exit points
;	.line	105; "main.c"	databuf=0;
	BANKSEL	_databuf
	CLRF	_databuf
	CLRF	(_databuf + 1)
;	.line	106; "main.c"	adc_value=0;
	BANKSEL	_adc_value
	CLRF	_adc_value
	CLRF	(_adc_value + 1)
;	.line	113; "main.c"	ADCON1=0b01010000;	//ADC数据存放格式选,ADC所采集数据，当选择存格式为左对齐时，ADC精度只能为12位
	MOVLW	0x50
	BANKSEL	_ADCON1
	MOVWF	_ADCON1
;	.line	114; "main.c"	ADCKCS=	0x00;
	CLRF	_ADCKCS
;	.line	115; "main.c"	ADCON0=0b00010101;	//参考电压选择内部2V，通道选择3，启动ADEN
	MOVLW	0x15
	BANKSEL	_ADCON0
	MOVWF	_ADCON0
;	.line	117; "main.c"	for(b=0;b<16;b++)
	BANKSEL	r0x101D
	CLRF	r0x101D
_00122_DS_:
;	.line	119; "main.c"	DelayUs2x(35);		//等待ADC稳定
	MOVLW	0x23
	CALL	_DelayUs2x
;	.line	120; "main.c"	ADON=1;	//启动ADON			
	BANKSEL	_ADCON0bits
	BSF	_ADCON0bits,1
;	.line	122; "main.c"	DelayUs2x(35);		//等待ADC稳定
	MOVLW	0x23
	CALL	_DelayUs2x
_00118_DS_:
;	.line	124; "main.c"	while(ADON!=0);
	BANKSEL	_ADCON0bits
	BTFSC	_ADCON0bits,1
	GOTO	_00118_DS_
;	.line	127; "main.c"	databuf=ADRESH;
	MOVF	_ADRESH,W
	BANKSEL	_databuf
	MOVWF	_databuf
	CLRF	(_databuf + 1)
;	.line	128; "main.c"	databuf=(databuf<<4)|(ADRESL>>4);
	SWAPF	(_databuf + 1),W
	ANDLW	0xf0
	BANKSEL	r0x101E
	MOVWF	r0x101E
	BANKSEL	_databuf
	SWAPF	_databuf,W
	BANKSEL	r0x101F
	MOVWF	r0x101F
	ANDLW	0x0f
	IORWF	r0x101E,F
	XORWF	r0x101F,F
	BANKSEL	_ADRESL
	SWAPF	_ADRESL,W
	ANDLW	0x0f
;;1	MOVWF	r0x1020
	BANKSEL	r0x1021
	MOVWF	r0x1021
	IORWF	r0x101F,W
	BANKSEL	_databuf
	MOVWF	_databuf
	BANKSEL	r0x101E
	MOVF	r0x101E,W
	BANKSEL	_databuf
	MOVWF	(_databuf + 1)
;	.line	129; "main.c"	adc_value=databuf+adc_value;
	BANKSEL	_adc_value
	MOVF	_adc_value,W
	BANKSEL	_databuf
	ADDWF	_databuf,W
	BANKSEL	_adc_value
	MOVWF	_adc_value
	BANKSEL	_databuf
	MOVF	(_databuf + 1),W
	BTFSC	STATUS,0
	INCF	(_databuf + 1),W
	BTFSC	STATUS,2
	GOTO	_00005_DS_
	BANKSEL	_adc_value
	ADDWF	(_adc_value + 1),F
_00005_DS_:
;	.line	130; "main.c"	databuf=0;
	BANKSEL	_databuf
	CLRF	_databuf
	CLRF	(_databuf + 1)
;	.line	117; "main.c"	for(b=0;b<16;b++)
	BANKSEL	r0x101D
	INCF	r0x101D,F
;;unsigned compare: left < lit(0x10=16), size=1
	MOVLW	0x10
	SUBWF	r0x101D,W
	BTFSS	STATUS,0
	GOTO	_00122_DS_
;;genSkipc:3257: created from rifx:0x782c64
;	.line	132; "main.c"	adc_value=adc_value>>4;					//平均值
	BANKSEL	_adc_value
	SWAPF	_adc_value,W
	ANDLW	0x0f
	MOVWF	_adc_value
	SWAPF	(_adc_value + 1),W
	MOVWF	(_adc_value + 1)
	ANDLW	0xf0
	IORWF	_adc_value,F
	XORWF	(_adc_value + 1),F
;	.line	133; "main.c"	ADCON0=0x00;
	BANKSEL	_ADCON0
	CLRF	_ADCON0
	RETURN	
; exit point of _adc_get

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _DelayUs2x
;   _DelayUs2x
;   _DelayUs2x
;   _DelayUs2x
;5 compiler assigned registers:
;   r0x101D
;   STK00
;   r0x101E
;   r0x101F
;   r0x1020
;; Starting pCode block
S_main__DelayMs	code
_DelayMs:
; 2 exit points
;	.line	82; "main.c"	void DelayMs(unsigned int t)
	BANKSEL	r0x101D
	MOVWF	r0x101D
	MOVF	STK00,W
	MOVWF	r0x101E
_00110_DS_:
;	.line	85; "main.c"	while(t--)
	BANKSEL	r0x101E
	MOVF	r0x101E,W
	MOVWF	r0x101F
	MOVF	r0x101D,W
	MOVWF	r0x1020
	MOVLW	0xff
	ADDWF	r0x101E,F
	BTFSS	STATUS,0
	DECF	r0x101D,F
	MOVF	r0x101F,W
	IORWF	r0x1020,W
	BTFSC	STATUS,2
	GOTO	_00113_DS_
;	.line	88; "main.c"	DelayUs2x(120);
	MOVLW	0x78
	CALL	_DelayUs2x
;	.line	89; "main.c"	DelayUs2x(125);
	MOVLW	0x7d
	CALL	_DelayUs2x
	GOTO	_00110_DS_
_00113_DS_:
	RETURN	
; exit point of _DelayMs

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;2 compiler assigned registers:
;   r0x101B
;   r0x101C
;; Starting pCode block
S_main__DelayUs2x	code
_DelayUs2x:
; 2 exit points
;	.line	73; "main.c"	void DelayUs2x(unsigned char t)
	BANKSEL	r0x101B
	MOVWF	r0x101B
_00105_DS_:
;	.line	75; "main.c"	while(--t);
	BANKSEL	r0x101B
	DECF	r0x101B,W
	MOVWF	r0x101C
	MOVWF	r0x101B
	MOVF	r0x101C,W
	BTFSS	STATUS,2
	GOTO	_00105_DS_
	RETURN	
; exit point of _DelayUs2x


;	code size estimation:
;	  412+  141 =   553 instructions ( 1388 byte)

	end
