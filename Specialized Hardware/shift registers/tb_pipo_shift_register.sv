`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Nima Poshtiban
// 
// Create Date: 12/02/2025 05:36:35 AM
// Design Name: 
// Module Name: tb_pipo_shift_register
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


module tb_pipo_shift_register;
logic clk=0;
logic[1:0] mode=2'b0;
logic[7:0] data=8'b0;
wire[7:0] y;
always #10 clk = !clk;
pipo_shift_register dut(.clk(clk),.mode(mode),.data(data),.y(y));

initial begin
	repeat(4) begin
$display("testing mode: 00 (load)");
mode=2'b0;#10;
data = 8'b10101011;#10;
assert(y==data) else $error("Data did not load, mode: 00 malfunctioned");

	end
		repeat(4) begin
$display("testing mode: 01 (reset)");
mode=2'b01;#10;
data = 8'b10101011;#10;
assert(y==8'b00000000) else $error("Data did not reset, mode: 01 malfunctioned");

	end
		repeat(4) begin
$display("testing mode: 10 (shr)");
mode=2'b10;#10;
data = 8'b10101011;#10;
assert(y==8'b01010101) else $error("Data did not shifted to the right, mode: 10 malfunctioned");

	end
	
	repeat(4) begin
	$display("testing mode: 11 (shl)");
	mode=2'b11;#10;
	data = 8'b10101011;#10;
	assert(y==8'b01010110) else $error("Data did not shifted to the left, mode: 11 malfunctioned");
	end
	#50;
	$finish;
end
endmodule
