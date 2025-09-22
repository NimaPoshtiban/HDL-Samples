library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity D_FF is 
	port(d,clk : in STD_LOGIC;
	     q : out STD_LOGIC);
end;

architecture archd of D_FF is

begin 
	process(clk) begin
	if clk'event and clk='1' 
	then
		q <= d;
	end if;
	end process;
	
end archd;