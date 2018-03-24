package HiHiHoHo;
	String hi = "Hi";
	String ho = "Ho";
	String bye = "Bye!";

	(* synthesize *)
	module mkHiHiHoHo(Empty);
		Reg#(Bit#(3)) counter <- mkReg(0);

		/* The counter increases at every clock cycle. */
		rule inc_counter;
			counter <= counter + 1;
		endrule

		/* TODO: rule say_hi: print "Hi" once */

		/* TODO: rule say_ho: print "Ho" once */

		/* TODO: rule finish: print "Bye" and quit */

	endmodule
endpackage
