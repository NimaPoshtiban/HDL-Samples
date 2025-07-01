library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity CPA is
	generic(N: integer := 8);
   	port(a, b: in STD_LOGIC_VECTOR(N-1 downto 0);
	cin: in STD_LOGIC;
	s: out STD_LOGIC_VECTOR(N-1 downto 0);
	cout: out STD_LOGIC);
end;

architecture synth of CPA is
signal result: STD_LOGIC_VECTOR(N downto 0);
begin
	gen: for i in 0 to N-1 generate
		result(i) <= (('0' AND a(i)) OR ('0' AND b(i))) OR cin;
	end generate;   	
	
    s <= result(N-1 downto 0);
	cout <= result(N);
end;			 