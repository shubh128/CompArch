
.data

list: .word 3, 0, 1, 2, 6, -2, 4, 7, 3, 7
maxVal: .asciiz "Max: "
minVal : .asciiz "\nMin: "

.text 
main :

la $a0, list
li $t0, 10


add $t1,$a0,$zero # load base address in $t2; find input string length
lb $t2, ($t1) # Ans stored in t2
li $t3, 0
loop: 
    bge $t3, $t0, exit
    lb $t4, ($t1)
    ble $t4, $t2, notMax
        move $t2, $t4
    notMax:
    addi $t3, $t3, 1
    addi $t1, $t1, 1
    j loop
exit:



la $a0, maxVal
li $v0, 4
syscall

move $a0, $t2
li $v0, 1
syscall

add $t1,$a0,$zero # load base address in $t2; find input string length
lb $t2, ($t1) # Ans stored in t2
li $t3, 0
loop: 
    bge $t3, $t0, exit
    lb $t4, ($t1)
    bge $t4, $t2, notMax
        move $t2, $t4
    notMax:
    addi $t3, $t3, 1
    addi $t1, $t1, 1
    j loop
exit:



la $a0, minVal
li $v0, 4
syscall

move $a0, $t2
li $v0, 1
syscall

li $v0,10 
syscall