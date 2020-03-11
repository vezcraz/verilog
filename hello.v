module Circuit(A,B,C,F1,F2);
	input A,B,C;
	output F1, F2;
	wire  T1, T2, T3, F2_B, E1, E2, E3;
	or g1(T1, A, B, C);
	and g2(T2, A, B);
	and g3(E1, A, B);
	and g4(E2, A, C);
	and g5(E3, B, C);
	or g6(F2,E1,E2,E3);
	not g7(F2_B, F2);
	and g8(T3, T1, F2_B);
	or g9(F1, T2, T3);
endmodule


module test;
	reg[2:0] D;
	reg [1:0] v = 2'b10 == 2'b1z ; 
	wire F1, F2;
	Circuit M1(D[2], D[1], D[0], F1, F2);
	initial
		begin
			// $dumpfile("test.vcd");
   //   		$dumpvars(0,test);
			D=0;
			repeat(7) 
			begin
			#10	D  += 1;
		end
					

		end

	// initial
	// 	begin
	// 		repeat(7)
	// 			#20	D[1]  = !D[1];
			
	// 	end
	// initial
	// 	begin
	// 		repeat(7)
	// 			#40	D[2]  = !D[2];
			
	// 	end
initial
	begin
					#70 $finish;
end
	initial
	$monitor("ABC= %b F1 = %b F2= %b",D, F1, F2);
	initial $display("%b ", v);
endmodule

// module hello (
// 	input clk,    // Clock
// 	input clk_en, // Clock Enable
// 	input rst_n,  // Asynchronous reset active low
	
// );

// endmodule