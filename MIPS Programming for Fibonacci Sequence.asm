.data
user_prompt: .asciiz 'Entr an integer, N. (NOTE: N must be >= 22)"
error: .asciiz "Illegal Number!\n"
Fib_title: .asciiz "Fibonacci Sequence:\n"
insert_space: .asciiz " "
insert_new_line: .asciiz "\n"

.text
.globl main

main:

#step 1

input_loop: #keep prompting user for num

li $v0, 4
la $a0, user_prompt
syscall

#recieve num
li $v0, 5
syscall