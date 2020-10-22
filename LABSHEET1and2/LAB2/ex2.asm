# demo code to print the integer value 10

.data #variable declaration follow this line
# sample string variable declaration – not used in first exercise.

myMsg: .asciiz "Hello Enter 2 numbers.\n" # string declaration
sumMsg: .asciiz "The sum is = " # string declaration
diffMsg: .asciiz "\nThe difference is = " # string declaration

# .asciiz directive makes string null terminated

.text #instructions follow this line


main:
la $a0, myMsg
li $v0, 4
syscall

li $t0,4294967295
li $t1,-4294967295

la $a0, sumMsg
li $v0, 4
syscall

add $t2, $t0, $t1

move $a0, $t2 #load address
li $v0,1
syscall

la $a0, diffMsg
li $v0, 4
syscall

sub $t2, $t0, $t1

move $a0, $t2 #load address
li $v0,1
syscall

li $v0,10 #System call - Exit - QTSPIM to properly terminate the run
syscall
