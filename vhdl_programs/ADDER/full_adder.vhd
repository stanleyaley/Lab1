library IEEE;
use ieee.std_logic_1164.all;
use work.all;


Entity full_adder is
	port(
			A	: in  std_logic;
			B	: in std_logic;
			Cin :in std_logic;
			cout : out std_logic;
			S	: out std_logic
	);
end full_adder;

Architecture Behaviour of full_adder is

begin
	S <= A xor B xor Cin after 5 ns;
	Cout <= (A and B) or (A and Cin) or (B and Cin) after 5 ns;
	--wait (100);

end architecture;