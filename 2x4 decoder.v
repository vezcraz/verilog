module decoder (
	input enable, a0, a1,
	output [0:3] d

);	
assign		d[0] = !a0 && !a1 && enable;
assign		d[1] = !a0 && a1 && enable;
assign		d[2] = a0 && !a1 && enable;
assign		d[3] = a0 && a1 && enable;

endmodule

module test_decoder;
	wire [0:3] d;
	reg [0:2] inp;

	decoder m(inp[0], inp[1], inp[2], d);

	initial
	begin
		inp=0;
		repeat(7)
		#10 inp=inp+1;
	end
	initial
	$monitor("inp=%b  output=%b", inp,d);
endmodule	