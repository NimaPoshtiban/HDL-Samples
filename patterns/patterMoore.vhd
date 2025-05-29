----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/23/2025 12:14:00 PM
-- Design Name: 
-- Module Name: patterMoore - synth
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
-- In the Moore machine 
-- the output depends only on the current state
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

entity patterMoore is
  Port (clk,reset,a : in std_logic;
    y : out std_logic
   );
end patterMoore;

architecture synth of patterMoore is
    type statetype is (s0,s1,s2);
    signal state,nextstate : statetype;
begin
    process(clk, reset) begin
        if reset='1' then state <= s0;
        elsif rising_edge(clk) then state <= nextstate;
        end if;
    end process;
    
    process(all) begin
       case state is
        when s0 => 
            if a='1' then nextstate <= s0;
            else nextstate <= s1;
            end if;
        when s1 =>
            if a='1' then nextstate <=s2;
            else nextstate <= s1;
            end if;
        when s2 => 
            if a='1' then nextstate <= s0;
            else nextstate <= s1;
            end if;
         when others => nextstate <= s0;
        end case;
    end process;
    y <='1' when state=s2 else '0';
end synth;
