This is a Hamming Error Correction Code generator for 32-bits of data.

Design details-
The design is implemented using SpinalHDL. Both the scala source and generated verilog are included.
It is a purley combinational circuit, with a 32-bit input and 39-bit output.
The output consists of 1 overall parity bit, 6 ECC bits computing using Hamming algorithm and the 32 input bits passed through.

Verification details-
Python (cocotb library) is used for verification. It works on the generated verilog DUT.
