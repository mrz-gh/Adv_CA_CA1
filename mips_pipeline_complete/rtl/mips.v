`timescale 1ns/1ns

module mips(
	input wire clk,
	input wire rst,
	output wire [31:0] out1,
	output wire [31:0] out2
	);


	wire MemRead_ID, MemRead_EX , MemRead_MEM; 
	wire MemWrite_ID, MemWrite_EX , MemWrite_MEM;
	wire RegWrite_ID, RegWrite_EX, RegWrite_MEM, RegWrite_WB;

	wire [31:0] write_data_reg_MEM, write_data_reg_WB;
	wire [31:0] alu_result_EX, alu_result_MEM;
	wire [31:0] instruction_IF, instruction_ID;
	wire [4:0] 	write_reg_EX, write_reg_MEM, write_reg_WB;
	wire [31:0] read_data1_reg_ID, read_data1_reg_EX;
	wire [31:0] read_data2_ID, read_data2_EX; // Data2 in ID stage
	wire [31:0] read_data2_reg_ID, read_data2_reg_EX, read_data2_reg_MEM;
	wire [31:0] imm_extended_ID, imm_extended_EX;
	wire imm_en;
	wire write_reg_sel_ID, write_reg_sel_EX;
	wire [31:0] read_data_mem;

	wire [2:0] AluOperation_ID, AluOperation_EX;

	wire [31:0] in_pc, pc_IF, pc4_IF, pc_ID;
	wire [4:0] rd_ID, rd_EX, rt_ID, rt_EX;

	wire [1:0] PCSrc_ID;
	wire Branch_ID, Branch_EX;

	wire zero_EX;




	///////////// IF Stage /////////////////////////////
	pc PC(.clk(clk),.rst(rst),.in(in_pc),.out(pc_IF));

	adder adder_of_pc(.clk(clk),.data1(pc_IF),.data2(32'd4),.sum(pc4_IF));
	
	inst_memory InstMem(.clk(clk),.rst(rst),.adr(pc_IF),.instruction(instruction_IF));

	assign in_pc = (zero_EX & Branch_EX) ?  (pc_ID + (imm_extended_EX << 2)) : 
				(PCSrc_ID == 2'b00) ?  pc4_IF:
				(PCSrc_ID == 2'b01) ?  {pc_IF[31:28], instruction_ID[25:0] ,2'b00} :
				(PCSrc_ID == 2'b10) ?  read_data1_reg_ID : 32'd0; // beq, bne
																// assume pc_ID = pc of EX inst + 4 ???

	
	///////////// ID Stage /////////////////////////////
	register #(64) IF_ID_preg(
		.clk_i (clk),
		.rst_ni(~rst),
		.clear_i(0),
		.ld_i(1'b1),
		.reg_di({pc_IF, instruction_IF}),
		.reg_qo({pc_ID, instruction_ID})
	);
	controller CU(
		.opcode(instruction_ID[31:26]),
		.func(instruction_ID[5:0]),
		.RegDst(write_reg_sel_ID),
		.PCSrc_o(PCSrc_ID),
		.DataC(),
		.RegWrite(RegWrite_ID),
		.Branch(Branch_ID),
		.MemRead(MemRead_ID),
		.MemWrite(MemWrite_ID),
	
		.AluOperation(AluOperation_ID),
		.imm_en_o(imm_en)
		);

	reg_file RegFile(.clk(clk), .rst(rst), .RegWrite(RegWrite_WB),.read_reg1(instruction_ID[25:21]),
					.read_reg2(instruction_ID[20:16]), .write_reg(write_reg_WB),.write_data(write_data_reg_WB),
					.read_data1(read_data1_reg_ID),.read_data2(read_data2_reg_ID));

	sign_extension sign_ext(.primary(instruction_ID[15:0]),.extended(imm_extended_ID));

	mux2_to_1 #(32) read_data2_mux (.data1(read_data2_reg_ID),.data2(imm_extended_ID),.sel(imm_en),.out(read_data2_ID));

	assign rt_ID = instruction_ID[20:16];
	assign rd_ID = instruction_ID[15:11];
	///////////// EX Stage /////////////////////////////
	register #(146) ID_EX_preg(
		.clk_i (clk),
		.rst_ni(~rst),
		.clear_i(0),
		.ld_i(1'b1),
		.reg_di({Branch_ID, imm_extended_ID, write_reg_sel_ID, MemWrite_ID, MemRead_ID, 
				AluOperation_ID, RegWrite_ID, rd_ID, rt_ID, read_data1_reg_ID, read_data2_ID, read_data2_reg_ID}),
		.reg_qo({Branch_EX, imm_extended_EX, write_reg_sel_EX, MemWrite_EX, MemRead_EX, 
				AluOperation_EX, RegWrite_EX, rd_EX, rt_EX, read_data1_reg_EX, read_data2_EX, read_data2_reg_EX})
	);

	alu ALU(
		.data1(read_data1_reg_EX),
		.data2(read_data2_EX),
		.alu_op(AluOperation_EX),
		.alu_result(alu_result_EX),
		.zero_flag(zero_EX)
		);

	mux2_to_1 #(32) write_reg_mux (.data1(rd_EX),.data2(rt_EX),.sel(write_reg_sel_EX),.out(write_reg_EX));


	
	///////////// MEM Stage /////////////////////////////
	register #(72) EX_MEM_preg(
		.clk_i (clk),
		.rst_ni(~rst),
		.clear_i(0),
		.ld_i(1'b1),
		.reg_di({MemWrite_EX, MemRead_EX, RegWrite_EX, write_reg_EX, read_data2_reg_EX, alu_result_EX}),
		.reg_qo({MemWrite_MEM, MemRead_MEM, RegWrite_MEM, write_reg_MEM, read_data2_reg_MEM, alu_result_MEM})
	);
	
	data_memory data_mem(.clk(clk),.rst(rst),.mem_read(MemRead_MEM),.mem_write(MemWrite_MEM),.adr(alu_result_MEM),
						 .write_data(read_data2_reg_MEM),.read_data(read_data_mem),.out1(out1),.out2(out2)); 

	mux2_to_1 #(32) write_data_reg_mux (.data1(alu_result_MEM),.data2(read_data_mem),
			.sel(MemRead_MEM),.out(write_data_reg_MEM)
			);

	
	///////////// WB Stage /////////////////////////////
	register #(38) MEM_WB_preg(
		.clk_i (clk),
		.rst_ni(~rst),
		.clear_i(0),
		.ld_i(1'b1),
		.reg_di({RegWrite_MEM, write_reg_MEM, write_data_reg_MEM}),
		.reg_qo({RegWrite_WB, write_reg_WB, write_data_reg_WB})
	);


endmodule
