.data
	num : .word 4
.text
main:
	lw $a0,num
	jal factorial
	move $a0,$v0
	li $v0,1
	syscall
	li $v0,10
	syscall

factorial:
	bgt $a0,0,recur # if n<=0 return 1, base case
	li $v0,1
	jr $ra
	recur:
		addi $sp,$sp,-8
		sw $a0, 4($sp)          
		sw $ra, 0($sp)          
		addi $a0, $a0,-1           # (n-1)
		jal factorial

		lw $t0, 4($sp)             # t0=n-1
		mul $v0, $v0, $t0          # n*(n-1)
		lw $ra, 0($sp)             # address to previous call
		addi $sp, $sp, 8           # end of this call, so adjust sp.
		jr $ra  
