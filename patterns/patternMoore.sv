// In the Moore machine 
// the output depends only on the current state

module patternMoore(input logic clk,reset,a, output logic y);
    typedef enum logic [1:0] {s0,s1,s2} statetype;
    statetype state,nextstate;
    
    
    always_ff @(posedge clk, posedge reset)
    if(reset) state <= s0;
    else state <= nextstate;
    
    always_comb
    case(state)
    s0 : if (a) nextstate=s0;
          else nextstate = s1;
    s1: if(a) nextstate = s2;
        else nextstate = s1;
    s2: if(a) nextstate = s0;
        else nextstate = s1;
    default: nextstate=s0;
    endcase;
    
    assign y = (state==s2);
    
endmodule