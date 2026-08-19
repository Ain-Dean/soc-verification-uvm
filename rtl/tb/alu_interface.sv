interface alu_interface(input logic clk);
    logic rst_n;
    logic [7:0] a;
    logic [7:0] b;
    logic [1:0] op;
    logic [7:0] result;
endinterface
