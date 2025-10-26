.data
newLine:        .asciiz "\n"
numberPrompt:   .asciiz "Enter n: "
prompt:         .asciiz "Enter an Integer: "
result:         .asciiz "The Avg is: "
remainder:      .asciiz "The Remainder is: "

.text

main:
    li      $t1,    0
    li      $t3,    0
    li      $v0,    4
    la      $a0,    numberPrompt
    syscall

    li      $v0,    5                           # $v0 = 5
    syscall
    move    $t2,    $v0                         # $t2 = $v0 This is for tracking the numbers

do:
    li      $v0,    4
    la      $a0,    prompt
    syscall

    li      $v0,    5                           # $v0 = 5
    syscall
    add     $t1,    $t1,            $v0
    addi    $t3,    $t3,            1           # $t3 = $t3 + 1

while:
    bne     $t2,    $t3,            do

    li      $v0,    4
    la      $a0,    result
    syscall

    div     $t1,    $t2                         # $t1 / $t2
    mflo    $t2                                 # $t2 = floor($t1 / $t2)
    mfhi    $t3                                 # $t3 = $t1 % $t2

    move    $a0,    $t2
    li      $v0,    1
    syscall

    li      $v0,    4
    la      $a0,    newLine
    syscall

    li      $v0,    4
    la      $a0,    remainder
    syscall

    move    $a0,    $t3
    li      $v0,    1
    syscall

    li      $v0,    4
    la      $a0,    newLine
    syscall

endDoWhile:

    addi    $v0,    $0,             10          # System call 10 - Exit
    syscall                                     # execute

