.data
array:  .word 10, 20, 30, 40, 50  # An array of integers
length: .word 5                   # Length of the array
sum:    .word 0                   # Variable to store the sum of the array
result: .word 0                   # Variable to store the final result

.text
.globl main
main:
    # Initialize registers
    li   $t0, 0           # $t0 will hold the sum (sum = 0)
    nop
    nop
    nop
    li   $t1, 0           # $t1 will be the index (i = 0)
    nop
    nop
    nop

    # Load the length of the array
    lw   $t2, length      # $t2 = length of the array
    nop
    nop
    nop

    # Load the base address of the array
    la   $t3, array       # $t3 = base address of the array
    nop
    nop
    nop

array_sum_loop:
    # Check if the index is less than the length of the array
    slt  $t4, $t1, $t2    # $t4 = 1 if $t1 < $t2, else $t4 = 0
    nop
    nop
    nop
    beq  $t4, $zero, end_sum # if $t4 == 0 (index >= length), exit loop
    nop
    nop
    nop

    # Load the current array element
    sll  $t5, $t1, 2      # $t5 = i * 4 (word offset)
    nop
    nop
    nop
    add  $t6, $t3, $t5    # $t6 = base address + offset
    nop
    nop
    nop
    lw   $t7, 0($t6)      # $t7 = array[i]
    nop
    nop
    nop

    # Add the current element to the sum
    add  $t0, $t0, $t7    # sum += array[i]
    nop
    nop
    nop

    # Increment the index
    addi $t1, $t1, 1      # i += 1
    nop
    nop
    nop

    # Repeat the loop
    j    array_sum_loop
    nop
    nop
    nop

end_sum:
    # Store the sum in memory
    sw   $t0, sum         # Save the sum to the memory location 'sum'
    nop
    nop
    nop

    # Load the constant 0xF0F0F0F0 using lui and ori
    lui  $t8, 0xF0F0      # Load the upper 16 bits
    nop
    nop
    nop
    ori  $t8, $t8, 0xF0F0 # Load the lower 16 bits
    nop
    nop
    nop

    # Perform a logical operation: bitwise AND with the constant
    and  $t9, $t0, $t8    # $t9 = sum & 0xF0F0F0F0
    nop
    nop
    nop

    # Shift the result to the right
    srl  $t9, $t9, 4      # Logical right shift $t9 by 4 bits
    nop
    nop
    nop

    # Store the final result in memory
    sw   $t9, result      # Save the final result to the memory location 'result'
    nop
    nop
    nop

infinite_loop:
    # Infinite loop
    j    infinite_loop    # Jump to itself to create an infinite loop
    nop
    nop
    nop
