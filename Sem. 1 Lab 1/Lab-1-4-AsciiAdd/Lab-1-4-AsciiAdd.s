;
; CSU11021 Introduction to Computing I 2019/2020
; Adding the values represented by ASCII digit symbols
;

	AREA	RESET, CODE, READONLY
	ENTRY

	LDR	R1, ='2'	; Load R1 with ASCII code for symbol '2'
	LDR	R2, ='4'	; Load R2 with ASCII code for symbol '4'

	LDR	R3, ='0'	; Load R3 with ASCII code for symbol '0' 
	SUB	R1, R1, R3	; Converts ASCII code for symbol '2' to decimal equivalent by subtracting 0x30 from ASCII code
	SUB	R2, R2, R3	; Converts ASCII code for symbol '4' to decimal equivalent by subtracting 0x30 from ASCII code 
	ADD	R0, R1, R2	; Adds decimal equivalents and stores result in R0
	ADD	R0, R0, R3	; Converts result from decimal to ASCII by adding 0x30
	

	
STOP	B	STOP

	END
