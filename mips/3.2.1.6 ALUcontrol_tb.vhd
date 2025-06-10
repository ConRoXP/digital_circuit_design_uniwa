library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALUcontrol_tb is
end ALUcontrol_tb;

architecture behavior of ALUcontrol_tb is
  signal funct: std_logic_vector(5 downto 0);
  signal ALUop: std_logic_vector(1 downto 0);
  signal ALUcontrol: std_logic_vector(3 downto 0);
  
  begin
    uut: entity work.ALUcontrol port map(
      funct => funct,
      ALUop => ALUop,
      ALUcontrol => ALUcontrol);
      
      process
        begin

          funct <= "100000";
          ALUop <= "10";
          wait for 10 ns;
          
          funct <= "100010";
          ALUop <= "10";
          wait for 10 ns;
          
          funct <= "111111";
          ALUop <= "00";
          wait for 10 ns;
          
          funct <= "111111";
          ALUop <= "01";
          wait for 10 ns;
          
          wait;
        end process;
      end behavior;