.data 		#Initialize a to d their respective values
x: .word 2
y: .word 3 

.text
# saving x and y values into argument registers 
# Use li to pass in parameter to argument register 
 lw $a0, x
 lw $a1, y 
 jal myAdd  # call myAdd function
 
myAdd: 
# function with 2 arguments and load value in return register 
add $v0, $a0, $a1	# add x and y 
jr $ra			# return 
