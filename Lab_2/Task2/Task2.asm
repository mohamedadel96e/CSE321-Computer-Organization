.data

numCountPrompt: .asciiz "Enter number of integers (n): "
numPrompt:      .asciiz "Enter an integer: "
resultPrompt:   .asciiz "The average of the numbers is: "
newline:        .asciiz "\n"

.text
main:

    li $v0, 4
    la $a0, numCountPrompt
    syscall

    li $v0, 5          
    syscall
    move $t0, $v0      

    li $t1, 0     # sum = 0    
    li $t2, 0     # count = 0     

while_loop:
    
    beq $t2, $t0, loop_end

    li $v0, 4
    la $a0, numPrompt
    syscall

    li $v0, 5
    syscall

    add $t1, $t1, $v0  

    addi $t2, $t2, 1   
    j while_loop

loop_end:
    mtc1 $t1, $f0          
    cvt.s.w $f0, $f0       

    mtc1 $t0, $f1          
    cvt.s.w $f1, $f1      

    div.s $f12, $f0, $f1   

   
    li $v0, 4
    la $a0, resultPrompt
    syscall

    li $v0, 2
    syscall

    li $v0, 4
    la $a0, newline
    syscall

exit:
    li $v0, 10
    syscall
