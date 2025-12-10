`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Nima Poshtiban
// 
// Create Date: 12/10/2025 01:27:20 AM
// Design Name: Dual_Edge_Detector
// Module Name: tb_Dual_Edge_Detector
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 		Moore Pattern for Dual_Edge_Detector
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_Dual_Edge_Detector;
logic clk=0;
logic x=0;
logic y;

always #10 clk = ~clk;
Dual_Edge_Detector dut(.clk(clk),.x(x),.y(y));

initial begin
$monitor("Time: %8t| clock:  %s  | input: %1b  | output: %s ",
	$time,clk? "Set" : "Reset", x, y? "Enabled" : "Disabled");
end

initial begin
	repeat(100) begin
		x = ~x ;#7;	
	end
	#50;
	$finish;
	end
endmodule
