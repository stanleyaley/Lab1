library IEEE;
use ieee.std_logic_1164.all;
use work.all;

entity adder8 is --carry select adder8
port(a			: in std_logic_vector (7 downto 0);
	  b			: in std_logic_vector (7 downto 0);
	  carry_in	: in std_logic;
	  sum			: out std_logic_vector (7 downto 0);
	  carry_out	: out std_logic);
end entity adder8;
	  	  
	  
architecture behav of adder8 is

component ripple_adder is
	port(
			A	: in  std_logic_vector(3 downto 0);
			B	: in 	std_logic_vector(3 downto 0);
			Cin :in std_logic;
			cout : out std_logic;
			S	: out std_logic_vector(3 downto 0)
	);
	end component;
	
component mux is
	port ( x		: in std_logic;
		 y		: in std_logic;
		 cins	: in std_logic;
		 outs	: out std_logic
);
end component;


begin
FA0: ripple_adder
port map(
		A(0) => A(0),
		A(1) => A(1),
		A(2) => A(2),
		A(3) => A(3),
		
		B(0) => B(0),
		B(1) => B(1),
		B(2) => B(2),
		B(3) => B(3),
		
		Cin => carry_in,
		cout => carry_out,
		s(0) => sum(0),
		s(1) => sum(1),
		s(2) => sum(2),
		s(3) => sum(3)
	);
	
	FA1: ripple_adder
port map(
		A(0) => A(4),
		A(1) => A(5),
		A(2) => A(6),
		A(3) => A(7),
		
		B(0) => B(0),
		B(1) => B(1),
		B(2) => B(2),
		B(3) => B(3),
		
		Cin => carry_in,
		cout => carry_out,
		s(0) => sum(0),
		s(1) => sum(1),
		s(2) => sum(2),
		s(3) => sum(3)
	);
	
	end architecture;