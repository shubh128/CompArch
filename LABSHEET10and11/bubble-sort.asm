.data
    list: .word 17, 5, 92, 87, 41, 10, 23, 55, 72, 36
    space: .asciiz " "
.text 
main:
    li $s7,10 # size of the list(sz)
    addi $s3,$s7,-1 # $s3 = Stop = sz-1
    li $s4, 0 # $s4 = Curr = 0 
    la $a0, list

    outer:
        ble $s3, $zero, exit
        li $s4, 0
    inner:
        
        bge $s4, $s3, inner_end

        mul $t3, $s4, 4
        add $t4, $t3, $a0

        lw $t5, ($t4)
        lw $t6, 4($t4)

        ble $t5, $t6 continue

        sw $t5, 4($t4)
        sw $t6, ($t4)
        
        continue:
        add $s4, $s4, 1
        j inner

    inner_end:
    
        addi $s3, $s3, -1
        j outer

    exit:
        la $t0, list
        li $t2, 0

    print:
        lw $a0,($t0)
        li $v0, 1
        syscall

        la $a0, space
        li $v0, 4
        syscall

        addi $t0, $t0, 4
        addi $t2, $t2, 1
        blt $t2, $s7, print

    li $v0, 10
    syscall
