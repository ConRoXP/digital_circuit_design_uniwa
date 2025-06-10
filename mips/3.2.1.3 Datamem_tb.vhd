library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Datamem_tb is
end Datamem_tb;

architecture behavior of Datamem_tb is
  signal clk: std_logic := '0';
  signal mem_write: std_logic;
  signal mem_read: std_logic;
  signal address: std_logic_vector(31 downto 0);
  signal write_data: std_logic_vector(31 downto 0);
  signal read_data: std_logic_vector(31 downto 0);
  
  constant clk_period: time := 10 ns;
  
  begin
    uut:entity work.Datamem port map(
      clk => clk,
      mem_write => mem_write,
      mem_read => mem_read,
      address => address,
      write_data => write_data,
      read_data => read_data);
      
      clk <= not clk after clk_period/2;
      
      process
        begin
          mem_write <= '1';
          mem_read <= '0';
          
          -- write 9 -> 2
          address <= x"00000002";
          write_data <= std_logic_vector(to_signed(9,32));
          wait for clk_period;
          
          -- write 4 -> 3
          address <= x"00000003";
          write_data <= std_logic_vector(to_signed(4,32));
          wait for clk_period;
          
          -- read <- 2
          mem_write <= '0';
          mem_read <= '1';
          address <= x"00000002";
          wait for clk_period;
          std.env.stop;
          
          wait;
        end process;
      end behavior;
      