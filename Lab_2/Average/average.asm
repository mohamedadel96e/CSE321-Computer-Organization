.data
newLine:        .asciiz "\n"
numberPrompt:   .asciiz "Enter n: "
prompt:         .asciiz "Enter an Integer: "
result:         .asciiz "The Avg is: "

.text

main:
    # Prompt for n
    li      $v0, 4
    la      $a0, numberPrompt
    syscall

    li      $v0, 5
    syscall
    move    $t0, $v0          # $t0 = n

    li      $t1, 0
    mtc1    $zero, $f0        # $f0 = sum = 0.0

input_loop:
    bge     $t1, $t0, calc_avg   # if counter >= n, break

    # Prompt for integer
    li      $v0, 4
    la      $a0, prompt
    syscall

    li      $v0, 5
    syscall
    mtc1    $v0, $f2           # move int to float register
    cvt.s.w $f2, $f2           # convert int to float

    add.s   $f0, $f0, $f2      # sum($f0) += input

    addi    $t1, $t1, 1        # counter++

    j       input_loop

calc_avg:
    # Convert n to float
    mtc1    $t0, $f4
    cvt.s.w $f4, $f4

    div.s   $f6, $f0, $f4      # avg($f6) = sum / n

    # Print result
    li      $v0, 4
    la      $a0, result
    syscall

    mov.s   $f12, $f6
    li      $v0, 2             # print float
    syscall

    li      $v0, 4
    la      $a0, newLine
    syscall

    # Exit
    jr		$ra					# jump to $ra
