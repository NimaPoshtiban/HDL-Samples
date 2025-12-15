`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Nima  Poshtiban
// 
// Create Date: 12/12/2025 09:25:02 AM
// Design Name: 
// Module Name: FIFO_Memory
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


module FIFO_Memory
#(parameter DATA_WIDTH=8,ADDR_WIDTH=4)
( 
input logic clk,
input logic rst,
input logic wr,
input logic rd,
input logic  [DATA_WIDTH-1:0]data_in,
output logic empty,full, 
output logic [DATA_WIDTH-1:0]data_out
);
logic[ADDR_WIDTH-1:0] w_addr,r_addr;
logic wr_en,full_tmp;


assign wr_en= wr& ~full_tmp;
assign full = full_tmp;
	
FIFO_Ctrl #(.ADDR_WIDTH(ADDR_WIDTH))control_unit(.clk(clk),.rst(rst),.wr(wr),.rd(rd),.empty(empty),.full(full_tmp),.w_addr(w_addr),.r_addr(r_addr));
FIFO_Register_File #(.DATA_WIDTH(DATA_WIDTH),.ADDR_WIDTH(ADDR_WIDTH)) reg_file(.clk(clk),.r_addr(r_addr),.w_addr(w_addr),.wr_en(wr),.r_data(data_out),.w_data(data_in));
endmodule



 