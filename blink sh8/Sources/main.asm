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
           	lda		SOPT1
           	AND		#$3F
           	STA		SOPT1
           	
           	BSET 	0,PTCDD

mainLoop:	BSET	0,PTCD
			BCLR	0,PTCD
            BRA    mainLoop
			

;**************************************************************
;*                 Interrupt Vectors                          *
;**************************************************************

            ORG	$FFFE

			DC.W  _Startup			; Reset
