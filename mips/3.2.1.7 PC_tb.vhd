library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PC_tb is
end PC_tb;

architecture behavior of PC_tb is
  signal clk: std_logic := '0';
  signal reset: std_logic := '0';
  signal pc_in: std_logic_vector(31 downto 0);
  signal pc_out: std_logic_vector(31 downto 0);
  
  constant clk_period: time := 10 ns;
  
  begin
    uut: entity work.PC
    port map(
      clk => clk,
      reset => reset,
      pc_in => pc_in,
      pc_out => pc_out);
      
      clk <= not clk after clk_period/2;
      
      process
        begin
          reset <= '1';
          wait for clk_period;
           reset <= '0';
           
           pc_in <= x"AAAACCCC";
           wait for clk_period;
           
           pc_in <= x"FFFFBBBB";
           wait for clk_period;
           
           wait;
         end process;
       end behavior;