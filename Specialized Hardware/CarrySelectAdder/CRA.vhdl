library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CRA is
    generic(nb:integer:=8);
    Port ( A : in STD_LOGIC_VECTOR (nb-1 downto 0);
           B : in STD_LOGIC_VECTOR (nb-1 downto 0);
           Cin : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (nb-1 downto 0);
           Cout : out STD_LOGIC);
end CRA;

architecture Behavioral of CRA is

signal  IC:STD_LOGIC_VECTOR(nb downto 0);
signal p, g: STD_LOGIC_VECTOR(nb-1 downto 0);
begin
IC(0) <= Cin;
Cout <= IC(nb);
p<= A xor B;
gen: for i in 0 to nb-1 generate
    S(i) <= p(i) xor IC(i);
   IC(i+1) <= A(i) when (p(i)='0') else
            IC(i) when(p(i)='1') else 'X';
   end generate gen;
   
end Behavioral;