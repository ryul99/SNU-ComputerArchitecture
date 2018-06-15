import Types::*;
import CacheTypes::*;
import Vector::*;

// IMemory Types
typedef 26 AddrBits;
typedef Bit#(AddrBits) MemIndx;
typedef Bit#(26) Memorysize;
typedef Bit#(80) Inst;


typedef WordsPerBlock MaxBurstLength;

typedef enum {Idle, Busy,IBusy, DBusy, BothBusy} MemStatus deriving(Eq, Bits);
typedef enum {Ld, St} MemOp deriving(Eq,Bits);

typedef struct {
	MemOp op;
	Addr addr;
	Data data;
} MemReq deriving(Eq, Bits);

typedef struct {
	MemOp op;
	Addr addr;
	Line data;
	Bit#(TAdd#(1,TLog#(MaxBurstLength))) burstLength;
} CacheMemReq deriving(Eq, Bits);
