.data
input_msg1: .asciiz "Enter first number\n"
input_msg2: .asciiz "Enter second number\n"

.text

main: 
# Read first number
la $a0, input_msg1
li $v0, 4
syscall
li $v0, 5
syscall
move $t0,$v0

# Read second number
la $a0,input_msg2
li $v0, 4
syscall
li $v0, 5
syscall
move $t1,$v0

add $t0,$t0,$t1
sub $t1,$t0,$t1
sub $t0,$t0,$t1

li $v0,10
syscall