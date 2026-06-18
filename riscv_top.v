`timescale 1ns / 1ps

module riscv_top(

    input clk,
    input rst
);

    //====================================================
    // PROGRAM COUNTER
    //====================================================

    wire [31:0] pc;
    wire [31:0] next_pc;

    //====================================================
    // INSTRUCTION FETCH
    //====================================================

    wire [31:0] instruction;

    //====================================================
    // IF/ID PIPELINE
    //====================================================

    wire [31:0] if_id_pc;
    wire [31:0] if_id_instruction;

    //====================================================
    // CONTROL SIGNALS
    //====================================================

    wire reg_write;
    wire alu_src;

    wire mem_read;
    wire mem_write;

    wire mem_to_reg;

    wire branch;

    wire [1:0] alu_op;

    //====================================================
    // REGISTER FILE
    //====================================================

    wire [31:0] read_data1;
    wire [31:0] read_data2;

    //====================================================
    // ALU CONTROL
    //====================================================

    wire [3:0] alu_ctrl;

    //====================================================
    // ALU
    //====================================================

    wire [31:0] alu_result;
    wire zero;

    //====================================================
    // IMMEDIATE
    //====================================================

    wire [31:0] imm_ext;

    //====================================================
    // ALU INPUT
    //====================================================

    wire [31:0] alu_in2;

    //====================================================
    // ID/EX PIPELINE
    //====================================================

    wire [31:0] id_ex_pc;
    wire [31:0] id_ex_read_data1;
    wire [31:0] id_ex_read_data2;
    wire [31:0] id_ex_imm;

    wire [4:0] id_ex_rd;

    wire id_ex_reg_write;
    wire id_ex_alu_src;

    wire [3:0] id_ex_alu_ctrl;

    //====================================================
    // EX/MEM PIPELINE
    //====================================================

    wire [31:0] ex_mem_alu_result;
    wire [31:0] ex_mem_write_data;

    wire [4:0] ex_mem_rd;

    wire ex_mem_reg_write;
    wire ex_mem_mem_read;
    wire ex_mem_mem_write;
    wire ex_mem_mem_to_reg;

    //====================================================
    // MEM/WB PIPELINE
    //====================================================

    wire [31:0] mem_wb_alu_result;
    wire [31:0] mem_wb_mem_data;

    wire [4:0] mem_wb_rd;
    wire [31:0] mem_read_data;
    wire mem_wb_reg_write;
    wire mem_wb_mem_to_reg;
   wire [31:0] write_back_data;
    //====================================================
    // PROGRAM COUNTER
    //====================================================

    program_counter PC(
        .clk(clk),
        .rst(rst),

        .next_pc(next_pc),

        .pc(pc)
    );

    // NEXT PC
    assign next_pc = pc + 4;

    //====================================================
    // INSTRUCTION MEMORY
    //====================================================

    instruction_memory IMEM(
        .pc(pc),

        .instruction(instruction)
    );

    //====================================================
    // IF/ID PIPELINE REGISTER
    //====================================================

    if_id_reg IF_ID(

        .clk(clk),
        .rst(rst),

        .pc_in(pc),
        .instruction_in(instruction),

        .pc_out(if_id_pc),
        .instruction_out(if_id_instruction)
    );

    //====================================================
    // CONTROL UNIT
    //====================================================

    control_unit CU(

        .opcode(if_id_instruction[6:0]),

        .reg_write(reg_write),
        .alu_src(alu_src),

        .mem_read(mem_read),
        .mem_write(mem_write),

        .mem_to_reg(mem_to_reg),

        .branch(branch),

        .alu_op(alu_op)
    );

    //====================================================
    // REGISTER FILE
    //====================================================

   reg_file RF(

    .clk(clk),
    .rst(rst),

    .rs1(if_id_instruction[19:15]),
    .rs2(if_id_instruction[24:20]),

   .rd(mem_wb_rd),
.write_data(write_back_data),
.reg_write(mem_wb_reg_write),

    .read_data1(read_data1),
    .read_data2(read_data2)
);

    //====================================================
    // ALU CONTROL
    //====================================================

    alu_control ALUCTRL(

        .alu_op(alu_op),

        .funct3(if_id_instruction[14:12]),
        .funct7(if_id_instruction[31:25]),

        .alu_ctrl(alu_ctrl)
    );
    // ID/EX PIPELINE REGISTER
id_ex_reg ID_EX(

    .clk(clk),
    .rst(rst),

    .pc_in(if_id_pc),

    .read_data1_in(read_data1),
    .read_data2_in(read_data2),

    .imm_in(imm_ext),

    .rd_in(if_id_instruction[11:7]),

    .reg_write_in(reg_write),
    .alu_src_in(alu_src),

    .alu_ctrl_in(alu_ctrl),

    .pc_out(id_ex_pc),

    .read_data1_out(id_ex_read_data1),
    .read_data2_out(id_ex_read_data2),

    .imm_out(id_ex_imm),

.rd_out(id_ex_rd),

.reg_write_out(id_ex_reg_write),
.alu_src_out(id_ex_alu_src),

.alu_ctrl_out(id_ex_alu_ctrl)

);

    //====================================================
    // IMMEDIATE EXTENSION
    //====================================================

    assign imm_ext =
           {{20{if_id_instruction[31]}},
             if_id_instruction[31:20]};

    //====================================================
    // ALU INPUT MUX
    //====================================================

   assign alu_in2 =
       (id_ex_alu_src) ?
       id_ex_imm :
       id_ex_read_data2;
    //====================================================
    // ALU
    //====================================================

    alu ALU(

    .a(id_ex_read_data1),
    .b(alu_in2),

    .alu_ctrl(id_ex_alu_ctrl),

    .result(alu_result),

    .zero(zero)
);
//====================================================
// EX/MEM PIPELINE REGISTER
//====================================================

ex_mem_reg EX_MEM(

    .clk(clk),
    .rst(rst),

    // DATA SIGNALS
    .alu_result_in(alu_result),
    .write_data_in(id_ex_read_data2),

    .rd_in(id_ex_rd),

    // CONTROL SIGNALS
    .reg_write_in(id_ex_reg_write),

    .mem_read_in(mem_read),
    .mem_write_in(mem_write),

    .mem_to_reg_in(mem_to_reg),

    // OUTPUTS
    .alu_result_out(ex_mem_alu_result),
    .write_data_out(ex_mem_write_data),

    .rd_out(ex_mem_rd),

    .reg_write_out(ex_mem_reg_write),

    .mem_read_out(ex_mem_mem_read),
    .mem_write_out(ex_mem_mem_write),

    .mem_to_reg_out(ex_mem_mem_to_reg)
);
//====================================================
// DATA MEMORY
//====================================================

data_memory DMEM(

    .clk(clk),

    .mem_read(ex_mem_mem_read),
    .mem_write(ex_mem_mem_write),

    .address(ex_mem_alu_result),
    .write_data(ex_mem_write_data),

    .read_data(mem_read_data)
);
 //====================================================
// MEM/WB PIPELINE REGISTER
//====================================================

mem_wb_reg MEM_WB(

    .clk(clk),
    .rst(rst),

    // DATA SIGNALS
    .alu_result_in(ex_mem_alu_result),
    .mem_data_in(mem_read_data),

    .rd_in(ex_mem_rd),

    // CONTROL SIGNALS
    .reg_write_in(ex_mem_reg_write),
    .mem_to_reg_in(ex_mem_mem_to_reg),

    // OUTPUTS
    .alu_result_out(mem_wb_alu_result),
    .mem_data_out(mem_wb_mem_data),

    .rd_out(mem_wb_rd),

    .reg_write_out(mem_wb_reg_write),
    .mem_to_reg_out(mem_wb_mem_to_reg)
);
     //====================================================
// WRITE BACK MUX
//====================================================

assign write_back_data =
       (mem_wb_mem_to_reg) ?
       mem_wb_mem_data :
       mem_wb_alu_result;
endmodule