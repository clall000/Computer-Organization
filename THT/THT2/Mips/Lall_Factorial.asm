 .data
 value: .word 5
 answer: .word
.text
main:
	lw $a0, value
	jal factorial
	sw $v0, answer
	li $v0, 10
	syscall
factorial:
	addi $sp, $sp, -8
	sw $s0, 4($sp)
	sw $ra, 0($sp)
	li $v0, 1
	beq $a0, 0, complete
	move $s0, $a0
	sub $a0, $a0, 1
	jal factorial
	mul $v0, $s0, $v0
	complete:
		lw $ra, 0($sp)
		lw $s0, 4($sp)
		addi $sp, $sp, 8	
		jr $ra
