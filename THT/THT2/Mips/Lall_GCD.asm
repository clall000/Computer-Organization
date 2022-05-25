	.data
str1: .asciiz "Enter first integer n1: "
str2: .asciiz "Enter first integer n2: "
str3: .asciiz "The greatest common divisor of n1 and n2 is "
str4: .asciiz "\nThe least common multiple of n1 and n2 is "
newline: .asciiz "\n"
.align 2
.globl main
.text
main:
    la $a0, str1         
    li $v0, 4             
    syscall              
    li $v0, 5             
    syscall               
    add $a1, $v0, $zero  
    la $a0, str2           
    li $v0, 4             
    syscall              
    li $v0, 5             
    syscall                
    add $a2, $v0, $zero    
    addi $sp, $sp, -8      
    sw $a1, 4($sp)         
    sw $a2, 0($sp)       
    jal gcd                
    lw $a2, 0($sp)         
    lw $a1, 4($sp)         
    addi $sp, $sp, 4       
    add $s0, $v0, $zero   
    sw $s0, 0($sp)        
    la $a0, str3          
    li $v0, 4              
    syscall                
    li $v0, 1              
    add $a0, $s0, $zero    
    syscall                
    la $a0, str4           
    li $v0, 4              
    syscall                
    li $v0, 1             
    add $a0, $s1, $zero   
    syscall                
    la $a0, newline        
    li $v0, 4              
    syscall                
    li $v0, 10             
    syscall             
gcd:
    addi $sp, $sp, -8     
    sw $ra, 4($sp)         
    div $a1, $a2           
    mfhi $s0               
    sw $s0, 0($sp)        
    bne $s0, $zero, L1     
    add $v0, $a2, $zero  
    addi $sp, $sp, 8      
    jr $ra               
L1:
    add $a1, $a2, $zero   
    lw $s0, 0($sp)        
    add $a2, $s0, $zero   
    jal gcd              
    lw $ra, 4($sp)        
    addi $sp, $sp, 8      
    jr $ra                



