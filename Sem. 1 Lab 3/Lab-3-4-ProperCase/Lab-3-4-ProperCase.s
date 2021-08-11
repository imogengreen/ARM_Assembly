;
; CSU11021 Introduction to Computing I 2019/2020
; Proper Case
;

	AREA	RESET, CODE, READONLY
	ENTRY

	LDR	R0, =tststr	; address of existing string
	LDR	R1, =0x40000000	; address for new string
start	
	LDRB	R2, [R0]	; load R0 into R2
	CMP	R0, #0		; while (char != NULL) 
	BEQ	endstr		; {
	CMP	R2, #0x20	; if (char = SPACE){
	BEQ	spchar		; branch to spchar }
	CMP	R2, #'a'	; if (char >= 'a' 
	BLO	lowerc		; && 
	CMP	R2, #'z'	; char <= 'z')
	BHI	lowerc		; {
	SUB	R2, R2, #0x20	; convert from lowercase to uppercase by subtracting 0x20}
lowerc
	STRB	R2, [R1]	; store contents of R2 into the address in memory at R1	
string	
	ADD	R0, R0, #1	; address of existing string++
	ADD	R1, R1, #1	; address of new string++
	LDRB	R2, [R0]	; load R0 into R2
	CMP	R0, #0		; while (char != NULL) 
	BEQ	endstr		; {
	CMP	R2, #0x20	; if (char = SPACE){
	BEQ	spchar		; branch to spchar }
	CMP	R2, #'A'	; if (char >= 'A' 
	BLO	convert		; && 
	CMP	R2, #'Z'	; char <= 'Z')
	BHI	convert		; {
	ADD	R2, R2, #0x20	; convert from uppercase to lowercase by adding 0x20}
convert
	STRB	R2, [R1]	; stores into the new string location at the address in R1
	B	string		; continue to convert to lowercase until we reach a space
spchar
	STRB	R2, [R1]	; copy space into new string location
	ADD	R0, R0, #1	; address of existing string++
	ADD	R1, R1, #1	; address of new string++
	B 	start		; branch back to the start of the string 
	
endstr
	STRB	R1, [R0]	; null-terminates the new string
	
STOP	B	STOP

tststr	DCB	"The FOX",0

	END
