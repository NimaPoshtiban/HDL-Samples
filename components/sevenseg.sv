`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/20/2025 12:43:32 PM
// Design Name: 
// Module Name: sevenseg
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


module sevenseg(
    input logic [3:0] data,output logic[6:0] segments
    );
    always_comb
    case(data)
    0: segments = 7'b111_1110;
1: segments = 7'b011_0000;
2: segments = 7'b110_1101;
3: segments = 7'b111_1001;
4: segments = 7'b011_0011;
5: segments = 7'b101_1011;
6: segments = 7'b101_1111;
7: segments = 7'b111_0000;
8: segments = 7'b111_1111;
9:    segments = 7'b111_0011;
    default: segments = 7'b000_0000;

endcase
endmodule
