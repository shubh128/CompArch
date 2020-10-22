.data
input: 
    .asciiz "\nEnter a number: "
output:
    .asciiz "Fact: "

.text

main:

la $a0, input
li $v0, 4
syscall
li $v0, 5
syscall

move $t0, $v0
li $t1, 1
li $t2, 1
loop:
    ble $t0, $t2, exit
    mul $t1, $t1, $t0
    sub $t0, $t0, 1
    j loop
exit:

la $a0, output
li $v0, 4
syscall
move $a0, $t1
li $v0, 1
syscall

li $v0, 10
syscall
