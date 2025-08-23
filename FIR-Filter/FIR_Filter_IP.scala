package projectname

import spinal.core._
import spinal.lib._
import spinal.lib.Stream._
import spinal.lib.bus.amba4.axilite._

case class FIR_Filter_IP(taps: Int = 8) extends Component 
{
  // ---------------- AXI-Lite control ----------------
  val axi = slave(AxiLite4(AxiLite4Config(6, 32, 2)))
  val slv = AxiLite4SlaveFactory(axi)

  val coeffs = Vec(Reg(SInt(32 bits)) init 0, taps)
  val enable = Reg(Bool) init False

  for (i <- 0 until taps) 
  {
    slv.readAndWrite(coeffs(i), address = i * 4)
  }
  slv.readAndWrite(enable, address = taps * 4)

  // ---------------- Streaming I/O ----------------
  val axiStreamIn  = slave  Stream(SInt(32 bits))
  val axiStreamOut = master Stream(SInt(32 bits))

  // ---------------- FIR core ----------------
  val delregs  = Vec(Reg(SInt(32 bits)) init 0, taps)
  val delvals  = Vec(Reg(Bool) init False, taps)

  // Default
  axiStreamIn.ready := enable
  axiStreamOut.valid := False
  axiStreamOut.payload := 0

  when(enable) 
  {
    // Pipeline shift registers
    delvals(0) := axiStreamIn.valid
    delregs(0) := axiStreamIn.payload

    for (i <- 1 until taps) 
	{
      delvals(i) := delvals(i - 1)
      when(delvals(i - 1)) 
	  {
        delregs(i) := delregs(i - 1)
      }
    }

    // FIR multiply-accumulate
    val products = for (i <- 0 until taps) yield (delregs(i) * coeffs(i)).resized
    val sum = products.reduce(_ + _)

    axiStreamOut.valid := delvals.last
    axiStreamOut.payload := sum.resized
  }
}

object MyTopLevelVerilog extends App 
{
  Config.spinal.generateVerilog(FIR_Filter_IP())
}
