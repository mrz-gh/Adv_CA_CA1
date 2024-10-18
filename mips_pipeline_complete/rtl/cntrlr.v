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
	input      [5:0] opcode,
	input      [5:0] func,
	output reg RegDst,
	output reg DataC,
	output reg RegWrite,
	output reg Branch,
	output reg MemRead,
	output reg MemWrite,

	output reg [1:0] PCSrc_o,
	output reg [2:0] AluOperation,

	output reg imm_en_o,
	output reg signed_imm
	);


	always@(opcode,func) begin
		    {signed_imm, imm_en_o, RegDst,PCSrc_o,DataC,RegWrite,Branch,MemRead,MemWrite,AluOperation}=0;
			case(opcode) 
			`sltiu: begin
                RegDst = 1;	// rt_EX
				RegWrite=1;
				AluOperation=3'b100;
				imm_en_o = 1;
            end
            `andi: begin
				RegDst = 1; // rt_EX
                RegWrite = 1;
                imm_en_o = 1;
                AluOperation = 3'b000; 
            end
            `ori: begin
				RegDst = 1; // rt_EX
                RegWrite = 1;
                imm_en_o = 1;
                AluOperation = 3'b001; 
            end
            `xori: begin
				RegDst = 1; // rt_EX
                RegWrite = 1;
                imm_en_o = 1;
                AluOperation = 3'b110; 
            end
            `lui: begin
				RegDst = 1; // rt_EX
                RegWrite = 1;
                imm_en_o = 1;
                AluOperation = 3'b111; // Assuming a unique ALU code for LUI
            end
            `bne: begin
                AluOperation=3'b011;
				Branch=1;
            end
			`RT: begin
				RegDst=1'b0; // rd_EX
				RegWrite=1;
				AluOperation=func[2:0];
				if (func == 6'b100010) // Sub
					AluOperation = 3'b011;
				else if (func == 6'b101010) // Slt
					AluOperation = 3'b100;
			 end
			`addi: begin
				signed_imm=1;
				RegWrite=1;
				RegDst = 1; // rt_EX
				AluOperation=3'b010;
				imm_en_o = 1;
			 end
			`addiu: begin
				RegDst = 1;	// rt_EX
				RegWrite=1;
				AluOperation=3'b010;
				imm_en_o = 1;
			 end
			`slti: begin
				signed_imm=1;
				RegDst = 1;	// rt_EX
				RegWrite=1;
				AluOperation=3'b100;
				imm_en_o = 1;
			 end
			`lw: begin
				signed_imm=1;
				RegWrite=1;
				RegDst = 1;	// rt_EX
				AluOperation=3'b010;
				MemRead=1;
				imm_en_o = 1;
			 end
			`sw: begin
				AluOperation=3'b010;
				MemWrite=1;
				imm_en_o=1;
				signed_imm=1;
			 end
			`beq: begin
				AluOperation=3'b011;
				Branch=1;
			 end
			`j: begin
				PCSrc_o = 2'b01;
			 end
			`jal: begin
				RegDst=2'b10;
				DataC=1;
				RegWrite=1;
				PCSrc_o = 2'b01;
				
			 end
			`jr: begin
				PCSrc_o = 2'b10;
			 end
			endcase
	end
endmodule
