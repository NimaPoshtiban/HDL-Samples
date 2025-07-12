library IEEE;
use ieee.std_logic_1164.all;

entity Nbit_Comperator is 
	generic(N: integer := 8);
	port(a,b : in std_logic_vector(N-1 downto 0);
	     eq  : out std_logic_vector(N-1 downto 0); -- a=b
	     gt  : out std_logic_vector(N-1 downto 0); -- a > b
	     lt  : out std_logic_vector(N-1 downto 0) -- a < b
     );
end entity;


Architecture synth of Nbit_Comperator is
begin
	process(a,b)
	variable gate_xor : std_logic_vector(N-1 downto 0);
	begin
	gate_xor := a xor b;

	eq <= not gate_xor;
	gt <= gate_xor AND a ;
	lt <= gate_xor AND b;
end process;
end synth;
