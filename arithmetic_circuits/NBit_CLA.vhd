-------------------------------------------------------------------------------
--
-- Title       : NBit_CLA
-- Design      : CLA
-- Author      : nima
-- Company     : me
--
-------------------------------------------------------------------------------
--
-- File        : C:\Users\nima\prod\hdl\generalized\CLA\src\NBit_CLA.vhd
-- Generated   : Tue Jul  1 13:54:45 2025
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : Carry Lock Ahead Adder
-- C_i = G_i:j + P_i:j C_i-1
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {NBit_CLA} architecture {synth}}
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity NBit_CLA is
	generic(N :integer := 2);
	port(a,b, cin: in STD_LOGIC_VECTOR(N-1 downto 0);
	s : out std_logic_vector(N-1 downto 0);
	cout : out std_logic
	);
	
end NBit_CLA;

--}} End of automatically maintained section

architecture synth of NBit_CLA is
begin
	s <= a xor b xor cin;	
	process(a,b,cin)
		variable c,cprev :std_logic := '0';
	begin
		gen: for i in 0 to N-1 loop
			c := (a(i) and b(i)) OR ((a(i)OR b(i)) AND cprev);
			cprev := c;
		end loop;
		cout <= c;
	end process;
	 -- enter your statements here --
	
end synth;
