library ieee;
use ieee.std_logic_1164.all;

entity shift4 is port(
--D: in std_logic_vector(3 downto 0);
Enable: in std_logic;
Sin: in std_logic;
Clock: in std_logic;
Q: out std_logic_vector(3 downto 0));
end shift4;

architecture behavioral of shift4 is
  signal Qt: std_logic_vector(3 downto 0);
  begin
    process(Clock)
      begin
        if enable= '1' then
          if rising_edge(clock) then
            Qt(0)<= Qt(1);
            Qt(1)<= Qt(2);
            Qt(2)<= Qt(3);
            Qt(3)<= Sin;
          end if;
        end if;
      end process;
      Q<= Qt;
    end behavioral;
            