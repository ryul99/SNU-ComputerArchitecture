import Multiplexer::*;
import FIFO::*;
import FIFOF::*;
import Vector::*;
import SpecialFIFOs::*;

/* Interface of the basic right shifter module */
interface BarrelShifterRightPipelined;
	method Action shift_request(Bit#(64) operand, Bit#(6) shamt, Bit#(1) val);
	method ActionValue#(Bit#(64)) shift_response();
endinterface

module mkBarrelShifterRightPipelined(BarrelShifterRightPipelined);
	let inFifo <- mkFIFOF;
	let outFifo <- mkFIFOF;
  Integer n = 71;
  Vector#(7,FIFO#(Tuple3)) midFifo = newVector;
//  FIFOF#(FIFOF) midFifo[7] = 0;
  
  for(Integer i = 0; i < 7; i = i+1) begin
    midFifo[i] <- mkFIFOF;
//    midFifo[i] = 0;
  end

	rule shift;
		/* TODO: Implement a pipelined right shift logic. */
//    method ActionValue#(Bit#(64)) rightShift(Bit#(64) val, Bit#(6) shiftAmt, Bit#(1) shiftValue);
      Bit#(64) re = 0;
      Integer shift = 1;
      Bit#(64) in = 0;
//      for(Integer i = 0; i < 64; i = i+1)
//       in[i] = val[i];
//     for(Integer i = 0; i < 64; i = i+1)
//       re[i] = val[i];
      midFifo[0] <= inFifo;
     /* TODO: Implement right barrel shifter using six multiplexers. */
      for(Integer i = 1; i <= 6 ; i = i + 1) begin
/*
        if(i == 0&&inFifo.notEmpty()&&midFifo[0].notFull()) begin
          inFifo.deq;
          in = tpl_1(inFifo.first);
          Bit#(6) shiftAmt = tpl_2(inFifo.first);
          Bit#(1) shiftValue = tpl_3(inFifo.first);
          midFifo[0].enq(rightShifting(in, shiftAmt,shiftValue));
        end
        if(i == 5&&midFifo[4].notEmpty()&&outFifo.notFull()) begin
          midFifo[4].deq;
          in = tpl_1(midFifo[4].first);
          Bit#(6) shiftAmt = tpl_2(midFifo[4].first);
          Bit#(1) shiftValue = tpl_3(midFifo[4].first);
          outFifo.enq(rightShifting(in, shiftAmt, shiftValue));
        end
        */
        if(i>0 && midFifo[i-1].notEmpty()&&midFifo[i].notFull) begin 
          in = tpl_1(midFifo[i-1].first);
          Bit#(6) shiftAmt = tpl_2(midFifo[i-1].first);
          Bit#(1) shiftValue = tpl_3(midFifo[i-1].first);
          midFifo[i-1].deq;
          for(Integer j = 0 ; j < shift; j = j + 1)
          re[63-j] = shiftValue;
          for(Integer j = shift; j < 64; j = j + 1)
          re[63-j] = in[63-j+shift];
          re = multiplexer_n(shiftAmt[i], in, re);
          midFifo[i].enq(tuple3(re,shiftAmt,shiftValue));
          shift = shift * 2;
        end
      end
//      return re;
//    endmethod
		//noAction;
	endrule

	method Action shift_request(Bit#(64) operand, Bit#(6) shamt, Bit#(1) val);
		inFifo.enq(tuple3(operand, shamt, val));
	endmethod

	method ActionValue#(Bit#(64)) shift_response();
    let v = outFifo.first;
		outFifo.deq;
		return v;
	endmethod
/*
  method ActionValue#(tuple3) rightShifting(tuple3);
    Bit#(64) re = 0;
    for(Integer j = 0 ; j < shift; j = j + 1)
    re[63-j] = shiftValue;
    for(Integer j = shift; j < 64; j = j + 1)
    re[63-j] = in[63-j+shift];
    re = multiplexer_n(shiftAmt[i], in, re);
    return tuple3(re,shiftAmt,shiftValue);
  endmethod
*/
endmodule


/* Interface of the three shifter modules
 *
 * They have the same interface.
 * So, we just copy it using typedef declarations.
 */
interface BarrelShifterRightLogicalPipelined;
	method Action shift_request(Bit#(64) operand, Bit#(6) shamt);
	method ActionValue#(Bit#(64)) shift_response();
endinterface

typedef BarrelShifterRightLogicalPipelined BarrelShifterRightArithmeticPipelined;
typedef BarrelShifterRightLogicalPipelined BarrelShifterLeftPipelined;

module mkBarrelShifterLeftPipelined(BarrelShifterLeftPipelined);
	/* TODO: Implement left shifter using the pipelined right shifter. */
	let bsrp <- mkBarrelShifterRightPipelined;

	method Action shift_request(Bit#(64) operand, Bit#(6) shamt);
		noAction;
	endmethod

	method ActionValue#(Bit#(64)) shift_response();
		let result <- ?;
		return 0;
	endmethod
endmodule

module mkBarrelShifterRightLogicalPipelined(BarrelShifterRightLogicalPipelined);
	/* TODO: Implement right logical shifter using the pipelined right shifter. */
	let bsrp <- mkBarrelShifterRightPipelined;

	method Action shift_request(Bit#(64) operand, Bit#(6) shamt);
		noAction;
	endmethod

	method ActionValue#(Bit#(64)) shift_response();
		let result <- ?;
		return 0;
	endmethod
endmodule

module mkBarrelShifterRightArithmeticPipelined(BarrelShifterRightArithmeticPipelined);
	/* TODO: Implement right arithmetic shifter using the pipelined right shifter. */
	let bsrp <- mkBarrelShifterRightPipelined;

	method Action shift_request(Bit#(64) operand, Bit#(6) shamt);
		noAction;
	endmethod

	method ActionValue#(Bit#(64)) shift_response();
		let result <- ?;
		return 0;
	endmethod
endmodule
