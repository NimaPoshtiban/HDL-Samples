`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Nima Poshtiban
// 
// Create Date: 11/28/2025 01:10:15 AM
// Design Name: 
// Module Name: tb_BCD_Incrementor
// Project Name: 3 Digit BCD Incrementor tb
// Target Devices: None
// Tool Versions: 
// Description: 
// 
// Dependencies: None
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
//interface _if (input logic clk);
//   logic[11:0] excess3;
//   logic[11:0] y;

//  clocking cb @(posedge clk);
//    input #1ps y;
//    output #5  excess3;
//  endclocking
//endinterface
module tb_BCD_Incrementor;

   
    logic clk = 0;
    always #5 clk = ~clk;

   
    logic [11:0] excess3;   
    logic [11:0] out;       

    
    BCD_Incrementor dut (
        .bcd(excess3),
        .clk(clk),
        .y(out)
    );

    
    initial begin
        $display(" time(ns) |   input BCD       |    output BCD");
        $display("----------------------------------------------");
        $monitor("%8t |  %1d%1d%1d -> %1d%1d%1d",
                  $time,
                  excess3[11:8], excess3[7:4], excess3[3:0],
                  out[11:8], out[7:4], out[3:0]
        );
    end

    // Stimulus
    initial begin
     
        excess3 = 12'h000;
        @(posedge clk);

        // Increment cases
        excess3 = 12'h009; @(posedge clk);  // carry 0→1
        excess3 = 12'h019; @(posedge clk);
        excess3 = 12'h099; @(posedge clk);
        excess3 = 12'h199; @(posedge clk);
        excess3 = 12'h999; @(posedge clk);  // overflow case → 000

        // Some random tests
        excess3 = 12'h123; @(posedge clk);
        excess3 = 12'h459; @(posedge clk);
        excess3 = 12'h890; @(posedge clk);

        #20;
        $finish;
    end

endmodule

