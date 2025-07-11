library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity Nbit_subtractor is
	generic(N : integer := 8);
	port(
		a,b,c : in STD_LOGIC_VECTOR(N-1 downto 0);
		signbit : out STD_LOGIC;
		s  : out STD_LOGIC_VECTOR(N-1 downto 0)
	    );
end Nbit_subtractor;

Architecture synth of Nbit_subtractor is 
	signal g1,g2 : STD_LOGIC_VECTOR(N-1 downto 0);
begin
	gen: for i in 0 to N-1 generate
		g1(i) <= a(i) xor NOT b(i) xor c(i);
		g2(i) <= a(i) AND NOT b(i) AND c(i);
	end generate;
	s <= NOT g1 or g2;
	signbit <= g1(N-1) or g2(N-1) or '1';

end synth;
