.data
input_msg:
    .asciiz "Enter a number: "
output_msg: 
    .asciiz "The Sum is: "

.text

main:

la $a0,input_msg
li $v0,4
syscall

li $v0,5
syscall

move $t0, $v0
li $t1, 0

loop:   
    ble $t0, $zero, exit
    add $t1, $t1, $t0
    sub $t0, $t0, 1
    j loop
exit:

la $a0,output_msg
li $v0,4
syscall
li $v0, 1
move $a0, $t1
syscall

li $v0, 10
syscall