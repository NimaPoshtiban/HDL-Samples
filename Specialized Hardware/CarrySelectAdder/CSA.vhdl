library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CSA is
    Port ( Acs : in STD_LOGIC_VECTOR (7 downto 0);
           Bcs : in STD_LOGIC_VECTOR (7 downto 0);
           Carry_in : in STD_LOGIC;
           Scs : out STD_LOGIC_VECTOR (7 downto 0);
           Carry_out : out STD_LOGIC);
end CSA;

architecture Behavioral of CSA is

component CRA is
     generic(nb:integer:=8);
     Port ( A : in STD_LOGIC_VECTOR (nb-1 downto 0);
            B : in STD_LOGIC_VECTOR (nb-1 downto 0);
            Cin : in STD_LOGIC;
            S : out STD_LOGIC_VECTOR (nb-1 downto 0);
            Cout : out STD_LOGIC);
end component;

component MUX is 
        Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           S : in STD_LOGIC;
           COUT : out STD_LOGIC);
end component;

signal sum1, sum0 : STD_LOGIC_VECTOR(7 downto 0);
signal carry1, carry0 : STD_LOGIC;

begin

RCA0: CRA port map (Acs, Bcs, '0', sum0, carry0);
RCA1: CRA port map (Acs, Bcs, '1', sum1, carry1);

Muxx: for i in 7 downto 0 generate
    mux_i: MUX port map ( sum0(i), sum1(i),Carry_in, Scs(i) );
end generate Muxx;

Muxf: MUX port map (carry0, carry1, Carry_in, Carry_out);

end Behavioral;