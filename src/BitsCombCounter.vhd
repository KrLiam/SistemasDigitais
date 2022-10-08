library ieee;
use ieee.std_logic_1164.all;
use ieee.math_real.all;
use ieee.numeric_std.all;

entity bitsCombCounter is
	generic(
	    N: positive := 8;
       count1s: boolean := false
	);
	port(   
		input: in std_logic_vector(N-1 downto 0);
		output: out std_logic_vector(integer(ceil(log2(real(N))))-1 downto 0) 
	);
end entity;

architecture bitcounter of bitsCombCounter is
	function count_ones(s : std_logic_vector) return integer is
	  variable temp : natural := 0;
	begin
	  for i in s'range loop
		 if s(i) = '1' then
			temp := temp + 1; 
		 end if;
	  end loop;
	  
	  return temp;
	end function count_ones;
	
	signal to_count: std_logic_vector(N-1 downto 0); 
begin
	inverter: if not count1s generate
		to_count <= not input;
	end generate;

	nao_inverter: if count1s generate
		to_count <= input;
	end generate;


	process(input) is
	begin
		output <= std_logic_vector(to_unsigned(count_ones(to_count), output'length));
	end process;
end architecture;