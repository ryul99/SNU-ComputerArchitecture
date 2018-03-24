package HiHoHiHo;
	String hi = "Hi";
	String ho = "Ho";
	String bye = "Bye!";

	(* synthesize *)
	module mkHiHoHiHo(Empty);
		Reg#(Bit#(3)) counter <- mkReg(0);

		/* The counter increases at every clock cycle. */
		rule inc_counter;
			counter <= counter + 1;
		endrule

		/* TODO: rule say_hi: print "Hi" once */
		rule say_hi(counter == 0 || counter == 2);
			$display(hi);
		endrule
		/* TODO: rule say_ho: print "Ho" once */
		rule say_ho(counter == 1||counter == 3);
			$display(ho);
		endrule
		/* TODO: rule finish: print "Bye" and quit */
		rule finish(counter == 4);
			$display(bye);
			$finish;
		endrule
	endmodule
endpackage
