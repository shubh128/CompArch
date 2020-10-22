.data
input_msg1: .asciiz "\nEnter first number "
input_msg2: .asciiz "\nEnter second number "
output_msg1: .asciiz "\nThe Maximum is : "
output_msg2: .asciiz "\nThe Minimum is : "
val1:
    .float 22.125
val2:
    .float 22.5
.text
main:
# Read first number
l.s $f1, val1
l.s $f2, val2
# Find max $f1 and $f2
c.lt.s $f1,$f2 # Check if $f1>=$f2, $f1 is maximum, then go to ifblock (label)
bc1f ifblock
mov.s $f4,$f2
# Else, $f2 is maximum
c.lt.s $f1,$f2
bc1t exit
ifblock:
mov.s $f4,$f1

exit:
# Display the Max
la $a0,output_msg1
li $v0,4
syscall
mov.s $f12,$f4
li $v0,2
syscall
# Find min $f1 and $f2
c.lt.s $f1,$f2 # Check if $f1<=$f2, $f1 is min, then go to ifblock (label)
bc1t ifblock1
c.lt.s $f1,$f2
bc1f else1
ifblock1:
mov.s $f6,$f1
else1:
mov.s $f6,$f2
# Display the Min
la $a0,output_msg2
li $v0,4
syscall
mov.s $f12,$f6
li $v0,2
syscall
# Exit the program
li $v0,10
syscall