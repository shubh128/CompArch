.data
prompt : .asciiz "Enter size of arr"


.text
main:

li $v0,4
la $a0,prompt
syscall

# take input
li $v0,5
syscall

# allocation of memory
move $a0,$v0
move $s4,$a0
addi $a0,$a0,1
mul $a0,$a0,4 # each integer is 4 bytes, a0 holds number of bytes to be allocated
li $v0,9 # system call for memory allocation, v0 holds address
syscall
# memory has been allocated,v0 holds the address

li $s0,0
li $s2,0
li $t2,0
move $a2,$v0
move $a3,$v0

slen:
	bge $s0,$s4,sum
	li $v0,5
	syscall
	sw $v0,0($a2)
	addi $a2,$a2,4
	addi $s0,$s0,1
j slen

sum:
	bge $s2,$s4,exit
	lw $t1,0($a3)
	add $t2,$t2,$t1
	addi $s2,$s2,1
	addi $a3,$a3,4
j sum

exit:
move $a0,$t2
li $v0,1
syscall
li $v0,10
syscall

