;
; CSU11021 Introduction to Computing I 2019/2020
; String Copy
;

	AREA	RESET, CODE, READONLY
	ENTRY

	LDR	R0, =tststr	; address of existing string
	LDR	R1, =0x40000000	; address for new string

	;
	; Write your program here to create the duplicate string
	;
while	
	LDRB	R2, [R0]	; load R0 into R2
	STRB	R2, [R1]	; store contents of R2 into R1
	ADD	R0, R0, #1	; address = address + 1
	ADD	R1, R1, #1	; address = address + 1
	CMP	R0, #0		; while (char != 0) {
	BNE	while		; perform this load-store instruction set again

STOP	B	STOP

tststr	DCB	"This is a test!",0

	END
