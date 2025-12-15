`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Nima Poshtiban
// 
// Create Date: 12/14/2025 05:29:39 AM
// Design Name: 
// Module Name: FIFO Control Unit
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


module FIFO_Ctrl
#(parameter ADDR_WIDTH = 4)(
	input logic clk,
input logic rst,
input logic wr,
input logic rd,
output logic empty,full, 
output logic[ADDR_WIDTH-1:0] w_addr,
output logic[ADDR_WIDTH-1:0] r_addr
);
logic[ADDR_WIDTH-1:0] w_ptr_logic,w_ptr_next,w_ptr_successor;
logic[ADDR_WIDTH-1:0] r_ptr_logic,r_ptr_next,r_ptr_successor;
logic empty_logic,full_logic,full_next,empty_next;
	always_ff@(posedge clk,posedge rst)
	begin
	if(rst) begin
	w_ptr_logic <=0;
	r_ptr_logic <=0;
	full_logic <= 1'b0;
	empty_logic <= 1'b1;
	end
	else 
		begin
		w_ptr_logic <=w_ptr_next;
		r_ptr_logic <= r_ptr_next;
		full_logic <= full_next;
		empty_logic <= empty_next;
		end
	end
	always_comb
	begin
		w_ptr_successor = w_ptr_logic+1;
		r_ptr_successor= r_ptr_logic+1;
		w_ptr_next = w_ptr_logic;
		r_ptr_next = r_ptr_logic;
		full_next = full_logic;
		empty_next = empty_logic;
		if(rd & wr) begin
			w_ptr_next = w_ptr_successor;
			r_ptr_next = r_ptr_successor;
		end 
		else if(rd | wr) begin
			if(rd & ~empty_logic)begin
				r_ptr_next =r_ptr_successor;
				full_next = 1'b0;
				empty_next = r_ptr_successor & w_ptr_logic;
			end
			if(wr & ~full_logic) begin
				w_ptr_next = w_ptr_successor;
				empty_next = 1'b0;
				full_next = w_ptr_successor & r_ptr_logic;
			end
		end
		else;
		end 
		
assign w_addr = w_ptr_logic;
assign r_addr = r_ptr_logic;
assign full = full_logic;
assign empty = empty_logic;
endmodule
