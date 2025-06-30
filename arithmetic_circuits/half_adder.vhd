library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity Half_Adder is 
	port (x,y : in STD_LOGIC ;
	cout : out STD_LOGIC;
	s : out STD_LOGIC);
end Half_Adder;

Architecture synth of Half_Adder is
	signal a : STD_LOGIC;
begin
	s <= x xor y;
	cout <= x AND y;

end synth;
