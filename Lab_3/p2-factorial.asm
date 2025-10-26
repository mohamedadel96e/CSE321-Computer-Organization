
.data
prompt:     .asciiz "Enter a number: "
newLine:    .asciiz "\n"

.text

fact:
    # Base case: if n <= 1, return 1
    blez    $a0,    base_case
    li      $t2,    1
    beq     $a0,    $t2,        base_case

    # Recursive case: n * fact(n-1)
    addi    $sp,    $sp,        -8          # Make space for $ra and $a0
    sw      $ra,    0($sp)
    sw      $a0,    4($sp)

    addi    $a0,    $a0,        -1          # n-1
    jal     fact                            # fact(n-1)

    lw      $a0,    4($sp)                  # Restore $a0 (n)
    lw      $ra,    0($sp)
    addi    $sp,    $sp,        8

    mul     $v0,    $a0,        $v0         # n * fact(n-1)
    jr      $ra

base_case:
    li      $v0,    1
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

    jal     fact                            # Call fact
    move    $t0,    $v0
    # Print result
    li      $v0,    4
    la      $a0,    newLine
    syscall

    li      $v0,    1
    move    $a0,    $t0                     # $v0 has factorial result
    syscall

    # Exit
    lw      $ra,    0($sp)
    addi    $sp,    $sp,        4
    jr      $ra