module GEN_AND
	#(parameter N = 8)
	(input logic [N-1:0] a, output logic y);
	genvar i;
	logic [N-1 : 0] x;
	generate
		assign x[0] = a[0];
		for(i = 1;i<N;i=i+1) begin: forloop
			assign x[i] = x[i-1] & a[i];
		end;
	endgenerate;
		assign y = x[N-1];
			
	endmodule
