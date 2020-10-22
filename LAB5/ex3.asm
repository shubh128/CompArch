.data

theStr : .space 6 # declare a space of 6 bytes
revStr : .space 6
newLine : .asciiz "\n"

.text 
main :
lb $t4, newLine
li $v0, 8 # 8=> read string; $a0 is buffer; $a1 is length
la $a0, theStr # load the base address of theStr
li $a1, 6 # load the length of string(max length of string+1 for '\0' )
syscall

add $t2,$a0,$zero # load base address in $t2; find input string length
slen_0: # loop label to find the last char
    lb $t3, ($t2) # load current byte
    addi $t2, $t2, 1 # increment for next iteration
    beq $t3, $t4, next # if current byte is '\n'
    bne $t3,$zero, slen_0 # if current byte isn't '\0', repeat
next : # label to exit the above loop
add $t1,$a0,$zero # load base address
addi $t2,$t2,-2 # -2 because moved beyond '\0' or '\n'; need char before

la $a0, revStr
add $t3, $a0, $zero

loop: 
    blt $t2, $t1, exit
    lb $t4, ($t2)
    sb $t4, ($t3)
    addi $t3, $t3, 1
    addi $t2, $t2, -1 
    j loop
exit:



la $a0, theStr
li $v0, 4
syscall


la $a0, revStr
li $v0, 4
syscall

li $v0,10 
syscall