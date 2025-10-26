.data
newLine:    .asciiz "\n"
prompt:     .asciiz "Enter A Number: "
result:     .asciiz "Fibo Number is: "

.text

fibo:                                           # a0 = 1
    blez    $a0,        base_case
    li      $t1,        1
    beq     $a0,        $t1,        base_case

    li      $t0,        1
    li      $t1,        0

    li      $t3,        2
forLoop:
    bgt     $t3,        $a0,        endFor
    move    $t4,        $t0                     # temp = b
    add     $t0,        $t1,        $t0         # $t0 = $t1 + $t0 # b = a + b
    move    $t1,        $t4                     # $t1 = $t4     # a = temp
    addi    $t3,        $t3,        1           # $t3 = $t3 + 1

    j       forLoop                             # jump to forLoop
endFor:
    move    $v0,        $t0                     # $v0 = $t0
    jr      $ra
base_case:
    move    $v0,        $a0
    jr      $ra

main:

    addi    $sp,        $sp,        -4
    sw      $ra,        0($sp)

    # Print prompt
    li      $v0,        4
    la      $a0,        prompt
    syscall

    # Read integer
    li      $v0,        5
    syscall

    move    $a0,        $v0

    jal     fibo
    move    $t0,        $v0
    # Print result
    li      $v0,        4
    la      $a0,        newLine
    syscall

    li      $v0,        1
    move    $a0,        $t0                     # $t0 has Febo result
    syscall

    li      $v0,        4
    la      $a0,        newLine
    syscall

    # Exit
    lw      $ra,        0($sp)
    addi    $sp,        $sp,        4
    jr      $ra