;
; CSU11021 Introduction to Computing I 2019/2020
; Convert a sequence of ASCII digits to the value they represent
;

	AREA	RESET, CODE, READONLY
	ENTRY

	LDR	R1, ='2'	; Load R1 with ASCII code for symbol '2'
	LDR	R2, ='0'	; Load R2 with ASCII code for symbol '0'
	LDR	R3, ='3'	; Load R3 with ASCII code for symbol '3'
	LDR	R4, ='4'	; Load R4 with ASCII code for symbol '4'
	LDR	R5, ='0'	; Load R5 with ASCII code for symbol '0', use for converting to decimal
	
	SUB	R1, R1, R5	; Converts ASCII '2' to decimal 2
	SUB	R2, R2, R5	; Converts ASCII '0' to decimal 0
	SUB	R3, R3, R5	; Converts ASCII '3' to decimal 3
	SUB	R4, R4, R5	; Converts ASCII '4' to decimal 4
	
	MOV	R5, #1000	; For multiplying value in R1 
	MOV	R6, #100	; For multiplying value in R2
	MOV	R7, #10		; For multiplying value in R3
	
	MUL	R1, R5, R1	; Gives us 2000
	MUL	R2, R6, R2	; Gives us 000
	MUL	R3, R7, R3	; Gives us 30
	
	ADD	R0, R1, R2	; Gives us 2000
	ADD	R0, R0, R3	; Gives us 2030
	ADD	R0, R0, R4	; Gives us 2034


STOP	B	STOP

	END
