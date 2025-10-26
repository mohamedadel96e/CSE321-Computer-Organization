.data

firstNumPrompt:     .asciiz "Enter first number:  "
secondNumPrompt:    .asciiz "Enter second number: "
thirdNumPrompt:    .asciiz "Enter third number: "
fourthNumPrompt:    .asciiz "Enter fourh number: "
resultPrompt:       .asciiz "The result is: "

newline:            .asciiz "\n"


.text

main:
    li $v0, 4
    la $a0, firstNumPrompt
    syscall

    li $v0, 5
    syscall
    move $t0, $v0

    li $v0, 4
    la $a0, secondNumPrompt
    syscall

    li $v0, 5
    syscall
    move $t1, $v0

    li $v0, 4
    la $a0, thirdNumPrompt
    syscall

    li $v0, 5
    syscall
    move $t2, $v0

    li $v0, 4
    la $a0, fourthNumPrompt
    syscall

    li $v0, 5
    syscall
    move $t3, $v0
    


    li $v0, 4
    la $a0, resultPrompt
    syscall

    add $t5, $t0, $t1
    add $t6, $t2, $t3
    add $t7, $t5, $t6

    mtc1 $t7, $f0          
    cvt.s.w $f0, $f0       

    li $t8, 4
    mtc1 $t8, $f1
    cvt.s.w $f1, $f1

    div.s $f12, $f0, $f1

    li $v0, 2
    syscall

    li $v0, 4
    la $a0, newline
    syscall


exit:
    li $v0, 10
    syscall