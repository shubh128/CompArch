.data


.text

main:


li $v0, 6
syscall
mov.s $f14, $f0


li $v0, 6
syscall
mov.s $f16, $f0

add.s $f2, $f14, $f16
mov.s $f12, $f2
li $v0,2
syscall

sub.s $f2, $f14, $f16
mov.s $f12, $f2
li $v0,2
syscall

neg.s $f18, $f16
add.s $f2, $f14, $f18
mov.s $f12, $f2
li $v0,2
syscall


li $v0,10
syscall