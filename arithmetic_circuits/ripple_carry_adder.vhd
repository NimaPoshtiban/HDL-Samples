--The delay of the adder,t_ripple, grows directly with the number of bits,  		 
-- t_ripple = N_tFA
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity ripple_carry_adder is
	generic(N : integer := 2);
	port(
	a,b,c_in : in std_logic_vector(N-1 downto 0);
	s,c_out : out std_logic_vector(N-1 downto 0)
	);
end;

architecture synth of ripple_carry_adder is
signal carry : std_logic_vector(N-1 downto 0);
signal s1 : std_logic_vector(N-1 downto 0);
begin
	process(a,b,c_in) begin	
	gen: for i in 1 to N-1 	LOOP
		carry(i) <= (a(i) AND b(i)) OR (a(i) AND c_in(i));
		s1(i) <= a(i) xor b(i) xor c_in(i);
	end LOOP;
	end	process;
	s <= s1;
	c_out <= carry;
end synth;


















