# SoC Validation: Simple ALU Testbench

This is a basic pre-silicon verification project to show how to build a modular testbench using SystemVerilog and UVM concepts. I put this together to demonstrate structural code separation, constrained randomisation, and connecting a design (DUT) to an interface block.

The environment tests a simple 8-bit ALU that handles addition, subtraction, and bitwise AND operations.

## Project Structure

* `rtl/simple_alu.v` - The basic ALU design logic.
* `tb/alu_interface.sv` - Signals connecting the design to the testbench.
* `tb/alu_sequence_item.sv` - Random transaction generation with an operation code constraint.
* `tb/alu_driver.sv` - Drives the randomised stimulus into the design on clock edges.
* `tb/alu_tb_top.sv` - The top module that sets up the clock and links everything together.

## How to Run It (ModelSim / Questa)

To compile the files and run the simulation in command-line mode, use these terminal commands:

```bash
vlib work
vlog rtl/simple_alu.v
vlog -sv tb/alu_interface.sv tb/alu_sequence_item.sv tb/alu_driver.sv tb/alu_tb_top.sv
vsim -c alu_tb_top -do "run -all; quit"
```

## Sample Console Output

When running the sim, you will see the clock cycle driving random values into the ALU inputs:

```text
# Loading work.alu_tb_top
# Loading work.simple_alu
# Simulation started at 0ns
# [Reset Check] System reset active.
# [Driver] Driving Cycle 1: a=15, b=2, op=0 (Add)
# [Monitor] Checked Output: result=17 | Pass
# [Driver] Driving Cycle 2: a=165, b=5, op=1 (Subtract)
# [Monitor] Checked Output: result=160 | Pass
# [Driver] Driving Cycle 3: a=255, b=15, op=2 (Bitwise AND)
# [Monitor] Checked Output: result=15 | Pass
# Simulation finished with 0 errors.
```
