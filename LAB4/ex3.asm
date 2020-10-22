.data
input_msg: .asciiz "Enter a number: "
output_msg: .asciiz "The sum "
.text
main:
# Read integer number n
la $a0,input_msg
li $v0,4
syscall

li $v0,5
syscall
move $t3,$v0 # $t3 contains n

li $t0,0 # intialize sum =0.
li $t1,0 # intialize count =0

loop:
bgt $t1,$t3,exit # while count>n, come out of loop
add $t0,$t0,$t1 # sum=sum+count
addi $t1,$t1,1 # increment count
j loop
exit:
# Display the sum
la $a0,output_msg
li $v0,4
syscall
move $a0,$t0
li $v0,1
syscall
# Exit the program
li $v0,10
syscall