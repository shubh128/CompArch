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
    la $a0, in_str
    li $a1, 10
    li $v0, 8
    syscall

    la $a1, out_str
    li $a2, 0
    li $t4, 0
    jal func

    li $v0, 10
    syscall

func: 
    loop:
        lb $t0, ($a0)
        addi $t4, $t4, 1

        beq $t0, $zero, exit

        lb $t1, a
        beq $t0, $t1, vowel
 
        lb $t1, e
        beq $t0, $t1, vowel

        lb $t1, i
        beq $t0, $t1, vowel

        lb $t1, o
        beq $t0, $t1, vowel

        lb $t1, u
        beq $t0, $t1, vowel
 
        sb $t0, ($a1)
        addi $a1, $a1, 1
        j continue


    vowel:
        addi $a2, $a2, 1
        j continue

    continue:
        addi $a0, $a0, 1
        j loop

    exit:

        move $a0, $a2
        li $v0, 1
        syscall

        la $a0, line
        li $v0, 4
        syscall

        la $a0, out_str
        li $v0, 4
        syscall

        jr $ra


