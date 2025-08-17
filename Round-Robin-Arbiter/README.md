This is an AXI4-Stream 3 to 1 Round-Robin Arbiter module.

Design details-
The design is implemented using SpinalHDL. Both the scala source and generated verilog are included.
The arbiter has 3 AXI4-Stream slave interfaces and 1 AXI4-Stream master interface.
The job of the arbiter is to select 1 of the 3 slaves that can stream out the data to the master in a round-robin fashion. 

Verification details-
Python (cocotb library) is used for verification. It works on the generated verilog DUT.
Cocotb functions are written for AXI4-Stream read transactions and write transactions.
Data is streamed into the arbiter from all 3 slave interfaces. 
The data read from the master interface is compared with expected data based on the arbitration scheme.
