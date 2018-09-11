--mux
library IEEE;
use ieee.std_logic_1164.all;
use work.all;


entity mux is
port ( x		: in std_logic;
		 y		: in std_logic;
		 cins	: in std_logic;
		 outs	: out std_logic
);
end entity mux;


Architecture Behaviour of mux is

begin
process(x, y, cins)
begin 
if cins = '0' then
 outs <= x;
 else
 outs <= y;
 end if;
 end process;

end architecture;