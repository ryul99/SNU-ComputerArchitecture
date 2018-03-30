import BarrelShifterRight::*;

interface BarrelShifterLeft;
	method ActionValue#(Bit#(64)) leftShift(Bit#(64) val, Bit#(6) shiftAmt);
endinterface

module mkBarrelShifterLeft(BarrelShifterLeft);
	let bsr <- mkBarrelShifterRightLogical;
	method ActionValue#(Bit#(64)) leftShift(Bit#(64) val, Bit#(6) shiftAmt);
		/* TODO: Implement a left shifter using the given logical right shifter */
    Bit#(64) reverse = reverseBits(val);
    Bit#(64) revResul <- bsr.rightShift(reverse,shiftAmt);
		let result = reverseBits(revResul);
		return result;
	endmethod
endmodule
