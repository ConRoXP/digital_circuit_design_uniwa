library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Control is port(
opcode: in std_logic_vector(5 downto 0);
regdst: out std_logic;
ALUsrc: out std_logic;
memtoreg: out std_logic;
regwrite: out std_logic;
memread: out std_logic;
memwrite: out std_logic;
branch: out std_logic;
ALUop: out std_logic_vector(1 downto 0));
end Control;

architecture behavioral of Control is
  begin
    process(opcode)
      begin
      --Initialization
      regdst <= '0';
      ALUsrc <= '0';
      memtoreg <= '0';
      regwrite <= '0';
      memread <= '0';
      memwrite <= '0';
      branch <= '0';
      ALUop <= "00";
      
      case opcode is
        --Type R instr.
      when "000000" =>
        regdst <= '1';
        ALUsrc <= '0';
        memtoreg <= '0';
        regwrite <= '1';
        ALUop <= "10";
        
        --addi
      when "001000" =>
        regdst <= '0';
        ALUsrc <= '1';
        memtoreg <= '0';
        regwrite <= '1';
        ALUop <= "00";
        
        --lw
      when "100011" =>
        regdst <= '0';
        ALUsrc <= '1';
        memtoreg <= '1';
        regwrite <= '1';
        memread <= '1';
        ALUop <= "00";
        
        --sw
      when "101011" =>
        ALUsrc <= '1';
        memwrite <= '1';
        ALUop <= "00";
        
        --bne
      when "000101" =>
        branch <= '1';
        ALUop <= "01";
        
      when others =>
        null;
        
      end case;
    end process;
  end behavioral;