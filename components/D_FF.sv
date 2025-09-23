`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Nima Poshtiban
// 
// Create Date: 9/23/2025 
// Design Name: D FlipFlap
// Module Name: D FlipFlap
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

module D_FF( 
	input logic d,
	input logic clk,
	output logic q);
	always_ff @(posedge clk)
		if(clk) q <= d; 


endmodule : D_FF;
