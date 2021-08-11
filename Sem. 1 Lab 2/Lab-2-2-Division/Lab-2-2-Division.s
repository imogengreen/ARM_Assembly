;
; CSU11021 Introduction to Computing I 2019/2020
; Division (inefficient!)
;

	AREA	RESET, CODE, READONLY
	ENTRY

	MOV	R2, #6
	MOV	R3, #3
while
	CMP	R2, R3
	BLS 	lowers
	SUB	R2, R2, R3
	ADD	R0, R2, #1
	ADD	R0, R0, R2
	B	while
lowers
	MOV	R1, R2
	
STOP	B	STOP

	END
