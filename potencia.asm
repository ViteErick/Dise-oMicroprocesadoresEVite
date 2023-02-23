#potencia 

.text
main:
	addi a2, zero, 5	#m
	addi a3, zero, 5	#n
	jal potencia
	jal exit

potencia:
	slti t0, a3, 1		#if n < 1 
	beq t0, zero, loop	#branch to loop
	addi a0, zero, 1	#loading 1
	jalr x0, 0(ra)		#return to the caller 
	
loop:
	#this first section will helping us to store in the stack the execution info
	addi sp, sp, -8	#decresing the stack pointer
	sw ra, 4(sp)	#storing n
	sw a2, 0(sp)	#storing the return address
	addi a3, a3, -1 # decreasing n
	
	#take back the info stored in the stack
	jal potencia	#recursive function 
	lw a2, 0(sp)	#loading values from stack
	lw ra, 4(sp)	#loading values from stack
	addi sp, sp, 8	#Increasing stack pointer
	mul a0, a0, a2	#multiplying 
	jalr x0, 0(ra)	#return to the caller

exit:
	nop
	nop
