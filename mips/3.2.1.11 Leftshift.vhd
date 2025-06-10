library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Leftshift is port(
input: in std_logic_vector(31 downto 0);
output: out std_logic_vector(31 downto 0));
end Leftshift;

architecture behavioral of Leftshift is
  begin
    output <= input(29 downto 0) & "00";
  end behavioral;