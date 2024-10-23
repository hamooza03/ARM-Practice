n:  .word 10

.global _start

_start:
    // use R0 to pass n and store the return value
    LDR     R0, n
    BL      padovan 

end:
    B       end

padovan:
    // your code starts here
	
	// Base cases
	CMP R0, #2
	BEQ done
	CMP R0, #1
	BEQ done
	CMP R0, #0
	BEQ done
	
	PUSH {R1-R3, LR} // push regs and LR
	MOV R1, R0 // temp storage
	SUB R0, R0, #2 // n-2
    // your code ends here
    BL      padovan
    // your code starts here
	MOV R2, R0
	
	
	MOV R0, R1 // restore original n
	SUB R0, R0, #3 // n-3
    // your code ends here
    BL      padovan
    // your code starts here
	MOV R3, R0
	
	ADD R0, R2, R3
	POP {R1-R3, LR}
	BX LR


done:
	MOV R0, #1
    // your code ends here
    BX      LR

	