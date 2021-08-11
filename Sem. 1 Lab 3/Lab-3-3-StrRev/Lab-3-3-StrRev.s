;
; CSU11021 Introduction to Computing I 2019/2020
; String Reverse
;

	AREA	RESET, CODE, READONLY
	ENTRY

	LDR	R0, =tststr	; address of existing string
	LDR	R1, =0x40000000	; address for new string

	;
	; Write your program here to create the reversed string
	;
	
	MOV	R2, R0		; copies contents of R0 to R2
while	
	LDRB	R3, [R2]	; loads R2 to R3
	CMP	R3, #0		; if (char != 0)
	BEQ	nullch		; {
	ADD	R2, R2, #1	; address++
	B	while		; 
nullch	
	SUB	R2, R2, #1	; address--
ifloop	
	CMP	R0, R2
	BHS	greater		; if (R0 >= R2), finished
	LDRB	R3, [R0]	; swap bytes
	LDRB	R4, [R2]
	STRB	R3, [R1]
	STRB	R4, [R0]
	ADD	R0, R0, #1	; address++
	SUB	R2, R2, #1	; address--
	B	ifloop
greater

STOP	B	STOP

tststr	DCB	"This is a test!",0

	END
