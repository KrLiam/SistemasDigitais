library ieee;
use ieee.std_logic_1164.all;

entity GrayEncoder is
	generic (
		width: natural := 8
	);
	port (
		binInput: in std_logic_vector(width-1 downto 0);
		grayOutput: out std_logic_vector(width-1 downto 0)
	);
end entity;

architecture encoder of GrayEncoder is
begin
	gerar: for i in width-2 downto 0 generate
		grayOutput(i) <= binInput(i) xor binInput(i+1);
	end generate;
	
	grayOutput(width-1) <= binInput(width-1);
end architecture;