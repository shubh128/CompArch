# Find max $t0 and $t1
.data

output_msg:
.asciiz "\nEven"
output_msg1:
.asciiz "\nOdd"
str2:
.asciiz "\nEnter number:"


.text

main:
la $a0,str2
li $v0,4
syscall

li $v0, 5
syscall
move $t0, $v0

li $t1,2
div $t0,$t1
mfhi $t0
# Find max $t0 and $t1
beqz $t0,ifblock # if($t0%2==0) goto ifblock and print even
la $a0,output_msg1 # Else, print odd
li $v0,4
syscall
bnez $t0,exit
ifblock:
la $a0,output_msg # Else, print even
li $v0,4
syscall
exit:

li $v0, 10
syscall