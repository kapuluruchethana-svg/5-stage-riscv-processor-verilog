`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/25/2026 12:18:03 PM
// Design Name: 
// Module Name: riscv_top_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module riscv_top_tb;

    reg clk;
    reg rst;

    // DUT
    riscv_top DUT(
        .clk(clk),
        .rst(rst)
    );

    // CLOCK GENERATION
    initial
    begin
        clk = 0;

        forever #5 clk = ~clk;
    end

    // TEST SEQUENCE
    initial
    begin

        // RESET
        rst = 1;

        #20;

        rst = 0;

        // RUN PROCESSOR
        #80;

        $finish;

    end

endmodule
