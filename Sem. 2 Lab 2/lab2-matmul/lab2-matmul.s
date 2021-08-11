;
; CS1022 Introduction to Computing II 2018/2019
; Lab 2 - Matrix Multiplication
;

N	EQU	4		

	AREA	globals, DATA, READWRITE

; result array
ARR_R	SPACE	N*N*4		; N*N words (4 bytes each)


	AREA	RESET, CODE, READONLY
	ENTRY

	; initialize system stack pointer (SP)
	LDR	SP, =0x40010000

	;
	; write your matrix multiplication program here
	;
	
	LDR	R2, =ARR_R		; initialising start address of array R (our result array)
	LDR	R4, =ARR_A		; initialising start address of array A
	LDR	R5, =ARR_B		; initialising start address of array B
	LDR	R6, =N			; number of rows and columns (N*N matrix)
	LDR	R3, =0			; i=0 (rowCounter); 
	LDR	R11, =0			; j=0 (columnCounter);
	LDR	R10, =0			; k=0;
	
	

forLoop
	CMP	R5, R3		; if (i<N)
	BEQ	endLoop		;&&
	CMP	R6, R3		;(j<N)
	BEQ	rstCounter	;{
					; get element from small array
	MUL	R9, R5, R4		; index = row*rowSize
	ADD	R9, R9, R6		; index = index + col
	LDR	R10, [R2, R9, LSL #2]
loop2					
	CMP	R6, R3
	BEQ	rstCounter		; get element from large array
	MUL	R7, R5, R3		; index = row*rowSize
	ADD	R7, R7, R6		; index = index+col
	LDR	R8, [R1, R7, LSL #2]	; }
				
	CMP	R8, R10			; if value in small array = value in large array
	BEQ	equal			;{
	ADD	R6, R6, #1		; 	j++;
	LDR	R0, =0			; 	R0=0;
	B	loop2			; }
equal
	ADD	R6, R6, #1		; j++;
	LDR	R0, =1			; R0=1;
	B	forLoop	
	
rstCounter
	LDR	R6, =0			; j=0 --> reset the columns to zero
	ADD	R5, R5, #1		; i++ --> move down to the next row
	B	forLoop	
endLoop

	
STOP	B	STOP


;
; test data
;

ARR_A	DCD	 1,  2,  3,  4
	DCD	 5,  6,  7,  8
	DCD	 9, 10, 11, 12
	DCD	13, 14, 15, 16

ARR_B	DCD	 1,  2,  3,  4
	DCD	 5,  6,  7,  8
	DCD	 9, 10, 11, 12
	DCD	13, 14, 15, 16

	END
