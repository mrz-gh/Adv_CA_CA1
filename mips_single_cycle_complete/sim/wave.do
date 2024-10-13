onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb/mips_processor/DP/clk
add wave -noupdate /tb/mips_processor/DP/rst
add wave -noupdate -divider Regfile
add wave -noupdate -label {$t0} -radix unsigned {/tb/mips_processor/DP/RegFile/register[8]}
add wave -noupdate -label {$t1} -radix decimal {/tb/mips_processor/DP/RegFile/register[9]}
add wave -noupdate -label {$t2} {/tb/mips_processor/DP/RegFile/register[10]}
add wave -noupdate -label {$t3} {/tb/mips_processor/DP/RegFile/register[11]}
add wave -noupdate -label {$t4} -radix decimal {/tb/mips_processor/DP/RegFile/register[12]}
add wave -noupdate -label {$at} -radix unsigned {/tb/mips_processor/DP/RegFile/register[1]}
add wave -noupdate -radix hexadecimal /tb/mips_processor/DP/out_pc
add wave -noupdate /tb/mips_processor/DP/instruction
add wave -noupdate /tb/mips_processor/DP/PC/in
add wave -noupdate /tb/mips_processor/DP/mux3_jmp/out
add wave -noupdate -radix binary /tb/mips_processor/CU/opcode
add wave -noupdate -divider ALU
add wave -noupdate /tb/mips_processor/DP/ALU/data1
add wave -noupdate -radix decimal /tb/mips_processor/DP/ALU/data2
add wave -noupdate /tb/mips_processor/DP/ALU/alu_op
add wave -noupdate /tb/mips_processor/DP/ALU/alu_result
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {11 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 251
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {78 ns}
