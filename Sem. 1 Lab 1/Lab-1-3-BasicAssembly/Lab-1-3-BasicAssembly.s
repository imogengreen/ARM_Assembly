;
; CSU11021 Introduction to Computing I 2019/2020
; Basic ARM Assembly Language
;

	AREA	RESET, CODE, READONLY
	ENTRY

; Write your solution for all parts (i) to (iv) below.

; Tip: Right-click on any instruction and select 'Run to cursor' to
; "fast forward" the processor to that instruction.

; (i) 3x+y

	LDR	R1, =2	; x = 2
	LDR	R2, =3	; y = 3

	
	MOV	R3, #3		
	MUL	R0, R1, R3	; 3x
	ADD	R0, R0, R2	; 3x + y

; (ii) 3x^2+5x

	LDR	R1, =2	; x = 2


	MUL	R0, R1, R1	; x^2
	MOV	R3, #3		
	MUL	R0, R3, R0	; 3x^2
	MOV	R3, #5		
	MUL	R3, R1, R3	; 5x
	ADD	R0, R0, R3	; 3x^2 + 5x

; (iii) 2x^2+6xy+3y^2

	LDR	R1, =2	; x = 2
	LDR	R2, =3	; y = 3


	MUL	R0, R1, R1	; x^2
	MOV	R3, #2
	MUL	R0, R3, R0	; 2x^2
	MUL	R3, R1, R2	; xy
	MOV	R4, #6
	MUL	R3, R4, R3	; 6xy
	ADD	R0, R0, R3	; 2x^2 + 6xy
	MUL	R4, R2, R2	; y^2
	MOV	R5, #3
	MUL	R5, R4, R5	; 3y^2
	ADD	R0, R0, R5	; 2x^2 + 6xy + 3y^2

; (iv) x^3-4x^2+3x+8

	LDR	R1, =2	; x = 2
	LDR	R2, =3	; y = 3


	MUL	R3, R1, R1	; x^2
	MUL	R0, R1, R3	; x^3
	MOV	R4, #4		
	MUL	R3, R4, R3	; 4x^2
	SUB	R0, R0, R3	; x^3 - 4x^2
	MOV	R3, #3		
	MUL	R3, R1, R3	; 3x
	ADD	R0, R0, R3	; x^3 - 4x^2 + 3x
	MOV	R3, #8		
	ADD	R0, R0, R3	; x^3 - 4x^2 + 3x + 8

STOP	B	STOP

	END
