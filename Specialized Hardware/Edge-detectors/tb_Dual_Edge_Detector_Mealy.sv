`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Nima Poshtiban
// 
// Create Date: 12/11/2025 01:02:25 AM
// Design Name: Mealy design of Dual Edge detector
// Module Name: tb_Dual_Edge_Detector_Mealy
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


module tb_Dual_Edge_Detector_Mealy;

logic clk=0;
logic x=0;
logic y;

always #10 clk = ~clk;
Dual_Edge_Detector_Mealy dut(.clk(clk),.x(x),.y(y));

initial begin
$monitor("Time: %8t| clock:  %s  | input: %1b  | output: %s ",
	$time,clk? "Set" : "Reset", x, y? "Enabled" : "Disabled");
end

initial begin
	repeat (20) begin
	x = ~x; #20;
	end
	repeat (20) begin
		x = 0; #20;
		x = 1; #20;
		end
	#100;
	$finish;
	end
endmodule
