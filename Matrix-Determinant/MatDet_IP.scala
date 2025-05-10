package projectname

import spinal.core._
import spinal.lib._
import spinal.lib.fsm._
import spinal.lib.bus.amba4.axilite._

case class MatDet_IP() extends Component
{
    val axi = slave(AxiLite4(AxiLite4Config(6,32,2))) //6 is address width, 32 is data width 
    val slv = AxiLite4SlaveFactory(axi)  
    val regs = Vec(Reg(SInt(32 bits)) init 0,12)
    (0 until 12).map(i=>slv.readAndWrite(regs(i), address= i*4))
    //regs0 to regs8 store 3x3 matrix elements
    //regs9 stores determinant result
    //regs10 is to state the computation
    //regs11 is to indicate that the computation is done and that the result (in regs9) is valid
    
	//internal register to store determinant
	val result = Reg(SInt(24 bits)) init(0)

	var a = SInt(8 bits)
	var b = SInt(8 bits)
	var c = SInt(8 bits)
	var d = SInt(8 bits)
	var e = SInt(8 bits)

	//internal register used as indicator that computation is over and regs9, regs11 can be updated
	val indreg = Reg(UInt(1 bits)) init(0)

	//signal that enable the computation (i.e enable the data path)
	var comp_en = Bool()

	//FSM to implement the control path of the matrix determinant engine	
    val fsm = new StateMachine 
  	{
		//set comp_en as 0 to avoid latches
		comp_en := False
		a := 0
		b := 0
		c := 0
		d := 0
		e := 0

		//stateA - FSM enters here on reset or when computation is done
    val stateA : State = new State with EntryPoint
    {
        whenIsActive
        {
          //regs10 = 1 indicates that the computation has to start or is done
          when (regs(10) === S(1))
          {
            when (indreg === U(1)) //indreg = 1 indicates that the computation is done
            {
              regs(9) := result.resized //store result in regs(9)
              regs(10) := S(0)          //make regs(10) = 0 in order to not start new computation again
              regs(11) := S(2)	      //make regs(11) = 2 to show that the result is valid
            }
            .otherwise //indreg = 0 indicates that the computation has to start 
            {
              regs(9) := S(0)           //store 0 in regs(9) just to clear any previous value
              regs(11) := S(1)          //make regs(11) = 1 to show that the result is not valid and computation is ongoing
              goto(stateB)              //go to stateB to start the computation
            }
          }
          comp_en := False //no computation is happening in this cycle (note that comp_en is a signal, not a register)
        }
    }
    
    //stateB - first cycle of computation
    val stateB : State = new State 
    {
      whenIsActive //store appropriate values in registers a, b, c, d, e; enable computation and go to stateC
      {
        goto(stateC)
        a := regs(0).resized
        b := regs(4).resized 
        c := regs(8).resized
        d := regs(7).resized
        e := regs(5).resized
        comp_en := True
      }
    }
    
    //stateC - second cycle of computation
    val stateC : State = new State 
    {
        whenIsActive //store appropriate values in registers a, b, c, d, e; enable computation and go to stateD
        {
          goto(stateD)
          a := regs(1).resized
          b := regs(6).resized 
          c := regs(5).resized
          d := regs(8).resized
          e := regs(3).resized 
          comp_en := True
        }
    }

    //stateD - third cycle of computation
    val stateD : State = new State 
    {
        whenIsActive //store appropriate values in registers a, b, c, d, e; enable computation and go to stateD
        {
          goto(stateA)
          a := regs(2).resized
          b := regs(3).resized
          c := regs(7).resized 
          d := regs(4).resized
          e := regs(6).resized
          indreg := U(1)
          comp_en := True
        }
    }
	}

  //Data path to compute determinant
	when (comp_en === True)
	{
		result := (result + (a*(b*c - d*e)))
	}
}

object MyTopLevelVerilog extends App 
{
	Config.spinal.generateVerilog(MatDet_IP())
}
