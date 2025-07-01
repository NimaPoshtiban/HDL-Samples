//-----------------------------------------------------------------------------
//
// Title       : CPA
// Design      : CPA
// Author      : nima
// Company     : me
//
//-----------------------------------------------------------------------------
//
// Generated   : Tue Jul  1 14:43:19 2025
// From        : interface description file
// By          : Itf2Vhdl ver. 1.22
//
//-----------------------------------------------------------------------------
//
// Description : 
//
//-----------------------------------------------------------------------------
`timescale 1 ns / 1 ps

//{{ Section below this comment is automatically maintained
//   and may be overwritten
//{module {CPA}}
module CPA #(parameter N = 8)
	(input logic [N-1:0] a, b,
	input logic cin,
	output logic [N-1:0] s,
	output logic cout);

	assign {cout, s} = a + b + cin;

endmodule
