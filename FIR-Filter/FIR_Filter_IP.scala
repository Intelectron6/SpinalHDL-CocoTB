package projectname

import spinal.core._
import spinal.lib._
import spinal.lib.Stream._
import spinal.lib.bus.amba4.axilite._

case class FIR_Filter_IP() extends Component
{
    val axi = slave(AxiLite4(AxiLite4Config(6,32,2))) //6 is address width, 32 is data width 
    val slv = AxiLite4SlaveFactory(axi)  
    val regs = Vec(Reg(SInt(32 bits)) init 0,9)
    (0 until 9).map(i=>slv.readAndWrite(regs(i), address= i*4))
    //regs0 to regs7 will store the filter coefficients
	  //regs8 will store indicator that the filter computation has been enabled

    //axistream input (slave) and axistream output (master) interfaces
	  val axiStreamIn  = slave  Stream(SInt(32 bits))
    val axiStreamOut = master Stream(SInt(32 bits))

    //internal registers
    val delregs  = Vec(Reg(SInt(32 bits)) init(0), 8)   //to store delayed versions of the input payload
    val delvals  = Vec(Reg(Bool) init(False), 8)        //to store delayed versions of the input valid signal
    val prodregs = Vec(Reg(SInt(32 bits)) init(0), 8)   //to store the products of input samples and filter coefficients

    //start filtering when regs8 is 1
  	when (regs(8) === S(1))
  	{
  		axiStreamIn.ready := True

      //passing the input valid signal....output valid will be 8 cycle shifted version of input valid
  		delvals(0) := axiStreamIn.valid
  		delvals(1) := delvals(0)
  		delvals(2) := delvals(1)
  		delvals(3) := delvals(2)
  		delvals(4) := delvals(3)
  		delvals(5) := delvals(4)
  		delvals(6) := delvals(5)
  		delvals(7) := delvals(6)
  		axiStreamOut.valid := delvals(7)

      //store delayed versions of the input payload and products of input payload with filter coefficients
      //use corresponding versions of valid signals to enable the registers
  		when(axiStreamIn.valid)
  		{
  			delregs(0)  := axiStreamIn.payload
  			prodregs(0) := (axiStreamIn.payload * regs(0)).resized
  		}
  
  		when(delvals(0))
  		{
  			delregs(1)  := delregs(0)
  			prodregs(1) := (delregs(0) * regs(1)).resized
  		}
  
  		when(delvals(1))
  		{
  			delregs(2)  := delregs(1)
  			prodregs(2) := (delregs(1) * regs(2)).resized
  		}
  
  		when(delvals(2))
  		{
  			delregs(3)  := delregs(2)
  			prodregs(3) := (delregs(2) * regs(3)).resized
  		}
  
  		when(delvals(3))
  		{
  			delregs(4)  := delregs(3)
  			prodregs(4) := (delregs(3) * regs(4)).resized
  		}
  
  		when(delvals(4))
  		{
  			delregs(5)  := delregs(4)
  			prodregs(5) := (delregs(4) * regs(5)).resized
  		}
  
  		when(delvals(5))
  		{
  			delregs(6)  := delregs(5)
  			prodregs(6) := (delregs(5) * regs(6)).resized
  		}
  
  		when(delvals(6)) //not necessary to store delayed version of input here....
  		{
  			prodregs(7) := (delregs(6) * regs(7)).resized
  		}
  
  		when(delvals(7)) //finally add all the products and stream it out
  		{
  			axiStreamOut.payload := (prodregs(0) + prodregs(1) + prodregs(2) + prodregs(3) + prodregs(4) + prodregs(5) + prodregs(6) + prodregs(7)).resized
  		}
  		.otherwise
  		{
  			axiStreamOut.payload := S(0)
  		}
  	}
  	.otherwise
  	{
  		axiStreamIn.ready := False
  		axiStreamOut.valid := False
  		axiStreamOut.payload := S(0)
  	}
}

object MyTopLevelVerilog extends App 
{
	Config.spinal.generateVerilog(FIR_Filter_IP())
}
