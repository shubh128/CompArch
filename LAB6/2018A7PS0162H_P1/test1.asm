.data
    line: .asciiz "\n"
    print_str: .asciiz "value of $a0: "
.text

main:
    li $a0, 10
    la $a1, print_str
    la $a2, line

    jal increment
    jal print

    li $v0, 10
    syscall

increment: 
    addi $sp, $sp, -8
    sw $a0, ($sp)
    sw $ra, 4($sp)

    addi $a0, $a0, 10
    jal print

    lw $a0, ($sp)
    lw $ra, 4($sp)
    addi $sp, $sp, 8

    jr $ra


print:
    addi $sp, $sp, -4
    sw $a0, ($sp)

    move $a0, $a1
    li $v0, 4
    syscall

    lw $a0,($sp)
    li $v0, 1
    syscall

    move $a0, $a2
    li $v0, 4
    syscall

    lw $a0,($sp)
    addi $sp, $sp, 4
    jr $ra

