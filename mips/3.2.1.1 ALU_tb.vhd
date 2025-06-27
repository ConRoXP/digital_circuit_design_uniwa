library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ALU_tb is
end ALU_tb;

architecture behavior of ALU_tb is
  signal ALUin1: std_logic_vector(31 downto 0);
  signal ALUin2: std_logic_vector(31 downto 0);
  signal ALUctrl: std_logic_vector(3 downto 0);
  signal ALUresult: std_logic_vector(31 downto 0);
  signal zero: std_logic;
  
begin
  uut: entity work.ALU
  port map(
    ALUin1 => ALUin1,
    ALUin2 => ALUin2,
    ALUctrl => ALUctrl,
    ALUresult => ALUresult,
    zero => zero);
    
    process
      begin
        -- 7+(-3)
        ALUin1 <= std_logic_vector(to_signed(7,32));
        ALUin2 <= std_logic_vector(to_signed(-3,32));
        ALUctrl <= "0010";
        wait for 10 ns;
        
        -- 6+(-6)
        ALUin1 <= std_logic_vector(to_signed(6,32));
        ALUin2 <= std_logic_vector(to_signed(-6,32));
        ALUctrl <= "0010";
        wait for 10 ns;
        
        -- 5-8
        ALUin1 <= std_logic_vector(to_signed(5,32));
        ALUin2 <= std_logic_vector(to_signed(8,32));
        ALUctrl <= "0110";
        wait for 10 ns;
        
        wait;
      end process;
    end behavior;