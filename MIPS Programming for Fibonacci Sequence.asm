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
move $t0, $v0 #make t0 = N integer

#illegal num check
li $t1, 22
blt $t0, $t1, illegal_num
j fib_generator  # if num is legal, move on

illegal_num: #runs if the input is an illegal num
    li $v0, 4
    la $a0, error_message
    syscall
    j input_loop

# Step 2

fib_generator:
    li $v0, 4
    la $a0, fib_title
    syscall

    #Init known Fibonacci values e.g. 0 and 1
    li $t2, 0
    li $t3, 1
    move $t4, $t0

print_fib:
    beqz $t4, killswitch  # base case
