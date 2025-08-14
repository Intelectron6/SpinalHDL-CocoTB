This is an FIR Filter compute engine with AXI4Lite interface to store filter co-efficients and AXI4Stream interfaces to receive and send data.</br>
</br>
Design details-</br>
The design is implemented using SpinalHDL. Both the scala source and generated verilog are included.</br>
Filter coefficients are transferred to MMRs using AXI4Lite protocol.</br>
Control signal to start the computation is also given to an MMR using AXI4Lite protocol.</br>
Inputs to be filtered are streamed-in using AXI4Stream slave interface and filtered outputs are streamed-out using AXI4Stream master interface.</br>
</br>
Verification details-</br>
Python (cocotb library) is used for verification. It works on the generated verilog DUT.</br>
Cocotb functions are written for AXI4Lite as well as AXI4Stream transactions.</br>
Pre-computed filter co-efficients are stored in the DUT via AXI4Lite writes.</br>
Randomly generated filter inputs elements are fed to the DUT via AXI4Stream slave interface.</br>
The filtered outputs are read from the DUT via AXI4Stream master interface.</br>

TO-DO:<br>
Compute expected outputs in software.<br>
Compare expected outputs with ouputs received from the FIR Filter.<br>
Can try using built-in filter function for this?? <br>
