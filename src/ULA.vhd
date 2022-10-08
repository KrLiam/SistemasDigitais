library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ULA is
	generic(
		width: positive := 8
	);
	port(
		clk: in std_logic;
		a, b: in signed(width-1 downto 0);
		op: in unsigned(2 downto 0);
		s: out signed(width-1 downto 0)
	);
end entity;

architecture ula of ULA is
	signal currentState, nextState: signed(s'range);
begin
	with op select
		nextState <= a and b when "000",
						 a or b when "001",
						 a xor b when "010",
						 (others=>'0') when others;

	process(clk) is
	begin
		if rising_edge(clk) then
			currentState <= nextState;
		end if;
	end process;
	
	s <= currentState;
end architecture;