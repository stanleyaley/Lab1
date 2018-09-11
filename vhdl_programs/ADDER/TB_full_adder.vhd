library IEEE;
use ieee.std_logic_1164.all;
use work.all;


Entity TB_full_adder is
	-- not really needed here for now
end entity;

Architecture test of TB_full_adder is

component full_adder is
	port(
			A	: in  std_logic;
			B	: in std_logic;
			Cin :in std_logic;
			cout : out std_logic;
			S	: out std_logic
	);
end component;

--input
signal numA	: std_logic:='0';
signal numB	: std_logic:='0';
signal numCin	: std_logic:='0';



--output
signal numCout	: std_logic:='0';
signal sum : std_logic:='0';

begin

DUT: full_adder 
	port map(
		A => numA,
		B => numB,
		Cin => numCin,
		cout => numcout,
		s => sum
	);

-- Our test stimulus

NumCin <= not(NUMCIN) after 10 ns;
NumA <= not (numA) after 20 ns;
NumB <= not (numB) after 40 ns;


end architecture;