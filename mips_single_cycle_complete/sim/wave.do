onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb/mips_processor/DP/clk
add wave -noupdate /tb/mips_processor/DP/rst
add wave -noupdate -divider Regfile
add wave -noupdate -label {$t0} -radix unsigned {/tb/mips_processor/DP/RegFile/register[8]}
add wave -noupdate -label {$t1} -radix decimal {/tb/mips_processor/DP/RegFile/register[9]}
add wave -noupdate -label {$t2} {/tb/mips_processor/DP/RegFile/register[10]}
add wave -noupdate -label {$t3} {/tb/mips_processor/DP/RegFile/register[11]}
add wave -noupdate -label {$t4} -radix decimal -childformat {{{/tb/mips_processor/DP/RegFile/register[12][31]} -radix decimal} {{/tb/mips_processor/DP/RegFile/register[12][30]} -radix decimal} {{/tb/mips_processor/DP/RegFile/register[12][29]} -radix decimal} {{/tb/mips_processor/DP/RegFile/register[12][28]} -radix decimal} {{/tb/mips_processor/DP/RegFile/register[12][27]} -radix decimal} {{/tb/mips_processor/DP/RegFile/register[12][26]} -radix decimal} {{/tb/mips_processor/DP/RegFile/register[12][25]} -radix decimal} {{/tb/mips_processor/DP/RegFile/register[12][24]} -radix decimal} {{/tb/mips_processor/DP/RegFile/register[12][23]} -radix decimal} {{/tb/mips_processor/DP/RegFile/register[12][22]} -radix decimal} {{/tb/mips_processor/DP/RegFile/register[12][21]} -radix decimal} {{/tb/mips_processor/DP/RegFile/register[12][20]} -radix decimal} {{/tb/mips_processor/DP/RegFile/register[12][19]} -radix decimal} {{/tb/mips_processor/DP/RegFile/register[12][18]} -radix decimal} {{/tb/mips_processor/DP/RegFile/register[12][17]} -radix decimal} {{/tb/mips_processor/DP/RegFile/register[12][16]} -radix decimal} {{/tb/mips_processor/DP/RegFile/register[12][15]} -radix decimal} {{/tb/mips_processor/DP/RegFile/register[12][14]} -radix decimal} {{/tb/mips_processor/DP/RegFile/register[12][13]} -radix decimal} {{/tb/mips_processor/DP/RegFile/register[12][12]} -radix decimal} {{/tb/mips_processor/DP/RegFile/register[12][11]} -radix decimal} {{/tb/mips_processor/DP/RegFile/register[12][10]} -radix decimal} {{/tb/mips_processor/DP/RegFile/register[12][9]} -radix decimal} {{/tb/mips_processor/DP/RegFile/register[12][8]} -radix decimal} {{/tb/mips_processor/DP/RegFile/register[12][7]} -radix decimal} {{/tb/mips_processor/DP/RegFile/register[12][6]} -radix decimal} {{/tb/mips_processor/DP/RegFile/register[12][5]} -radix decimal} {{/tb/mips_processor/DP/RegFile/register[12][4]} -radix decimal} {{/tb/mips_processor/DP/RegFile/register[12][3]} -radix decimal} {{/tb/mips_processor/DP/RegFile/register[12][2]} -radix decimal} {{/tb/mips_processor/DP/RegFile/register[12][1]} -radix decimal} {{/tb/mips_processor/DP/RegFile/register[12][0]} -radix decimal}} -subitemconfig {{/tb/mips_processor/DP/RegFile/register[12][31]} {-height 14 -radix decimal} {/tb/mips_processor/DP/RegFile/register[12][30]} {-height 14 -radix decimal} {/tb/mips_processor/DP/RegFile/register[12][29]} {-height 14 -radix decimal} {/tb/mips_processor/DP/RegFile/register[12][28]} {-height 14 -radix decimal} {/tb/mips_processor/DP/RegFile/register[12][27]} {-height 14 -radix decimal} {/tb/mips_processor/DP/RegFile/register[12][26]} {-height 14 -radix decimal} {/tb/mips_processor/DP/RegFile/register[12][25]} {-height 14 -radix decimal} {/tb/mips_processor/DP/RegFile/register[12][24]} {-height 14 -radix decimal} {/tb/mips_processor/DP/RegFile/register[12][23]} {-height 14 -radix decimal} {/tb/mips_processor/DP/RegFile/register[12][22]} {-height 14 -radix decimal} {/tb/mips_processor/DP/RegFile/register[12][21]} {-height 14 -radix decimal} {/tb/mips_processor/DP/RegFile/register[12][20]} {-height 14 -radix decimal} {/tb/mips_processor/DP/RegFile/register[12][19]} {-height 14 -radix decimal} {/tb/mips_processor/DP/RegFile/register[12][18]} {-height 14 -radix decimal} {/tb/mips_processor/DP/RegFile/register[12][17]} {-height 14 -radix decimal} {/tb/mips_processor/DP/RegFile/register[12][16]} {-height 14 -radix decimal} {/tb/mips_processor/DP/RegFile/register[12][15]} {-height 14 -radix decimal} {/tb/mips_processor/DP/RegFile/register[12][14]} {-height 14 -radix decimal} {/tb/mips_processor/DP/RegFile/register[12][13]} {-height 14 -radix decimal} {/tb/mips_processor/DP/RegFile/register[12][12]} {-height 14 -radix decimal} {/tb/mips_processor/DP/RegFile/register[12][11]} {-height 14 -radix decimal} {/tb/mips_processor/DP/RegFile/register[12][10]} {-height 14 -radix decimal} {/tb/mips_processor/DP/RegFile/register[12][9]} {-height 14 -radix decimal} {/tb/mips_processor/DP/RegFile/register[12][8]} {-height 14 -radix decimal} {/tb/mips_processor/DP/RegFile/register[12][7]} {-height 14 -radix decimal} {/tb/mips_processor/DP/RegFile/register[12][6]} {-height 14 -radix decimal} {/tb/mips_processor/DP/RegFile/register[12][5]} {-height 14 -radix decimal} {/tb/mips_processor/DP/RegFile/register[12][4]} {-height 14 -radix decimal} {/tb/mips_processor/DP/RegFile/register[12][3]} {-height 14 -radix decimal} {/tb/mips_processor/DP/RegFile/register[12][2]} {-height 14 -radix decimal} {/tb/mips_processor/DP/RegFile/register[12][1]} {-height 14 -radix decimal} {/tb/mips_processor/DP/RegFile/register[12][0]} {-height 14 -radix decimal}} {/tb/mips_processor/DP/RegFile/register[12]}
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
add wave -noupdate -divider {New Divider}
add wave -noupdate /tb/mips_processor/DP/ALU/alu_result
add wave -noupdate /tb/mips_processor/DP/data_mem/read_data
add wave -noupdate /tb/mips_processor/DP/data_mem/write_data
add wave -noupdate /tb/mips_processor/DP/data_mem/addr
add wave -noupdate /tb/mips_processor/DP/data_mem/mem_read
add wave -noupdate /tb/mips_processor/DP/data_mem/mem_write
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1400 ns} 0}
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
WaveRestoreZoom {1369 ns} {1447 ns}
