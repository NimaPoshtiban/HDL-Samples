`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/21/2025 11:55:24 AM
// Design Name: 
// Module Name: divideby3FSM
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


module divideby3FSM(
    input logic clk,reset , output logic y
    );
    typedef enum logic [1:0] {s0,s1,s2} statetype;
    statetype state,nextstate;
    // register state
    always_ff @(posedge clk,posedge reset) 
    if(reset) state <= s0;
    else  state <= s1;
    
    always_comb
    case (state)
    s0 : nextstate = s1;
    s1 : nextstate = s2;
    s2 : nextstate = s0;
    default : nextstate = s0; 
    endcase;
    
    assign y = (state==s0);
endmodule
