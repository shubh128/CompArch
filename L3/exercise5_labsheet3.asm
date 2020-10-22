.data

int0 : .word 10051
int1 : .word 98712
zero : .float 0.0 
msg: .asciiz "result of multiplication-->"
msg1: .asciiz "result of multiplication in float(single)--->"
msg2: .asciiz "result of multiplication in float(double)--->"
msg3: .asciiz "difference between   int and single(float) result-->"
msg4: .asciiz "difference between   int and double(float) result-->"
newline : .asciiz "\n"
gap : .asciiz "  "

.text

main:

lw $s0,int0
lw $s1,int1

# Integer Multiplication stored in $t0
mulo $t0,$s0,$s1
move $t1,$t0 # saving the result of mult to seperate reg

la $a0,msg
li $v0,4
syscall 

move $a0,$t0
li $v0,1
syscall # displaying the  result

la $a0,newline
li $v0,4
syscall

mtc1 $s0 ,$f1 # Move value to float reg
mtc1 $s1 ,$f2
cvt.s.w $f3,$f1 # Convert from int to single precision
cvt.s.w $f4,$f2
mul.s $f5,$f3,$f4 # Multiply single precision
cvt.w.s $f0,$f5 # Convert single to int for comparison later
la $a0,msg1
li $v0,4
syscall 

mov.s $f12,$f5 # Print single result
li $v0,2
syscall # display mul result in float (single)

la $a0,newline
li $v0,4
syscall

mfc1 $a0,$f0       #[Step D]
sub $s2,$t0,$a0  # store the diff btw float and int mul result




mtc1 $s0 ,$f0     #[Step E]

mtc1 $s1 ,$f2 

cvt.d.w $f4,$f0
cvt.d.w $f6,$f2
mul.d $f8,$f4,$f6
cvt.w.d $f10,$f8

la $a0,newline
li $v0,4
syscall


la $a0,msg2
li $v0,4
syscall 

mov.d $f12,$f8
li $v0,3
syscall

la $a0,newline
li $v0,4
syscall

mfc1 $a0,$f10  #[Step F]


sub $s3,$t0,$a0  # store the diff btw float and int mul result [Step G]




la $a0,newline
li $v0,4
syscall

la $a0,msg3
li $v0,4
syscall

move $a0,$s2
li $v0,1
syscall


la $a0,newline
li $v0,4
syscall

la $a0,msg4
li $v0,4
syscall

move $a0,$s3
li $v0,1
syscall

mul.s $f3,$f1,$f2
li $v0,10
syscall





