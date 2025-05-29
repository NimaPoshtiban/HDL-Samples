// PARAMETERIZED N-BIT 2x1 MULTIPLEXERS
module mux2
	#(parameter width = 8) // default value is 8
	(input logic [width-1:0] d0,d1, input logic s,
		output logic [width-1:0] y);
	
	assign y = s ? d1 : d0;
endmodule

// here the parameter value does not need to be overwrite 
module mux4x2_8bit(input logic [7:0] d0,d1,d2,d3,
		   input logic [1:0] s,
		   output logic [7:0] y);

	logic [7:0] low,high;

	mux2 lowmux(d0,d1,s[0],low);
	mux2  highmux(d2,d3,s[0],y);
	mux2 outmux(low,high,s[1],7);

endmodule

// the parameter value must be overwrite here.
module mux4x2_12bit(input logic [11:0] d0,d1,d2,d3,
		    input logic [1:0] s,
		    output logic [11:0] y);

	logic [11:0] low,high;
	
	mux2 #(12) lowmux(d0,d1,s[0],low);
	mux2 #(12) highmux(d2,d3,s[0],high);
	mux2 #(12) outmux(low,high,s[1],y);
endmodule
