;
; CS1022 Introduction to Computing II 2018/2019
; Lab 2 - Upper Triangular
;

N	EQU	4		

	AREA	RESET, CODE, READONLY
	ENTRY

	; initialize system stack pointer (SP)
	LDR	SP, =0x40010000

	;
	; write your program here to determine whether ARR_A
	;   (below) is a matrix in Upper Triangular form.
	;
	; Store 1 in R0 if the matrix is in Upper Triangular form
	;   and zero otherwise.
	;
	
	LDR	R1, =1		; i counter --> start at 1 as it will begin in the second row; need not check the very first row
	LDR	R2, =0		; j counter --> have to check the very first column
	LDR	R3, =N		; dimensions of array (N rows, N columns --> square matrix)
	LDR	R4, =ARR_A	; initialise address of array
	
start
	CMP	R2, R3			; compare rows checked to the rows to check (N) --> if (i<N)
	BHS	endLoop1		; if greater than or equal to, end the loop
loop 	
	SUB	R6, R1, #1		; i-1
	CMP	R2, R6			; if (j>i-1)
	BHI	endLoop1		; branch out of the loop
	
	MUL	R7, R1, R3		; row*rowSize
	ADD	R7, R7, R2		; index of array (from 2D to 1D)
	LDR	R5, [R4, R7, LSL #2]	; loads the element from this position into R5
	
	CMP	R5, #0
	BNE	endLoop			; branch out if not zero
	ADD	R2, R2, #1		; j++
	ADD	R1, R1, #1		; i++
	LDR	R0, =1			; sets R0 to be 1 if Upper Triangle
	B	start	
endLoop
	LDR	R0, =0
endLoop1
	

STOP	B	STOP


;
; test data
;

ARR_A	DCD	 1,  2,  3,  4
	DCD	 0,  6,  7,  8
	DCD	 0,  0, 11, 12
	DCD	 0,  0,  0, 16

	END
