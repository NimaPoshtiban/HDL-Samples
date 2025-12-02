`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Nima Poshtiban
// 
// Create Date: 12/02/2025 06:11:33 AM
// Design Name: 
// Module Name: ALU_with_2bit_opcode
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: ALU with Addition, Subtraction, BT, bitwise AND operations
// opcodes: |	00   |  	 01     | 10 |  	11	  |
//          |Addition|  Subtraction | BT | Bitwise AND|
// flag: = "1" if => carry, A >B , A=B, A != B
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ALU_with_2bit_opcode(
    input wire[1:0] opcode,
    input logic[3:0] A,
    input logic[3:0] B,
    output logic [3:0] y,
    output bit flag
    );
	always_comb
	begin
		case(opcode) 
			2'b00: {flag,y} <= A + B;
			2'b01: {flag,y} <= A > B ? {0,A-B} : {1,A-B};
			2'b10: {flag,y} <= A > B ? {0,4'b1111} : {1,4'b0000} ;
			2'b11: {flag,y} <= A & B ? {0,A&B} : {1,A&B};
		endcase	
	end
endmodule
