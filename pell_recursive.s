.global _start

N: 			.word 7	// input parameter n
P:			.space 4	// Pell number result

_start:
	ldr		R1, N		// get the input parameter
	bl		pell		// go!
	str		R1, P		// save the result
	
stop:
	b		stop

// Pell number calculation
// pre-- A1: Pell number index i to calculate, n >= 0
// post- A1: Pell number P = pell(n)
pell:
	PUSH {R3, R4, LR} //Push R2, Link Register
	CMP R1, #1 // if n==1
	BNE secondif // If not, continue
	B _end // End code

secondif:
	CMP R1, #0 // if n==0
	BNE recurs //
	B _end
	
recurs:
	MOV R4, R1
	SUB R1, R1, #1 // n-1
	BL pell
	LSL R1, R1, #1 // 2*pell(n-1)
	MOV R3, R1 // move 2*pell(n-1) -> r3
	SUB R1, R4, #2 // n-2
	BL pell
	ADD R1, R3, R1 // 2*pell(n-1) + pell(n-2)
	
_end:
	POP {R3, R4, LR}
	BX LR



