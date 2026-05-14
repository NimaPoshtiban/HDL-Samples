`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:  Nima Poshtiban
// 
// Create Date: 05/13/2026 08:49:38 PM
// Design Name: 
// Module Name: RNS_Encoder
// Project Name: 
// Target Devices: General
// Tool Versions: 0.0.1
// Description: RNS(9|8|7) encoder
// the most common moduli for signal processing
// Dependencies: None
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module RNS_Encoder
#( N = 8)(
    input logic[N-1:0] x,
    input logic reset,
    output logic[N-1:0] y1,y2,y3
    );
    always_ff@(posedge reset) begin
   	 y1 = 0;
   	 y2 = 0;
   	 y3 = 0;
    end 
   	always_comb begin
		y1 = x % 4'b1001;
		y2 = x % 4'b1000;
		y3 = x % 3'b111	;
   	end
   	
endmodule
