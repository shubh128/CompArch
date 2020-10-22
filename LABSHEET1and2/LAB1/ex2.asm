# demo code to print the integer value 10

.data #variable declaration follow this line
# sample string variable declaration – not used in first exercise.

myMsg: .asciiz "Hello Enter a number.\n" # string declaration
# .asciiz directive makes string null terminated

.text #instructions follow this line

main:

la $a0, myMsg
li $v0, 4
syscall

li $a0,10 #load immediate
li $v0,1
syscall

li $v0,10 #System call - Exit - QTSPIM to properly terminate the run
syscall

#end of program