library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.all;



Entity TB_ripple_adder is
end entity;

architecture testbench of TB_ripple_adder is 

component ripple_adder is
	port(
			A	: in  std_logic_vector(3 downto 0);
			B	: in 	std_logic_vector(3 downto 0);
			Cin :in std_logic;
			cout : out std_logic;
			S	: out std_logic_vector(3 downto 0)
	);
end component;

--signals
--input to DUT

signal numA: integer;
signal numb: integer;
signal numc: integer;

signal A_int: std_logic_vector(3 downto 0);
signal B_int: std_logic_vector(3 downto 0);
signal adder_cin: std_logic:='0';

--outputs from DUT
signal answer: std_logic_vector(3 downto 0);
signal overflow: std_logic;

begin


A_int <= std_logic_vector(to_unsigned(numA, A_int'length));
B_int <= std_logic_vector(to_unsigned(numB, B_int'length));
--adder_cin <= '0'; 

DUT: ripple_adder
port map(
			A => A_int,
			B	=> B_int,
			cin => adder_cin,
			cout => overflow,
			S	=> answer
);


process
	begin
	numA <= 2;
	numB <= 3;
	adder_cin <= '1';
	wait for 10 ns;
	
	numA <= 16;
	numB <= 8;
	adder_cin <= '0';
	wait for 10 ns;
	
	numA <= 1;
	numB <= 2;
	adder_cin <= '1';
	wait for 10 ns;
	
	numA <= 16;
	numB <= 16;
	adder_cin <= '0';
	wait for 10 ns;
	
	numA <= 16;
	numB <= 16;
	adder_cin <= '1';
	wait for 10 ns;
	
	


end process;



end architecture;