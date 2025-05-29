library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD_UNSIGNED.all;
entity decoder is 
	generic(inputs: INTEGER := 3);
	port (a : in STD_LOGIC_Vector(inputs - 1 downto 0);
		y : out STD_LOGIC_Vector(inputs**2 - 1 downto 0)	
	     );	
end;

architecture decoder_generic of decoder is 
begin
process(all) begin
	y <= (others => '0');
	y(TO_INTEGER(a)) <= '1';
end process;

end;
