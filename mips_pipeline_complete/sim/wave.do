onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb/mips_processor/clk
add wave -noupdate /tb/mips_processor/rst
add wave -noupdate -divider Regfile
add wave -noupdate -expand /tb/mips_processor/RegFile/register
add wave -noupdate -label {$at} {/tb/mips_processor/RegFile/register[1]}
add wave -noupdate -label {$t0} {/tb/mips_processor/RegFile/register[8]}
add wave -noupdate -label {$t1} -radix decimal {/tb/mips_processor/RegFile/register[9]}
add wave -noupdate -label {$t2} {/tb/mips_processor/RegFile/register[10]}
add wave -noupdate -label {$t3} {/tb/mips_processor/RegFile/register[11]}
add wave -noupdate -label {$t4} -radix decimal {/tb/mips_processor/RegFile/register[12]}
add wave -noupdate -divider IF
add wave -noupdate -radix unsigned /tb/mips_processor/pc_IF
add wave -noupdate -radix unsigned /tb/mips_processor/in_pc
add wave -noupdate -divider ID
add wave -noupdate -radix unsigned /tb/mips_processor/pc_ID
add wave -noupdate /tb/mips_processor/instruction_ID
add wave -noupdate /tb/mips_processor/MemRead_ID
add wave -noupdate /tb/mips_processor/MemWrite_ID
add wave -noupdate /tb/mips_processor/RegWrite_ID
add wave -noupdate /tb/mips_processor/read_data1_reg_ID
add wave -noupdate /tb/mips_processor/read_data2_ID
add wave -noupdate /tb/mips_processor/read_data2_reg_ID
add wave -noupdate /tb/mips_processor/AluOperation_ID
add wave -noupdate /tb/mips_processor/rt_ID
add wave -noupdate /tb/mips_processor/rd_ID
add wave -noupdate /tb/mips_processor/imm_en
add wave -noupdate /tb/mips_processor/imm_extended_ID
add wave -noupdate /tb/mips_processor/Branch_ID
add wave -noupdate /tb/mips_processor/DataC_ID
add wave -noupdate -divider EXE
add wave -noupdate /tb/mips_processor/Branch_EX
add wave -noupdate /tb/mips_processor/zero_EX
add wave -noupdate /tb/mips_processor/imm_extended_EX
add wave -noupdate /tb/mips_processor/RegWrite_EX
add wave -noupdate /tb/mips_processor/alu_result_EX
add wave -noupdate /tb/mips_processor/read_data1_reg_EX
add wave -noupdate /tb/mips_processor/read_data2_EX
add wave -noupdate /tb/mips_processor/read_data2_reg_EX
add wave -noupdate /tb/mips_processor/AluOperation_EX
add wave -noupdate /tb/mips_processor/rt_EX
add wave -noupdate /tb/mips_processor/write_reg_EX
add wave -noupdate /tb/mips_processor/MemWrite_EX
add wave -noupdate /tb/mips_processor/MemRead_EX
add wave -noupdate /tb/mips_processor/rd_EX
add wave -noupdate /tb/mips_processor/DataC_EX
add wave -noupdate -divider MEM_stage
add wave -noupdate /tb/mips_processor/alu_result_MEM
add wave -noupdate /tb/mips_processor/MemRead_MEM
add wave -noupdate /tb/mips_processor/MemWrite_MEM
add wave -noupdate /tb/mips_processor/RegWrite_MEM
add wave -noupdate /tb/mips_processor/write_data_reg_MEM
add wave -noupdate /tb/mips_processor/read_data2_reg_MEM
add wave -noupdate /tb/mips_processor/read_data_mem
add wave -noupdate /tb/mips_processor/write_reg_MEM
add wave -noupdate /tb/mips_processor/DataC_MEM
add wave -noupdate -divider WB
add wave -noupdate /tb/mips_processor/RegWrite_WB
add wave -noupdate /tb/mips_processor/write_data_reg_WB
add wave -noupdate /tb/mips_processor/write_reg_WB
add wave -noupdate /tb/mips_processor/DataC_WB
add wave -noupdate -divider ALU
add wave -noupdate /tb/mips_processor/ALU/data1
add wave -noupdate /tb/mips_processor/ALU/data2
add wave -noupdate /tb/mips_processor/ALU/alu_op
add wave -noupdate /tb/mips_processor/ALU/alu_result
add wave -noupdate /tb/mips_processor/ALU/zero_flag
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {100 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 213
configure wave -valuecolwidth 75
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
WaveRestoreZoom {3916 ns} {4011 ns}
