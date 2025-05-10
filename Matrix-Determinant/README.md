This is a 3x3 determinant compute engine with AXI4Lite interface.</br>
</br>
Design details-</br>
The design is implemented using SpinalHDL. Both the scala source and generated verilog are included.</br>
Matrix elements are transferred to MMRs using AXI4Lite protocol.</br>
Control signal to start the computation is also given to an MMR using AXI4Lite protocol.</br>
The computation is implemented using standard control-path (FSM) and data-path template.</br>
Once the determinant is calculated, it is stored in another MMR which can be read via AXI4Lite protocol.</br>
</br>
Verification details-</br>
Python (cocotb library) is used for verification. It works on the generated verilog DUT.</br>
Cocotb functions are written for AXI4Lite read transactions and write transactions.</br>
Randomly generated matrix elements are fed to the DUT via AXI4Lite writes.</br>
Then the result is read via AXI4Lite read and is compared with the software-computed result.</br>
