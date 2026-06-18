`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/23/2026 03:30:32 PM
// Design Name: 
// Module Name: instruction_memory
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


module instruction_memory(
    input [31:0] pc,

    output [31:0] instruction
);

    // INSTRUCTION MEMORY
    reg [31:0] memory [0:255];

    // INITIAL INSTRUCTIONS
   initial
   begin

    memory[0] = 32'h002081B3;
    memory[1] = 32'h40320233;
    memory[2] = 32'h0041F2B3;
    memory[3] = 32'h0041E333;

    // NOP Instructions
    memory[4] = 32'h00000013;
    memory[5] = 32'h00000013;
    memory[6] = 32'h00000013;
    memory[7] = 32'h00000013;

end

    // WORD ADDRESSING
    assign instruction = memory[pc[31:2]];

endmodule
