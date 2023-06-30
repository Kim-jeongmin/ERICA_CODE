# switch to the Data segment
	.data
	# global data is defined here
	# Don't forget the backslash-n (newline character)
Homework:
	.asciiz	"ENE 1004 23480 Assignment 1\n"
Name:	.asciiz "My name is: ÄÄÇ»ÅÍÇÐºÎ 2019041094 ±èÁ¤¹Î"

# switch to the Text segment
	.text
	# the program is defined here
	.globl	main
main:
	# Whose program is this?
	la	$a0, Homework
	jal	Print_string
	la	$a0, Name
	jal	Print_string
	
	la	$a0, cr
	jal	Print_string
	la	$a0, header
	jal	Print_string
	
	# int i, n;
	# for (i = 0; i < 18; i++)
	#   {
	#      ... calculate n from i
	#      ... print i and n
	#   }
	
	# register assignments
	#	$s0	i
	#	$s1	n
	#	$s2	address of testcase[0]
	#	$s3	testcase[i]
	#	$t0	temporary values
	#	$a0	argument to Print_integer, Print_string, etc.
	#	add to this list if you use any other registers
	
	la	$s2, testcase
	
	# for (i = 0; i < 18; i++)
	li	$s0, 0		# i = 0
	bge	$s0, 18, bottom
top:
	# calculate n from shuffle32(testcase[i])
	sll	$t0, $s0, 2	# 4*i
	add	$t0, $s2, $t0	# address of testcase[i]
	lw	$s3, 0($t0)	# testcase[i]
	
	move	$a0, $s3
	jal	shuffle32
	move	$s1, $v0	# n = shuffle32(testcase[i])
	
	# print i and n
	# if (i < 10) print an extra space for alignment
	bge	$s0, 10, L1
	la	$a0, sp		# space
	jal	Print_string
L1:
	move	$a0, $s0	# i
	jal	Print_integer
	la	$a0, sp		# space
	jal	Print_string
	move	$a0, $s3	# testcase[i]
	jal	Print_hex
	la	$a0, sp		# space
	jal	Print_string
	move	$a0, $s3	# testcase[i]
	jal	Print_binary
	la	$a0, sp		# space
	jal	Print_string
	move	$a0, $s1	# n
	jal	Print_binary
	la	$a0, sp		# space
	jal	Print_string
	move	$a0, $s1	# n
	jal	Print_hex
	la	$a0, cr		# newline
	jal	Print_string
	
	# for (i = 0; i < 18; i++)
	add	$s0, $s0, 1	# i++
	blt	$s0, 18, top	# i < 18
bottom:
	
	la	$a0, done	# mark the end of the program
	jal	Print_string
	
	jal	Exit	# end the program, no explicit return status

	
# switch to the Data segment
	.data
	# global data is defined here
sp:
	.asciiz	" "
cr:
	.asciiz	"\n"
done:
	.asciiz	"All done!\n"
header:
	.asciiz	" i testcase[i]           testcase[i] in binary        shuffled result in binary     result\n"

testcase:
	.word	0xffffffff,	#  0
		0xffff0000,	#  1
		0x0000ffff,	#  2
		0xff00ff00,	#  3
		0x00ff00ff,	#  4
		0xf0f0f0f0,	#  5
		0x0f0f0f0f,	#  6
		0xcccccccc,	#  7
		0x33333333,	#  8
		0xaaaaaaaa,	#  9
		0x55555555,	# 10
		0x00000000,	# 11
		0xffff0000,	# 12
		0xaaaaaaaa,	# 13
		0xcccccccc,	# 14
		0xf0f0f0f0,	# 15
		0xff00ff00,	# 16
		0x12345678	# 17
		
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Your part starts here

.text
# function shuffle32 to be defined here
shuffle32:
sub $sp, $sp, 4     # Adjust the stack pointer to make space for return address
sw $ra, 0($sp)  

andi $t0, $a0, 0xff000000       # $t0 = 11111111000000000000000000000000
andi $t1, $a0, 0x00ff0000 	# $t1 = 00000000111111110000000000000000
andi $t2, $a0, 0x0000ff00 	# $t2 = 00000000000000001111111100000000
andi $t3, $a0, 0x000000ff       # $t3 = 00000000000000000000000011111111

srl $t1, $t1, 8
sll $t2, $t2, 8

or $t4, $t0, $t2
or $t5, $t1, $t3

srl $t4, $t4, 16

move $a0, $t4
jal  shuffle16
move $t4, $v0

sll $t4, $t4, 16

move $a0, $t5
jal shuffle16
move $t5, $v0

or $v0, $t4, $t5

lw $ra, 0($sp)     # Restore the return address from the stack
addi $sp, $sp, 4   # Adjust the stack pointer to remove the return address
jr $ra


shuffle16:
sub $sp, $sp, 4     # Adjust the stack pointer to make space for return address
sw $ra, 0($sp)      # Save the return address on the stack

andi $t0, $a0, 0xf000         # $t0 = b16 b15 b14 b13 0000 0000 0000
andi $t1, $a0, 0x0f00         # $t1 = 0000 b12 b11 b10 b9 0000 0000
andi $t2, $a0, 0x00f0         # $t2 = 0000 0000 b8 b7 b6 b5 0000
andi $t3, $a0, 0x000f         # $t3 = 0000 0000 0000 b4 b3 b2 b1

srl $t1, $t1, 4               # $t1 = 0000 0000 b12 b11 b10 b9 0000
sll $t2, $t2, 4               # $t2 = 0000 b8 b7 b6 b5 0000 0000

or $t6, $t0, $t2              # $t6 = b16 b15 b14 b13 b8 b7 b6 b5 0000 0000
or $t7, $t1, $t3              # $t7 = 0000 0000 b12 b11 b10 b9 b4 b3 b2 b1

srl $t6, $t6, 8

move $a0, $t6
jal shuffle8	
move $t6, $v0		  

move $a0, $t7
jal shuffle8
move $t7, $v0    	

sll $t6, $t6, 8

or $v0, $t6, $t7

# Restore register values for the caller
lw $ra, 0($sp)     # Restore the return address from the stack
addi $sp, $sp, 4   # Adjust the stack pointer to remove the return address

jr $ra

.text
shuffle8:
sub $sp, $sp, 4     # Adjust the stack pointer to make space for return address
sw $ra, 0($sp)      # Save the return address on the stack

andi $t0, $a0, 0xC0        # $t0 = b7 b6 000000
andi $t1, $a0, 0x30        # $t1 = 00 b5 b4 0000
andi $t2, $a0, 0x0C        # $t2 = 0000 b3 b2 00
andi $t3, $a0, 0x03        # $t3 = 000000 b1 b0

srl $t1, $t1, 2            # $t1 = 0000 b5 b4 00
sll $t2, $t2, 2		   # $t2 = 00 b3 b2 0000

or $s4, $t0, $t2           # $t4 = b7 b6 b3 b2 0000 or $t5, $t1, $t3	   # $t5 = 0000 b5 b4 b1 b0
or $s5, $t1, $t3

srl $s4, $s4, 4		   # $t4 = 0000 b7 b6 b3 b2 

move $a0, $s4
jal shuffle4	
move $s4, $v0		   # $t4 = 0000 b7 b3 b6 b2 

move $a0, $s5
jal shuffle4
move $s5, $v0    	   # $t5 = 0000 b5 b1 b4 b0

sll $s4, $s4, 4            # $t4 = b7 b3 b6 b2 0000

or $v0, $s4, $s5  	   # $v0 = b7 b3 b6 b2 b5 b1 b4 b0

lw $ra, 0($sp)     # Restore the return address from the stack
addi $sp, $sp, 4   # Adjust the stack pointer to remove the return address

jr $ra





.text
shuffle4:
sub $sp, $sp, 4     # Adjust the stack pointer to make space for return address
sw $ra, 0($sp)      # Save the return address on the stack
# $a0 = (00000000 00000000 00000000 0000) b3 b2 b1 b0 (input) - decimal, hexdecial, binary
# $v0 = (00000000 00000000 00000000 0000) b3 b1 b2 b0 (output)

andi $t0, $a0, 9   # 9 = (0x28bits)1001 & b3 b2 b1 b0 = b3 0 0 b0; $t0 = b3 0 0 b0
andi $t1, $a0, 2   # 2 = (0x28bits)0010 & b3 b2 b1 b0 = 0 0 b1 0; $t1 = 0 0 b1 0
andi $t2, $a0, 4   # 4 = (0x28bits)0100 & b3 b2 b1 b0 = 0 b2 0 0; $t2 = 0 b2 0 0

sll  $t1, $t1, 1   # $t1= 0 b1 0 0
srl  $t2, $t2, 1   # $t2 = 0 0 b2 0

# combine $t0 + $t1 + $t2: b3 b1 b2 b0
or   $v0, $t1, $t2   # $v0 = (0x28bits) 0 b1 b2 0
or   $v0, $v0, $t0   # $v0 = (0x28bits) b3 b1 b2 b0

lw $ra, 0($sp)     # Restore the return address from the stack
addi $sp, $sp, 4   # Adjust the stack pointer to remove the return address
jr   $ra
# Your part ends here



















# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Wrapper functions around some of the system calls
# See P&H COD, Fig. B.9.1, for the complete list.  More are available with MARS.

# switch to the Text segment
	.text
	
	.globl	Print_integer
Print_integer:	# print the integer in register a0, decimal
	li	$v0, 1
	syscall
	jr	$ra

	.globl	Print_hex
Print_hex:	# print the integer in register a0, hexadecimal
	li	$v0, 34
	syscall
	jr	$ra

	.globl	Print_binary
Print_binary:	# print the integer in register a0, binary
	li	$v0, 35
	syscall
	jr	$ra

	.globl	Print_string
Print_string:	# print the string whose starting address is in register a0
	li	$v0, 4
	syscall
	jr	$ra

	.globl	Exit
Exit:		# end the program, no explicit return status
	li	$v0, 10
	syscall
	jr	$ra

	.globl	Exit2
Exit2:		# end the program, with return status from register a0
	li	$v0, 17
	syscall
	jr	$ra
