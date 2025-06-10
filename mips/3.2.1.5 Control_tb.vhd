library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Control_tb is
end Control_tb;

architecture behavior of Control_tb is
  signal opcode: std_logic_vector(5 downto 0);
  signal regdst: std_logic;
  signal ALUsrc: std_logic;
  signal memtoreg: std_logic;
  signal regwrite: std_logic;
  signal memread: std_logic;
  signal memwrite: std_logic;
  signal branch: std_logic;
  signal ALUop: std_logic_vector(1 downto 0);
  
  begin
    uut: entity work.Control
    port map(
      opcode => opcode,
      regdst => regdst,
      ALUsrc => ALUsrc,
      memtoreg => memtoreg,
      regwrite => regwrite,
      memread => memread,
      memwrite => memwrite,
      branch => branch,
      ALUop => ALUop);
      
      process
        begin
          --addi $1, $0, 4
          opcode <= "001000";
          wait for 10 ns;
          
          --sw $6, $4
          opcode <= "101011";
          wait for 10 ns;
          
          --bne $5, $0, L1
          opcode <= "000101";
          wait for 10 ns;
          
          wait;
        end process;
      end behavior;