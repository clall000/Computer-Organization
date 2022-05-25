.data
	number1: .word 4
	number2: .word 8
	number3: .word 12
	number4: .word 28
	number5: .word 18
.text
	lw $t0, number1
	lw $t1, number2
	lw $t2, number3
	lw $t3, number4
	lw $t4, number5
	add $t5, $t0, $t1
	add $t6, $t5, $t2
	add $t7, $t6, $t3
	add $t8, $t7, $t4
	sw $t8, number1
