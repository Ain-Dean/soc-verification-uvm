// A basic 8-bit Arithmetic Logic Unit to validate
module simple_alu (
    input wire clk,
    input wire rst_n,
    input wire [7:0] a,
    input wire [7:0] b,
    input wire [1:0] op,
    output reg [7:0] result
);
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) 
            result <= 8'h00;
        else begin
            case (op)
                2'b00: result <= a + b;
                2'b01: result <= a - b;
                2'b10: result <= a & b;
                default: result <= 8'h00;
            endcase
        end
    end
endmodule
