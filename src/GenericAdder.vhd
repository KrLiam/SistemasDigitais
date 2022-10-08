library ieee;
use ieee.std_logic_1164.all;

entity GenericAdder is
    generic (
        width: natural := 4;
		  generate_overflow: boolean := true
    );
    port (
        A, B: in std_logic_vector(width-1 downto 0);
        Cin: in std_logic;
        S: out std_logic_vector(width-1 downto 0);
        Cout: out std_logic;
		  OV: out std_logic
    );
end entity;

architecture generic_adder of GenericAdder is
	signal carry: std_logic_vector(width downto 0);
	
	component FullAdder is
		port (
			A, B, Cin: in std_logic;
			S, Cout: out std_logic
		);
	end component;
	
begin
	soma: for i in S'range generate
			adder: FullAdder port map (
				A => A(i),
				B => B(i),
				Cin => carry(i),
				S => S(i),
				Cout => carry(i+1)
			);
	end generate;
	
	carry(0) <= Cin;
	Cout <= carry(width);
	
	overflow: if generate_overflow generate
		OV <= carry(width) xor carry(width-1);
	end generate;
    
end architecture;