array:      .short  9, 3, 1, 2  // array
size:       .word   4           // number of elements

.global _start

_start:
    // your code starts here
	
	// bubble sort in descending order
	LDR R0, =array // address of the start of the array
	LDR R1, size // length of array
	CMP R1, #0 // size = 0
	BLE end
	
	MOV R2, #0 // step = 0
	SUB R3, R1, #1 // size - 1
	
for1:
	CMP R2, R3 // step < size-1
	BGE end

	MOV R4, #0 // i = 0
	
for2:
	SUB R5, R3, R2 // size - step - 1
	CMP R4, R5 // i < size - step - 1
	BGE incrementstep
		
	// array[i]
	MOV R6, R4
	LSL R6, R6, #1
	LDRH R7, [R0, R6]
	
	// array[i+1]
	ADD R8, R6, #2
	LDRH R9, [R0, R8]
	
	CMP R7, R9 // compare
	BLT incrementi
		
	// swap
	STRH R9, [R0, R6]      
    STRH R7, [R0, R8]  
		
incrementi:
	// increment i (i + 1)
	ADD R4, R4, #1
	B for2
		
incrementstep:
	ADD R2, R2, #1
	B for1
		
    // your code ends here

end:
    B       end