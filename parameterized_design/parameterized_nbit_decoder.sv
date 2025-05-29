module decoder
	#(parameter N = 3)
	(input logic [N-1:0] a, output logic [N**2-1:0] y);

	always_comb
	begin
		y = 0 ;
		y[a] = 1;
	end
endmodule
