library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity MUX is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           S : in STD_LOGIC;
           COUT : out STD_LOGIC);
end MUX;

architecture synthmux of MUX is
begin
    if S='1' then COUT <= B else COUT <=A;

end synthmux;