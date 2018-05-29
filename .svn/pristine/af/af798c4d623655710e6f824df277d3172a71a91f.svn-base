signature Scoreboard where {
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
		
interface (Scoreboard.Scoreboard :: # -> *) size = {
    Scoreboard.insertE :: ¶Prelude®¶.¶Maybe®¶ ProcTypes.FullIndx ->
			  ¶Prelude®¶.¶Action®¶ {-# arg_names = [rIndx] #-};
    Scoreboard.insertM :: ¶Prelude®¶.¶Maybe®¶ ProcTypes.FullIndx ->
			  ¶Prelude®¶.¶Action®¶ {-# arg_names = [rIndx] #-};
    Scoreboard.search1 :: ¶Prelude®¶.¶Maybe®¶ ProcTypes.FullIndx ->
			  ¶Prelude®¶.¶Bool®¶ {-# arg_names = [rIndx] #-};
    Scoreboard.search2 :: ¶Prelude®¶.¶Maybe®¶ ProcTypes.FullIndx ->
			  ¶Prelude®¶.¶Bool®¶ {-# arg_names = [rIndx] #-};
    Scoreboard.search3 :: ¶Prelude®¶.¶Maybe®¶ ProcTypes.FullIndx ->
			  ¶Prelude®¶.¶Bool®¶ {-# arg_names = [rIndx] #-};
    Scoreboard.search4 :: ¶Prelude®¶.¶Maybe®¶ ProcTypes.FullIndx ->
			  ¶Prelude®¶.¶Bool®¶ {-# arg_names = [rIndx] #-};
    Scoreboard.remove :: ¶Prelude®¶.¶Action®¶ {-# arg_names = [] #-}
};
 
instance Scoreboard ¶Prelude®¶.¶PrimMakeUndefined®¶ (Scoreboard.Scoreboard size);
										
instance Scoreboard ¶Prelude®¶.¶PrimDeepSeqCond®¶ (Scoreboard.Scoreboard size);
									      
instance Scoreboard ¶Prelude®¶.¶PrimMakeUninitialized®¶ (Scoreboard.Scoreboard size);
										    
Scoreboard.isFound :: ¶Prelude®¶.¶Maybe®¶ ProcTypes.FullIndx ->
		      ¶Prelude®¶.¶Maybe®¶ ProcTypes.FullIndx -> ¶Prelude®¶.¶Bool®¶;
										  
Scoreboard.mkPipelineScoreboard :: (¶Prelude®¶.¶IsModule®¶ _m__ _c__) =>
				   _m__ (Scoreboard.Scoreboard size)
}
