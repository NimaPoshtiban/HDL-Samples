`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Nima Poshtiban
// 
// Create Date: 9/23/2025 
// Design Name: D_FF_RST_HIGH
// Module Name:  D FlipFlap
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 	 synchronous low resetable D-FF 
// Dependencies: None
// 
// Revision: 
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module D_FF_RST_LOW( 
	input logic d,
	input logic rst ,
	input logic clk,
	output logic q);
	always_ff @(posedge clk)
		if(clk) q <= d & ~rst; 


endmodule : D_FF_RST_LOW;
