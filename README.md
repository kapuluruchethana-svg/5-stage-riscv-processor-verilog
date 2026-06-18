# 5-Stage Pipelined RISC-V Processor Design and Verification

## Overview

This project implements a 32-bit 5-Stage Pipelined RISC-V Processor using Verilog HDL.

The processor is designed with:

- Instruction Fetch (IF)
- Instruction Decode (ID)
- Execute (EX)
- Memory Access (MEM)
- Write Back (WB)

The design includes hazard handling mechanisms such as forwarding, branch handling, and pipeline registers to ensure correct instruction execution.

Functional verification was performed using Xilinx Vivado through RTL simulation and waveform analysis.

---

## Features

- 32-bit RISC-V Processor Architecture
- 5-Stage Pipeline
- Program Counter (PC)
- Instruction Memory
- Register File
- Arithmetic Logic Unit (ALU)
- Immediate Generator
- Control Unit
- Pipeline Registers
- Branch Handling Logic
- Data Forwarding Unit
- Hazard Detection Unit
- Data Memory
- RTL Simulation and Verification

---

## Pipeline Stages

### Instruction Fetch (IF)
- Fetches instructions from instruction memory
- Updates Program Counter (PC)

### Instruction Decode (ID)
- Decodes instruction fields
- Reads operands from register file
- Generates control signals

### Execute (EX)
- Performs ALU operations
- Calculates branch targets

### Memory Access (MEM)
- Handles load/store operations
- Accesses data memory

### Write Back (WB)
- Writes results back into register file

---

## Hazard Handling

### Data Forwarding
Implemented a forwarding unit to resolve RAW (Read After Write) hazards and reduce pipeline stalls.

### Branch Handling
Implemented branch decision logic for correct program flow.

### Pipeline Registers
Implemented:

- IF/ID Register
- ID/EX Register
- EX/MEM Register
- MEM/WB Register

for stage-to-stage data transfer.

---

## Verification

The processor was verified using RTL simulation in Xilinx Vivado.

### Test Cases Verified

- Arithmetic Instructions
- Register Read/Write Operations
- Pipeline Data Flow
- Hazard Detection Logic
- Forwarding Logic
- Branch Instructions
- Memory Operations
- Control Signal Propagation

Waveform analysis was used to validate correct instruction execution across all pipeline stages.

---

## Tools Used

- Verilog HDL
- Xilinx Vivado 2024.2
- RTL Simulation
- Waveform Debugging

---

## Results

- Successfully implemented a 5-Stage Pipelined RISC-V Processor
- Verified instruction execution through RTL simulation
- Demonstrated forwarding and branch handling
- Validated datapath and control-path functionality using waveform analysis

---

## Skills Demonstrated

- Verilog HDL
- RTL Design
- Functional Verification
- Digital System Design
- CPU Pipeline Architecture
- Hazard Detection
- Forwarding Techniques
- Waveform Debugging
- Vivado Simulation
- RISC-V Architecture

---

## Author

**Kapuluru Chethana**

B.Tech – Electronics and Communication Engineering  
IIIT RGUKT RK Valley
