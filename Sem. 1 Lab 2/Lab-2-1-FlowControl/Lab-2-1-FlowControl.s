;
; CSU11021 Introduction to Computing I 2019/2020
; Flow Control
;

	AREA	RESET, CODE, READONLY
	ENTRY

; (i)
; if (h >= 13) {
; 	h = h - 12;
; }
	CMP	R0, #13
	BLT	lessth
	SUB	R0, R0, #12
lessth

; (ii)
; if (a > b) {
;	i = i + 1;
; } else {
;	i = i - 1;
; }
	CMP	R1, R2
	BLE	lesstheq
	ADD	R0, R3, #1
lesstheq
	SUB	R0, R3, #1
	
; (iii)
; if (v < 10) {
; 	a = 1;
; }
; else if (v < 100) {
; 	a = 10;
; }
; else if (v < 1000) {
; 	a = 100;
; }
; else {
; 	a = 0;
; }
	CMP	R1, #10
	BGE	greater10
	MOV	R0, #1
greater10
	CMP	R1, #100
	BGE	greater100
	MOV	R0, #10
greater100
	CMP	R1, #1000
	BGE	greater1000
	MOV	R0, #100
greater1000
	MOV	R0, #0
	
	

; (iv)
; i = 3;
; while (i < 1000) {
; 	a = a + i;
; 	i = i + 3;
; }
	LDR	R1, #3
	
	CMP	R1, #1000
	BGE	greatereq
	ADD	R2, R2, R1
	ADD	R1, R1, #3
greatereq

	

; (v) 
; for (int i = 3; i < 1000; i = i + 3) {
; 	a = a + i;
; }
	LDR	R1, #3
	
	CMP	R1, #3
	BNE	noteq
	CMP	R1, #1000
	BGE	greaterequ
	ADD	R1, R1, #3
		

noteq
greaterequ

; (vi)
; p = 1;
; do {
; 	p = p * 10;
; } while (v < p);

	LDR	R1, = 5
	LDR	R2, =7
	LDR	R3, =6
dolabel
	MUL	R1, R2, R1
	CMP	R1, R3
	BLS	dolabel
; (vii)
; if (ch >= 'A' && ch <= 'Z') {
; 	upper = upper + 1;
; }


; (viii)
; if (ch=='a' || ch=='e' || ch=='i' || ch=='o' || ch=='u')
; {
; 	v = v + 1;
; }
	CMP	R0, #'a'
	BLO	lower
	CMP	R0, #'z'
	BLS	lessths
lower	
	CMP	R0, #'A'
	BLO	higher
	CMP	R0, #'Z'
	BHI	higher
lessths
	ADD	R1, R1, #1
higher

STOP	B	STOP

	END
