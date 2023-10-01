# 64 Bit Green ALU Design Using Clock Gating

## Overview

This repository contains the RTL design, verification, and physical design files for a 64-bit Arithmetic Logic Unit (ALU) designed using clock gating for energy efficiency. The project was implemented using Xilinx Vivado for synthesis and Qflow for the physical design process. This README.md file provides an overview of the verification process and details of the Qflow open-source tool's usage.

The provided Verilog code represents a 64-bit Arithmetic Logic Unit (ALU) module that performs various arithmetic and logical operations on two 64-bit input operands (operand_A and operand_B). The module has clock (clk) and reset (reset) inputs and provides several outputs:

result [63:0]: This is the 64-bit output that holds the result of the ALU operation.

zero_flag: A 1-bit output indicating whether the result is zero (1 if zero, 0 otherwise).

carry_flag: A 1-bit output indicating the carry-out from the most significant bit of the result for addition and subtraction operations.

overflow_flag: A 1-bit output indicating an overflow condition for addition and subtraction operations.

The module includes clock gating logic (enable_clk) to enable or disable clocking based on the ALU operation. This helps save power when the ALU is not actively processing an operation.

The ALU supports several operations, as defined by the alu_op input:

ADD: Performs addition of operand_A and operand_B.

SUB: Performs subtraction of operand_A and operand_B.

AND: Performs bitwise AND between operand_A and operand_B.

OR: Performs bitwise OR between operand_A and operand_B.

XOR: Performs bitwise XOR between operand_A and operand_B.

SLL: Performs a left shift of operand_A by a specified number of bits.

SRL: Performs a logical right shift of operand_A by a specified number of bits.

SRA: Performs an arithmetic right shift of operand_A by a specified number of bits.

SLT: Sets the result to 1 if operand_A is less than operand_B; otherwise, sets it to 0.

SEQ: Sets the result to 1 if operand_A is equal to operand_B; otherwise, sets it to 0.

SRNE: Sets the result to 1 if operand_A is not equal to operand_B; otherwise, sets it to 0.

The code includes clock gating logic to minimize power consumption when the ALU is not actively processing an operation. The ALU operations are performed when enable_clk is high.

The ALU also checks for zero, carry, and overflow flags based on the operation being performed. These flags can be used for various purposes, such as conditional branching in a processor's control unit.

The module provides a versatile and efficient ALU capable of performing a wide range of 64-bit operations. It can be used as a component in various digital systems, including microprocessors and digital signal processors (DSPs).

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
 Synthesis : During synthesis, you use the "yosys" tool, an open-source RTL synthesis tool, to convert your RTL (Register-Transfer Level) design description into a gate-level netlist. This netlist represents your digital logic in terms of standard cells from the chosen technology library. The synthesized design will be optimized for area, power, and timing based on your specified constraints and technology parameters. The resulting gate-level netlist is a crucial intermediate step before proceeding to placement and routing. 180nm pdk used in this project
Placement :  During this stage, you use the "Graywolf" tool, which is an open-source standard cell placement tool. Placement involves determining the physical locations of the standard cells from your gate-level netlist on the target FPGA or ASIC device's silicon area. The goal is to optimize the arrangement of cells to meet area, timing, and power constraints while minimizing wirelength. Proper placement is crucial for achieving good overall performance in the final design.
Static Timing Analysis (STA) : Static Timing Analysis is a critical phase where you use tools like "OpenSTA" to analyze the timing behavior of your design. It checks whether the signals in your design meet the required setup and hold time constraints as specified by your target technology and design goals.

Static Timing Analysis considers factors like gate delays, interconnect delays, clock skew, and signal arrival times to ensure that your design operates correctly within the desired clock frequency. Any violations of timing constraints are identified during this step, and if necessary, you may need to make adjustments to your design to correct these violations.

Routing :  in the Qflow ASIC design flow is the process of determining physical paths for interconnections, optimizing wire routes while adhering to design rules, and ensuring efficient and constraint-compliant connectivity between logic cells. The tool "Qrouter" is often used to achieve optimal routing solutions, helping to minimize signal delays and ensure good overall performance in the final chip design.

Post-Route Static Timing Analysis (STA) : is the step in the Qflow ASIC design flow where the completed routed design is analyzed to ensure that it meets the required timing constraints. STA tools like "OpenSTA" are used to calculate and validate the timing of signals through the entire design, identifying any violations and helping designers optimize the design further if necessary. This analysis ensures that the design operates at the desired clock frequencies and meets performance targets.
Migration : Migration is the process of preparing the design for the target technology and foundry-specific requirements. It involves generating technology-specific files and libraries, adapting the design to match the target technology's manufacturing process, and ensuring compatibility. Migration is crucial for successfully transitioning from the design phase to the actual fabrication of the integrated circuit.
DRC (Design Rule Checking) : is a step in the design flow where the design is checked against a set of predefined design rules specific to the target technology and manufacturing process. These rules ensure that the design meets the required manufacturing specifications and can be fabricated without defects or errors. DRC identifies violations of these rules, such as minimum feature sizes, spacing requirements, and other constraints, and flags them for correction before proceeding to fabrication. This step helps guarantee the manufacturability of the integrated circuit.

LVS (Layout vs. Schematic) :  is a critical step in the integrated circuit design flow. It involves verifying that the layout of the designed circuit matches the intended schematic representation. LVS compares the physical layout of transistors, wires, and components with the logical representation from the schematic, ensuring that there are no discrepancies. Any differences found during LVS can indicate errors in the layout or schematic, and these must be resolved to ensure the design functions correctly. LVS is essential for identifying and correcting potential issues before the design moves forward to fabrication.
GDS (Graphic Database System) :  is a standard file format used in the semiconductor industry to represent the physical layout of an integrated circuit. The GDS format stores information about the polygons, layers, and hierarchy of elements that make up the layout. In the context of the IC design flow, the GDS file is typically generated as the final output from the layout tools after the design has been fully verified and is ready for fabrication. It contains the geometric data needed by semiconductor foundries to manufacture the integrated circuit. The GDS file is used for mask generation, photolithography, and other fabrication processes, making it a crucial step in the IC design-to-production transition.

Cleanup : in the context of IC design typically refers to the final stages of preparation before tape-out or fabrication. This step involves reviewing the design files, scripts, and documentation to ensure that everything is organized, consistent, and ready for handoff to the semiconductor foundry. Cleanup may include tasks such as:

File Organization: Ensuring that all design files are organized in a clear directory structure with meaningful file names. This helps prevent errors during the tape-out process.

Naming Conventions: Checking that all files, cells, and layers follow consistent naming conventions. Consistent naming makes it easier to manage and verify the design.

Documentation: Verifying that design documentation, including design specifications, design rules, and any foundry-specific requirements, is up to date and complete.

Script Verification: Reviewing and testing any automation scripts or Makefiles used in the design flow to ensure they work as expected.

Final Checks: Performing a final set of design rule checks (DRC) and layout versus schematic checks (LVS) to catch any last-minute issues.

Version Control: Ensuring that the correct versions of design files are used and that there are no discrepancies between different versions.

Data Backup: Creating backups of critical design data to prevent data loss.

Quality Assurance: Conducting a quality assurance review to confirm that the design meets all requirements and specifications.

Once the cleanup process is complete, the design is considered ready for tape-out, where the GDS (Graphic Database System) file is generated and sent to the foundry for fabrication. The cleanup phase is a critical step to ensure a smooth transition from design to manufacturing and minimize the risk of errors during fabrication.


qflow tool enivironment:
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
  ## Usage

To replicate the project:

1. Clone the repository: `git clone https://github.com/khaja7289/ALU.git`
2. Follow the instructions in the respective directories (`rtl/`, `verification/`, `qflow/`) to run simulations, synthesize, and perform physical design with Qflow.

## Contributors

- Your Name (JUNJURAMPALLI KHAJA)
- Collaborator Name (khaja7289)


