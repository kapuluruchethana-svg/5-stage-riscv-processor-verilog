`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/25/2026 12:54:30 PM
// Design Name: 
// Module Name: hazard_detection_unit
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


module hazard_detection_unit(

    input id_ex_mem_read,

    input [4:0] id_ex_rd,

    input [4:0] if_id_rs1,
    input [4:0] if_id_rs2,

    output reg stall
);

always @(*)
begin

    // DEFAULT
    stall = 0;

    // LOAD-USE HAZARD
    if(id_ex_mem_read &&
      ((id_ex_rd == if_id_rs1) ||
       (id_ex_rd == if_id_rs2)))
    begin
        stall = 1;
    end

end

endmodule