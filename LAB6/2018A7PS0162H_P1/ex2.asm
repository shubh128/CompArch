.data
    line: .asciiz "\n"
    a: .asciiz "a"
    e: .asciiz "e"
    i: .asciiz "i"
    o: .asciiz "o"
    u: .asciiz "u"
    in_str: .space 10
    out_str: .space 10
.text
    main:
        li $v0, 8
        la $a0, in_str
        li $a1, 10
        syscall
 
        la $a0, in_str
        la $a1, out_str
        li $a2, 0
 		li $t4,0
        jal count_and_remove
 
        li $v0, 10
        syscall
 
    count_and_remove:
        loop:
            lb $t0, ($a0)
 			addi $t4,$t4,1
            beq $t0, $zero, exit_loop
 
            lb $t1, a
            beq $t0, $t1, continue
 
            lb $t1, e
            beq $t0, $t1, continue
 
            lb $t1, i
            beq $t0, $t1, continue
 
            lb $t1, o
            beq $t0, $t1, continue
 
            lb $t1, u
            beq $t0, $t1, continue
 
            sb $t0, ($a1)
            addi $a1, $a1, 1
            j continue1
 
        continue:
            addi $a2, $a2, 1
            j continue1
        continue1:
            addi $a0, $a0, 1
            j loop
 
        exit_loop:
        	li $v0,1
        	move $a0,$a2
        	syscall
        	
            li $v0, 4
            la $a0, line
            syscall
 
            li $v0, 4
            la $a0, out_str
            syscall
 
            jr $ra