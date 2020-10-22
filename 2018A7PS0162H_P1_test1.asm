# 2018A7PS0162H 
# Shubh Deep 
# 8850337223 / 9619225765
# f20180162@hyderabad.bits-pilani.ac.in

.data
input_msg1:
    .asciiz "Enter a: "
input_msg2:
    .asciiz "Enter b: "
output_msg:
    .asciiz "Final Value of a: "
val1:
    .double 0.01
.text

main:

la $a0, input_msg1
li $v0, 4
syscall
li $v0, 7
syscall
mov.d $f2, $f0

la $a0, input_msg2
li $v0, 4
syscall
li $v0, 7
syscall
mov.d $f4, $f0

l.d $f6, val1

loop: 
    c.le.d $f2, $f6
    bc1t exit
    div.d $f2, $f2, $f4
    j loop

exit:

mov.d $f12, $f2
la $a0, output_msg
li $v0, 4
syscall
li $v0, 3
syscall

li $v0, 10
syscall






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
