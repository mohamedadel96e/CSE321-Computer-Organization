.data

prompt:         .asciiz "Enter an Integer: "
zeroMessage:    .asciiz "Zero\n"
posMessage:     .asciiz "Positive\n"
negMessage:     .asciiz "Negative\n"

.text

main:
    # Print the prompt
    li      $v0,    4
    la      $a0,    prompt
    syscall

    #Read the Integer
    li      $v0,    5
    syscall
    move    $t0,    $v0

if:
    bne     $t0,    $zero,          elif
    la      $a0,    zeroMessage
    j       endif
elif:
    bgez    $t0,    else
    la      $a0,    negMessage
    j       endif
else:
    la      $a0,    posMessage
    j       endif
endif:
    li      $v0,    4
    syscall

exit:
    li      $v0,    10
    syscall
