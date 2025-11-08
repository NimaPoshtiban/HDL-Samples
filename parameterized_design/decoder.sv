`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Nima Poshtiban
// 
// Create Date: 11/08/2025 06:17:15 AM
// Design Name: 
// Module Name: decoder8x3
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module decoder
	#(parameter N = 3)
	(input logic [N-1:0] a, output logic [N**2-2:0] y);

	always_comb
	begin
		y = 0 ;
		y[a] = 1;
	end
endmodule
