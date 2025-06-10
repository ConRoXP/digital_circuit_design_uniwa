library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Registerfile is port(
clk: in std_logic;
reset: in std_logic;
read_reg1: in std_logic_vector(4 downto 0);
read_reg2: in std_logic_vector(4 downto 0);
write_reg: in std_logic_vector(4 downto 0);
write_data: in std_logic_vector(31 downto 0);
write_enable: in std_logic;
read_data1: out std_logic_vector(31 downto 0);
read_data2: out std_logic_vector(31 downto 0));
end Registerfile;

architecture behavioral of Registerfile is
  type reg_array is array(15 downto 0) of std_logic_vector(31 downto 0);
  signal registers: reg_array := (others => (others => '0'));
  begin

    read_data1 <= registers(to_integer(unsigned(read_reg1)));
    read_data2 <= registers(to_integer(unsigned(read_reg2)));
    
    process(clk, reset)
      begin
        if reset = '1' then
          registers <= (others => (others => '0'));
        elsif rising_edge(clk) then
          if write_enable= '1' then
            registers(to_integer(unsigned(write_reg))) <= write_data;
          end if;
        end if;
      end process;
    end behavioral;