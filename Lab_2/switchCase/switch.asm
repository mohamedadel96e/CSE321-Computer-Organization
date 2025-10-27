.data
menuPrompt:     .asciiz "Enter Your Choice(1,2,3): "
option1:        .asciiz "You selected option 1\n"
option2:        .asciiz "You selected option 2\n"
option3:        .asciiz "You selected option 3\n"
invalidOption:  .asciiz "Invalid option selected\n"
newline:        .asciiz "\n"


.text
main:

    li      $v0,            4
    la      $a0,            menuPrompt
    syscall
    li      $v0,            5
    syscall
    move    $t0,            $v0

    beq     $t0,            1,              case1
    beq     $t0,            2,              case2
    beq     $t0,            3,              case3
    j       default_option

case1:
    li      $v0,            4
    la      $a0,            option1
    syscall
    j       end_switch

case2:
    li      $v0,            4
    la      $a0,            option2
    syscall
    j       end_switch

case3:
    li      $v0,            4
    la      $a0,            option3
    syscall
    j       end_switch

default_option:
    li      $v0,            4
    la      $a0,            invalidOption
    syscall

end_switch:
exit:
    li      $v0,            10
    syscall