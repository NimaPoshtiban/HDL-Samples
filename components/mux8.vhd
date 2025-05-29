----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/09/2025 06:10:49 PM
-- Design Name: 
-- Module Name: mux8 - struct
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

entity mux8 is
 Port (d0,d1 : in std_logic_vector(7 downto 0);
    s : std_logic; 
    y: out std_logic_vector(7 downto 0)
  );
end mux8;

architecture struct of mux8 is
component mux2 
port(d0,d1 : in std_logic_vector(3 downto 0);
      s :in  std_logic;
      y : out std_logic_vector(3 downto 0)
      );
 end component;
begin
    lsmux: mux2 port map(d0(3 downto 0),d1(3 downto 0),s,y(3 downto 0));
    msmux: mux2 port map(d0(7 downto 4),d1(7 downto 4),s,y(7 downto 4));
end struct;
