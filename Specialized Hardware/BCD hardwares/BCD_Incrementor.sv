`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Nima Poshtiban
// 
// Create Date: 11/27/2025 11:55:55 PM
// Design Name: 3 Digit BCD incrementor 
// Module Name: BCD_Incrementor
// Project Name: 3 Digit BCD Incrementor 
// Target Devices: None
// Tool Versions: 
// Description: if 1001 xor each digit = 0 then => reset. state=> carry 
// 
// Dependencies: None
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module BCD_Incrementor(
input logic[11:0] bcd, input logic clk,output logic[11:0] y
    );
//    State state;
//	  always_ff@(posedge clk) 
//	begin
//		case(state)
//			start: y <= bcd+ 1'b1;
//			reset: y <=0;
//			s1: y <= { bcd[11:8], (bcd[7:4] + 4'b0001), 4'b0000 };
//			s2: y <= { bcd[11:8] + 4'b0001, 8'b00000000 };
//			s3: begin 
//			y <= 12'b000000000000 ; state <= reset;
//			state <= reset;
//			end
//			default: 
//				y <= bcd;
//		endcase
//	end	
//	always_comb
//		unique case (bcd)   
//	    (bcd[3:0] == 4'b1001): 
//	        state <= s1;
//	    ({bcd[7:4], bcd[3:0]} == {4'b1001, 4'b1001}):
//	        state <= s2;
//	    (bcd == 12'b100110011001):
//	        state <= s3;
//	    default:
//	        state <= start;
	always_ff@(posedge clk)
	begin
		if(bcd[3:0] < 9) y <= {bcd[11:4],bcd[3:0] + 4'b0001 };
		else if (bcd[3:0] >=9 && bcd[7:4] < 9) y <= {bcd[11:8],bcd[7:4]+4'b0001,4'b0000};
		else if (bcd[7:4] < 9) y <= {bcd[11:8],bcd[7:4]+4'b0001,bcd[3:0]};
		else if (bcd[3:0] >= 9 && bcd[7:4] >= 9 &&  bcd[11:8] <9) y <= {bcd[11:8]+4'b0001,4'b0000,4'b0000};
		else if (bcd[7:4] >= 9 &&  bcd[11:8] <9) y <= {bcd[11:8]+4'b0001,4'b0000,bcd[3:0]};
		else if (bcd[11:8] <9) y <= {bcd[11:8]+4'b0001,bcd[7:0]};
		else y <= 12'b0;
	end
endmodule

