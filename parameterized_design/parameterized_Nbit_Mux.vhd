-- PARAMETERIZED N-BIT 2:1 MULTIPLEXERS
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity mux2 is 
	generic(width: integer := 8); -- default value is 8
	port(d0,d1 : in STD_LOGIC_VECTOR(width -1 downto 0);
	    s : in STD_LOGIC;
	    y : out STD_LOGIC_VECTOR(width - 1 downto 0)
);

end;

architecture synthmux2 of mux2 is
begin
	y <= d1 when s='1' else d0;
end synthmux2;

-- the paramater value does not to be overwriten
-- 8 bit 4x2 Mux
library IEEE;
use IEEE.STD_LOGIC_1164.all;


entity mux4x2 is 
	port(d0,d1,d2,d3 : in STD_LOGIC_VECTOR(7 downto 0);
	s : in STD_LOGIC_VECTOR(1 downto 0);
	y : out STD_LOGIC_VECTOR(7 downto 0)
	    );
end;

architecture synthmux4x2 of mux4x2 is
	component mux2 
	generic(width: integer := 8);
	port(d0,d1 : in STD_LOGIC_VECTOR(width -1 downto 0);
	    s : in STD_LOGIC;
	    y : out STD_LOGIC_VECTOR(width - 1 downto 0));
    end component;
    signal low,high : STD_LOGIC_VECTOR(7 downto 0);
begin
	lowmux: mux2 port map(d0,d1,s(0),low);
	highmux: mux2 port map(d2,d3,s(0),high);
	outmux: mux2 port map(low,high,s(1),y);
end synthmux4x2;



-- the paramater value does need to be overwriten
-- 12 bit 4x2 Mux
library IEEE;
use IEEE.STD_LOGIC_1164.all;


entity mux4_12bit is 
	port(d0,d1,d2,d3 : in STD_LOGIC_VECTOR(11 downto 0);
	s : in STD_LOGIC_VECTOR(1 downto 0);
	y : out STD_LOGIC_VECTOR(11 downto 0)
	    );
end;

architecture synthmux4_12bit of mux4_12bit is
	component mux2 
	generic(width: integer := 8);
	port(d0,d1 : in STD_LOGIC_VECTOR(width -1 downto 0);
	    s : in STD_LOGIC;
	    y : out STD_LOGIC_VECTOR(width - 1 downto 0));
    end component;
    signal low,high : STD_LOGIC_VECTOR(11 downto 0);
begin
	lowmux: mux2 generic map(12) port map(d0,d1,s(0),low);
	highmux: mux2 generic map(12) port map(d2,d3,s(0),high);
	outmux: mux2 generic map(12) port map(low,high,s(1),y);
end synthmux4_12bit;
