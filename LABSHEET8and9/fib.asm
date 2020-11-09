.data
    promptMessage: .asciiz "Enter a number: "
    resultMessage: .ascii "\nThe fibonacci number: "
.text

main:
    la $a0, promptMessage
    li $v0, 4
    syscall

    li $v0, 5
    syscall
    move $a0, $v0

    li $t1, 2
    jal fibonacci

    move $s0, $v0
    la $a0, resultMessage
    li $v0, 4
    syscall

    li $v0, 1 # display the result
    move $a0, $s0
    syscall

    li $v0,10 # exit from main
    syscall

fibonacci:

    addi $sp, $sp, -12
    sw $ra, 8($sp)
    sw $s0, 4($sp)
    sw $s1, ($sp)

    move $s0, $a0
    li $v0, 1

    ble $s0, $t1, fibDone

    addi $a0, $s0, -1
    jal fibonacci
    move $s1, $v0

    addi $a0, $s0, -2

    jal fibonacci

    add $v0, $s1, $v0
    
    fibDone:
        lw $ra, 8($sp)
        lw $s0, 4($sp)
        lw $s1, ($sp)
        addi $sp, $sp, 12

        jr $ra

