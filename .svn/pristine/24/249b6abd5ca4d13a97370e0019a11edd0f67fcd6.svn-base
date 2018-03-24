package HelloWorld;
	String hello = "HelloWorld";
	String bye = "Bye!";
	(* synthesize *)
	module mkHelloWorld(Empty);
		/* TODO: Implement HelloWorld module */
		Reg#(Bit#(3)) counter <- mkReg(0);

		rule say_bye(counter == 5);
			$display(bye);
			$finish;
		endrule

		rule say_hello(counter < 5);
			$display(hello);
			counter <= counter +1;
		endrule

	endmodule
endpackage
