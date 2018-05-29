signature ProcTypes where {
import ¶FIFOF_®¶;
		
import ¶FIFOF®¶;
	       
import ¶FIFO®¶;
	      
import ¶List®¶;
	      
import ¶PrimArray®¶;
		   
import ¶Probe®¶;
	       
import ¶Vector®¶;
		
import ¶FShow®¶;
	       
import Types;
	    
import MemTypes;
	       
type (ProcTypes.RIndx :: *) = ¶Prelude®¶.¶Bit®¶ 4;
						 
data (ProcTypes.ProcStatus :: *) =
    ProcTypes.AOK () | ProcTypes.ADR () | ProcTypes.INS () | ProcTypes.HLT ();
									     
instance ProcTypes ¶Prelude®¶.¶PrimMakeUndefined®¶ ProcTypes.ProcStatus;
								       
instance ProcTypes ¶Prelude®¶.¶PrimDeepSeqCond®¶ ProcTypes.ProcStatus;
								     
instance ProcTypes ¶Prelude®¶.¶PrimMakeUninitialized®¶ ProcTypes.ProcStatus;
									   
instance ProcTypes ¶Prelude®¶.¶Bits®¶ ProcTypes.ProcStatus 2;
							    
instance ProcTypes ¶Prelude®¶.¶Eq®¶ ProcTypes.ProcStatus;
							
type (ProcTypes.OpCode :: *) = ¶Prelude®¶.¶Bit®¶ 8;
						  
type (ProcTypes.ICode :: *) = ¶Prelude®¶.¶Bit®¶ 4;
						 
data (ProcTypes.RegType :: *) = ProcTypes.Normal () | ProcTypes.CopReg ();
									 
instance ProcTypes ¶Prelude®¶.¶PrimMakeUndefined®¶ ProcTypes.RegType;
								    
instance ProcTypes ¶Prelude®¶.¶PrimDeepSeqCond®¶ ProcTypes.RegType;
								  
instance ProcTypes ¶Prelude®¶.¶PrimMakeUninitialized®¶ ProcTypes.RegType;
									
instance ProcTypes ¶Prelude®¶.¶Bits®¶ ProcTypes.RegType 1;
							 
instance ProcTypes ¶Prelude®¶.¶Eq®¶ ProcTypes.RegType;
						     
data (ProcTypes.IType :: *) =
    ProcTypes.Unsupported () |
    ProcTypes.Rmov () |
    ProcTypes.Opq () |
    ProcTypes.RMmov () |
    ProcTypes.MRmov () |
    ProcTypes.Cmov () |
    ProcTypes.Jmp () |
    ProcTypes.Push () |
    ProcTypes.Pop () |
    ProcTypes.Call () |
    ProcTypes.Ret () |
    ProcTypes.Hlt () |
    ProcTypes.Nop () |
    ProcTypes.Mtc0 () |
    ProcTypes.Mfc0 ();
		     
instance ProcTypes ¶Prelude®¶.¶PrimMakeUndefined®¶ ProcTypes.IType;
								  
instance ProcTypes ¶Prelude®¶.¶PrimDeepSeqCond®¶ ProcTypes.IType;
								
instance ProcTypes ¶Prelude®¶.¶PrimMakeUninitialized®¶ ProcTypes.IType;
								      
instance ProcTypes ¶Prelude®¶.¶Bits®¶ ProcTypes.IType 4;
						       
instance ProcTypes ¶Prelude®¶.¶Eq®¶ ProcTypes.IType;
						   
data (ProcTypes.CondUsed :: *) =
    ProcTypes.Al () |
    ProcTypes.Eq () |
    ProcTypes.Neq () |
    ProcTypes.Lt () |
    ProcTypes.Le () |
    ProcTypes.Gt () |
    ProcTypes.Ge ();
		   
instance ProcTypes ¶Prelude®¶.¶PrimMakeUndefined®¶ ProcTypes.CondUsed;
								     
instance ProcTypes ¶Prelude®¶.¶PrimDeepSeqCond®¶ ProcTypes.CondUsed;
								   
instance ProcTypes ¶Prelude®¶.¶PrimMakeUninitialized®¶ ProcTypes.CondUsed;
									 
instance ProcTypes ¶Prelude®¶.¶Bits®¶ ProcTypes.CondUsed 3;
							  
instance ProcTypes ¶Prelude®¶.¶Eq®¶ ProcTypes.CondUsed;
						      
data (ProcTypes.OpqFunc :: *) =
    ProcTypes.FNop () | ProcTypes.FAdd () | ProcTypes.FSub () | ProcTypes.FAnd () | ProcTypes.FXor ();
												     
instance ProcTypes ¶Prelude®¶.¶PrimMakeUndefined®¶ ProcTypes.OpqFunc;
								    
instance ProcTypes ¶Prelude®¶.¶PrimDeepSeqCond®¶ ProcTypes.OpqFunc;
								  
instance ProcTypes ¶Prelude®¶.¶PrimMakeUninitialized®¶ ProcTypes.OpqFunc;
									
instance ProcTypes ¶Prelude®¶.¶Bits®¶ ProcTypes.OpqFunc 3;
							 
instance ProcTypes ¶Prelude®¶.¶Eq®¶ ProcTypes.OpqFunc;
						     
type (ProcTypes.OpqRes :: *) = ¶Prelude®¶.¶Tuple2®¶ ProcTypes.CondFlag Types.Data;
										 
type (ProcTypes.ExecRes :: *) =
  ¶Prelude®¶.¶Tuple4®¶ ProcTypes.CondFlag ¶Prelude®¶.¶Bool®¶ ¶Prelude®¶.¶Bool®¶ Types.Data;
											  
struct (ProcTypes.FullIndx :: *) = {
    ProcTypes.regType :: ProcTypes.RegType;
    ProcTypes.idx :: ProcTypes.RIndx
};
 
instance ProcTypes ¶Prelude®¶.¶PrimMakeUndefined®¶ ProcTypes.FullIndx;
								     
instance ProcTypes ¶Prelude®¶.¶PrimDeepSeqCond®¶ ProcTypes.FullIndx;
								   
instance ProcTypes ¶Prelude®¶.¶PrimMakeUninitialized®¶ ProcTypes.FullIndx;
									 
instance ProcTypes ¶Prelude®¶.¶Bits®¶ ProcTypes.FullIndx 5;
							  
instance ProcTypes ¶Prelude®¶.¶Eq®¶ ProcTypes.FullIndx;
						      
ProcTypes.validReg :: ProcTypes.RIndx -> ¶Prelude®¶.¶Maybe®¶ ProcTypes.FullIndx;
									       
ProcTypes.validCop :: ProcTypes.RIndx -> ¶Prelude®¶.¶Maybe®¶ ProcTypes.FullIndx;
									       
ProcTypes.validRegValue :: ¶Prelude®¶.¶Maybe®¶ ProcTypes.FullIndx -> ProcTypes.RIndx;
										    
interface (ProcTypes.Proc :: *) = {
    ProcTypes.cpuToHost :: ¶Prelude®¶.¶ActionValue®¶
			   (¶Prelude®¶.¶Tuple3®¶ ProcTypes.RIndx Types.Data Types.Data) {-# arg_names = [] #-};
    ProcTypes.hostToCpu :: Types.Addr -> ¶Prelude®¶.¶Action®¶ {-# arg_names = [startpc] #-}
};
 
instance ProcTypes ¶Prelude®¶.¶PrimMakeUndefined®¶ ProcTypes.Proc;
								 
instance ProcTypes ¶Prelude®¶.¶PrimDeepSeqCond®¶ ProcTypes.Proc;
							       
instance ProcTypes ¶Prelude®¶.¶PrimMakeUninitialized®¶ ProcTypes.Proc;
								     
struct (ProcTypes.CondFlag :: *) = {
    ProcTypes.zf :: ¶Prelude®¶.¶Bool®¶;
    ProcTypes.sf :: ¶Prelude®¶.¶Bool®¶;
    ProcTypes.¡of¡ :: ¶Prelude®¶.¶Bool®¶
};
 
instance ProcTypes ¶Prelude®¶.¶PrimMakeUndefined®¶ ProcTypes.CondFlag;
								     
instance ProcTypes ¶Prelude®¶.¶PrimDeepSeqCond®¶ ProcTypes.CondFlag;
								   
instance ProcTypes ¶Prelude®¶.¶PrimMakeUninitialized®¶ ProcTypes.CondFlag;
									 
instance ProcTypes ¶Prelude®¶.¶Bits®¶ ProcTypes.CondFlag 3;
							  
instance ProcTypes ¶Prelude®¶.¶Eq®¶ ProcTypes.CondFlag;
						      
struct (ProcTypes.DecodedInst :: *) = {
    ProcTypes.iType :: ProcTypes.IType;
    ProcTypes.opqFunc :: ProcTypes.OpqFunc;
    ProcTypes.condUsed :: ProcTypes.CondUsed;
    ProcTypes.valP :: Types.Addr;
    ProcTypes.dstE :: ¶Prelude®¶.¶Maybe®¶ ProcTypes.FullIndx;
    ProcTypes.dstM :: ¶Prelude®¶.¶Maybe®¶ ProcTypes.FullIndx;
    ProcTypes.regA :: ¶Prelude®¶.¶Maybe®¶ ProcTypes.FullIndx;
    ProcTypes.regB :: ¶Prelude®¶.¶Maybe®¶ ProcTypes.FullIndx;
    ProcTypes.valA :: ¶Prelude®¶.¶Maybe®¶ Types.Data;
    ProcTypes.valB :: ¶Prelude®¶.¶Maybe®¶ Types.Data;
    ProcTypes.valC :: ¶Prelude®¶.¶Maybe®¶ Types.Data;
    ProcTypes.copVal :: ¶Prelude®¶.¶Maybe®¶ Types.Data
};
 
instance ProcTypes ¶Prelude®¶.¶PrimMakeUndefined®¶ ProcTypes.DecodedInst;
									
instance ProcTypes ¶Prelude®¶.¶PrimDeepSeqCond®¶ ProcTypes.DecodedInst;
								      
instance ProcTypes ¶Prelude®¶.¶PrimMakeUninitialized®¶ ProcTypes.DecodedInst;
									    
instance ProcTypes ¶Prelude®¶.¶Bits®¶ ProcTypes.DecodedInst 358;
							       
instance ProcTypes ¶Prelude®¶.¶Eq®¶ ProcTypes.DecodedInst;
							 
struct (ProcTypes.ExecInst :: *) = {
    ProcTypes.iType :: ProcTypes.IType;
    ProcTypes.dstE :: ¶Prelude®¶.¶Maybe®¶ ProcTypes.FullIndx;
    ProcTypes.dstM :: ¶Prelude®¶.¶Maybe®¶ ProcTypes.FullIndx;
    ProcTypes.valE :: ¶Prelude®¶.¶Maybe®¶ Types.Data;
    ProcTypes.valA :: ¶Prelude®¶.¶Maybe®¶ Types.Data;
    ProcTypes.valC :: ¶Prelude®¶.¶Maybe®¶ Types.Data;
    ProcTypes.valM :: ¶Prelude®¶.¶Maybe®¶ Types.Data;
    ProcTypes.valP :: Types.Addr;
    ProcTypes.condFlag :: ProcTypes.CondFlag;
    ProcTypes.condSatisfied :: ¶Prelude®¶.¶Bool®¶;
    ProcTypes.mispredict :: ¶Prelude®¶.¶Bool®¶;
    ProcTypes.memAddr :: Types.Addr;
    ProcTypes.nextPc :: ¶Prelude®¶.¶Maybe®¶ Types.Addr;
    ProcTypes.copVal :: ¶Prelude®¶.¶Maybe®¶ Types.Data
};
 
instance ProcTypes ¶Prelude®¶.¶PrimMakeUndefined®¶ ProcTypes.ExecInst;
								     
instance ProcTypes ¶Prelude®¶.¶PrimDeepSeqCond®¶ ProcTypes.ExecInst;
								   
instance ProcTypes ¶Prelude®¶.¶PrimMakeUninitialized®¶ ProcTypes.ExecInst;
									 
instance ProcTypes ¶Prelude®¶.¶Bits®¶ ProcTypes.ExecInst 539;
							    
instance ProcTypes ¶Prelude®¶.¶Eq®¶ ProcTypes.ExecInst;
						      
ProcTypes.getICode :: MemTypes.Inst -> ProcTypes.ICode;
						      
ProcTypes.getOpCode :: MemTypes.Inst -> ProcTypes.OpCode;
							
ProcTypes.nextAddr :: Types.Addr -> ¶Prelude®¶.¶Bit®¶ 4 -> Types.Addr;
								     
ProcTypes.isValidInst :: ProcTypes.OpCode -> ¶Prelude®¶.¶Bool®¶;
							       
ProcTypes.rax :: ¶Prelude®¶.¶Bit®¶ 4;
				    
ProcTypes.rcx :: ¶Prelude®¶.¶Bit®¶ 4;
				    
ProcTypes.rdx :: ¶Prelude®¶.¶Bit®¶ 4;
				    
ProcTypes.rbx :: ¶Prelude®¶.¶Bit®¶ 4;
				    
ProcTypes.rsp :: ¶Prelude®¶.¶Bit®¶ 4;
				    
ProcTypes.rbp :: ¶Prelude®¶.¶Bit®¶ 4;
				    
ProcTypes.rsi :: ¶Prelude®¶.¶Bit®¶ 4;
				    
ProcTypes.rdi :: ¶Prelude®¶.¶Bit®¶ 4;
				    
ProcTypes.r8 :: ¶Prelude®¶.¶Bit®¶ 4;
				   
ProcTypes.r9 :: ¶Prelude®¶.¶Bit®¶ 4;
				   
ProcTypes.r10 :: ¶Prelude®¶.¶Bit®¶ 4;
				    
ProcTypes.r11 :: ¶Prelude®¶.¶Bit®¶ 4;
				    
ProcTypes.r12 :: ¶Prelude®¶.¶Bit®¶ 4;
				    
ProcTypes.r13 :: ¶Prelude®¶.¶Bit®¶ 4;
				    
ProcTypes.r14 :: ¶Prelude®¶.¶Bit®¶ 4;
				    
ProcTypes.halt :: ¶Prelude®¶.¶Bit®¶ 4;
				     
ProcTypes.nop :: ¶Prelude®¶.¶Bit®¶ 4;
				    
ProcTypes.irmovq :: ¶Prelude®¶.¶Bit®¶ 4;
				       
ProcTypes.rmmovq :: ¶Prelude®¶.¶Bit®¶ 4;
				       
ProcTypes.mrmovq :: ¶Prelude®¶.¶Bit®¶ 4;
				       
ProcTypes.cmov :: ¶Prelude®¶.¶Bit®¶ 4;
				     
ProcTypes.opq :: ¶Prelude®¶.¶Bit®¶ 4;
				    
ProcTypes.addc :: ¶Prelude®¶.¶Bit®¶ 4;
				     
ProcTypes.subc :: ¶Prelude®¶.¶Bit®¶ 4;
				     
ProcTypes.andc :: ¶Prelude®¶.¶Bit®¶ 4;
				     
ProcTypes.xorc :: ¶Prelude®¶.¶Bit®¶ 4;
				     
ProcTypes.jmp :: ¶Prelude®¶.¶Bit®¶ 4;
				    
ProcTypes.call :: ¶Prelude®¶.¶Bit®¶ 4;
				     
ProcTypes.ret :: ¶Prelude®¶.¶Bit®¶ 4;
				    
ProcTypes.push :: ¶Prelude®¶.¶Bit®¶ 4;
				     
ProcTypes.pop :: ¶Prelude®¶.¶Bit®¶ 4;
				    
ProcTypes.fNcnd :: ¶Prelude®¶.¶Bit®¶ 4;
				      
ProcTypes.fLe :: ¶Prelude®¶.¶Bit®¶ 4;
				    
ProcTypes.fLt :: ¶Prelude®¶.¶Bit®¶ 4;
				    
ProcTypes.fEq :: ¶Prelude®¶.¶Bit®¶ 4;
				    
ProcTypes.fNeq :: ¶Prelude®¶.¶Bit®¶ 4;
				     
ProcTypes.fGe :: ¶Prelude®¶.¶Bit®¶ 4;
				    
ProcTypes.fGt :: ¶Prelude®¶.¶Bit®¶ 4;
				    
ProcTypes.copinst :: ¶Prelude®¶.¶Bit®¶ 4;
					
ProcTypes.mtc0 :: ¶Prelude®¶.¶Bit®¶ 4;
				     
ProcTypes.mfc0 :: ¶Prelude®¶.¶Bit®¶ 4;
				     
ProcTypes.reverseEndian :: Types.Data -> Types.Data;
						   
ProcTypes.big2LittleEndian :: Types.Data -> Types.Data;
						      
ProcTypes.little2BigEndian :: Types.Data -> Types.Data;
						      
ProcTypes.showInst :: MemTypes.Inst -> ¶Prelude®¶.¶Fmt®¶
}
