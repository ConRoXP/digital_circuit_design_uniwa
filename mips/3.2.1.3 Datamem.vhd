library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Datamem is port(
clk: in std_logic;
mem_write: in std_logic;
mem_read: in std_logic;
address: in std_logic_vector(31 downto 0);
write_data: in std_logic_vector(31 downto 0);
read_data: out std_logic_vector(31 downto 0));
end Datamem;

architecture behavioral of Datamem is
  type memory_array is array(15 downto 0) of std_logic_vector(31 downto 0);
  signal memory: memory_array := (others => (others => '0'));
  
  begin
    process(clk)
      begin
        if rising_edge(clk) then
          if mem_write = '1' then
            memory(to_integer(unsigned(address))) <= write_data;
          end if;
        end if;
      end process;
      
      process(mem_read, address, memory)
        begin
        if mem_read = '1' then
          read_data <= memory(to_integer(unsigned(address)));
        end if;
      end process;
    end behavioral;