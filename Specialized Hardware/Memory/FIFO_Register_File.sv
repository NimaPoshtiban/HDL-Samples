`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/14/2025 06:08:05 AM
// Design Name: 
// Module Name: FIFO_Register_File
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


module FIFO_Register_File
#(parameter DATA_WIDTH = 8, ADDR_WIDTH=2)
(
input logic clk,
input logic wr_en,
input logic[ADDR_WIDTH-1:0] r_addr,w_addr,
input logic [DATA_WIDTH-1:0] w_data,
output logic [DATA_WIDTH-1:0] r_data
);
logic [DATA_WIDTH-1:0] array_reg[0:2**ADDR_WIDTH-1];

always_ff@(posedge clk) 
	if(wr_en) array_reg[w_addr] <= w_data;
	


assign r_data  = array_reg[r_addr];

endmodule
