# 64 Bit Green ALU Design Using Clock Gating

## Overview

This repository contains the RTL design, verification, and physical design files for a 64-bit Arithmetic Logic Unit (ALU) designed using clock gating for energy efficiency. The project was implemented using Xilinx Vivado for synthesis and Qflow for the physical design process. This README.md file provides an overview of the verification process and details of the Qflow open-source tool's usage.
##output waveform
![Screenshot (184)](https://github.com/khaja7289/ALU/assets/122887258/abd22970-4c56-4351-9621-9514d1aeb39a)

schimatic pre synthesis
![Screenshot (182)](https://github.com/khaja7289/ALU/assets/122887258/2025872b-d14b-47c9-b5a1-cd5cce4c87fc)
schimatic post synthesis
![Screenshot (183)](https://github.com/khaja7289/ALU/assets/122887258/f9e465a6-a3d1-4cc0-b56a-08f567e0f66b)


## Verification Process

### Simulation

1. The RTL design was initially verified using simulation. This involved creating testbenches with random input data to test various ALU operations.
2. Test cases were designed to cover a wide range of ALU operations, including addition, subtraction, logical operations, shifts, and comparisons.
3. Simulation results were analyzed to ensure that the ALU produced correct results and flag signals (zero, carry, overflow) were generated accurately.

### FPGA Synthesis

1. The RTL design was synthesized using Xilinx Vivado targeting a specific FPGA device.
2. Post-synthesis simulations were performed to verify the correctness of the synthesized design.
   ## Physical Design with Qflow

All actions are represented in the output file qflow_exec.sh. However, if specific actions are called out on the command line, those commands related to the actions will be left uncommented in the file. When qflow sources the command file, these actions will be executed in sequence.
There are two actions that are easy to remember and encompass the most important steps, so you don't have to remember all the names of all the steps to add to the command line:

build
Run these steps in sequence: synthesize, place, buffer, route (see below)
all
Run these steps in sequence: synthesize, place, buffer, route, clean, display (see below)
Individual synthesis steps are as follows:
synthesize
Run the verilog synthesis (yosys, or, in qflow-1.0 only, Odin-II and ABC) and load balancing (blifFanout) and node fanout reduction (blifFanout, in qflow-1.1 only)
sta
Run static timing analysis (vesta)
place
Run the placement (graywolf)
buffer
(qflow 1.0 only)
Perform fanout reduction, and rerun the load balancing and placement (clocktree, blifFanout, and graywolf). Note that qflow 1.1 does this in one pass during the "synthesize" stage.
route
Run the detail router (qrouter)
backanno
Run static timing analysis (vesta) with back-annotated delays
migrate
Create layout and abstract views, and extract netlist from layout (qflow 1.2 and higher).
drc
Run design rule checks on the layout (qflow 1.2 and higher).
lvs
Run layout vs. schematic check (qflow 1.2 and higher).
gdsii
Generate GDS mask layer output (qflow 1.2 and higher).
clean
Clean up temporary files in all subdirectories.
display
Display the layout result (magic)

qflow tool:
![Screenshot from 2023-10-01 13-44-08](https://github.com/khaja7289/ALU/assets/122887258/014f9226-b540-4932-a604-37271efa04c0)
synthesis using yosys tool  180nm pdk
placement :graywolf
![Screenshot from 2023-10-01 13-46-34](https://github.com/khaja7289/ALU/assets/122887258/ace518bd-0a84-4e1f-a459-ad7d0ee6e11a)
after placement layout: magic tool
![Screenshot from 2023-10-01 16-08-10](https://github.com/khaja7289/ALU/assets/122887258/f2d3caa8-abb4-4023-8502-d2af7ed059da)
routing : qrouter
![Screenshot from 2023-10-01 12-54-46](https://github.com/khaja7289/ALU/assets/122887258/4dd1cb04-95cd-47d4-b765-df9735f29bee)
after routing layout:
![Screenshot from 2023-10-01 16-13-47](https://github.com/khaja7289/ALU/assets/122887258/b465119b-09e8-4159-867d-5dd48d92472a)
after migration:
![Screenshot from 2023-10-01 16-23-46](https://github.com/khaja7289/ALU/assets/122887258/2e0fca3f-74ea-45b0-841b-ef4a628da5da)
after gds11:
![Screenshot from 2023-10-01 16-24-35](https://github.com/khaja7289/ALU/assets/122887258/484f2476-e6d8-4877-87ee-a29b02770132)



## Repository Structure

- `rtl/`: Contains the RTL design files.
- `verification/`: Includes simulation testbenches and verification scripts.
- `qflow/`: Contains Qflow configuration and script files for physical design.
- `docs/`: Documentation and reports related to the project.


