# switch to the Data segment
	.data
	# global data is defined here
	# Don't forget the backslash-n (newline character)
Homework:
	.asciiz	"ENE 1004 23480 Assignment 1\n"
Name:	.asciiz "My name is: 2019041094 Kim-jeongmin"

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

# t0 : 앞에 16비트, t1 : 뒤에 16비트
andi $t0, $a0, 4294901760
andi $t1, $a0, 65535
# t5 : 맨 처음 비트, t6 : 맨 마지막 비트
addi $t5, $zero, 2147483648
addi $t6, $zero, 1
# t7 : for문 iterator
add $t7, $zero, $zero

# v0 0으로 초기화
andi $v0, $v0, 0

Loop:
	
	and $t2, $t0, $t5
	and $t3, $t1, $t6

	or $t4, $t2, $t3
	or $v0, $v0, $t4
	
	srl $t0, $t0, 1
	sll $t1, $t1, 1
	
	srl $t5, $t5, 2
	sll $t6, $t6, 2
	
	addi $t7, $t7, 1
	slti $t8, $t7, 16
	bne  $t8, $zero, Loop

jr   $ra


shuffle4:
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
