import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge


async def set_default_values(dut):
    # Reset all slave inputs
    dut.io_axiStreamIn1_valid.value = 0
    dut.io_axiStreamIn1_payload_data.value = 0
    dut.io_axiStreamIn1_payload_last.value = 0

    dut.io_axiStreamIn2_valid.value = 0
    dut.io_axiStreamIn2_payload_data.value = 0
    dut.io_axiStreamIn2_payload_last.value = 0

    dut.io_axiStreamIn3_valid.value = 0
    dut.io_axiStreamIn3_payload_data.value = 0
    dut.io_axiStreamIn3_payload_last.value = 0

    # Master is always ready
    dut.io_axiStreamOut_ready.value = 1


async def send_packet(dut, slave, data_list):
    """
    Drive one packet into slave interface.
    slave = 1,2,3
    data_list = list of ints (last item will have last=1)
    """
    for i, val in enumerate(data_list):
        if slave == 1:
            dut.io_axiStreamIn1_valid.value = 1
            dut.io_axiStreamIn1_payload_data.value = val
            dut.io_axiStreamIn1_payload_last.value = (i == len(data_list) - 1)
        elif slave == 2:
            dut.io_axiStreamIn2_valid.value = 1
            dut.io_axiStreamIn2_payload_data.value = val
            dut.io_axiStreamIn2_payload_last.value = (i == len(data_list) - 1)
        elif slave == 3:
            dut.io_axiStreamIn3_valid.value = 1
            dut.io_axiStreamIn3_payload_data.value = val
            dut.io_axiStreamIn3_payload_last.value = (i == len(data_list) - 1)

        # Wait until DUT consumes
        while True:
            await RisingEdge(dut.clk)
            if slave == 1 and dut.io_axiStreamIn1_ready.value:
                break
            if slave == 2 and dut.io_axiStreamIn2_ready.value:
                break
            if slave == 3 and dut.io_axiStreamIn3_ready.value:
                break

    # Deassert valid after packet
    if slave == 1:
        dut.io_axiStreamIn1_valid.value = 0
        dut.io_axiStreamIn1_payload_last.value = 0
    elif slave == 2:
        dut.io_axiStreamIn2_valid.value = 0
        dut.io_axiStreamIn2_payload_last.value = 0
    elif slave == 3:
        dut.io_axiStreamIn3_valid.value = 0
        dut.io_axiStreamIn3_payload_last.value = 0


async def capture_packet(dut):
    """
    Capture one packet from the master interface.
    Returns list of ints (data).
    """
    pkt = []
    while True:
        await RisingEdge(dut.clk)
        if dut.io_axiStreamOut_valid.value and dut.io_axiStreamOut_ready.value:
            val = int(dut.io_axiStreamOut_payload_data.value.signed_integer)
            pkt.append(val)
            if dut.io_axiStreamOut_payload_last.value:
                break
    return pkt


@cocotb.test()
async def RR_Arbiter_IP_test(dut):

    # generate a clock
    cocotb.start_soon(Clock(dut.clk, 1, units="ns").start())

    # reset the DUT
    dut.reset.value = 1
    await set_default_values(dut)

    # wait for 2 rising edges of clock to release reset
    for _ in range(2):
        await RisingEdge(dut.clk)
    dut.reset.value = 0
    await RisingEdge(dut.clk)

    # === Test sequence ===

    # Send packets on all slaves (round-robin expected)
    cocotb.start_soon(send_packet(dut, 1, [11, 12, 13]))
    cocotb.start_soon(send_packet(dut, 2, [21, 22]))
    cocotb.start_soon(send_packet(dut, 3, [31, 32, 33, 34]))

    pkt1 = await capture_packet(dut)
    pkt2 = await capture_packet(dut)
    pkt3 = await capture_packet(dut)

    # Check order
    assert pkt1 == [11, 12, 13], f"Unexpected packet1: {pkt1}"
    assert pkt2 == [21, 22], f"Unexpected packet2: {pkt2}"
    assert pkt3 == [31, 32, 33, 34], f"Unexpected packet3: {pkt3}"
