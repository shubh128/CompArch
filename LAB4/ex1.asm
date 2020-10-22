# Find max $t0 and $t1
.data

output_msg1:
.asciiz "\nMax: "
output_msg2:
.asciiz "\nMin: "
str2:
.asciiz "\Enter number:"


.text

main:
la $a0,str2
li $v0,4
syscall

li $v0, 5
syscall
move $t0, $v0

li $v0, 5
syscall
move $t1, $v0

bge $t0,$t1,ifblock # Check if $t0>=$t1, $t0 is maximum, then go to ifblock (label)
move $t2,$t1
# Else, $t1 is maximum
blt $t0,$t1,exit
ifblock:
move $t2,$t0
exit:
# Display the Max
la $a0,output_msg1
li $v0,4
syscall
move $a0,$t2
li $v0,1
syscall
##############################################################
# Find min $t0 and $t1
ble $t0,$t1,ifblock1 # Check if $t0<=$t1, $t0 is min, then go to ifblock (label)
move $t2,$t1
# Else, $t1 is min
bgt $t0,$t1,exit1
ifblock1:
move $t2,$t0
exit1:
# Display the Min
la $a0,output_msg2
li $v0,4
syscall
move $a0,$t2
li $v0,1
syscall

li $v0, 10
syscall