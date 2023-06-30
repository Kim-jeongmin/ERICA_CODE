# version 3, print something, then exit

# text segment
	.text
main:
	# the main program goes here
	la $a0, hello_string
	jal Print_string

	# call Exit
	jal Exit

# data segment
	.data
hello_string:
	.asciiz "Hello, world\n"



# text segment
.text

Print_integer: # print the integer in register a0
	li $v0, 1
	syscall
	jr $ra

Print_string: # print the string whose starting address is in register a0
	li $v0, 4
	syscall
	jr $ra

Exit:           # end the program, no explicit return status
        li      $v0, 10
        syscall
        jr      $ra
       
Exit2:           # end the program, with return status from register a0
        li      $v0, 17
        syscall
        jr      $ra