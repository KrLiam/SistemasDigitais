library ieee;
use ieee.std_logic_1164.all;

entity FullAdder is
    port (
        A, B, Cin: in std_logic;
        S, Cout: out std_logic
    );
end entity;

architecture full_adder of FullAdder is
begin
    S <= Cin xor (A xor B);
    Cout <= (Cin and (A xor B)) or (A and B);
end architecture;