;
; CSU11021 Introduction to Computing I 2019/2020
; Mode
;

	AREA	RESET, CODE, READONLY
	ENTRY

	LDR	R4, =tstN	; load address of tstN
	LDR	R1, [R4]	; load value of tstN

	LDR	R2, =tstvals	; load address of numbers
	LDR	R10, =0		; set count = 0
forlp	
	CMP	R10, R1		; while (count <= number of values)
	BHI	endmode		; {
	LDR	R5, [R2]	; first number loaded into R5
	ADD	R10, R10, #1	; count++
	LDR	R11, =0 	; initialise second counter for tally of next number in string
	LDR	R3, =tstvals	; reloading from memory to find second value
	LDR	R7, =0		; counter for comparison between character and next character
forlp1
	CMP	R11, R1		; while (count <= number of values)
	BHI	endloop
	LDR	R6, [R3]	; reload from memory into R6
	ADD	R11, R11, #1	; count++
mode
	CMP	R5, R6		; if (char = next char)
	BNE	nextvalue
	ADD	R7, R7, #1	; count++
nextvalue
	ADD	R3, R3, #4	; incrementing the value by 1 byte 
	B	forlp1		; get the next value in the string 
endloop
	CMP	R7, R8		; 1st iteration: will always be 0; subsequent iterations will involve overriding old count with new
	BLO	endst		; 
	MOV	R8, R7		; new count overrides old count
	MOV	R0, R5		; R0 is the mode
endst
	ADD	R2, R2, #4
	B	forlp
endmode	

STOP	B	STOP

tstN	DCD	10			; N (number of numbers)
tstvals	DCD	5, 3, 7, 5, 3, 5, 1, 9, 3, 3	; numbers

	END
