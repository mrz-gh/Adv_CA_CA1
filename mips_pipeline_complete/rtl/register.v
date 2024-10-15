module register #(
    parameter NUM_OF_BITS
) (
    input wire clk_i,
    input wire rst_ni,

    input wire clear_i,
    input wire ld_i,

    input wire [NUM_OF_BITS - 1 : 0] reg_di, 
    output reg [NUM_OF_BITS - 1 : 0] reg_qo
);


    always @(posedge clk_i , negedge rst_ni) begin
        if (!rst_ni)
            reg_qo <= 0;
        else if (clear_i)
            reg_qo <= 0;
        else if (ld_i)
            reg_qo <= reg_di;
        
    end
    
endmodule