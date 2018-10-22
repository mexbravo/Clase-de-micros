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
           
MECHA		EQU		PTCD_PTCD2       
           
            ORG    Z_RAMStart         ; Insert your data definition here
ExampleVar: DS.B   1

;
; code section
;
            ORG    ROMStart
            

_Startup:
            LDHX   #RAMEnd+1        ; initialize the stack pointer
            TXS
           	LDA		SOPT1
           	AND		#$3F
           	STA		SOPT1
           
           	LDA		#%00000100
           	STA		PTCDD
           	
           
mainLoop:
			
			BSET	MECHA,PTCD
			BCLR	MECHA,PTCD
		    BRA    mainLoop
			


;**************************************************************
;*                 Interrupt Vectors                          *
;**************************************************************

            ORG	$FFFE

			DC.W  _Startup			; Reset
