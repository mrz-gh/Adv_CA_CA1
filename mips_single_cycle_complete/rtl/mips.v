module mips(
	clk,
	rst,
	out1,
	out2
	);
	input 					clk,rst;
	output wire [31:0] 		out1,out2;

	wire 		[5:0] 		opcode,func;
	wire 		[1:0]		RegDst,Jmp;
	wire 					DataC,Regwrite,AluSrc,Branch,MemRead,MemWrite,MemtoReg;
	wire 		[3:0]		AluOperation;
	wire					signed_imm;

	controller CU(.clk(clk),.rst(rst),.opcode(opcode),.func(func),.RegDst(RegDst),.Jmp(Jmp),
	              .DataC(DataC),.Regwrite(Regwrite),.AluSrc(AluSrc),.Branch(Branch),.MemRead(MemRead),.MemWrite(MemWrite),
				  .MemtoReg(MemtoReg),.AluOperation(AluOperation),.signed_imm());

	data_path DP(.clk(clk),.rst(rst),.RegDst(RegDst),.Jmp(Jmp),.DataC(DataC),.RegWrite(Regwrite),.AluSrc(AluSrc),
				 .Branch(Branch),.MemRead(MemRead),.MemWrite(MemWrite),.MemtoReg(MemtoReg),.AluOperation(AluOperation),
		         .func(func),.opcode(opcode),.out1(out1),.out2(out2),.signed_imm(signed_imm));
endmodule