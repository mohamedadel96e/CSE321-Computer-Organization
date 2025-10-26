.data                                                   # memory
firstNumberPrompt:  .asciiz "Enter the first number: "
secondNumberPrompt: .asciiz "Enter the second number: "
outputMessage: .asciiz "The Answer is: "

.text                                                   #code
main:
    li      $v0,    4
    la      $a0,    firstNumberPrompt
    syscall
    li      $v0,    5
    syscall

    move 	$t0,$v0		# $t0 =$v0

    li      $v0,    4
    la      $a0,    secondNumberPrompt
    syscall
    li      $v0, 5
    syscall

    move 	$t1, $v0		# $t1 = $v0

    
    li      $v0,    4
    la      $a0,    outputMessage
    syscall
    
    add		$a0, $t0, $t1		# $a0 = $t0 + $t1
    li      $v0,    1
    syscall

    li      $v0,    10
    syscall