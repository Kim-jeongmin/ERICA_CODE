	
	.text

main:
	subu $sp, $sp, 40 # this number depends on how much will be put on the stack
	sw $0, 24($sp) # sum = 0
	sw $0, 28($sp) # i = 0
loop:
	lw $t6, 28($sp) # i
	mul $t7, $t6, $t6 # i * i
	lw $t8, 24($sp) # sum
	addu $t9, $t8, $t7 # sum + i*i
	sw $t9, 24($sp) # sum = sum + i*i
	addu $t0, $t6, 1 # i + 1
	sw $t0, 28($sp) # i = i + 1
	ble $t0, 100, loop # if (i <= 100) goto loop

	la $a0, str1
	jal Print_string # print the string whose starting address is in register a0
	lw $a0, 24($sp) # sum
	jal Print_integer # print the integer in register a0
	la $a0, str2
	jal Print_string # print the string whose starting address is in register a0

	move $a0, $0
	jal Exit2 # end the program, with return status from register a0

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

	.data
# .align 0	
str1:
	.asciiz "The sum from 0 .. 100 is :"
str2:
	.asciiz "\n"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -


# switch to the Text segment
	.text

Print_integer: # print the integer in register a0
	li $v0, 1
	syscall
	jr $ra

Print_string: # print the string whose starting address is in register a0
	li $v0, 4
	syscall
	jr $ra

Exit: # end the program, no explicit return status
	li $v0, 10
	syscall
	jr $ra

Exit2: # end the program, with return status from register a0
	li $v0, 17
	syscall
	jr $ra
	