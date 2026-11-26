# 8-bit ALU Design Using Verilog

## Objective
Design and simulate an 8-bit Arithmetic Logic Unit (ALU) using Verilog HDL.

## Operations

| Sel | Operation |
|---|---|
| 000 | Addition |
| 001 | Subtraction |
| 010 | AND |
| 011 | OR |
| 100 | XOR |

## Inputs
- A: 8-bit input
- B: 8-bit input
- Sel: 3-bit operation selector

## Outputs
- Result: 8-bit output
- CarryOut: Carry or borrow indicator for arithmetic operations
- Zero: Indicates whether the result is zero

## Tools Used
- Verilog HDL
- Icarus Verilog
- GTKWave (waveform file generated)
- Yosys

## Project Structure
- design/alu.v - ALU design
- simulation/tb_alu.v - Testbench
- simulation/alu.vcd - Simulation waveform
- synthesis/alu_synth.v - Synthesized Verilog
- synthesis/yosys_report.txt - Synthesis report

## Simulation
Compile:
iverilog -o alu_tb design/alu.v simulation/tb_alu.v

Run:
cd simulation
vvp alu_tb

## Synthesis
yosys -p "read_verilog design/alu.v; hierarchy -top alu; synth -top alu; stat"

## Result
All ten test cases passed with automatic result checking.
The ALU performs arithmetic and logical operations correctly.
