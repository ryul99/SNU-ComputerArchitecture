import Multiplexer::*;

interface BarrelShifterRight;
  method ActionValue#(Bit#(64)) rightShift(Bit#(64) val, Bit#(6) shiftAmt, Bit#(1) shiftValue);
endinterface

module mkBarrelShifterRight(BarrelShifterRight);
  method ActionValue#(Bit#(64)) rightShift(Bit#(64) val, Bit#(6) shiftAmt, Bit#(1) shiftValue);
    Bit#(64) re = 0;
    Integer shift = 1;
    Bit#(64) in = 0;
    for(Integer i = 0; i < 64; i = i+1)
      in[i] = val[i];
    for(Integer i = 0; i < 64; i = i+1)
      re[i] = val[i];
    /* TODO: Implement right barrel shifter using six multiplexers. */
    for(Integer i = 0; i < 6 ; i = i + 1) begin
      for(Integer j = 0 ; j < shift; j = j + 1)
        re[j] = multiplexer_n(shiftAmt[i],re[j],shiftValue);
      for(Integer j = shift; j < 64; j = j + 1)
        re[j] = multiplexer_n(shiftAmt[i],re[j],in[j - shift]);
      for(Integer j = 0; j < 64; j = j + 1)
        in[j] =  re[j];
      shift = shift * 2;
    end
    return re;
  endmethod
endmodule

interface BarrelShifterRightLogical;
  method ActionValue#(Bit#(64)) rightShift(Bit#(64) val, Bit#(6) shiftAmt);
endinterface

module mkBarrelShifterRightLogical(BarrelShifterRightLogical);
  let bsr <- mkBarrelShifterRight;
  method ActionValue#(Bit#(64)) rightShift(Bit#(64) val, Bit#(6) shiftAmt);
    /* TODO: Implement logical right shifter using the right shifter */
    let result <- bsr.rightShift(val,shiftAmt,0);
//    Bit#(64) result <- re;
/*    for(Integer i = 0; i < 64; i = i + 1)
      result[i] = re::_read[i];*/
    return result;
  endmethod
endmodule

typedef BarrelShifterRightLogical BarrelShifterRightArithmetic;

module mkBarrelShifterRightArithmetic(BarrelShifterRightArithmetic);
  let bsr <- mkBarrelShifterRight;
  method ActionValue#(Bit#(64)) rightShift(Bit#(64) val, Bit#(6) shiftAmt);
    /* TODO: Implement arithmetic right shifter using the right shifter */
    let result <- ?;
    return 0;
  endmethod
endmodule
