import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge
import numpy as np

# Function to send write address
async def axi4lite_aw(dut, aw_valid, aw_addr, aw_prot):
    dut.axi_aw_valid.value = aw_valid
    dut.axi_aw_payload_addr.value = aw_addr 
    dut.axi_aw_payload_prot.value = aw_prot 

# Function to send write data
async def axi4lite_w(dut, w_valid, w_data, w_strb):
    dut.axi_w_valid.value = w_valid
    dut.axi_w_payload_data.value = w_data 
    dut.axi_w_payload_strb.value = w_strb

# Function to send read address
async def axi4lite_ar(dut, ar_valid, ar_addr, ar_prot):
    dut.axi_ar_valid.value = ar_valid
    dut.axi_ar_payload_addr.value = ar_addr 
    dut.axi_ar_payload_prot.value = ar_prot

# Function to receive read data
async def axi4lite_r(dut, r_ready):
    dut.axi_r_ready.value = r_ready
    for _ in range(2):
        await RisingEdge(dut.clk)
    r_data = dut.axi_r_payload_data.value.signed_integer
    r_resp = dut.axi_r_payload_resp.value
    return [r_data, r_resp]

# Function to set default input values
async def set_default_values(dut):
    dut.axi_aw_valid.value = 0
    dut.axi_aw_payload_addr.value = 0 
    dut.axi_aw_payload_prot.value = 0

    dut.axi_w_valid.value = 0
    dut.axi_w_payload_data.value = 0
    dut.axi_w_payload_strb.value = 0

    dut.axi_b_ready.value = 1

    dut.axi_ar_valid.value = 0
    dut.axi_ar_payload_addr.value = 0 
    dut.axi_ar_payload_prot.value = 0

    dut.axi_r_ready.value = 1

# Function that implements an axi4lite write transcation
async def axi4lite_write(dut, valid, addr, data):
    await axi4lite_aw(dut, valid, addr, 0)
    await axi4lite_w(dut, valid, data, 0)
    await RisingEdge(dut.clk)

# Function that implements an axi4lite read transcation
async def axi4lite_read(dut, valid, addr):
    await axi4lite_ar(dut, valid, addr, 0)
    data = await axi4lite_r(dut, 1)
    return data

@cocotb.test()
async def MatDet_IP_test(dut):
	
    # create a random 3x3 matrix with elements ranging from -100 to 100 
    A = np.random.randint(-100, 100, size=(3,3))

    # compute the determinant in software (golden result)
    det_golden = np.linalg.det(A)

    # generate a clock
    cocotb.start_soon(Clock(dut.clk, 1, units="ns").start())

    # reset the DUT
    dut.reset.value = 1

    # set default values for input signals
    await set_default_values(dut)

    # wait for 2 rising edges of clock to release reset
    for _ in range(2):
        await RisingEdge(dut.clk)
    dut.reset.value = 0
    await RisingEdge(dut.clk)

    # Axi4lite writes
    # Fill registers 0 to 8 with matrix elements
    await axi4lite_write(dut, 1, 0, int(A[0][0]))
    await axi4lite_write(dut, 1, 4, int(A[0][1]))
    await axi4lite_write(dut, 1, 8, int(A[0][2]))
    await axi4lite_write(dut, 1, 12, int(A[1][0]))
    await axi4lite_write(dut, 1, 16, int(A[1][1]))
    await axi4lite_write(dut, 1, 20, int(A[1][2]))
    await axi4lite_write(dut, 1, 24, int(A[2][0]))
    await axi4lite_write(dut, 1, 28, int(A[2][1]))
    await axi4lite_write(dut, 1, 32, int(A[2][2]))

    # Enable the computation by setting register 10 to 1
    await axi4lite_write(dut, 1, 40, 1)

    # Set write interface signals back to default
    await axi4lite_write(dut, 0, 0, 0)

    # Simulate for few cycles
    for i in range(20):
        await RisingEdge(dut.clk)

    # Read from register 11
    det_valid = await axi4lite_read(dut, 1, 44)
    assert det_valid[0] == 2, f"Determinant result is not valid...."

    # Read from register 9
    det_value = await axi4lite_read(dut, 1, 36)
    assert det_value[0] == int(round(det_golden)), f"Determinant result computed is incorrect..."

    # Simulate for few cycles
    for i in range(5):
        await RisingEdge(dut.clk)
