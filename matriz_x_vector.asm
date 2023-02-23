.data 
	vector: .word 1 2 3 4  
	row_0: .word 1 2 3 4  
	row_1: .word 5 6 7 8 
	row_2: .word 9 10 11 12 
	row_3: .word 13 1 2 3
	result: .word 0     
.text
main:
	
	auipc a0,0xfc10		#vector
	addi a0, a0, 0
	auipc a1, 0xfc10	#matriz
	addi a1, a1, 8
	auipc a2, 0xfc10	#result
	addi a2, a2, 64

	addi a3, zero, 15	#i_for_1++
	
	addi a5, zero, 0	#array++_vector
	addi a6, zero, 0	#array++_matriz
	addi a7, zero, 0	#array++_result

	addi s0, zero, 0	#vector
	addi s1, zero, 0	#matriz
	addi s2, zero, -1	#result


for_1:
	slti t0, a3, 1		#start for
	bne t0, zero, exit	#branch to loop
	
	addi a4, zero, 4	#i_for_2++
	addi s2, zero, 1

	for_2:
		slti t0, a4, 1		#start for
		bne t0, zero, for_1	#branch to loop
		
		slli t2, a5, 2		#shift left i vector
		slli t3, a6, 2		#shift left i matriz
		slli t4, a7, 2		#shift left i result
		
		add t2, t2, a0		#adding a offset to the base address
		add t3, t3, a1		#adding a offset to the base address
		
		lw s0, 0(t2)		#loading data from memory
		lw s1, 0(t3)		#loading data from memory

		mul a2, s0, s1		#multiplicacion 
		
		addi a4, a4, -1

		addi a5, a5, 1 
		addi a6, a6, 1
		#addi a7, a7, 1

		jal for_2
exit:
	nop
