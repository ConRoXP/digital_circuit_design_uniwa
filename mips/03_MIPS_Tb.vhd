library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MIPS_tb is
end MIPS_tb;

architecture behavior of MIPS_tb is
  signal clock: std_logic := '0';
  signal reset: std_logic := '0';
  
  -- 200MHz => 5 ns
  constant clk_period: time := 5 ns;
  
begin
  uut: entity work.MIPS port map(
    clock => clock,
    reset => reset);
    
    clock <= not clock after clk_period/2;
    
    process
      begin
        reset <= '1';
        wait for 3 ns;
        
        reset <= '0';
        wait for 100 ns;
        std.env.stop;
        wait;
      end process;
    end behavior;
