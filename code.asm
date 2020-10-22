
.data
input_msg1:
    .asciiz "Enter the value for N: "
input_msg2:
    .asciiz "Enter m: "
output_msg1:
    .asciiz "Even numbers upto N="
output_msg2:
    .asciiz ": "
output_space: 
    .asciiz " " 
output_add: 
    .asciiz "+"
output_msg3:
    .asciiz "\nSum of Even numbers divisible by "
output_err:
    .asciiz "Value cannot be 0 or 1"
.text

main:

la $a0, input_msg1
li $v0, 4
syscall
li $v0, 5
syscall
move $t0, $v0 # t0 has N




la $a0, input_msg2
li $v0, 4
syscall
li $v0, 5
syscall
move $t1, $v0 # t1 has M

li $t5, 1

bgt $t1, $t5, safe1
    la $a0, output_err
    li $v0, 4
    syscall
    li $v0, 10
    syscall
safe1:
bgt $t0, $t5, safe4
    la $a0, output_err
    li $v0, 4
    syscall
    li $v0, 10
    syscall
safe4:

li $t4, 2

la $a0, output_msg1
li $v0, 4
syscall

move $a0, $t0
li $v0, 1
syscall

la $a0, output_msg2
li $v0, 4
syscall
li $t4, 2
li $t5, 2
loop:
    bgt $t5, $t0, exit
    move $a0, $t5
    li $v0, 1
    syscall
    la $a0, output_space
    li $v0, 4
    syscall
    add $t5, $t5, $t4
    j loop
exit:


la $a0, output_msg3
li $v0, 4
syscall

move $a0, $t1
li $v0, 1
syscall

la $a0, output_msg2
li $v0, 4
syscall
li $t4, 2
rem $t3, $t1, $t4
beqz $t3, even
    mul $t1, $t1, $t4
even:

li $t2, 0 # t2 will have ans
move $t3, $t1
loop2:
    bgt $t1, $t0, exit2
    add $t2, $t2, $t1
    add $t1, $t1, $t3
    j loop2
exit2:

move $a0, $t2
li $v0, 1
syscall

li $v0, 10
syscall
