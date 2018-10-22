;*******************************************************************
;* This stationery serves as the framework for a user application. *
;* For a more comprehensive program that demonstrates the more     *
;* advanced functionality of this processor, please see the        *
;* demonstration applications, located in the examples             *
;* subdirectory of the "Freescale CodeWarrior for HC08" program    *
;* directory.                                                      *
;*******************************************************************

; Include derivative-specific definitions
            INCLUDE 'derivative.inc'
            
;
; export symbols
;
            XDEF _Startup
            ABSENTRY _Startup

;
; variable/data section
;
            ORG    Z_RAMStart         ; Insert your data definition here

LOCAL:		DS.B	1
VISITA:		DS.B	1
MIN:		DS.B	1
SEG:		DS.B	1
BCD_LOC:	DS.B	1
BCD_VIS:	DS.B	1
BCD_MIN:	DS.B	1
BCD_SEG:	DS.B	1


 			ORG    RAMStart 
VAR:		DS.B	1
;
; code section
;
            ORG    ROMStart

_Startup: 	LDHX   #RAMEnd+1        ; initialize the stack pointer
            TXS
            LDA		SOPT1			; Mataperros
            AND		#$3F
            STA		SOPT1
            
            
			LDA			#47
			STA			LOCAL            
            LDA			#23
			STA			VISITA
			LDA			#30
			STA			MIN
			LDA			#58
			STA			SEG
			 
			 
			
			   
mainLoop:  	LDA		#$01
LAZO		PSHA
			JSR		X5
			PULA
			INCA
			BRA    	LAZO


CONBCD:		LDHX	#LOCAL
			LDA		0,X
			PSHH
			PSHX
			BSR		DEC2BCD
			PULX
			PULH
			STA		4,X
			INCX					;VISITA
			LDA		0,X
			PSHH
			PSHX
			BSR		DEC2BCD
			PULX
			PULH
			STA		4,X
			INCX					;MIN
			LDA		0,X
			PSHH
			PSHX
			BSR		DEC2BCD
			PULX
			PULH
			STA		4,X
			INCX					;SEG
			LDA		0,X
			PSHH
			PSHX
			BSR		DEC2BCD
			PULX
			PULH
			STA		4,X
			RTS


			
			
			






			LDA		LOCAL
			BSR		DEC2BCD
			STA		BCD_LOC
			LDA		VISITA
			BSR		DEC2BCD
			STA		BCD_VIS	
			BSR		ACTRELOJ
			LDA		SEG
			BSR		DEC2BCD
			STA		BCD_SEG
			LDA		MIN
			BSR		DEC2BCD
			STA		BCD_MIN
			
			
ACTRELOJ:	LDA		SEG
			INCA
			CMP		#60
			BNE		FINACT	
			
			LDA		MIN
			INCA
			STA		MIN
			
			CLRA	

FINACT		STA		SEG
			RTS
			
			
			
			
;*******************************************************************
;* DEC2BCD  transforma un numero de en decimal a BCD			   *
;*  in	acc   													   *
;*  out	acc   													   *
;*******************************************************************
DEC2BCD:	CLRH
			LDX		#$0A
			DIV
			LSLA
			LSLA
			LSLA
			LSLA
			PSHA
			PSHH
			PULA
			ADD		1,SP
			PULH
			RTS
			
			
 ;*******************************************************************
;* X5  =  ((X*5)-2)/2	   											   *
;*  in	STACK   												   *
;*  out	STACK  													   *
;*******************************************************************
X5:			LDA		3,SP
			LDX		#$05
			MUL		
			SUB		#2
			LSRA
			STA		3,SP
			RTS           
			
	        
			


;**************************************************************
;*                 Interrupt Vectors                          *
;**************************************************************

            ORG	$FFFE
			DC.W  _Startup			; Reset
