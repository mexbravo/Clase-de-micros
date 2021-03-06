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
            ORG    RAMStart         ; Insert your data definition here
ExampleVar: DS.B   1

;
; code section
;
            ORG    ROMStart
            

_Startup:
            LDHX   #RAMEnd+1        ; initialize the stack pointer
            TXS
            LDA		#$03
            STA		SOPT1			;KILL DOG AND RESET
            
            MOV		#$01,PTCDD
            

mainLoop:	BSET 	0,PTCD
			BSR		DELAY
			BCLR 	0,PTCD
			BSR		DELAY
			BRA    mainLoop
			
DELAY:		LDHX	#$0004
DD			AIX		#-1
			CPHX	#0
			BNE		DD
			RTS
			
			
			
;**************************************************************
;*                 Interrupt Vectors                          *
;**************************************************************

            ORG	$FFFE
           	DC.W  _Startup			; Reset
