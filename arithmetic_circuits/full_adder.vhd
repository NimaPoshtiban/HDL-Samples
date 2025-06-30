-------------------------------------------------------------------------------
--
-- Title       : Full_Adder
-- Design      : FullAdder
-- Author      : nima
-- Company     : me
--
-------------------------------------------------------------------------------
--
-- File        : C:\Users\nima\prod\hdl\generalized\Half_Adder\src\full_adder.vhd
-- Generated   : Fri Jun 20 16:01:54 2025
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {Full_Adder} architecture {synth}}
library IEEE;
use IEEE.STD_logic_1164.all;


entity Full_Adder is
	port( a, b, c_in : in STD_LOGIC;
	c_out : out STD_LOGIC;
	s : out STD_LOGIC
	);
end Full_Adder;

--}} End of automatically maintained section

architecture synth of Full_Adder is
begin
	c_out <= (a AND b) OR (a AND c_in);
	s <= a xor b xor c_in;

end synth;
