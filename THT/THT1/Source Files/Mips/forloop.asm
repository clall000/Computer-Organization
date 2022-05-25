.data #Initialize a to d their respective values
a: .word 1

.text 
# Copy values from memory 
lw $s0, a

li 	$a0, 0 		# $a0 = 0
li 	$t0, 10 	# Initalize loop counter to 10 

loop:
	addi 	$s0, $s0, 1 	# Increment 'a'
	addi 	$t0, $t0, -1	# Decrement loop counter
	bgtz 	$t0, loop	# If ($t0 > 0) Branch to loop 
