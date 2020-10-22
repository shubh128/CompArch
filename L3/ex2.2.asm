.data
val1:
.double 7.10
val2:
.float 2.53

.text

main:

#Display double 7.10
l.d $f12, val1
li $v0,3
syscall

#Display float 2.53
l.s $f12, val2
li $v0,2
syscall

#Convert float to double
cvt.d.s $f14,$f12
mov.d $f12, $f14
li $v0,3
syscall

l.d $f12, val1
#Convert double to float
cvt.s.d $f14,$f12
mov.s $f12, $f14
li $v0,2
syscall

li $v0,10
syscall