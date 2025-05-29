library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity GEN_AND is 
	generic(N : integer := 8);
	port(a : in STD_LOGIC_VECTOR(N-1 downto 0);
		y : out STD_LOGIC
	    );
end;


architecture generate_and of GEN_AND is
	signal x : STD_LOGIC_VECTOR(N-1 downto 0);
begin
	x(0) <= a(0);
	gen: for i in 1 to N-1 generate  -- i does not need to be declared
		x(i) <= a(i) AND x(i-1);
	end generate;
	y <= x(N-1);
end generate_and;
