----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/20/2025 12:53:14 PM
-- Design Name: 
-- Module Name: decoder3x8 - synth
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


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity decoder3x8 is
  Port (a : in std_logic_vector(2 downto 0);
    y : out std_logic_vector(7 downto 0)
   );
end decoder3x8;

architecture synth of decoder3x8 is
    
begin
    process(all) begin
        case a is
        when "000" => y <= "00000001";
        when "001" => y <= "00000010";
        when "010" => y <= "00000100";
        when "011" => y <= "00001000";
        when "100" => y <= "00010000";
        when "101" => y <= "00100000";
        when "110" => y <= "01000000";
        when "111" => y <= "11111111";
        when others => y <= "XXXXXXXX";        
        end case;
    end process;

end synth;
