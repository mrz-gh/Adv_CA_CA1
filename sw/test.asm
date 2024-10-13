.data
array: .word 5, -3, 12, 7, -8, 19, 0, -15, 22, 10  # 10-element array
length: .word 10
maxValue: .word 0

.text
.globl main

main:
    # Initialize pointers and load the first element of the array
    la $t0, array          # $t0 points to the start of the array
    lw $t1, ($t0)          # Load the first element into $t1 (current max)
    li $t2, 1              # $t2 is the index, starting from 1
    
    lw $t3, length         # Load the length of the array into $t3
    sub $t3, $t3, 1        # We already considered the first element, so $t3 = length - 1

loop:
    beq $t3, $zero, done   # If $t3 is 0, we are done
    lw $t4, 0($t0)         # Load current array element into $t4
    addi $t0, $t0, 4       # Move to the next array element
    
    # Compare $t4 with current max in $t1
    ble $t4, $t1, skip     # If $t4 <= $t1, skip updating max
    move $t1, $t4          # Update max to $t4
    
skip:
    sub $t3, $t3, 1        # Decrease $t3 (remaining elements to check)
    j loop                 # Repeat loop

done:
    sw $t1, maxValue       # Store the maximum value in memory

infinite_loop:
    j infinite_loop        # Jump to itself to create an infinite loop