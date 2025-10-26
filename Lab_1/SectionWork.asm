.data
hello:      .asciiz "Hello, World!"
newline:    .asciiz "\n"

.text
main:
    # Print "Hello, World!"
    li      $v0,    4               # syscall for print string
    la      $a0,    hello           # load address of hello string
    syscall                         # make syscall

    # Print a newline
    li      $v0,    4               # syscall for print string
    la      $a0,    newline         # load address of newline string
    syscall                         # make syscall

    # Exit program
    li      $v0,    10              # syscall for exit
    syscall                         # make syscall
    # End of program

    # Quick notes:
    # v0 is responsible for syscall code if
    # v0 = 4, it means print string
    # v0 = 10, it means exit program
    # v0 = 1, it means print integer
    # v0 = 5, it means read integer
    # a0 is responsible for the first argument to syscall
    # a1 is responsible for the second argument to syscall
    # a2 is responsible for the third argument to syscall
    # a3 is responsible for the fourth argument to syscall
    # la is load address instruction
    # li is load immediate instruction
    # syscall is the instruction to make a system call
    # .data section is for declaring initialized data or constants
    # .text section is for the code segment
    # .asciiz is for declaring null-terminated strings
    # main is the label for the main function
    # the data in .data section can be accessed using the la instruction
    # and it is in the form of address
    # the program starts executing from the main label