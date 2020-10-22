.data
prompt1 : .asciiz "Enter the first number :"
prompt2 : .asciiz "Enter the second number :"
message : .asciiz "The higher number is :"

.text
main:
#print the first prompt
la $a0,prompt1
li $v0,4
syscall
#take double input
li $v0,7
syscall
mov.d $f2,$f0
#print the second prompt
la $a0, prompt2
li $v0,4
syscall
#take double input 
li $v0,7
syscall
mov.d $f4,$f0
#time to compare
c.le.d $f4,$f2
la $a0,message
li $v0,4
syscall
li $v0,3
bc1t higher
mov.d $f12,$f4
syscall
j end
higher: mov.d $f12,$f2
		syscall
end: li $v0,10
	 syscall 

