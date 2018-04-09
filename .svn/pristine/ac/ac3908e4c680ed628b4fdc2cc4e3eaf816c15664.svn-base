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
  let midFifo1 <- mkFIFOF;
  let midFifo2 <- mkFIFOF;
  let midFifo3 <- mkFIFOF;
  let midFifo4 <- mkFIFOF;
  let midFifo5 <- mkFIFOF;

	rule shift1 if(inFifo.notEmpty()&&midFifo1.notFull);
      Bit#(64) re = 0;
      Bit#(64) in = 0;
      Integer shift = 1;
          in = tpl_1(inFifo.first);
          Bit#(6) shiftAmt = tpl_2(inFifo.first);
          Bit#(1) shiftValue = tpl_3(inFifo.first);
          inFifo.deq;
          for(Integer j = 0 ; j < shift; j = j + 1)
          re[63-j] = shiftValue;
          for(Integer j = shift; j < 64; j = j + 1)
          re[63-j] = in[63-j+shift];
          re = multiplexer_n(shiftAmt[0], in, re);
          midFifo1.enq(tuple3(re,shiftAmt,shiftValue));
	endrule
	rule shift2 if(midFifo1.notEmpty()&&midFifo2.notFull);
      Bit#(64) re = 0;
      Bit#(64) in = 0;
      Integer shift = 2; 
          in = tpl_1(midFifo1.first);
          Bit#(6) shiftAmt = tpl_2(midFifo1.first);
          Bit#(1) shiftValue = tpl_3(midFifo1.first);
          midFifo1.deq;
          for(Integer j = 0 ; j < shift; j = j + 1)
          re[63-j] = shiftValue;
          for(Integer j = shift; j < 64; j = j + 1)
          re[63-j] = in[63-j+shift];
          re = multiplexer_n(shiftAmt[1], in, re);
          midFifo2.enq(tuple3(re,shiftAmt,shiftValue));
	endrule
	rule shift3 if(midFifo2.notEmpty()&&midFifo3.notFull);
      Bit#(64) re = 0;
      Bit#(64) in = 0;
      Integer shift = 4; 
          in = tpl_1(midFifo2.first);
          Bit#(6) shiftAmt = tpl_2(midFifo2.first);
          Bit#(1) shiftValue = tpl_3(midFifo2.first);
          midFifo2.deq;
          for(Integer j = 0 ; j < shift; j = j + 1)
          re[63-j] = shiftValue;
          for(Integer j = shift; j < 64; j = j + 1)
          re[63-j] = in[63-j+shift];
          re = multiplexer_n(shiftAmt[2], in, re);
          midFifo3.enq(tuple3(re,shiftAmt,shiftValue));
	endrule
	rule shift4 if(midFifo3.notEmpty()&&midFifo4.notFull);
      Bit#(64) re = 0;
      Bit#(64) in = 0;
      Integer shift = 8; 
          in = tpl_1(midFifo3.first);
          Bit#(6) shiftAmt = tpl_2(midFifo3.first);
          Bit#(1) shiftValue = tpl_3(midFifo3.first);
          midFifo3.deq;
          for(Integer j = 0 ; j < shift; j = j + 1)
          re[63-j] = shiftValue;
          for(Integer j = shift; j < 64; j = j + 1)
          re[63-j] = in[63-j+shift];
          re = multiplexer_n(shiftAmt[3], in, re);
          midFifo4.enq(tuple3(re,shiftAmt,shiftValue));
	endrule
	rule shift5 if(midFifo4.notEmpty()&&midFifo5.notFull);
      Bit#(64) re = 0;
      Bit#(64) in = 0;
      Integer shift = 16; 
          in = tpl_1(midFifo4.first);
          Bit#(6) shiftAmt = tpl_2(midFifo4.first);
          Bit#(1) shiftValue = tpl_3(midFifo4.first);
          midFifo4.deq;
          for(Integer j = 0 ; j < shift; j = j + 1)
          re[63-j] = shiftValue;
          for(Integer j = shift; j < 64; j = j + 1)
          re[63-j] = in[63-j+shift];
          re = multiplexer_n(shiftAmt[4], in, re);
          midFifo5.enq(tuple3(re,shiftAmt,shiftValue));
	endrule
	rule shift6 if(midFifo5.notEmpty()&&outFifo.notFull);
      Bit#(64) re = 0;
      Bit#(64) in = 0;
      Integer shift = 32;
      in = tpl_1(midFifo5.first);
      Bit#(6) shiftAmt = tpl_2(midFifo5.first);
      Bit#(1) shiftValue = tpl_3(midFifo5.first);
      midFifo5.deq;
      for(Integer j = 0 ; j < shift; j = j + 1)
      re[63-j] = shiftValue;
      for(Integer j = shift; j < 64; j = j + 1)
      re[63-j] = in[63-j+shift];
      re = multiplexer_n(shiftAmt[5], in, re);
      outFifo.enq(tuple3(re,shiftAmt,shiftValue));
	endrule

	method Action shift_request(Bit#(64) operand, Bit#(6) shamt, Bit#(1) val);
		inFifo.enq(tuple3(operand, shamt, val));
	endmethod

	method ActionValue#(Bit#(64)) shift_response();
    Bit#(64) v = tpl_1(outFifo.first);
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
		let reverse = reverseBits(operand);
    bsrp.shift_request(reverse, shamt, 0);
	endmethod

	method ActionValue#(Bit#(64)) shift_response();
    Bit#(64) re <- bsrp.shift_response();
		let result = reverseBits(re);
		return result;
	endmethod
endmodule

module mkBarrelShifterRightLogicalPipelined(BarrelShifterRightLogicalPipelined);
	/* TODO: Implement right logical shifter using the pipelined right shifter. */
	let bsrp <- mkBarrelShifterRightPipelined;

	method Action shift_request(Bit#(64) operand, Bit#(6) shamt);
		bsrp.shift_request(operand, shamt, 0);
	endmethod

	method ActionValue#(Bit#(64)) shift_response();
		let result <- bsrp.shift_response();
		return result;
	endmethod
endmodule

module mkBarrelShifterRightArithmeticPipelined(BarrelShifterRightArithmeticPipelined);
	/* TODO: Implement right arithmetic shifter using the pipelined right shifter. */
	let bsrp <- mkBarrelShifterRightPipelined;

	method Action shift_request(Bit#(64) operand, Bit#(6) shamt);
    let a = operand[63];
    bsrp.shift_request(operand,shamt,a);
	endmethod

	method ActionValue#(Bit#(64)) shift_response();
		let result <- bsrp.shift_response();
		return result;
	endmethod
endmodule
