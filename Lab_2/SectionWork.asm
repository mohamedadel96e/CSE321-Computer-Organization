# # Arithmetic Operations
# # Examples of common MIPS arithmetic instructions
#
#     li   $t0, 10        # $t0 = 10
#     li   $t1, 3         # $t1 = 3
#
#     add  $t2, $t0, $t1  # $t2 = $t0 + $t1 (signed, traps on overflow)
#     addu $t3, $t0, $t1  # $t3 = $t0 + $t1 (unsigned, no overflow trap)
#     addi $t4, $t0, -5   # $t4 = $t0 + (-5) (signed immediate)
#     addiu $t5, $t0, -20 # $t5 = $t0 + (-20) (unsigned immediate)
#
#     sub  $t6, $t0, $t1  # $t6 = $t0 - $t1 (signed)
#     subu $t7, $t0, $t1  # $t7 = $t0 - $t1 (unsigned)
#
#     mult $s0, $s1       # signed multiply -> 64-bit result in HI|LO
#     multu $s2, $s3      # unsigned multiply -> 64-bit result in HI|LO
#     mflo $a0            # move LO (low 32 bits of product) to $a0
#     mfhi $a1            # move HI (high 32 bits of product) to $a1
#
#     div  $s4, $s5       # signed divide: quotient -> LO, remainder -> HI
#     divu $s6, $s7       # unsigned divide
#
#     mul  $v0, $t0, $t1  # MIPS32: 32-bit multiply (product in rd)
#
#     # neg is a pseudo-instruction: neg rd, rs  => sub rd, $zero, rs
#     neg  $t8, $t1       # $t8 = -$t1


# Bitwise operations examples

li   $a0, 0xF0F0F0F0    # load example operands
li   $a1, 0x00FF00FF

and  $v0, $a0, $a1      # $v0 = $a0 & $a1
or   $v1, $a0, $a1      # $v1 = $a0 | $a1
xor  $v2, $a0, $a1      # $v2 = $a0 ^ $a1
nor  $v3, $a0, $a1      # $v3 = ~($a0 | $a1)

andi $t0, $a0, 0x00FF   # mask low byte: $t0 = $a0 & 0x00FF
ori  $t1, $a0, 0x0001   # set low bit:  $t1 = $a0 | 0x0001
xori $t2, $a0, 0xFFFF   # toggle low 16 bits

sll  $s0, $a1, 8        # logical left shift by 8
srl  $s1, $a1, 4        # logical right shift by 4
sra  $s2, $a1, 4        # arithmetic right shift by 4 (preserve sign)

li   $t3, 2
sllv $s3, $a1, $t3      # variable shift: use amount in $t3
srlv $s4, $a1, $t3
srav $s5, $a1, $t3

lui  $t4, 0x1234        # load upper immediate
ori  $t4, $t4, 0x5678   # now $t4 = 0x12345678

# (Optional extended instructions on some MIPS variants)
# clz  $t5, $a0         # count leading zeros (if supported)