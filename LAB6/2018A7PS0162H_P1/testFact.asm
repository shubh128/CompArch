.data
    num: .word 4

.text

main:
    li $v0, 5
    syscall
    move $a0, $v0

    jal factorial

    move $a0, $v0
    li $v0, 1
    syscall
    
    li $v0, 10
    syscall

factorial:
    bgt $a0, 0, recur
    li $v0, 1
    jr $ra

    recur:

    addi $sp, $sp, -8
    sw $a0, ($sp)
    sw $ra, 4($sp)

    addi $a0, $a0, -1
    jal factorial

    lw $t0, ($sp)
    lw $ra, 4($sp)
    addi $sp, $sp, 8

    mul $v0, $v0, $t0

    jr $ra

