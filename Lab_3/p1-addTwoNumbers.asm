.data



.text

add_func:
    add     $v0,        $a0,        $a1 # $v0 = $a0 + $a1
    jr      $ra                         # jump to $ra


main:
    addi    $sp,        $sp,        -4
    sw      $ra,        0($sp)

    li      $a0,        10
    li      $a1,        15

    jal     add_func                    # jump to add_func and save position to $ra

    move    $a0,        $v0

    li      $v0,        1
    syscall

returnMain:
    lw      $ra,        0($sp)
    addi	$sp, $sp, 4			# $sp = $sp + 4
    

    jr      $ra