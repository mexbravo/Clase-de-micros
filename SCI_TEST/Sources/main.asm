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
ExampleVar: DS.B   1
RESULTADO:	DS.B	1
TIEMPO		dS.B	9


;
; code section
;
            ORG    ROMStart
MSG:		DC.B	"HOLA IBERO",$0A,$0D,0          
MSG1:		DC.B	"EL RESULTADO ES: ",0    
_Startup:
            LDHX   #RAMEnd+1        ; initialize the stack pointer
            TXS
            LDA		SOPT1
            AND		#$3F
            STA		SOPT1
			MOV		#23,RESULTADO           
            
            BSR		INIT
            
            LDHX	#TIEMPO
			BSR		SENDSTR
			LDHX	#MSG1
			BSR		SENDSTR
			
			LDA		RESULTADO
			CLRH
			LDX		#$0A
			DIV
			ADD		#$30
			BSR		SENDCHAR
			PSHH
			PULA
			ADD		#$30
			BSR		SENDCHAR
			
			
mainLoop:   BRA    mainLoop
			

SENDSTR:	LDA		0,X
			CBEQA	#$0,FIN_SENDSTR
			BSR		SENDCHAR
			AIX		#1
			BRA		SENDSTR
FIN_SENDSTR:RTS


SENDCHAR:	BRCLR	7,SCIS1,*
            STA		SCID
			RTS


INIT:		MOV		#$04,SCIBDL
			MOV		#$0C,SCIC2
			RTS
			
;**************************************************************
;*                 Interrupt Vectors                          *
;**************************************************************

            ORG	$FFFE

			DC.W  _Startup			; Reset
