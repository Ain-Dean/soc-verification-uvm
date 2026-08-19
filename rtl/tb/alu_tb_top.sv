`timescale 1ns/1ps

module alu_tb_top;
    bit clk;
    always #5 clk = ~clk; // 100MHz clock simulation

    // Instantiate interface
    alu_interface intf(clk);

    // Instantiate RTL Design Under Test
    simple_alu dut (
        .clk(intf.clk),
        .rst_n(intf.rst_n),
        .a(intf.a),
        .b(intf.b),
        .op(intf.op),
        .result(intf.result)
    );

    initial begin
        intf.rst_n = 0;
        #20 intf.rst_n = 1;
    end
endmodule
