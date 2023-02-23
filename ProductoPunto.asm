.data
	array1: .word 1, 2, 3, 4, 5, 6, 7, 8
	array2: .word 1, 2, 3, 4, 5, 6, 7, 8
.text

main:
	auipc a0,0xfc10		#Array1
	addi a0, a0, 0
	auipc a1, 0xfc10	#Array2
	addi a1, a1, 24
	
	addi a5, zero, 8	#i_for
	addi s1, zero, 0	#i_array
	addi a2, zero, 0	#resultado
	addi a3, zero, 0	#array1
	addi a4, zero, 0	#array2
	jal for
	jal exit
	
for:	
	slti t0, a5, 1		# Si a5 < 1, entonces no se ejecuta el ciclo for
	bne t0, zero, exit	#branch to loop
	
	slli t1, s1, 2		#shift left i
	slli t2, s1, 2		#shift left i
	add t1, t1, a0		#adding a offset to the base address
	add t2, t2, a1		#adding a offset to the base address
	lw a3, 0(t1)		#loading data from memory
	lw a4, 0(t2)		#loading data from memory
	
	jal productoPunto
	
	add a2, a2, t3
			
	addi a5, a5, -1 	#decreasing i_for
	addi s1, s1, 1		#increasing i_array
	nop
	jal for
	
productoPunto:
	mul t3, a3, a4		#multiplicacion 
	jr ra
exit:
	nop
