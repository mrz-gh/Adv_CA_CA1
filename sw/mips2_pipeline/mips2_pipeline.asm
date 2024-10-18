.data
array:  .word 10, 20, 30, 40, 50  # An array of integers
result: .word 0                   # Variable to store the final result
.text
.globl main
main:
    # Arithmetic operations
    li   $t0, 10         # Load immediate value into $t0
    nop
    nop
    nop
    li   $t1, 20         # Load immediate value into $t1
    nop
    nop
    nop
    add  $t2, $t0, $t1   # $t2 = $t0 + $t1
    nop
    nop
    nop
    addu $t3, $t0, $t1   # $t3 = $t0 + $t1 (unsigned)
    nop
    nop
    nop
    sub  $t4, $t1, $t0   # $t4 = $t1 - $t0
    nop
    nop
    nop
    subu $t5, $t1, $t0   # $t5 = $t1 - $t0 (unsigned)
    nop
    nop
    nop

    # Comparison operations
    slt  $t6, $t0, $t1   # $t6 = 1 if $t0 < $t1, else 0
    nop
    nop
    nop
    sltu $t7, $t0, $t1   # $t7 = 1 if $t0 < $t1 (unsigned), else 0
    nop
    nop
    nop

    # Logical operations
    and  $t8, $t0, $t1   # $t8 = $t0 & $t1
    nop
    nop
    nop
    or   $t9, $t0, $t1   # $t9 = $t0 | $t1
    nop
    nop
    nop
    xor  $t0, $t0, $t1   # $t0 = $t0 ^ $t1
    nop
    nop
    nop
    nor  $t1, $t0, $t1   # $t1 = ~($t0 | $t1)
    nop
    nop
    nop

    # Shift operations
    sll  $t2, $t2, 2     # $t2 = $t2 << 2
    nop
    nop
    nop
    srl  $t3, $t3, 1     # $t3 = $t3 >> 1 (logical)
    nop
    nop
    nop
    sllv $t4, $t2, $t1   # $t4 = $t2 << $t1 (variable shift)
    nop
    nop
    nop

    # Arithmetic operations with immediates
    addi $t5, $t5, 10    # $t5 = $t5 + 10
    nop
    nop
    nop
    addiu $t6, $t6, 5    # $t6 = $t6 + 5 (unsigned)
    nop
    nop
    nop
    slti $t7, $t0, 30    # $t7 = 1 if $t0 < 30, else 0
    nop
    nop
    nop
    sltiu $t8, $t0, 40   # $t8 = 1 if $t0 < 40 (unsigned), else 0
    nop
    nop
    nop

    # Logical operations with immediates
    andi $t9, $t1, 0xFF  # $t9 = $t1 & 0xFF
    nop
    nop
    nop
    ori  $t0, $t0, 0xF0  # $t0 = $t0 | 0xF0
    nop
    nop
    nop
    xori $t1, $t1, 0x0F  # $t1 = $t1 ^ 0x0F
    nop
    nop
    nop

    # Load upper immediate
    lui  $t2, 0x1234     # Load upper immediate 0x1234 into $t2
    nop
    nop
    nop

    # Load and store operations
    lw   $t3, array      # Load word from memory
    nop
    nop
    nop
    sw   $t3, result     # Store word to memory
    nop
    nop
    nop

    # Branch operations
    beq  $t0, $t1, label1 # Branch if $t0 == $t1
    nop
    nop
    nop
    bne  $t0, $t1, label2 # Branch if $t0 != $t1
    nop
    nop
    nop

label1:
    # Jump and link
    jal  func             # Jump to function and link
    nop
    nop
    nop

label2:
    # Unconditional jump
    j    infinite_loop    # Jump to infinite loop
    nop
    nop
    nop

func:
    # Jump return
    jr   $ra              # Return from function
    nop
    nop
    nop

infinite_loop:
    # Infinite loop
    j    infinite_loop    # Loop forever
    nop
    nop
    nop
