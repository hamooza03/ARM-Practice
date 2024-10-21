dividend:
    .word 10
divisor:
    .word 2

    .global _start
_start:
    // R0: stores the quotient
    MOV R0, #0
    
	// your code starts here
	MOV R1, #0 //sign
	LDR R2, dividend //dividend
	LDR R3, divisor //divisor
	MVN R4, #0 // -1
	MOV R5, #0 // remainder
	CMP R2, #0
	BGE if2 // branch if dividend not negative
	MVN R1, R1 //Not gate for sign
	MUL R2, R2, R4

if2:
	CMP R3, #0
	BGE setDiv
	MVN R1, R1
	MUL R3, R3, R4
	
setDiv:
	MOV R6, #31 // i = 0

for:
	CMP R6, R4
	BLE if3

	// remainder << 1
	LSL R5, R5, #1

	MOV R7, R2
	LSR R7, R7, R6
	AND R7, R7, #1
	ORR R5, R5, R7

	CMP R5, R3
	BLT decrement
	SUB R5, R5, R3

	MOV R8, #1
	LSL R8, R8, R6
	ORR R0, R0, R8

decrement:
	SUBS R6, R6, #1
	B for

if3:
	CMP R1, #0
	BEQ end
	MUL R0, R0, R4

// your code ends here
end:
	B end
