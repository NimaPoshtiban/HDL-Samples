`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Nima Poshtiban
// 
// Create Date: 11/29/2025 02:43:23 AM
// Design Name: 
// Module Name: counter_with_memory
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// for each posedge clk signal counter value = counter value + 1
// if rst singal is set, the counter will reset to 0; but the previous value will be preserved
// after rst changes to unset , counter starts from the preserved value
// Dependencies: None
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module counter_with_memory(
input logic clk,rst,output logic[3:0] y
    );  
     logic[3:0] tmp =y;
 	 always_ff @(posedge clk or posedge rst) begin
 	
 	       if (clk) begin
 	        y <= tmp+4'b0001;
 	        tmp <= y;
 	        end
 	       else if(rst) y <= 4'b000;
		   else  y<= 4'b000;
 	    end
	
endmodule
