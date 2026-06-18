`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/25/2026 12:41:13 PM
// Design Name: 
// Module Name: id_ex_reg
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


module id_ex_reg(

    input clk,
    input rst,

    // DATA SIGNALS
    input [31:0] pc_in,
    input [31:0] read_data1_in,
    input [31:0] read_data2_in,
    input [31:0] imm_in,

    input [4:0] rd_in,

    // CONTROL SIGNALS
    input reg_write_in,
    input alu_src_in,

    input [3:0] alu_ctrl_in,

    // OUTPUTS
    output reg [31:0] pc_out,
    output reg [31:0] read_data1_out,
    output reg [31:0] read_data2_out,
    output reg [31:0] imm_out,

    output reg [4:0] rd_out,

    output reg reg_write_out,
    output reg alu_src_out,

    output reg [3:0] alu_ctrl_out
);

always @(posedge clk or posedge rst)
begin

    if(rst)
    begin

        pc_out <= 0;
        read_data1_out <= 0;
        read_data2_out <= 0;
        imm_out <= 0;

        rd_out <= 0;

        reg_write_out <= 0;
        alu_src_out <= 0;

        alu_ctrl_out <= 0;

    end

    else
    begin

        pc_out <= pc_in;

        read_data1_out <= read_data1_in;
        read_data2_out <= read_data2_in;

        imm_out <= imm_in;

        rd_out <= rd_in;

        reg_write_out <= reg_write_in;
        alu_src_out <= alu_src_in;

        alu_ctrl_out <= alu_ctrl_in;

    end

end

endmodule