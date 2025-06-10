library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux32_2to1_tb is
end Mux32_2to1_tb;

architecture behavior of Mux32_2to1_tb is
  signal in0: std_logic_vector(31 downto 0);
  signal in1: std_logic_vector(31 downto 0);
  signal set: std_logic;
  signal output: std_logic_vector(31 downto 0);
  
  begin
    uut: entity work.Mux32_2to1 port map(
      in0 => in0,
      in1 => in1,
      set => set,
      output => output);
      
      process
        begin
          
          in0 <= x"CCCCCCCC";
          in1 <= x"BBBBBBBB";
          set <= '1';
          wait for 10 ns;
          
          in0 <= x"CCCCCCCC";
          in1 <= x"BBBBBBBB";
          set <= '0';
          wait for 10 ns;
          
          wait;
        end process;
      end behavior;