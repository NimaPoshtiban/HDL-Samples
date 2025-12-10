//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Nima Poshtiban
// 
// Create Date: 12/10/2025 01:27:20 AM
// Design Name: Dual_Edge_Detector
// Module Name: Dual_Edge_Detector
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 		Moore Pattern for Dual_Edge_Detector
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//  `state` is unused, just used for my own purposes
//////////////////////////////////////////////////////////////////////////////////


module Dual_Edge_Detector(input logic clk,
	input logic x
	,output logic y);
	typedef enum logic[1:0] {s0,s1,s2} State;
	State state,next;
	logic prev = x;
	always_ff@(posedge clk) 
	begin
		prev <= x;
		if(x) 
		begin
			if(prev)
			begin
				state <= s1 ;
				next <= s0;
			end
			else 
			begin
				state <= s0;
				next <= s1;
			end
		end
		else
		begin
		   if(prev)
		   begin
			state <= s1; 
			next <= s2;
		   end
		   else
		   begin
			state <= s0;
			next <= s0;
		   end		
		end 	
	end
	always_comb 
	begin
	case(next)
	s0: y = 1'b0;	
	s1:  y = 1'b1;
	s2:  y = 1'b1;
	default: y = 1'b0;
	endcase
	end
endmodule
