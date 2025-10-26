
.data
prompt:     .asciiz "Enter a number: "
newLine:    .asciiz "\n"

.text

fibo:                                       # a0 = 1
    blez    $a0,    base_case
    li      $t1,    1
    beq     $a0,    $t1,        base_case

    addi    $sp,    $sp,        -12         # allocate 12 bytes ($ra, $a0, saved t3)
    sw      $ra,    0($sp)
    sw      $a0,    4($sp)

    addi    $a0,    $a0,        -1
    jal     fibo
    move    $t3,    $v0
    sw      $t3,    8($sp)                  # save first result

    lw      $a0,    4($sp)
    addi    $a0,    $a0,        -2
    jal     fibo
    move    $t4,    $v0

    lw      $t3,    8($sp)                  # restore first result
    add     $v0,    $t3,        $t4
    lw      $ra,    0($sp)
    addi    $sp,    $sp,        12

    jr      $ra
base_case:
    move    $v0,    $a0
    jr      $ra


main:
    addi    $sp,    $sp,        -4
    sw      $ra,    0($sp)

    # Print prompt
    li      $v0,    4
    la      $a0,    prompt
    syscall

    # Read integer
    li      $v0,    5
    syscall

    move    $a0,    $v0                     # Pass input to fact

    jal     fibo                            # Call fibo
    move    $t0,    $v0
    # Print result
    li      $v0,    4
    la      $a0,    newLine
    syscall

    li      $v0,    1
    move    $a0,    $t0                     # $t0 has Febo result
    syscall

    li      $v0,    4
    la      $a0,    newLine
    syscall

    # Exit
    lw      $ra,    0($sp)
    addi    $sp,    $sp,        4
    jr      $ra