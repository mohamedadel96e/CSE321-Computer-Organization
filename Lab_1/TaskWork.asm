.data
myName: .asciiz "Name: Mohamed Adel\n"
myID:   .asciiz "ID: 123456789\n"
Course: .asciiz "Course: CSE321-Computer-Organnization"

.text
main:
    li      $v0,    4
    la      $a0,    myName
    syscall
    la      $a0,    myID
    syscall
    la      $a0,    Course
    syscall
    li      $v0,    10
    syscall