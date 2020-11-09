.data
prompt : .asciiz "Enter the number of students"
newLine : .asciiz "\n"

.text
main:
la $a0,prompt
li $v0,4
syscall

li $v0,5
syscall
move $a0,$v0
move $t1,$v0
addi $a0,$a0,1 # extra space to avoid exceptions 
mul $a0,$a0,32
li $v0,9
syscall

# v0 contains the address
move $s0,$v0
move $s2,$v0
li $t0,0 # counter variable
li $t2,0

input_loop:
	beq $t0,$t1,print_loop
	li $v0,5
	syscall
	sw $v0,0($s0)
	li $v0,8
	la $a0,4($s0)
	li $a1,20
	syscall
	li $v0,6
	syscall
	s.s $f0,24($s0)
	addi $t0,$t0,1
	addi $s0,$s0,32
	j input_loop

print_loop:
	beq $t2,$t1,exit
	lw $a0,0($s2)
	li $v0,1
	syscall
	la $a0,4($s2)
	li $v0,4
	syscall
	li $v0,2
	l.s $f12,24($s2)
	syscall
	addi $s2,$s2,32
	addi $t2,$t2,1
	j print_loop

exit:
li $v0,10
syscall