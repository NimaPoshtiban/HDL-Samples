-------------------------------------------------------------------------------
--
-- Title       : seven_seg_dec
-- Design      : sevenseg_dec
-- Author      : nima
-- Company     : me
--
-------------------------------------------------------------------------------
--
-- File        : C:\Users\nima\prod\aldec_hdl\HDL_Basis\src\sevenseg_dec.vhd
-- Generated   : Mon May 19 16:19:06 2025
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------
library IEEE; use IEEE.STD_logic_1164.all;


entity seven_seg_dec is
	port(
	data : in std_logic_vector(3 downto 0);
	segments : out std_logic_vector(6 downto 0)
	);
end seven_seg_dec;

--}} End of automatically maintained section

architecture synth of seven_seg_dec is
begin
	process(all) 
	begin
		case data is
			when X"0" => segments <= "1111110";
			when X"1" => segments <= "0110000";	
			when X"2" => segments <= "1101101";
			when X"3" => segments <= "1111001";
			when X"4" => segments <= "0110011";
			when X"5" => segments <= "1011011";
			when X"6" => segments <= "1011111";
			when X"7" => segments <= "1110000";
			when X"8"=> segments <= "1111111";
			when X"9"=> segments <= "1110011" ;
			when others => segments <= "0000000";
		end case;
	 -- enter your statements here --
	end process;
end synth;
