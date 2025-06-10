library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Signextension is port(
in16: in std_logic_vector(15 downto 0);
out32: out std_logic_vector(31 downto 0));
end Signextension;

architecture behavioral of Signextension is
  begin
    process(in16)
      variable tmp: signed(31 downto 0);
      begin
        tmp:= resize(signed(in16),32);
        out32 <= std_logic_vector(tmp);
      end process;
    end behavioral;