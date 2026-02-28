package projectname

import spinal.core._

case class Hamming_ECC_IP() extends Component
{
	val io = new Bundle 
	{
		val data_in = in Bits(32 bits)
		val data_out = out Bits(39 bits)
	}
	
	val d = io.data_in

	// -------------------------
	// Hamming parity bits
	// -------------------------

	val P0 = d(0) ^ d(1) ^ d(3) ^ d(4) ^ d(6) ^ d(8) ^ d(10) ^ d(11) ^ d(13) ^ d(15) ^ d(17) ^ d(19) ^ d(21) ^ d(23) ^ d(25) ^ d(26) ^ d(28) ^ d(30)

	val P1 = d(0) ^ d(2) ^ d(3) ^ d(5) ^ d(6) ^ d(9) ^ d(10) ^ d(12) ^ d(13) ^ d(16) ^ d(17) ^ d(20) ^ d(21) ^ d(24) ^ d(25) ^ d(27) ^ d(28) ^ d(31)

	val P2 = d(1) ^ d(2) ^ d(3) ^ d(7) ^ d(8) ^ d(9) ^ d(10) ^ d(14) ^ d(15) ^ d(16) ^ d(17) ^ d(22) ^ d(23) ^ d(24) ^ d(25) ^ d(29) ^ d(30) ^ d(31)

	val P3 = d(4) ^ d(5) ^ d(6) ^ d(7) ^ d(8) ^ d(9) ^ d(10) ^ d(18) ^ d(19) ^ d(20) ^ d(21) ^ d(22) ^ d(23) ^ d(24) ^ d(25)

	val P4 = d(11) ^ d(12) ^ d(13) ^ d(14) ^ d(15) ^ d(16) ^ d(17) ^ d(18) ^ d(19) ^ d(20) ^ d(21) ^ d(22) ^ d(23) ^ d(24) ^ d(25)

	val P5 = d(26) ^ d(27) ^ d(28) ^ d(29) ^ d(30) ^ d(31)

	// -------------------------
	// Overall parity (SECDED)
	// -------------------------

	val P6 = d.xorR ^ P0 ^ P1 ^ P2 ^ P3 ^ P4 ^ P5

	// -------------------------
	// Output formatting
	// -------------------------
	io.data_out := P6 ## P5 ## P4 ## P3 ## P2 ## P1 ## P0 ## d
}

object MyTopLevelVerilog extends App 
{
	Config.spinal.generateVerilog(Hamming_ECC_IP())
}
