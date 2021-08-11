;
; CS1022 Introduction to Computing II 2019/2020
; Lab 1B - Bubble Sort
;

N	EQU	10

	AREA	globals, DATA, READWRITE

; N word-size values

SORTED	SPACE	N*4		; N words (4 bytes each)


	AREA	RESET, CODE, READONLY
	ENTRY


	;
	; copy the test data into RAM
	;

	LDR	R4, =SORTED
	LDR	R5, =UNSORT
	LDR	R6, =0
whInit	CMP	R6, #N
	BHS	eWhInit
	LDR	R7, [R5, R6, LSL #2]
	STR	R7, [R4, R6, LSL #2]
	ADD	R6, R6, #1
	B	whInit
eWhInit

	LDR	R4, =SORTED
	LDR	R5, =UNSORT
	
	LDR	R6, =1		; initialise counter to be 1
	LDR	R7, =N		; initialise the number of numbers


	CMP	R6, R7
	BHI	endForLoop
	
	
	LDR	R8, [R5, R6, LSL #2]	; retrieves the element at the ith index
	
	SUB	R9, R6, #1		; for finding the value at the i-1 index
	LDR	R10, [R5, R9, LSL #1]	; retrieves the element at the i-1 index
	
	CMP	R10, R8
	BLS	doNotSort
	LDR	R11, R10		; tmpswap register is R11
	LDR	R10, R8
	STR	R8, [R11]		; array[i] = tmpswap
	ADD	R6, R6, #1		; count++
	B	start

endForLoop

stop	B stop

UNSORT	DCD	9,3,0,1,6,2,4,7,8,5

	END
