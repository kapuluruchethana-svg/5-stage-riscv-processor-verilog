`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/23/2026 03:21:09 PM
// Design Name: 
// Module Name: reg_file
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


module reg_file(
    input clk,
    input rst,

    // READ PORTS
    input [4:0] rs1,
    input [4:0] rs2,

    // WRITE PORT
    input [4:0] rd,
    input [31:0] write_data,
    input reg_write,

    // OUTPUTS
    output [31:0] read_data1,
    output [31:0] read_data2
);

    // 32 REGISTERS
    reg [31:0] registers [0:31];

    integer i;

    // RESET + WRITE LOGIC
    always @(posedge clk or posedge rst)
    begin
        if(rst)
        begin
            for(i = 0; i < 32; i = i + 1)
                registers[i] <= 0;
        end

        else
        begin
            // x0 always zero
            registers[0] <= 0;

            if(reg_write && (rd != 0))
                registers[rd] <= write_data;
        end
    end

    // READ PORTS
    assign read_data1 = registers[rs1];

    assign read_data2 = registers[rs2];

endmodule
