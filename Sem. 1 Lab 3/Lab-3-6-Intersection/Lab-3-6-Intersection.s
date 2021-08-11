;
; CSU11021 Introduction to Computing I 2019/2020
; Intersection
;

	AREA	RESET, CODE, READONLY
	ENTRY

	LDR	R0, =0x40000000	; address of sizeC
	LDR	R1, =0x40000004	; address of elemsC
	
	LDR	R6, =sizeA	; address of sizeA
	LDR	R2, [R6]	; load sizeA
	LDR	R3, =elemsA	; address of elemsA
	
	LDR	R6, =sizeB	; address of sizeB
	LDR	R4, [R6]	; load sizeB
	LDR	R5, =elemsB	; address of elemsB

	;
	; Your program to compute the interaction of A and B goes here
	;
	; Store the size of the intersection in memory at the address in R0
	;
	; Store the elements in the intersection in memory beginning at the
	;   address in R1
	;
	
	LDR	R10, =0		; counter1 initialised to 0
	LDR	R12, =0		; addressSizeC initialised to 0
forlp1	
	CMP	R10, R2		; for (counter1 <= size of A)
	BHS	endloop		; {
	ADD	R10, R10, #1	; counter1++
	LDR	R9, [R3]	; load char into R9 }
	LDR	R7, =0		; counter2 initialised to 0
	LDR	R5, =elemsB	; reload
forlp2	
	CMP	R7, R4		; for (counter2 <= size of B)
	BHI	endloop2
	ADD	R7, R7, #1	; counter2++
	LDR	R11, [R5]	; load char into R11

	CMP	R9, R11		; if (A = B) 
	BNE	endwhile	; {
	STR	R9, [R1]	; address elemsC into R8
	ADD	R1, R1, #4	; memory++
	ADD	R12, R12, #1	; sizeC++
	STR	R12, [R0]	; }
	B	endloop2
endwhile
	ADD	R5, R5, #4	; addressElemsB++
	B	forlp2
endloop2
	ADD	R3, R3, #4	; addressElemsA++
	B	forlp1
endloop

STOP	B	STOP

sizeA	DCD	4
elemsA	DCD	8, 7, 6, 3

sizeB	DCD	9
elemsB	DCD	20, 8, 14, 5, 7, 2, 9, 12, 17

	END
