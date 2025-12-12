`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Nima Poshtiban
// 
// Create Date: 12/12/2025 02:39:35 AM
// Design Name: 2 digit BCD to Binary Convertor
// Module Name: BCD_Binary_Convertor
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 		Algorithm: Reversed Double Dabble 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module BCD_Binary_Convertor(
    input logic[7:0] x,
    output logic[7:0] y
    );
logic[7:0] tmp;
logic[7:0] interim;
int i;
		always@*
		begin
		tmp= x;
		interim = x;
		for(i = 0;i < 8;i++)
    	begin
    		if(tmp)
    		begin
    			interim = interim;
    		 break;
    		 end
    		interim = tmp >> 1;
    		 tmp = tmp >> 1;
    		 if(tmp[7:4] >= 8 || tmp[3:0]>=8) tmp = tmp - 4'b0011 ;
	
		    	end
    	end

	  assign y = interim;
endmodule
