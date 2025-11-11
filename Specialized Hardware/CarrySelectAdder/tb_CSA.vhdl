----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/11/2025 12:54:49 AM
-- Design Name: 
-- Module Name: tb_CSA - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use std.env.finish;
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_CSA is
end tb_CSA;

architecture tb of tb_CSA is
	component CSA
	    Port ( Acs : in STD_LOGIC_VECTOR (7 downto 0);
	       Bcs : in STD_LOGIC_VECTOR (7 downto 0);
	       Carry_in : in STD_LOGIC;
	       Scs : out STD_LOGIC_VECTOR (7 downto 0);
	       Carry_out : out STD_LOGIC);
	end component;
	signal A,B : STD_LOGIC_VECTOR(7 DOWNTO 0);
	signal CIN : STD_LOGIC;
	signal Scs : STD_LOGIC_VECTOR (7 downto 0);
	signal Carry_out :  STD_LOGIC;
begin
	uut: CSA 
	port map(Acs=>A,Bcs=>B,Carry_in=>CIN,Scs=>Scs,Carry_out=>Carry_out);
	process 
	begin
	A <= "00000010";
	B <= "01110101";
	wait for 20ns;
	assert Carry_out='0'report "incorrect result" severity failure;
	assert Scs="01110111" report "incorrect result" severity failure;
	
	A <= "10000010";
	B <= "11110101";
	wait for 40ns;
	assert Carry_out='1'report "incorrect result" severity failure;
	assert Scs="01110111" report "incorrect result" severity failure;
	
	
	report "Testbench finished: OK";
	wait;
	finish;
	end process;


end architecture;
