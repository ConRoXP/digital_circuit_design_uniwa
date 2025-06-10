library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Signextension_tb is
end Signextension_tb;

architecture behavior of Signextension_tb is
  signal in16: std_logic_vector(15 downto 0);
  signal out32: std_logic_vector(31 downto 0);
  
  begin
    uut: entity work.Signextension port map(
      in16 => in16,
      out32 => out32);
      
      process
        begin
          in16 <= x"FAAA";
          wait for 10 ns;
          
          in16 <= x"AFFF";
          wait for 10 ns;
          
          in16<= x"5444";
          wait for 10 ns;
          
          wait;
        end process;
      end behavior;