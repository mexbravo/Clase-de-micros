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
            

_Startup:	LDHX   #RAMEnd+1        ; initialize the stack pointer
            TXS
            LDA		SOPT1
            AND		#$3F
            STA		SOPT1
            
            MOV		#$50,MTIMSC
            MOV		#$18,MTIMCLK
            MOV		#60,MTIMMOD
            
            MOV		#$01,PTCDD
            
            
		
			BCLR	4,MTIMSC		;SIN STOP


			CLI			; enable interrupts


mainLoop:	BRA    mainLoop
			



IRS_MTIM:	PSHH
			BSET	5,MTIMSC
			LDA		PTCD
			EOR		#$01
			STA		PTCD
			PULH
			RTI


;**************************************************************
;*                 Interrupt Vectors                          *
;**************************************************************
			ORG	$FFCA
			DC.W	IRS_MTIM
            ORG	$FFFE
			DC.W  _Startup			; Reset
