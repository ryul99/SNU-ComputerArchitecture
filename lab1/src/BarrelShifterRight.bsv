import Multiplexer::*;

interface BarrelShifterRight;
  method ActionValue#(Bit#(64)) rightShift(Bit#(64) val, Bit#(6) shiftAmt, Bit#(1) shiftValue);
endinterface

module mkBarrelShifterRight(BarrelShifterRight);
  method ActionValue#(Bit#(64)) rightShift(Bit#(64) val, Bit#(6) shiftAmt, Bit#(1) shiftValue);
    Bit#(64) re;
    for(Integer i = 0; i < 64; i = i + 1)
      re[i] = val[i];
    Integer shift = 1;
    /* TODO: Implement right barrel shifter using six multiplexers. */
    for(Integer i = 0; i < 6 ; i = i + 1) begin
      Bit#(64) origin;
      for(Integer j = 0; j < 64; j = j + 1)
        origin[j] = re[j];
      for(Integer j = 0 ; j < shift; j = j + 1) begin
        re[j] = shiftValue;
      end
      for(Integer j = shift; j < 64; j = j + 1) begin
        re[j] = val[j - shift];
      end
      re = multiplexer_n(shiftAmt[i],origin,re);
      shift = shift * 2;
    end
    let result <- Bit#(64) re;
    return 0;
  endmethod
endmodule

interface BarrelShifterRightLogical;
  method ActionValue#(Bit#(64)) rightShift(Bit#(64) val, Bit#(6) shiftAmt);
endinterface

module mkBarrelShifterRightLogical(BarrelShifterRightLogical);
  let bsr <- mkBarrelShifterRight;
  method ActionValue#(Bit#(64)) rightShift(Bit#(64) val, Bit#(6) shiftAmt);
    /* TODO: Implement logical right shifter using the right shifter */
    let re = bsr(val,shiftAmt,0);
    let result <- re;
    return 0;
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
