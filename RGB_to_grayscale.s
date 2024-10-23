.data
input_image:    // don't refer to this label directly
.byte 230, 172, 36, 60, 99, 64, 212, 100, 69, 98, 146, 76
.byte 12, 51, 7, 70, 132, 101, 200, 223, 51, 35, 191, 12
.byte 9, 66, 112, 69, 83, 181, 88, 127, 120, 139, 199, 82 
.byte 232, 60, 24, 250, 193, 125, 59, 126, 110, 206, 194, 62

output_image:   // don't refer to this label directly
.space 16

image_size:
.word 16

.text
.global _start
_start:
    LDR R0, =input_image
    LDR R1, =output_image
    LDR R2, =image_size
    LDR R2, [R2]
    BL  rgb2gray

end:
    B   end

rgb2gray:
    // your code starts here
	MOV R3, #0 // size, comparator

loop:
	CMP R3, R2
	BEQ done
	
	LDRB R4, [R0], #1 // R
	LDRB R5, [R0], #1 // G
	LDRB R6, [R0], #1 // B
	
	MOV R7, #77
	MUL R8, R4, R7
	
	MOV R7, #150
	MUL R9, R5, R7
	
	MOV R7, #29
	MUL R10, R6, R7
	
	ADD R8, R8, R9
	ADD R8, R8, R10
	
	LSR R8, R8, #8
	
	STRB R8, [R1], #1
	
	ADD R3, R3, #1
	B loop

done:
    // your code ends here
    BX  LR
	
	
	
	