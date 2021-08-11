;
; CSU11021 Introduction to Computing I 2019/2020
; 64-bit Shift
;

	AREA	RESET, CODE, READONLY
	ENTRY

	LDR	R1, =0x00005000
	
	LDR	R2, =0
	LDR	R3, =0
for
	CMP	R2, #32
	BHS	endFor
	
	MOVS	R1, R1, LSR #1
	BCS	carrySet
	MOV	R3, #0
carrySet
	ADD	R3, R3, #1
	CMP	R3, R4
	BLS	doNotChange
	MOV	R4, R3
doNotChange
	ADD	R2, R2, #1
	B	for
endFor

STOP	B	STOP

	END
