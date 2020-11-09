.data
    promptMessage: .asciiz "Enter a number to find it's factorial:"
    resultMessage: .ascii "\nThe factorial of the given number is:"
.text
main:
    li $v0, 4
    la $a0, promptMessage
    syscall
    li $v0,5 # get the number from user
    syscall
    move $a0, $v0
    jal findFactorial # call findFactorial function
    move $s0,$v0
    li $v0, 4
    la $a0, resultMessage
    syscall
    li $v0, 1 #display the result
    move $a0, $s0
    syscall
    li $v0,10 # exit from main
    syscall

findFactorial:
    subu $sp,$sp,8 #adjust stack pointer
    sw $ra,0($sp)
    sw $s0,4($sp) # since the register s0 will be modified during recursion
    # a0 is not saved, since its value is not used after return
    li $v0,1 # v0 is not saved, since its value is reset before return
    beq $a0,0,factDone # the base case (input = 0) – return 1
    move $s0,$a0 # find findfactorial(n-1)
    sub $a0,$a0,1
    jal findFactorial
    mul $v0,$s0,$v0

factDone:
    lw $ra,0($sp)
    lw $s0,4($sp)
    addu $sp,$sp,8
    jr $ra