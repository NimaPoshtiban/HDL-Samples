`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Nima Poshtiban
// 
// Create Date: 9/23/2025 
// Design Name: D latch
// Module Name: D latch
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: None
// 
// Revision: 
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module D_Latch (
	input logic clk, 
	input logic d,
	output logic q
	
);
	always_ff @(posedge clk)
		if(clk && d) q <= 1;
		else begin
		if(clk && ~d) q <= 0;
		else q <= q;
		end
	
endmodule

