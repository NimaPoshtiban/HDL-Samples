
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Nima Poshtiban
// 
// Create Date: 12/2/2025 05:30:35 AM
// Design Name: shift register
// Module Name: pipo_shift_register
// Project Name: 
// Target Devices: None 
// Tool Versions: Vivdao 2025
// Description: Parallel Shift Register with 4 modes:
// mode: 00 -> load 01 -> reset 10 -> shr 11->shl
// 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module pipo_shift_register (
   input logic clk,
   input logic[1:0] mode,
   input wire[7:0] data,
   output wire[7:0] y
);
logic[7:0] tmp=data;
  always_ff@(posedge clk) begin
    case (mode)
      2'b00: tmp <= data;
      2'b01: tmp <= 0;
      2'b10: tmp <= data >> 1;
      2'b11: tmp <= data << 1;
      default : tmp <= data;
    endcase
  end
assign y = tmp;
endmodule
