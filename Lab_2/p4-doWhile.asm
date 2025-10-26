.data
newLine:    .asciiz "\n"
prompt:     .asciiz "Enter an Integer: "
result:     .asciiz "The Sum = "
.text

main:
    li      $t1,        0

do:
    addi    $v0,        $0,         4
    la      $a0,        prompt
    syscall
    li      $v0,        5                   # To Read Integer
    syscall
    move    $t0,        $v0
    add     $t1,        $t1,        $t0     # $t1 = $t1 + $t0
while:
    bne     $t0,        $zero,      do
endDoWhile:
    addi    $v0,        $0,         4
    la      $a0,        result
    syscall
    move    $a0,        $t1
    li      $v0,        1
    syscall
    addi    $v0,        $0,         4
    la      $a0,        newLine
    syscall

exit:
    li      $v0,        10
    syscall