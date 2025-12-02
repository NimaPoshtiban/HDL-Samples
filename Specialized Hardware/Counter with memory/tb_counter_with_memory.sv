`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2025 03:16:52 AM
// Design Name: 
// Module Name: tb_counter_with_memory
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


module tb_counter_with_memory;

logic clk = 0;
logic rst=0;
logic[3:0] y =4'b0;
 always #10 clk = ~clk;
counter_with_memory dut(.clk(clk),.rst(rst),.y(y));

 
//   initial begin
//       $display(" time(ns) | clock | reset | value ");
//       $display("----------------------------------------------");
////       $monitor("%8t |  %1b | %1b |  %4b | ", $time, clk, rst, y);
//   end
     
	 initial begin
      repeat(4) begin
	  $display("Testing RST and recover functionality");
	  #10;   
	       @(posedge clk);#10;
	       rst=~rst ;#5
	       $display("time(ns): %8t  value: %4b   ",$time,y );
	           rst=~rst ;#5
	         @(posedge clk);#10;
	        $display("time(ns): %8t  value: %4b   ",$time,y );

	  end
    repeat(20) begin
    $display("Second test: Testing normal incrementor with no rst");
    #10;   
         @(posedge clk);#10;
         $display(" time(ns): %8tvalue: %4b   ",$time,y );  
  end
  		#10;
          $finish;
      end

endmodule
