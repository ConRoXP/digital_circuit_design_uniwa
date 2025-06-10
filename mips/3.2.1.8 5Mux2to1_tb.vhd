library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux5_2to1_tb is
end Mux5_2to1_tb;

architecture behavior of Mux5_2to1_tb is
  signal in0: std_logic_vector(4 downto 0);
  signal in1: std_logic_vector(4 downto 0);
  signal set: std_logic;
  signal output: std_logic_vector(4 downto 0);
  
  begin
    uut: entity work.Mux5_2to1 port map(
      in0 => in0,
      in1 => in1,
      set => set,
      output => output);
      
      process
        begin
          
          in0 <= "11100"; --0x1C
          in1 <= "01010"; --0x0A
          set <= '1';
          wait for 10 ns;
          
          in0 <= "11100";
          in1 <= "01011";
          set <= '0';
          wait for 10 ns;
          
          wait;
        end process;
      end behavior;