library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux5_2to1 is port(
in0: in std_logic_vector(4 downto 0);
in1: in std_logic_vector(4 downto 0);
set: in std_logic;
output: out std_logic_vector(4 downto 0));
end Mux5_2to1;

architecture behavioral of Mux5_2to1 is
  begin
    process(in0, in1, set)
      begin
        if set = '0' then
          output <= in0;
        else output <= in1;
        end if;
      end process;
    end behavioral;