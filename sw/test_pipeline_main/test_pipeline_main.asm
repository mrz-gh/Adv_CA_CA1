.data
array: .word 5, -3, 12, 7, -8, 19, 0, -15, 22, 10  # 10-element array
length: .word 11
maxValue: .word 0

.text
.globl main

main:
    la $t0, array          # Load address of array into $t0
    nop
    nop
    nop
    lw $t1, ($t0)          # Load the first element into $t1 (current max)
    nop
    nop
    nop
    li $t2, 1              # Load immediate value 1 into $t2
    nop
    nop
    nop
    lw $t3, length         # Load the length of the array into $t3
    nop
    nop
    nop
    sub $t3, $t3, 1        # Decrement $t3 by 1
    nop
    nop
    nop

loop:
    beq $t3, $zero, done   # If $t3 is 0, go to done
    nop
    nop
    nop
    lw $t4, 0($t0)         # Load current array element into $t4
    nop
    nop
    nop
    addi $t0, $t0, 4       # Increment $t0 to point to the next array element
    nop
    nop
    nop
    ble $t4, $t1, skip     # If $t4 <= $t1, skip the update
    nop
    nop
    nop
    move $t1, $t4          # Update max to $t4
    nop
    nop
    nop

skip:
    sub $t3, $t3, 1        # Decrement $t3
    nop
    nop
    nop
    j loop                 # Jump back to the loop label
    nop
    nop
    nop

done:
    sw $t1, maxValue       # Store the maximum value in memory
    nop
    nop
    nop

infinite_loop:
    j infinite_loop        # Jump to itself to create an infinite loop
    nop
    nop
    nop

