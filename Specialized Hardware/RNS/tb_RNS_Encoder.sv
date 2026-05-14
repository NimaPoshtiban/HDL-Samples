`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/13/2026 11:43:59 PM
// Design Name: 
// Module Name: tb_RNS_Encoder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 	testing RNS Encoder
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_RNS_Decoder;

logic[7:0] x = 8'b0;
logic reset = 1'b0;
logic [7:0] y1,y2,y3;

RNS_Encoder dut(.x(x),.reset(reset),.y1(y1),.y2(y2),.y3(y3));

initial begin 
	$monitor("%8t reset: %1b input: %8b , outputs : %8b | %8b | %8b",$time,reset,x,y1,y2,y3); 
end;

initial begin
	$display("Testing ....");
	reset = 1;#10;
	x = 8'b0000; #10;
	assert(y1==8'b0) else $error("Reset failure");
	assert(y2==8'b0) else $error("Reset failure");
	assert(y3==8'b0) else $error("Reset failure");
	x = 8'b1010;#10;
	assert(y1==8'b00000001) else $error("Mpd 9 failure");
	assert(y2==8'b00000010) else $error("Mod 8 failure");
	assert(y3==8'b00000011) else $error("Mod 7 failure");
	reset = 1;#10;
	x = 8'b1000; #10;
	assert(y1==8'b00001000) else $error("Mod 9 failure");
	assert(y2==8'b0) else $error("Mod 8 failure");
	assert(y3==8'b00000001) else $error("Mod 7 failure");
	$finish;#10;
end;

endmodule