# MIPS Assembly Program to demonstrate the use of jal and jr with NOP instructions

.data
    result: .word 0       # Variable to store the result

.text
.globl main

main:
    # Initialize registers
    li $t0, 10            # Load immediate value 10 into register $t0
    nop                   # NOP 1
    nop                   # NOP 2
    nop                   # NOP 3

    li $t1, 20            # Load immediate value 20 into register $t1
    nop                   # NOP 1
    nop                   # NOP 2
    nop                   # NOP 3

    # Call the subroutine add_numbers
    jal add_numbers       # Jump to the subroutine and link (save return address in $ra)
    nop                   # NOP 1
    nop                   # NOP 2
    nop                   # NOP 3

    # Store the result in memory
    sw $t2, result        # Store the value in $t2 (result) into memory location 'result'
    nop                   # NOP 1
    nop                   # NOP 2
    nop                   # NOP 3

    # Enter an infinite loop
    j infinite_loop       # Jump to the infinite loop label
    nop                   # NOP 1
    nop                   # NOP 2
    nop                   # NOP 3

# Subroutine to add two numbers
add_numbers:
    # Add $t0 and $t1, store the result in $t2
    add $t2, $t0, $t1     # $t2 = $t0 + $t1
    nop                   # NOP 1
    nop                   # NOP 2
    nop                   # NOP 3

    # Return to the caller
    jr $ra                # Jump to the address in the return address register ($ra)
    nop                   # NOP 1
    nop                   # NOP 2
    nop                   # NOP 3

# Infinite loop label
infinite_loop:
    j infinite_loop       # Keep jumping to itself, creating an infinite loop
    nop                   # NOP 1
    nop                   # NOP 2
    nop                   # NOP 3
