library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter is port(
Clear, Clock: in std_logic;
Q: out std_logic_vector(1 downto 0));
end counter;

architecture behavioral of counter is
  signal Count: unsigned(1 downto 0);
begin
  counter: process(Clock)
  begin
    if rising_edge(Clock) then
      if Clear= '1' then
        Count<= "00";
      else
        Count<= Count + 1;
      end if;
    end if;
  end process;
  Q<= std_logic_vector(Count);
end behavioral;