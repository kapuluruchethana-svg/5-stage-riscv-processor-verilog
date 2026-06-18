`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/25/2026 12:39:19 PM
// Design Name: 
// Module Name: if_id_reg
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


module if_id_reg(

    input clk,
    input rst,

    input [31:0] pc_in,
    input [31:0] instruction_in,

    output reg [31:0] pc_out,
    output reg [31:0] instruction_out
);

always @(posedge clk or posedge rst)
begin

    if(rst)
    begin
        pc_out <= 0;
        instruction_out <= 0;
    end

    else
    begin
        pc_out <= pc_in;
        instruction_out <= instruction_in;
    end

end

endmodule