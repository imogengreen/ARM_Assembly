;
; CSU11021 Introduction to Computing I 2019/2020
; GCD
;

	AREA	RESET, CODE, READONLY
	ENTRY

	LDR	R2, =24		; assiging a to R2 
	LDR	R3, =76		; assiging b to R3
while	
	CMP	R2, R3		; while (a != b)
	BEQ	equal		; {
	CMP	R2, R3		;	if (a > b)
	BLS	lessths		;	{
	SUB	R2, R2, R3	;		a = a - b
	MOV	R0, R2		; 	} (stores result in R0)
	B	while		; 
lessths				;	else {
	SUB	R3, R3, R2	;		b = b - a
	MOV	R0, R3		;	}  (stores result in R0)
	B	while
equal	


STOP	B	STOP

	END