library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Leftshift_tb is
end Leftshift_tb;

architecture behavior of Leftshift_tb is
  signal input: std_logic_vector(31 downto 0);
  signal output: std_logic_vector(31 downto 0);
  
  begin
    uut: entity work.Leftshift port map(
      input => input,
      output => output);
      
      process
        begin
          input <= x"0FFFFFFF";
          wait for 10 ns;
          
          wait;
        end process;
      end behavior;