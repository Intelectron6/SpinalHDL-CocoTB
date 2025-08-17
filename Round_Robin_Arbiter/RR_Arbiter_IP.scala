package projectname

import spinal.core._
import spinal.lib._
import spinal.lib.fsm._
import spinal.lib.Stream._

// Define a simple AXIS-like bundle: Stream + last signal
case class SimpleAxis() extends Bundle with IMasterSlave 
{
  val data = SInt(32 bits)
  val last = Bool()

  override def asMaster(): Unit = 
  {
    out(data, last)
  }
}

// Our round-robin arbiter: 3 slaves -> 1 master
case class RR_Arbiter_IP() extends Component 
{
  val io = new Bundle 
  {
    val axiStreamIn1 = slave Stream(SimpleAxis())
    val axiStreamIn2 = slave Stream(SimpleAxis())
    val axiStreamIn3 = slave Stream(SimpleAxis())
    val axiStreamOut = master Stream(SimpleAxis())
  }

  // Round-robin pointer: which slave has highest priority when IDLE
  val rrPtr = Reg(UInt(2 bits)) init(0)

  // Default outputs
  io.axiStreamOut.valid := False
  io.axiStreamOut.payload.data := 0
  io.axiStreamOut.payload.last := False
  io.axiStreamIn1.ready := False
  io.axiStreamIn2.ready := False
  io.axiStreamIn3.ready := False

  // FSM states
  val fsm = new StateMachine 
  {
    val IDLE     : State = new State with EntryPoint
    val S1_ACTIVE: State = new State
    val S2_ACTIVE: State = new State
    val S3_ACTIVE: State = new State

    // IDLE: choose next slave based on RR pointer and availability
    IDLE.whenIsActive 
	  {
      switch(rrPtr) 
	    {
        is(0) 
		    {
            when(io.axiStreamIn1.valid) { goto(S1_ACTIVE) }
            .elsewhen(io.axiStreamIn2.valid) { goto(S2_ACTIVE) }
            .elsewhen(io.axiStreamIn3.valid) { goto(S3_ACTIVE) }
        }
        is(1) 
	    	{
            when(io.axiStreamIn2.valid) { goto(S2_ACTIVE) }
            .elsewhen(io.axiStreamIn3.valid) { goto(S3_ACTIVE) }
            .elsewhen(io.axiStreamIn1.valid) { goto(S1_ACTIVE) }
        }
        is(2) 
		    {
            when(io.axiStreamIn3.valid) { goto(S3_ACTIVE) }
            .elsewhen(io.axiStreamIn1.valid) { goto(S1_ACTIVE) }
            .elsewhen(io.axiStreamIn2.valid) { goto(S2_ACTIVE) }
        }
      }
    }

    // Slave 1 active
    S1_ACTIVE.whenIsActive
	  {
      io.axiStreamOut.valid := io.axiStreamIn1.valid
      io.axiStreamOut.payload := io.axiStreamIn1.payload
      io.axiStreamIn1.ready := io.axiStreamOut.ready

      when(io.axiStreamIn1.fire && io.axiStreamIn1.payload.last) 
	    {
        rrPtr := 1  // next time start with slave 2
        goto(IDLE)
      }
    }

    // Slave 2 active
    S2_ACTIVE.whenIsActive 
    {
      io.axiStreamOut.valid := io.axiStreamIn2.valid
      io.axiStreamOut.payload := io.axiStreamIn2.payload
      io.axiStreamIn2.ready := io.axiStreamOut.ready

      when(io.axiStreamIn2.fire && io.axiStreamIn2.payload.last) 
	    {
        rrPtr := 2  // next time start with slave 3
        goto(IDLE)
      }
    }

    // Slave 3 active
    S3_ACTIVE.whenIsActive 
    {
      io.axiStreamOut.valid := io.axiStreamIn3.valid
      io.axiStreamOut.payload := io.axiStreamIn3.payload
      io.axiStreamIn3.ready := io.axiStreamOut.ready

      when(io.axiStreamIn3.fire && io.axiStreamIn3.payload.last) 
	    {
        rrPtr := 0  // next time start with slave 1
        goto(IDLE)
      }
    }
  }
}

// Generate Verilog
object MyTopLevelVerilog extends App 
{
  SpinalVerilog(RR_Arbiter_IP())
}
