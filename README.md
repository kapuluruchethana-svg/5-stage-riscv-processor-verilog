5-Stage Pipelined RISC-V Processor Design and Verification
Overview

This project implements a 32-bit 5-Stage Pipelined RISC-V Processor using Verilog HDL. The processor is designed with Instruction Fetch (IF), Instruction Decode (ID), Execute (EX), Memory Access (MEM), and Write Back (WB) stages to improve instruction throughput and performance.

The design includes hazard handling mechanisms such as forwarding, branch handling, and pipeline registers to ensure correct instruction execution. Functional verification was performed using Xilinx Vivado through RTL simulation and waveform analysis.

Features
32-bit RISC-V Processor Architecture
5-Stage Pipeline (IF, ID, EX, MEM, WB)
Program Counter (PC)
Instruction Memory
Register File
Arithmetic Logic Unit (ALU)
Immediate Generator
Control Unit
Pipeline Registers
Branch Handling Logic
Data Forwarding Unit
Hazard Detection Unit
Data Memory
RTL Simulation and Verification
Pipeline Stages
Instruction Fetch (IF)
Fetches instructions from instruction memory.
Updates Program Counter (PC).
Instruction Decode (ID)
Decodes instruction fields.
Reads source operands from register file.
Generates control signals.
Execute (EX)
Performs ALU operations.
Calculates branch targets and addresses.
Memory Access (MEM)
Handles load and store operations.
Accesses data memory.
Write Back (WB)
Writes results back into the register file.
Hazard Handling
Data Forwarding

Implemented a forwarding unit to resolve Read-After-Write (RAW) data hazards and reduce pipeline stalls.

Branch Handling

Implemented branch decision logic to support correct program flow.

Pipeline Registers

Implemented IF/ID, ID/EX, EX/MEM, and MEM/WB pipeline registers for stage-to-stage data transfer.

Verification

The processor was verified using RTL simulation in Xilinx Vivado.

Test Cases Verified
Arithmetic Instructions
Register Read/Write Operations
Pipeline Data Flow
Hazard Detection Logic
Forwarding Logic
Branch Instructions
Memory Operations
Control Signal Propagation

Waveform analysis was used to validate correct instruction execution across all pipeline stages.

Tools Used
Verilog HDL
Xilinx Vivado 2024.2
RTL Simulation
Waveform Debugging
Project Structure
riscv_processor/
│
├── riscv_top.v
├── pc.v
├── instruction_memory.v
├── control_unit.v
├── reg_file.v
├── alu.v
├── immediate_generator.v
├── branch_unit.v
├── hazard_detection_unit.v
├── forwarding_unit.v
├── id_ex_reg.v
├── ex_mem_reg.v
├── mem_wb_reg.v
├── data_memory.v
├── riscv_top_tb.v
│
├── screenshots/
│   ├── waveform.png
│   └── pipeline_verification.png
│
└── README.md
Results
Successfully implemented a 5-Stage Pipelined RISC-V Processor in Verilog HDL.
Verified instruction execution through RTL simulation.
Demonstrated forwarding, branch handling, and pipeline operation.
Achieved correct datapath and control-path functionality using waveform-based verification.
Skills Demonstrated
Verilog HDL
RTL Design
Functional Verification
Digital System Design
CPU Pipeline Architecture
Hazard Detection
Forwarding Techniques
Waveform Debugging
Vivado Simulation
RISC-V Architecture
Author

Kapuluru Chethana
B.Tech – Electronics and Communication Engineering
IIIT RGUKT RK Valley
