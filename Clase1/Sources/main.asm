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


            
			ORG		$0080
MYFIRST		DS.B		1			;VARIABLE 1	
LAOTRA		DS.B		2
LAULTIUMA	DS.B		1	


			ORG		$F000
_Startup	CLRA
			STA		MYFIRST			
LOOP		LDA		MYFIRST
			INCA
			INCA
			INCA
			INCA
			
			ADD 	#$04
			
			
			
			STA		MYFIRST
			BRA		LOOP
			
			ORG		#FFFE
			DC.W  _Startup			; Reset			

			
