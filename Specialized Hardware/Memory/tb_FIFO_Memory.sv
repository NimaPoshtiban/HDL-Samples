`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/12/2025 11:06:58 AM
// Design Name: 
// Module Name: tb_FIFO_Memory
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


module tb_FIFO_Memory;
logic clk = 0;
 logic rst = 0;
 logic wr_en=0;
 logic rd_en=0;
 logic [7:0]data_in ;
 logic full,empty; // 10 -> full , 01-> empty
 logic [7:0]data_out;

always #10 clk = ~clk;


FIFO_Memory #(.DATA_WIDTH(8),.ADDR_WIDTH(4)) dut(.clk(clk),.rst(rst),.wr(wr_en),.rd(rd_en),.data_in(data_in),.full(full),.empty(empty),.data_out(data_out));


initial begin
    $monitor("%8t | clk:%b rst:%b wr:%b rd:%b  in:%8b empty:%b full:%b out:%8b",
             $time, clk, rst, wr_en, rd_en, data_in, empty,full , data_out);
end

initial begin
#10;
data_in=8'b0 ;#10;

for(int i=0;i<20;i++)begin
	wr_en = 1; #10;
	data_in [i]= 1'b1;#10;
		data_in [i%8]= 1'b1;#10;
	data_in [i]= 1'b1;#10;
	data_in [i]= 1'b1;#10;
		data_in [i]= 1'b1;#10;
	data_in [i]= 1'b1;#10;
	data_in [i]= 1'b1;#10;
	data_in [i]= 1'b1;#10;
	data_in [i]= 1'b1;#10;
	data_in [i]= 1'b1;#10;
	data_in [i]= 1'b1;#10;
	data_in [i]= 1'b1;#10;

	rst = ~rst;#10;
	data_in [i]= 1'b1;#10; 
	data_in [i]= 1'b1;#10;
	wr_en = ~wr_en;#10;
	rd_en = 1;#10;
	rd_en =~ rd_en;#10;
	rd_en = ~rd_en;#10;
	rd_en = ~rd_en;#10;
	
end
#10;
$finish;
end

endmodule
