`define RT     6'b000000  // R-type instructions use opcode 000000
`define addi   6'b001000  // add immediate
`define addiu  6'b001001  // Add Immediate Unsigned
`define slti   6'b001010  // set on less than immediate
`define lw     6'b100011  // load word
`define sw     6'b101011  // store word
`define beq    6'b000100  // branch if equal
`define j      6'b000010  // jump
`define jal    6'b000011  // jump and link
`define jr     6'b000000  // JR is an R-type instruction, uses opcode 000000


module controller(
	clk,
	rst,
	opcode,
	func,
	RegDst,
	Jmp,
	DataC,
	Regwrite,
	AluSrc,
	Branch,
	MemRead,
	MemWrite,
	MemtoReg,
	AluOperation
	);
	input 				clk,rst;
	input      [5:0] 	opcode,func;
	output reg [1:0]	RegDst,Jmp;
	output reg		    DataC,Regwrite,AluSrc,Branch,MemRead,MemWrite,MemtoReg;
	output reg [2:0]    AluOperation;

	always@(opcode,func) begin
		    {RegDst,Jmp,DataC,Regwrite,AluSrc,Branch,MemRead,MemWrite,MemtoReg,AluOperation}=0;
			case(opcode) 
				`RT: begin
					RegDst=2'b01;
					Regwrite=1;
					AluOperation=func[2:0];
					if (func == 6'b100010)
						AluOperation = 3'b011;
					else if (func == 6'b101010)
						AluOperation = 3'b100;
				 end
				`addi: begin
					Regwrite=1;
					AluSrc=1;
					AluOperation=3'b010;
				 end
				`addiu: begin
					Regwrite=1;
					AluSrc=1;
					AluOperation=3'b010;
				 end
				`slti: begin
					Regwrite=1;
					AluSrc=1;
					AluOperation=3'b100;
				 end
				`lw: begin
					Regwrite=1;
					AluSrc=1;
					AluOperation=3'b010;
					MemRead=1;
					MemtoReg=1;
				 end
				`sw: begin
					AluSrc=1;
					AluOperation=3'b010;
					MemWrite=1;
				 end
				`beq: begin
					AluOperation=3'b011;
					Branch=1;
				 end
				`j: begin
					Jmp=2'b01;

				 end
				`jal: begin
					RegDst=2'b10;
					DataC=1;
					Regwrite=1;
					Jmp=2'b01;
				 end
				`jr: begin
					Jmp=2'b10;
				 end
			endcase
	end
endmodule
