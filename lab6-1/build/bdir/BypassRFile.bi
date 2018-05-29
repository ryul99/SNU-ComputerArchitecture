signature BypassRFile where {
import ¶ConfigReg®¶;
		   
import ¶FIFOF_®¶;
		
import ¶FIFOF®¶;
	       
import ¶FIFO®¶;
	      
import ¶List®¶;
	      
import ¶PrimArray®¶;
		   
import ¶Probe®¶;
	       
import ¶RWire®¶;
	       
import ¶Vector®¶;
		
import CReg;
	   
import ¶FShow®¶;
	       
import Fifo;
	   
import Types;
	    
import MemTypes;
	       
import ProcTypes;
		
interface (BypassRFile.RFile :: *) = {
    BypassRFile.wrE :: ProcTypes.RIndx -> Types.Data -> ¶Prelude®¶.¶Action®¶ {-# arg_names = [rIdx,
											      ¡data¡] #-};
    BypassRFile.wrM :: ProcTypes.RIndx -> Types.Data -> ¶Prelude®¶.¶Action®¶ {-# arg_names = [rIdx,
											      ¡data¡] #-};
    BypassRFile.rdA :: ProcTypes.RIndx -> Types.Data {-# arg_names = [rIdx] #-};
    BypassRFile.rdB :: ProcTypes.RIndx -> Types.Data {-# arg_names = [rIdx] #-}
};
 
instance BypassRFile ¶Prelude®¶.¶PrimMakeUndefined®¶ BypassRFile.RFile;
								      
instance BypassRFile ¶Prelude®¶.¶PrimDeepSeqCond®¶ BypassRFile.RFile;
								    
instance BypassRFile ¶Prelude®¶.¶PrimMakeUninitialized®¶ BypassRFile.RFile;
									  
BypassRFile.mkBypassRFile :: (¶Prelude®¶.¶IsModule®¶ _m__ _c__) => _m__ BypassRFile.RFile
}
