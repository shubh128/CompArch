.data  
	prompt: .asciiz "1 for Triangle, 0 for Square -"
	prompt1: .asciiz "Enter the number of lines - "
	star: .asciiz "*"
	newline: .asciiz "\n"
.text
main:
	la $a0, prompt # printing the prompt
	li $v0,4
	syscall

	li $v0,5 # taking input
	syscall
	move $t0,$v0 # t0 holds 1/0 for Triangle/square

	la $a0,prompt1 # printing the second prompt
	li $v0,4 
	syscall

	li $v0,5 # taking input
	syscall
	move $t1,$v0 # number of lines

	li $s0,0 # count
	li $s2,0 # for triangle
	li $t3,1

	beqz $t0,square # if t0 is 0, print square
	; addi $s0,$s0,1
	b triangle # if t0 is 1, print triangle



square:
	li $s1,0
	l1: bge $s1,$t1,l_end
		addi $s1, $s1,1
		li $v0,4
		la $a0,star
		syscall
		j l1
	l_end: la $a0,newline
		   li $v0,4
		   syscall
		   addi $s0,$s0,1
		   blt $s0,$t1,square
		   j exit

triangle:
	l2: bge $s2,$t3,l_end2
		addi $s2,$s2,1
		la $a0,star
		li $v0,4
		syscall
		j l2
	l_end2: li $s2,0
			la $a0,newline
			li $v0,4
			syscall
			bge $t3,$t1,exit
			addi $t3,$t3,1
			j triangle

exit:
	li $v0,10 # end
	syscall