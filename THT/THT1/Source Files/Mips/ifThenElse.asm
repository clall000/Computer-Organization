.data #Initialize a to d their respective values
a: .word 4
b: .word 5
c: .word 10
d: .word 3
.text 
# Copy values from memory 
lw $s0, a
lw $s1, b 
lw $s2, c 
lw $s3, d
#if-else statement
bgez 	$s2, else		# if ($s2 is >= zero) branch to else
sub 	$s0, $zero, $s2		# $s0 gets the negative of $s2
addi 	$s1, $s1, 1 		# increment $s1 by 1 
b 	exit 			# branch around the else code

else:
	ori 	$s0, $s2, 0	# $s0 gets a copy of $t8
	addi 	$s3, $s3, 1	# increment $s3 by 1 
exit: