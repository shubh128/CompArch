.data 
input_msg1: 
    .asciiz "Enter a number: "
odd: 
    .asciiz "Odd\n"
even: 
    .asciiz "Even\n"

.text

main: 

la $a0, input_msg1
li $v0, 4
syscall
li $v0,5
syscall

move $t0, $v0
li $t1, 2
div $t0, $t1

mfhi $t2
li $v0, 4
beqz $t2, ifblock
la $a0, odd
j exit
ifblock: 
    la $a0, even
exit:

syscall
li $v0, 10
syscall