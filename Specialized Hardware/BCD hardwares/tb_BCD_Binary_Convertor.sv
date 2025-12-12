`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/12/2025 05:40:24 AM
// Design Name: 
// Module Name: tb_BCD_Binary_Convertor
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


module tb_BCD_Binary_Convertor;
logic [7:0] x=8'b0;
logic [7:0] y;

BCD_Binary_Convertor dut(.x(x),.y(y));

 
initial begin
    $monitor("Stable y => %8b", y);
end
initial begin
	x = 'hA; #10;
	x = 19; #10;
	x = 99; #10
    forever begin
        #0; #0;  // let combinational logic settle
//        $display("Final stable output: %8b", y);
        @(x);    // wait for next change
    end
end

endmodule
