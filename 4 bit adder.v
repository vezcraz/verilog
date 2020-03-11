module adder (
	input [3:0] a,b,
	input c_in,z,
	output reg [3:0] d, 
	output  reg c_out,
	output  reg [0:4] x
);
always @(z) begin 
	if(z)
	begin
		{c_out,d} = a+b+c_in; 
		x={c_out,d};
	end
	else begin
		{c_out,d} = a-b+c_in; 
		x={c_out,d};
	end
end
endmodule

module test_adder;
	wire [0:3] d;
	wire c_out;
	wire [0:4] x;
	reg [0:3] inp1, inp2;
	reg c_in,z;
	adder m( inp1, inp2, c_in,z, d,c_out,x);


	initial
	begin
		$dumpfile("test_adder.vcd");
     		$dumpvars(0,test_adder);
		inp1=4'b1011;
		inp2=4'b0110;
		c_in=1;
		z=0;
		repeat(5)
		#10 z=!z;
		
	end
	initial
	$monitor("inp1=%b  inp2=%b output=%d", inp1,inp2,x);
endmodule	