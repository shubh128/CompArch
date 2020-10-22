.data
input_msg1: .asciiz "\nEnter first number "
input_msg2: .asciiz "\nEnter second number "
output_msg1: .asciiz "\nThe Maximum is : "
output_msg2: .asciiz "\nThe Minimum is : "
val1:
    .float 22.125
val2:
    .float 22.5

.text

main:

la $a0, input_msg1
li $v0,4
syscall
li $v0,6
syscall
mov.s $f1, $f0

la $a0, input_msg2
li $v0,4
syscall
li $v0,6
syscall
mov.s $f2, $f0

la $a0, output_msg1
li $v0, 4
syscall
li $v0, 2

c.lt.s $f1, $f2
bc1f ifblock
mov.s $f12, $f2
syscall
j exit
ifblock:
    mov.s $f12, $f1
    syscall
exit:
nop

la $a0, output_msg2
li $v0, 4
syscall
li $v0, 2

c.lt.s $f1, $f2
bc1t ifblock1
mov.s $f12, $f2
syscall
j exit1
ifblock1:
    mov.s $f12, $f1
    syscall
exit1:

li $v0, 10
syscall