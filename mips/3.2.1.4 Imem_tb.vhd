library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Imem_tb is
end Imem_tb;

architecture behavior of Imem_tb is
  signal address: std_logic_vector(31 downto 0);
  signal instruction: std_logic_vector(31 downto 0);
  
  begin
    uut: entity work.Imem
    port map(
      address => address,
      instruction => instruction);
      
      process
        begin
          address <= x"00000004";
          wait for 10 ns;
          std.env.stop;
        end process;
      end behavior;