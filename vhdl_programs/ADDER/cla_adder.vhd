library IEEE;
use ieee.std_logic_1164.all;
use work.all;


Entity cla_adder is -- carry lookahead adders
	port(
			A	: in  std_logic_vector(3 downto 0);
			B	: in 	std_logic_vector(3 downto 0);
			Cin :in std_logic;
			cout : out std_logic;
			S	: out std_logic_vector(3 downto 0)
	);
end cla_adder;

architecture behav of cla_adder is

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
signal c0,c1,c2,c3: std_logic;
signal o1,o2,o3,o4: std_logic;
begin
c0<= (a(0) and b(0)) or ((a(0) or b(0))and cin);
			-- g1				or 		p1 		and 			g0				or			p1			and	p0 			and 	cin;
	c1 <= (a(1) and b(1)) or ((a(1) or b(1)) and (a(0) and b(0))) or ((a(1) or b(1)) and (a(0) or b(0)) and cin);
			
	c2 <= (a(2) and b(2)) or ((a(2) or b(2)) and (a(1) and b(1))) or ((a(2) or b(2)) and (a(1) or b(1)) and (a(0) and b(0))) or ((a(2) or b(2)) and (a(1) or b(1)) and (a(0) or b(0)) and cin);
	
	cout <= (a(3) and b(3)) or ((a(3) or b(3)) and (a(2) and b(2))) or ((a(3) or b(3)) and (a(2) or b(2))and (a(1) and b(1))) or ((a(3) or b(3)) and (a(2) or b(2)) and (a(1) or b(1)) and (a(0) and b(0))) or ((a(3) or b(3))and (a(2) or b(2)) and (a(1) or b(1))and (a(0) or b(0)) and cin);
	
FA0: full_adder
	port map(
		A => A(0),
		B => B(0),
		Cin => cin,
		cout => carryline(0),
		s => S(0)
	);
	--A(0),B(0),cin,c0,S(0));

FA1: full_adder
port map(
		A => A(1),
		B => B(1),
		cin => c0,
		cout => carryline(1),
		s => S(1)
	);
--port map(A(1),B(1),c0,c1,S(1));
	
FA2: full_adder
port map(
		A => A(2),
		B => B(2),
		Cin => c1,
		cout => carryline(2),
		s => S(2)
	);
--port map(A(2),B(2),c1,c2,S(2));
	
FA3:	full_adder
port map(
		A => A(3),
		B => B(3),
		Cin => c2,
		cout => open,
		s => S(3)
	);
--port map(A(3),B(3),c2,c3,S(0));
	
	
	
	
	--c0 <= (cin and(a(0) xor b(0))) or(a(0) and b(0));
	--c1 <= (c0 and(a(1) xor b(1))) or(a(1) and b(1));
	--c2 <= (c1 and(a(2) xor b(2))) or(a(2) and b(2));
	--c3 <= (c2 and(a(3) xor b(3))) or(a(3) and b(3));


end architecture;

-- endsssss

--cout = (a and b) or ((a xor b) and cin)
-- 1st part: carry generator, 2nd part carry propagator
--cout = G + P and cin

--co = G + P and cin-1 

--so, Ci = G+P Cin-1
