;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (CYGWIN)
;--------------------------------------------------------
; PIC port for the 14-bit core
;--------------------------------------------------------
;	.file	"adc.c"
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
	global	_delay_us

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_adc_0	udata
r0x1001	res	1
r0x1000	res	1
r0x1002	res	1
r0x1003	res	1
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
code_adc	code
;***
;  pBlock Stats: dbName = C
;***
;has an exit
;5 compiler assigned registers:
;   r0x1000
;   STK00
;   r0x1001
;   r0x1002
;   r0x1003
;; Starting pCode block
S_adc__delay_us	code
_delay_us:
; 2 exit points
;	.line	14; "adc.c"	void delay_us(unsigned int t)
	BANKSEL	r0x1000
	MOVWF	r0x1000
	MOVF	STK00,W
	MOVWF	r0x1001
_00105_DS_:
;	.line	16; "adc.c"	while(--t);
	MOVLW	0xff
	BANKSEL	r0x1001
	ADDWF	r0x1001,W
	MOVWF	r0x1002
	MOVLW	0xff
	MOVWF	r0x1003
	MOVF	r0x1000,W
	BTFSC	STATUS,0
	INCFSZ	r0x1000,W
	ADDWF	r0x1003,F
	MOVF	r0x1002,W
	MOVWF	r0x1001
	MOVF	r0x1003,W
	MOVWF	r0x1000
	MOVF	r0x1002,W
	IORWF	r0x1003,W
	BTFSS	STATUS,2
	GOTO	_00105_DS_
	RETURN	
; exit point of _delay_us


;	code size estimation:
;	   21+    2 =    23 instructions (   50 byte)

	end
