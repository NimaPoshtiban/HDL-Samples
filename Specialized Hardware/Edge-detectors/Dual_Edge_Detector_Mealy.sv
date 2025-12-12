module Dual_Edge_Detector_Mealy(input logic clk,input logic x=0,output logic y);
typedef enum logic[1:0] {q0,PS,NS,EN} State;
State state,nextstate;

logic tmp;
always_ff@(posedge clk) begin
	tmp <= x;
	if(tmp != x) state <= EN;
	else if(x) state <= PS;
	else state  <= NS;
	nextstate <= state;
end

always_comb
	case(state)
	PS: begin
	if(!x) nextstate = EN;
	else nextstate = PS;
	end
	NS:
	begin
	if(x) nextstate = EN;
	else nextstate = NS; 
	end
	EN:
	begin
		if(x != tmp) nextstate = EN;
		else nextstate = q0 ;
	end
	default: nextstate = state;
	endcase
	assign y = nextstate == EN ? 1'b1 : 1'b0;
endmodule