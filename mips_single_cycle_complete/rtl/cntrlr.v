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
`define sltiu  6'b001011  // set on less than immediate unsigned
`define andi   6'b001100  // AND immediate
`define ori    6'b001101  // OR immediate
`define xori   6'b001110  // XOR immediate
`define lui    6'b001111  // Load Upper Immediate
`define bne    6'b000101  // branch if not equal


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
	AluOperation,
	signed_imm
	);
	input 				clk,rst;
	input      [5:0] 	opcode,func;
	output reg [1:0]	RegDst,Jmp;
	output reg		    DataC,Regwrite,AluSrc,Branch,MemRead,MemWrite,MemtoReg;
	output reg [3:0]    AluOperation;
	output reg			signed_imm;

	always@(opcode,func) begin
		    {signed_imm,RegDst,Jmp,DataC,Regwrite,AluSrc,Branch,MemRead,MemWrite,MemtoReg,AluOperation}=0;
			case(opcode) 

				`sltiu: begin
               
				Regwrite=1;
				AluOperation=4'b0100;
				AluSrc=1;
            	end
            	`andi: begin
					
            	    Regwrite = 1;
            	    AluSrc=1;
            	    AluOperation = 4'b0000; 
            	end
            	`ori: begin
					
            	    Regwrite = 1;
            	    AluSrc=1;
            	    AluOperation = 4'b0001; 
            	end
            	`xori: begin
					
            	    Regwrite = 1;
            	    AluSrc=1;
            	    AluOperation = 4'b0110; 
            	end
            	`lui: begin

            	    Regwrite = 1;
            	    AluSrc=1;
            	    AluOperation = 4'b0111; // Assuming a unique ALU code for LUI
            	end
            	`bne: begin
            	    AluOperation=4'b0011;
					Branch=1;
            	end
				`RT: begin
					RegDst=2'b01;
					Regwrite=1;
					case (func)
						6'b100010: AluOperation = 4'b0011; // Sub
						6'b101010: AluOperation = 4'b0100; // Slt
						6'b100000: AluOperation = 4'b0010; // add
						6'b100001: AluOperation = 4'b0010; // addu
						6'b100011: AluOperation = 4'b0011; // subu
						6'b101011: AluOperation = 4'b0100; // sltu
						6'b100100: AluOperation = 4'b0000; // and
						6'b100101: AluOperation = 4'b0001; // or
						6'b100110: AluOperation = 4'b0110; // xor
						6'b100111: AluOperation = 4'b0101; // nor
						6'b000000: AluOperation = 4'b1000; // sll
						6'b000010: AluOperation = 4'b1001; // srl
						6'b000011: AluOperation = 4'b1010; // sra
						6'b000100: AluOperation = 4'b1011; // sllv
						6'b000110: AluOperation = 4'b1100; // srlv
						6'b000111: AluOperation = 4'b1101; // srav
					endcase
				 end
				`addi: begin
					signed_imm=1;
					Regwrite=1;
					AluSrc=1;
					AluOperation=4'b0010;
				 end
				`addiu: begin
					Regwrite=1;
					AluSrc=1;
					AluOperation=4'b0010;
				 end
				`slti: begin
					signed_imm=1;
					Regwrite=1;
					AluSrc=1;
					AluOperation=4'b0100;
				 end
				`lw: begin
					signed_imm=1;
					Regwrite=1;
					AluSrc=1;
					AluOperation=4'b0010;
					MemRead=1;
					MemtoReg=1;
				 end
				`sw: begin
					AluSrc=1;
					AluOperation=4'b0010;
					MemWrite=1;
					signed_imm=1;
				 end
				`beq: begin
					AluOperation=4'b0011;
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
