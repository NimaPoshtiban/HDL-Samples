----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/23/2025 12:56:33 PM
-- Design Name: 
-- Module Name: patternMealy - Behavioral
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
-- in the Mealy machine the output logic
-- depends on both the current state and inputs.
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

entity patternMealy is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           a : in STD_LOGIC;
           y : out STD_LOGIC);
end patternMealy;

architecture Behavioral of patternMealy is
    type statetype is (s0,s1);
    signal state,nextstate : statetype;
begin
    process(clk,reset) begin
    if reset='1' then state <= s0;
    elsif rising_edge(clk) then state  <= nextstate;
    end if;
            
    end process;
    
    process(all) begin
    case state is
    when s0 => 
        if a='1' then nextstate <= s0;
        else nextstate <= s1;
        end if;
    when s1 =>
        if a='1' then nextstate <=s0;
        else nextstate <= s1;
        end if;
    when others => nextstate <=s0;
    end case;
    end process;
    y <='1' when (a='1' and state=s1) else '0';
end Behavioral;
