.data #Initialize a to d their respective values
a: .word 1
b: .word 10 
c: .word 2
d: .word 3

.text
# Copy values from memory 
lw $s0, a 
lw $s1, b
lw $s2, c
lw $s3, d 
li $v0, 1 			# Load Immediate $v0 with the value 1
loop:
	bgeu	$a1, $a2, done	# If($a1 >= $a2) Branch to done
	mul	$s2, $s2, 2 	# Multiply c by 2
	mul 	$s3, $s3, 2 	# Multiply d by 2
	addi 	$a0, $a0, 1	# Increment a by 1
	addi 	$a2, $a2, -1	# Decrement b by 1 
	b	loop		# Branch to loop

done: 
