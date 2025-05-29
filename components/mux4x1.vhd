----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/09/2025 05:45:24 PM
-- Design Name: 
-- Module Name: mux4 - struct
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

entity mux4 is
 port( d0,d1
   ,d2,d3 : in std_logic_vector (3 downto 0 );
  s : in std_logic_vector(1 downto 0);
  y : out std_logic_vector(3 downto 0)
 );
end mux4;

architecture struct of mux4 is
    component mux2 
     port(
        d0,d1 : in std_logic_vector(3 downto 0);
        s : in std_logic;
        y : out std_logic_vector(3 downto 0) 
     );
    end component;
        signal low,high : std_logic_vector(3 downto 0);
begin
    lowmux: mux2 port map(d0,d1,s(0),low);
    highmux: mux2 port map(d2,d3,s(0),high);
    finalmux: mux2 port map(low,high,s(1),y);
end struct;
