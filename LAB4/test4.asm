.data
input_msg1: 
    .asciiz "Enter First Number: "
input_msg2: 
    .asciiz "Enter Second Number: "
max: 
    .asciiz "Max: "
min: 
    .asciiz "\nMin: "
    
.text

main: 

la $a0, input_msg1
li $v0, 4
syscall
li $v0, 5
syscall
move $t0, $v0

la $a0, input_msg2
li $v0, 4
syscall
li $v0, 5
syscall
move $t1, $v0

ble $t0, $t1, ifblock
move $t2, $t0
move $t3, $t1
j exit
ifblock: 
    move $t2, $t1
    move $t3, $t0
exit:

la $a0, max
li $v0, 4
syscall
move $a0, $t2
li $v0, 1
syscall

la $a0, min
li $v0, 4
syscall
move $a0, $t3
li $v0, 1
syscall

li $v0, 10
syscall