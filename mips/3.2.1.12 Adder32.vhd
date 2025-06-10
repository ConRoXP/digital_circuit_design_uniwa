library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Adder32 is port(
        in0: in  std_logic_vector(31 downto 0);
        in1: in  std_logic_vector(31 downto 0);
        result: out std_logic_vector(31 downto 0));
end Adder32;

architecture behavioral of Adder32 is
begin
    result <= std_logic_vector(unsigned(in0) + unsigned(in1));
end behavioral;
