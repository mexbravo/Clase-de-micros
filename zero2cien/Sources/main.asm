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
ExampleVar: DS.B   	1
DIS1:		DS.B	1
DIS2:		DS.B	1
CUENTA:		DS.B	1

;
; code section
;
            ORG    ROMStart
            

_Startup:   LDHX   	#$180        ; initialize the stack pointer
            TXS
            LDA		SOPT1
            AND		#$3F
            STA		SOPT1
            
            
INIT:		MOV	    #$FF,PTBDD
 			MOV		#$50,MTIMSC
 			MOV		#$18,MTIMCLK
			MOV		#30,MTIMMOD    
 					
			BSR		ES_0
			BCLR	4,MTIMSC
			CLI
			
			
mainLoop: 	MOV		DIS1,PTBD
			NOP
			MOV		DIS2,PTBD
			NOP
			BRA		mainLoop
			
ES_0:		CLR		CUENTA
			MOV		#$10,DIS1
			MOV		#$20,DIS2
			RTS		
			
IRS_MTIM:	PSHH
			BSET	5,MTIMSC
			INC		CUENTA
			LDA		CUENTA
			CBEQA	#100,ES_ZERO
			CLRH
			LDX		#$0A
			DIV
			ADD		#$20
			STA		DIS2
			PSHH
			PULA
			ADD		#$10
			STA		DIS1
			PULH
			RTI

ES_ZERO:	BSR		ES_0
			RTI
			
			
			
			
			
			
			ORG	$FFCA
			DC.W	IRS_MTIM
           
			
			ORG	$FFFE
			DC.W  _Startup			; Reset
