`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Nima Poshtiban
// 
// Create Date: 11/08/2025 06:17:15 AM
// Design Name: 
// Module Name: decoder_tb
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


module tb_decoder;
logic [2:0] a = 3'b00;
logic [7:0] y = 8'b00;
decoder dut (.a(a),.y(y));

initial begin
      $display("      Time(ns) |   a | y");
    $display("--------------------------------------------");
    $monitor("%8t |  %b  | %b",
             $time, a, y);
    end
     initial begin
           repeat (8) begin
               a = 3'b000;  #10;
               a = 3'b001;  #10;
               a = 3'b010; #10;
               a = 3'b011;  #10;
               a = 3'b100; #10;
               a = 3'b101; #10;
               a = 3'b110;  #10;
                a = 3'b111;  #10;
           end
           $finish;
       end
endmodule
