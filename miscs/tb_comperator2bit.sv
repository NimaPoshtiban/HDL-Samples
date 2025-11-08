`timescale 1ns / 1ps

module tb_comperator2bit;
    logic [1:0] a = 2'b00, b = 2'b00;
    logic [2:0] result;
    
    comperator2bit dut (.a(a), .b(b), .result(result));

    // Monitor values
    initial begin
      $display("          Time(ns) |   a   |   b   | result | Meaning");
    $display("--------------------------------------------");
    $monitor("%8t | %3b | %3b |  %03b  | %s",
             $time, a, b, result,
             (result == 3'b001) ? "a>b" :
             (result == 3'b010) ? "a=b" :
             (result == 3'b100) ? "a<b" : "???");
    end

    // Stimulus pattern
    initial begin
        repeat (4) begin
            a = 2'b00; b = 2'b00; #10;
            a = 2'b00; b = 2'b01; #10;
            a = 2'b01; b = 2'b00; #10;
            a = 2'b10; b = 2'b01; #10;
            a = 2'b11; b = 2'b10; #10;
            a = 2'b01; b = 2'b11; #10;
            a = 2'b11; b = 2'b11; #10;
        end
        $finish;
    end
endmodule
