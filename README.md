# APB_Slave_Verification_SV-TB
APB slave verification using System Verilog

# Overview
This project implemented by using a complete System Verilog testbench to verify an APB Slave design. 
The testbench follows the verification architecture inspired by UVM concepts completely focusing onthe 
different aspects that were introduced in SystemVerilog.

# Protocol
The Advanced Peripheral Bus (APB) is part of the Advanced Microcontroller Bus Architecture 
(AMBA) protocol family. It is an on chip protocol. APB protocol is low power protocol and not 
pipelined, use it to connect to low-bandwidth peripherals that do not require the high 
performance.  
In APB, data transfers and control signals are sampled on the rising edge of the clock. Rising 
edge is crucial for capturing valid data and control signals. Data is transferred during the 
ENABLE phase, which is triggered by the rising edge of the clock. Every transfer takes at least 
two cycles.

# Testbench Architecture
Interface based signal abstraction.
Generated different stimulus using constraint based randomization and checked if randomization is fail or pass.
Mailbox based communication between generator,driver,monitor,scoreboard.

# Featured Verified
Read and Write transactions
Transaction-level logging ids
Address validity and Data bus activity
Basic APB protocol flow

# Tools used
- SystemVerilog
- Synopsys VCS 2025.06
- EDA

# How to run
1. Compile RTL and TB files
2. Run `tb_top`
3. Observe scoreboard results in simulation log
4. Observe EP waveforms

# Author
Dasi Honey - VLSI Design Verification Trainee








