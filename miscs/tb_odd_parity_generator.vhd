library ieee;
use ieee.std_logic_1164.all;
use std.env.finish;
use ieee.numeric_std.all;
entity tb_odd_parity_generator is 
end;

architecture behave of tb_odd_parity_generator is
component odd_parity_generator 
port(data : IN STD_LOGIC_VECTOR( 3-1 downto 0); 
	     y : OUT STD_LOGIC_VECTOR(3 downto 0));

end component;
signal data :  STD_LOGIC_VECTOR( 3-1 downto 0);
signal y :  STD_LOGIC_VECTOR( 3 downto 0);  
begin
	 uut : odd_parity_generator
	port map( data => data, 
	     y => y);

	process 
	begin
	data <= "000";
	wait for 10 ns;
	assert y = "0001" report "incorrect result" severity failure;

	data <= "001";
	wait for 10 ns;
	assert y = "0010" report "incorrect result" severity failure;
	report "Testbench finished: OK";
	data <= "011";
	wait for 10 ns;
	assert y = "0111" report "incorrect result" severity failure;
	report "Testbench finished: OK";

	data <= "111";
	wait for 10 ns;
	assert y = "1110" report "incorrect result" severity failure;
	report "Testbench finished: OK";
 	wait;
	finish;
	end process;


end architecture;