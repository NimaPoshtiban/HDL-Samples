`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Nima Poshtiban
// 
// Create Date: 12/02/2025 06:32:22 AM
// Design Name: 
// Module Name: tb_ALU_with_2bit_opcode
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


module tb_ALU_with_2bit_opcode;
  logic[1:0] opcode=2'b00;
  logic[3:0] A;
  logic[3:0] B;
  logic [3:0] y;
  bit flag;
ALU_with_2bit_opcode dut(.opcode(opcode),.A(A),.B(B),.y(y),.flag(flag));

initial begin
$display("Testing Addition");
opcode=2'b00;
A=4'b1101;#10;
B=4'b1110;#10;
assert(flag==1'b1) else $error("Flag did not get set");
assert(y== 4'b1011) else $error("Addition failure");
$display("Testing Subtraction");
opcode=2'b01;
A=4'b1101;#10;
B=4'b1110;#10;
assert(flag==1'b1) else $error("Flag did not get set");
assert(y== 4'b1111) else $error("Subtraction failure");
$display("Testing Subtraction");
opcode=2'b10;
A=4'b1101;#10;
B=4'b1110;#10;
assert(flag==1'b1) else $error("Flag did not get set");
assert(y== 4'b0000) else $error("BT failure");
$display("Testing Bitwise AND");
opcode=2'b11;
A=4'b1100;#10;
B=4'b0010;#10;
assert(flag==1'b1) else $error("Flag did not get set");
assert(y== 4'b0000) else $error("Bitwise AND failure");
#50;
$finish;
end

endmodule
