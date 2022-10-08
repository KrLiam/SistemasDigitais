library ieee;
use ieee.std_logic_1164.all;

entity Sistemas is
	generic(
		w: positive := 8
	);
	port(
		a, b: in std_logic_vector(w-1 downto 0);
		op: in std_logic;
		output: out std_logic_vector(w-1 downto 0)
	);
end entity;

architecture sistemas of Sistemas is
	component AdderSubtractor is
		generic(
			width: positive;
			isAdder: boolean := false;
			isSubtractor: boolean := false;
			generateCout: boolean := true;
			generateOvf: boolean := true);
		port(	
			a, b: in std_logic_vector(width-1 downto 0);
			op: in std_logic;
			result: out std_logic_vector(width-1 downto 0)
		);
	end component;

begin
	addersub: AdderSubtractor
		generic map(
			width => 8,
			isAdder => true,
			isSubtractor => true
		)
		port map(
			a => a, b => b,
			op => op,
			result => output
		);
end architecture;