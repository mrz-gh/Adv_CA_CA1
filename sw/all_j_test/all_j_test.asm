# MIPS Assembly Program to demonstrate the use of jal and jalr

.data
    result1: .word 0       # Variable to store the result of first addition
    result2: .word 0       # Variable to store the result of second addition

.text
.globl main

main:
    # Initialize registers for the first subroutine
    li $t0, 10            # Load immediate value 10 into register $t0
    nop                   # NOP 1
    nop                   # NOP 2
    nop                   # NOP 3

    li $t1, 20            # Load immediate value 20 into register $t1
    nop                   # NOP 1
    nop                   # NOP 2
    nop                   # NOP 3

    # Call the first subroutine add_numbers using jal
    jal add_numbers       # Jump to the subroutine and link (save return address in $ra)
    nop                   # NOP 1
    nop                   # NOP 2
    nop                   # NOP 3

    # Store the result of the first addition in memory
    sw $t2, result1       # Store the value in $t2 (result of first addition) into memory location 'result1'
    nop                   # NOP 1
    nop                   # NOP 2
    nop                   # NOP 3

    # Initialize registers for the second subroutine
    li $t0, 30            # Load immediate value 30 into register $t0
    nop                   # NOP 1
    nop                   # NOP 2
    nop                   # NOP 3

    li $t1, 40            # Load immediate value 40 into register $t1
    nop                   # NOP 1
    nop                   # NOP 2
    nop                   # NOP 3

    # Prepare for jalr
    la $t3, add_numbers2  # Load the address of add_numbers2 into $t3
    nop                   # NOP 1
    nop                   # NOP 2
    nop                   # NOP 3

    # Call the second subroutine using jalr
    jalr $t3              # Jump to the address in $t3 and link (save return address in $ra)
    nop                   # NOP 1
    nop                   # NOP 2
    nop                   # NOP 3

    # Store the result of the second addition in memory
    sw $t2, result2       # Store the value in $t2 (result of second addition) into memory location 'result2'
    nop                   # NOP 1
    nop                   # NOP 2
    nop                   # NOP 3

    # Enter an infinite loop
    j infinite_loop       # Jump to the infinite loop label
    nop                   # NOP 1
    nop                   # NOP 2
    nop                   # NOP 3

# Subroutine to add two numbers (first subroutine)
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

# Subroutine to add two numbers (second subroutine)
add_numbers2:
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
