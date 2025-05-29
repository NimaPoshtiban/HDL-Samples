----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/21/2025 11:55:24 AM
-- Design Name: 
-- Module Name: divideby3FSM - synth
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

entity divideby3FSM is
  Port (
    clk,reset : in std_logic;
    y : out std_logic
   );
end divideby3FSM;

architecture synth of divideby3FSM is
    type statetype is (s0,s1,s2);
    signal state,nextstate : statetype;
begin
    -- state register
    process(clk,reset) begin
        if reset then state <= s0;
        elsif clk'event and clk='1' then state <= nextstate;
        end if;
    end process;
    -- next state logic
    nextstate <= s1 when state=s0 else s2 when state = s1 else s0;
    
    y <= '1' when state= s0 else '0';
end synth;
