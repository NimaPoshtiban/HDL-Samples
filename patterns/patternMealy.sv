`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/23/2025 01:09:35 PM
// Design Name: 
// Module Name: patternMealy
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
// in the Mealy machine the output logic
// depends on both the current state and inputs.
//////////////////////////////////////////////////////////////////////////////////


module patternMealy(
    input logic clk,
    input logic reset,
    input logic a,
    output logic y
    );
    typedef enum {s0,s1} statetype;
    statetype state,nextstate;
    always_ff @(posedge clk, posedge reset)
    if(reset) state <= s0;
    else state <= s1;
    
    always_comb
        case (state)
        s0 : if(a) nextstate = s0;
             else nextstate = s1;
        s1 : if(a) nextstate = s0;
             else nextstate = s1;
        default: nextstate =s0;
        endcase;
        
       assign y = (a & state == 1);
endmodule
