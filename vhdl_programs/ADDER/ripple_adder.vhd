library IEEE;
use ieee.std_logic_1164.all;
use work.all;


Entity ripple_adder is
	port(
			A	: in  std_logic_vector(3 downto 0);
			B	: in 	std_logic_vector(3 downto 0);
			Cin :in std_logic;
			cout : out std_logic;
			S	: out std_logic_vector(3 downto 0)
	);
end ripple_adder;

architecture behav of ripple_adder is

component full_adder is
	port(
			A	: in  std_logic;
			B	: in std_logic;
			Cin :in std_logic;
			cout : out std_logic;
			S	: out std_logic
	);
end component;


signal carryline: std_logic_vector(3 downto 0);

begin

FA0: full_adder
	port map(
		A => A(0),
		B => B(0),
		Cin => cin,
		cout => carryline(0),
		s => S(0)
	);

gen_adder:
	for i in 1 to 2 generate
		FAx: full_adder
		port map(
			A => A(i),
			B => B(i),
			Cin => carryline(i-1),
			cout => carryline(i),
			s => S(i)
		);
	end generate;
	
FA3:	full_adder
	port map(
			A => A(3),
			B => B(3),
			Cin => carryline(3-1),
			cout => cout,
			s => S(3)
	);
	
	

end architecture;