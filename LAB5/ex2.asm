.data
char: .byte 'z'
vowels: .asciiz "aeiou"
found: .asciiz "Found\n"
not_found: .asciiz "Not Found\n"

.text

main:
lb $t0, char # load character to look for
li $t1, 0 # it's not found yet
la $s0, vowels # set pointer to vowels[0]
lb $s1, ($s0) # get vowels[0]
srchlp:
    beq $s1, $zero, srchdn # check for terminator
    seq $t1, $s1, $t0 # compare characters
    bgt $t1, $zero, srchdn # check if found
    addi $s0, $s0, 1 # no, step to next vowel
    lb $s1, ($s0) # load next vowel
    b srchlp
srchdn: 
    bne, $t1, $zero, success
    la $a0, not_found
    li $v0, 4
    syscall
    j exit
    success:
        la $a0, found
        li $v0, 4
        syscall  
    exit:
    li $v0, 10 
    syscall