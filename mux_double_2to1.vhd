-- A simple 2 to 1 MUX
LIBRARY ieee;
USE ieee.std_logic_1164.all;


entity mux_double_2to1 is
port
  (a, b: in std_logic_vector(2 downto 0);
  s: in std_logic;
  d: out std_logic_vector(2 downto 0));
end mux_double_2to1;

architecture dataflow of mux_double_2to1 is
begin
  process(a,b,s)
    begin
      if s= '0' then
        d<= a;
      else
        d<= b;
      end if;
    end process;
  end dataflow;