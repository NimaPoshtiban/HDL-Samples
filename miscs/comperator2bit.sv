
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:  Nima Poshtiban
// 
// Create Date: 11/06/2025 09:26:32 AM
// Design Name: 
// Module Name: comperator2bit
// Project Name: 2 bit input comperator 
// Description: 
// this design uses one-hot bit encoding
// 001 => a>b
// 010 =>  a=b
// 100 => a <b: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module comperator2bit(
    input logic[1:0] a,b, output logic[2:0] result 
    );
    always_comb begin
    // xor logic
    // 0 0  => 0
    // 0 1 => 1
    // 1 0 => 1
    // 1 1 ->0
    result[0]= ((a[1] ^ b[1]) & a[1])|( (a[0] ^ b[0]) & a[0] )    ;
    // xnor logic 
    // 0 0  => 1
    // 0 1  => 0
    // 1 0 => 0
    // 1 1 =>1
       result[1] = ~(a[1] ^ b[1]) & ~(a[0] ^ b[0])  ;
       
         // xor logic
    // 0 0  => 0
    // 0 1 => 1
    // 1 0 => 1
    // 1 1 ->0
      result[2]= ((a[1] ^ b[1])  & b[1])|( (a[0] ^ b[0]) & b[0] )    ;
    end
  
endmodule
