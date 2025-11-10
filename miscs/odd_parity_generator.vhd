library IEEE;
use IEEE.std_logic_1164.all;

entity odd_parity_generator is 
	generic( N : integer := 3);
	port(data : IN STD_LOGIC_VECTOR( N-1 downto 0); 
	     y : OUT STD_LOGIC_VECTOR(N downto 0));


end;

architecture synth of odd_parity_generator is
	signal parity_bit : STD_LOGIC;
begin
		parity_bit <=  not ((data(0) xor data (1) ) xor data(2));
		y(3) <= data(2);
		y(2) <= data(1);
		y(1) <= data(0);
		y(0) <= parity_bit;


end synth;