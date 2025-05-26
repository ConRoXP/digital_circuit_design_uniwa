library ieee;
use ieee.std_logic_1164.all;

entity ffreset is port(
D: in bit;
CLK: in bit;
Rstn: in bit;
Q: out bit);
end ffreset;

architecture behavioral of ffreset is
begin
  process(Rstn, CLK)
    begin
      if Rstn= '0' then
        Q<= '0';
    elsif CLK'event and CLK= '1' then
      Q<= D;
    end if;
  end process;
end behavioral;