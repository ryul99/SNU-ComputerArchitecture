import Types::*;
import ProcTypes::*;
import MemTypes::*;
import BypassRFile::*;
import Scoreboard::*;
import IMemory::*;
import DMemory::*;
import Decode::*;
import Exec::*;
import Cop::*;
import Fifo::*;

typedef struct {
	Inst inst;
	Addr pc;
	Addr ppc;
	Bool epoch;
} Fetch2Decode deriving(Bits, Eq);

typedef struct {
	DecodedInst dInst;
	Addr ppc;
	Bool epoch;
} Decode2Exec deriving(Bits, Eq);
/*
typedef struct {
  ExecInst eInst;
  Addr ppc;
  Bool epoch;
} Exec2Memory deriving(Bits, Eq);
*/
typedef struct {
  Maybe#(ExecInst) eInst;
} Exec2Memory deriving(Bits, Eq);
/*
typedef struct {
  ExecInst eInst;
  Addr ppc;
  Bool epoch;
} Memory2WriteBack deriving(Bits, Eq);
*/
typedef struct {
  Maybe#(ExecInst) eInst;
} Memory2WriteBack deriving(Bits, Eq);

(*synthesize*)
module mkProc(Proc);
	Reg#(Addr)    pc  <- mkRegU;
	RFile         rf  <- mkBypassRFile;
	IMemory     iMem  <- mkIMemory;
	DMemory     dMem  <- mkDMemory;
	Cop          cop  <- mkCop;

	Reg#(CondFlag) 	 	condFlag	<- mkRegU;
	Reg#(ProcStatus)   	stat		<- mkRegU;

	Fifo#(1, Addr)       execRedirect <- mkBypassFifo;
  Fifo#(1, Addr)       memRedirect  <- mkBypassFifo;
	Fifo#(1, ProcStatus) statRedirect <- mkBypassFifo;

	Fifo#(1, Fetch2Decode)	f2d    	   <- mkPipelineFifo;
  Fifo#(1, Decode2Exec)   d2e        <- mkPipelineFifo;
  Fifo#(1, Exec2Memory)   e2m        <- mkPipelineFifo;
  Fifo#(1, Memory2WriteBack) m2w     <- mkPipelineFifo;

	Reg#(Bool) fEpoch <- mkRegU;
	Reg#(Bool) eEpoch <- mkRegU;

	Scoreboard#(4) sb <- mkPipelineScoreboard;

	/* TODO: Lab 6-1: Implement 5-stage pipelined processor, using given scoreboard.
			 Lab 6-2: Implement 5-stage pipelined processor, using bypassing. */

	rule doFetch(cop.started && stat == AOK);
		/* Fetch */
    Addr rPc;
    Bool rEpoch;

		if(execRedirect.notEmpty)
		begin
			rEpoch = !fEpoch;
			execRedirect.deq;
			rPc = execRedirect.first;
		end
		else if(memRedirect.notEmpty)
    begin
      rEpoch = !fEpoch;
      memRedirect.deq;
      rPc = memRedirect.first;
    end
    else
		begin
      rPc = pc;
      rEpoch = fEpoch;
  	end

		let inst = iMem.req(rPc);
		let ppc = nextAddr(rPc, getICode(inst));

    fEpoch <= rEpoch;
    pc <= ppc;

		$display("Fetch : from Pc %d , expanded inst : %x, \n", rPc, inst, showInst(inst));
		f2d.enq(Fetch2Decode{inst:inst, pc:rPc, ppc:ppc, epoch:rEpoch});
  endrule

	rule doDecode(cop.started && stat == AOK);
		let inst   = f2d.first.inst;
		let ipc    = f2d.first.pc;
		let ppc    = f2d.first.ppc;
		let iEpoch = f2d.first.epoch;
    let dInst = decode(inst, ipc);
	  
    let stall = sb.search1(dInst.regA) || sb.search2(dInst.regB);

    if(!stall)
    begin
      f2d.deq;
		/* Decode */
//		if(iEpoch == eEpoch)
//		begin
			dInst.valA   = isValid(dInst.regA)? tagged Valid rf.rdA(validRegValue(dInst.regA)) : Invalid;
			dInst.valB   = isValid(dInst.regB)? tagged Valid rf.rdB(validRegValue(dInst.regB)) : Invalid;
			dInst.copVal = isValid(dInst.regA)? tagged Valid cop.rd(validRegValue(dInst.regA)) : Invalid;
      d2e.enq(Decode2Exec{dInst: dInst, ppc: ppc, epoch: iEpoch});
      
      sb.insertE(dInst.dstE);
      sb.insertM(dInst.dstM);
//    end
    end
//    d2e.enq(Decode2Exec{dInst: dInst, ppc: ppc, epoch: iEpoch});
    $display("Decode : from Pc %d , expanded inst : %x, \n", ipc, inst, showInst(inst));

 endrule   

  rule doExec(cop.started && stat == AOK);
    let dInst = d2e.first.dInst;
    let ppc = d2e.first.ppc;
    let iEpoch = d2e.first.epoch;
    d2e.deq;

//	    let stall = sb.search1(dInst.regA) || sb.search2(dInst.regB) || sb.search3(dInst.dstE) || sb.search4(dInst.dstM);
//	    let stall = sb.search1(dInst.regA) || sb.search2(dInst.regB);
//    if(!stall)
//    begin
      if(iEpoch == eEpoch)
      begin
		/* Execute */
			let eInst = exec(dInst, condFlag, ppc);
			condFlag <= eInst.condFlag;
      e2m.enq(Exec2Memory{eInst: Valid(eInst)});

			if(eInst.mispredict)
			begin
				eEpoch <= !eEpoch;
        if(isValid(eInst.nextPc))
        begin
				  let redirPc = validValue(eInst.nextPc);
				  $display("mispredicted, redirect %d ", redirPc);
				  execRedirect.enq(redirPc);
        end
        
        //m2w.enq(Memory2WriteBack{eInst: Valid(eInst)});
//        m2w.enq(Memory2WriteBack{eInst: eInst, ppc: ppc, epoch: iEpoch});
      end

     // let iType = eInst.iType;
      /* Update Status */
/*			let newStatus = case(iType)
								Unsupported : INS;
								Hlt 		  : HLT;
								default     : AOK;
							endcase;
			statRedirect.enq(newStatus);
      */
      end
      else
        e2m.enq(Exec2Memory{eInst: Invalid});
      $display("OwO");
//    end
  endrule

  rule doMemory(cop.started && stat == AOK);

     e2m.deq;
     if(isValid(e2m.first.eInst))
      begin
      
      let eInst = validValue(e2m.first.eInst);
		/* Memory */
			let iType = eInst.iType;

//      if(!stall)
//      begin
//      if(iEpoch == eEpoch)
//      begin
			case(iType)
				MRmov, Pop, Ret :
				begin
					let ldData <- (dMem.req(MemReq{op: Ld, addr: eInst.memAddr, data:?}));
					eInst.valM = Valid(little2BigEndian(ldData));
					$display("Loaded %d from %d", little2BigEndian(ldData), eInst.memAddr);
					if(iType == Ret)
					begin
						eInst.nextPc = eInst.valM;
            memRedirect.enq(validValue(eInst.nextPc));
					end
				end

				RMmov, Call, Push :
				begin
					let stData = (iType == Call)? eInst.valP : validValue(eInst.valA);
					let dummy <- dMem.req(MemReq{op: St, addr: eInst.memAddr, data: big2LittleEndian(stData)});
					$display("Stored %d into %d", stData, eInst.memAddr);
				end
			endcase

      /*
			if(eInst.mispredict)
			begin
				eEpoch <= !eEpoch;
				let redirPc = validValue(eInst.nextPc);
				$display("mispredicted, redirect %d ", redirPc);
				execRedirect.enq(redirPc);
        m2w.enq(Memory2WriteBack{eInst: Valid(eInst)});
//        m2w.enq(Memory2WriteBack{eInst: eInst, ppc: ppc, epoch: iEpoch});
      end
      */
     m2w.enq(Memory2WriteBack{eInst: Valid(eInst)});
    end
      else
        m2w.enq(Memory2WriteBack{eInst: Invalid});
//    end
//    end
  endrule

  rule doWriteBack(cop.started && stat == AOK);
   if(isValid(m2w.first.eInst))
    begin

       let eInst = validValue(m2w.first.eInst);
       let iType = eInst.iType;


      /* Update Status */
			let newStatus = case(iType)
								Unsupported : INS;
								Hlt 		  : HLT;
								default     : AOK;
							endcase;
			statRedirect.enq(newStatus);


//      let eInst = m2w.first.eInst;
//      let iEpoch = m2w.first.epoch;
     //m2w.deq;
			/* WriteBack */
			if(isValid(eInst.dstE))
			begin
				$display("On %d, writes %d   (wrE)", validRegValue(eInst.dstE), validValue(eInst.valE));
				rf.wrE(validRegValue(eInst.dstE), validValue(eInst.valE));
			end
			if(isValid(eInst.dstM))
			begin
				$display("On %d, writes %d   (wrM)", validRegValue(eInst.dstM), validValue(eInst.valM));
				rf.wrM(validRegValue(eInst.dstM), validValue(eInst.valM));
			end

			cop.wr(eInst.dstE, validValue(eInst.valE));
      //sb.remove;
    end
    m2w.deq;
    sb.remove;
	endrule

	rule upd_Stat(cop.started);
		$display("Stat update");
		statRedirect.deq;
		stat <= statRedirect.first;
	endrule

	rule statHLT(cop.started && stat == HLT);
		$fwrite(stderr, "Program Finished by halt\n");
		$finish;
	endrule

	rule statINS(cop.started && stat == INS);
		$fwrite(stderr, "Executed unsupported instruction. Exiting\n");
		$finish;
	endrule

	method ActionValue#(Tuple3#(RIndx, Data, Data)) cpuToHost;
		let retV <- cop.cpuToHost;
		return retV;
	endmethod

	method Action hostToCpu(Addr startpc) if (!cop.started);
		cop.start;
		eEpoch <= False;
		fEpoch <= False;
		pc <= startpc;
		stat <= AOK;
	endmethod
endmodule
