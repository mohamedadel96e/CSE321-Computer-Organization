
.data
prompt:    .asciiz "Enter an integer: "
evenMsg:   .asciiz "The number is even.\n"
oddMsg:    .asciiz "The number is odd.\n"

.text
main:
    # print prompt
    li   $v0, 4
    la   $a0, prompt
    syscall

    # read integer
    li   $v0, 5
    syscall
    move $t1, $v0        # store input

    # check LSB to determine odd/even
    andi $t0, $t1, 1
    beq  $t0, $zero, print_even

print_odd:
    li   $v0, 4
    la   $a0, oddMsg
    syscall
    j    exit

print_even:
    li   $v0, 4
    la   $a0, evenMsg
    syscall

exit:
    li   $v0, 10
    syscall