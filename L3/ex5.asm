.data

str0:
.asciiz "\nMul:"
str1:
.asciiz "\nDiv:"
str2:
.asciiz "\nDifference:"

integer1: .word 10051
integer2: .word 98712

.text

main:

lw $t0, integer1
lw $t1, integer2

la $a0, str0
li $v0, 4
syscall

mul $a0, $t0, $t1
li $v0,1
# print from $a0
syscall
move $t2, $a0

# Convert Integers to single point precision
mtc1 $t0, $f0
cvt.s.w $f14, $f0

mtc1 $t1, $f2
cvt.s.w $f16, $f2

mul.s $f12, $f14, $f16

la $a0, str0
li $v0, 4
syscall
li $v0, 2
syscall

mov.s $f20, $f12

mtc1.d $t0, $f0
cvt.d.w $f14, $f0

mtc1.d $t1, $f2
cvt.d.w $f16, $f2

mul.d $f12, $f14, $f16

la $a0, str0
li $v0, 4
syscall
li $v0, 3
syscall

mov.d $f22, $f12
cvt.d.s $f24, $f20
sub.d $f12, $f22, $f24

la $a0, str2
li $v0, 4
syscall
li $v0, 3
syscall

li $v0,10
syscall