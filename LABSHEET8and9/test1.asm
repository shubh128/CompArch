.data
    promptMessage: .asciiz "Enter a number to find it's factorial: "
    resultMessage: .ascii "\nThe factorial of the given number is: "
.text
main:
    la $a0, promptMessage
    li $v0, 4
    syscall

    li $v0, 5
    syscall
    move $a0, $v0

    jal factorial

    move $s0, $v0
    la $a0, resultMessage
    li $v0, 4
    syscall

    li $v0, 1 #display the result
    move $a0, $s0
    syscall

    li $v0,10 # exit from main
    syscall

factorial:
    addi $sp, $sp, -8
    sw $ra, ($sp)
    sw $s0, 4($sp)

    li $v0, 1
    beq $a0, 0, factDone
    move $s0, $a0
    addi $a0, $a0, -1

    jal factorial
    mul $v0, $v0, $s0
    factDone:
        lw $ra, ($sp)
        lw $s0, 4($sp)
        addi $sp, $sp, 8

        jr $ra