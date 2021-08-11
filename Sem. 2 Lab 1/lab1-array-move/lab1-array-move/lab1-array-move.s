;
; CS1022 Introduction to Computing II 2018/2019
; Lab 1 - Array Move
;

N	EQU	16		; number of elements

	AREA	globals, DATA, READWRITE

; N word-size values

ARRAY	SPACE	N*4		; N words
	

	AREA	RESET, CODE, READONLY
	ENTRY

	; for convenience, let's initialise test array [0, 1, 2, ... , N-1]

	LDR	R0, =ARRAY
	LDR	R1, =0
L1	CMP	R1, #N
	BHS	L2
	STR	R1, [R0, R1, LSL #2]
	ADD	R1, R1, #1
	B	L1
L2

	; initialise registers for your program

	LDR	R0, =ARRAY
	LDR	R1, =6
	LDR	R2, =3
	LDR	R3, =N
	ADD	R9, R2, #1
	; your program goes here


	CMP	R2, R3			; if (R2 > R3)
	BHS	notInArray		; { (*input invalid*)}
	LDR	R7, [R0, R1, LSL #2]	; 6 in R7
	LDR	R8, [R0, R2, LSL #2]	; 3 in R8
	SUB	R5, R2, #1		; 2 in R5
	SUB	R6, R1, #1		; 5 in R6
	MOV	R4, R1			; 6 in R4
copyingArray
	CMP	R4, R9
	BEQ	store
	CMP	R6, R5
	BEQ 	store
	LDR	R10, [R0, R6, LSL #2]
	STR	R10, [R0, R4, LSL #2]
	SUB	R6, R6, #1
	SUB	R4, R4, #1
	B	copyingArray
	
store
	STR	R7, [R0, R2, LSL #2]
	STR	R8, [R0, R4, LSL #2]	

notInArray

STOP	B	STOP

	END
