`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/25/2026 01:08:02 PM
// Design Name: 
// Module Name: forwarding_unit
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



module forwarding_unit(

    input ex_mem_reg_write,
    input mem_wb_reg_write,

    input [4:0] ex_mem_rd,
    input [4:0] mem_wb_rd,

    input [4:0] id_ex_rs1,
    input [4:0] id_ex_rs2,

    output reg [1:0] forward_a,
    output reg [1:0] forward_b
);

always @(*)
begin

    // DEFAULT
    forward_a = 2'b00;
    forward_b = 2'b00;

    // EX HAZARD
    if(ex_mem_reg_write &&
      (ex_mem_rd != 0) &&
      (ex_mem_rd == id_ex_rs1))
    begin
        forward_a = 2'b10;
    end

    if(ex_mem_reg_write &&
      (ex_mem_rd != 0) &&
      (ex_mem_rd == id_ex_rs2))
    begin
        forward_b = 2'b10;
    end

    // MEM HAZARD
    if(mem_wb_reg_write &&
      (mem_wb_rd != 0) &&
      !(ex_mem_reg_write &&
       (ex_mem_rd != 0) &&
       (ex_mem_rd == id_ex_rs1)) &&
      (mem_wb_rd == id_ex_rs1))
    begin
        forward_a = 2'b01;
    end

    if(mem_wb_reg_write &&
      (mem_wb_rd != 0) &&
      !(ex_mem_reg_write &&
       (ex_mem_rd != 0) &&
       (ex_mem_rd == id_ex_rs2)) &&
      (mem_wb_rd == id_ex_rs2))
    begin
        forward_b = 2'b01;
    end

end

endmodule