-- A simple 4 to 1 MUX
LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity mux_4to1 is port (
  a: in std_logic_vector(4 downto 1);
  s: in std_logic_vector(2 downto 1);
  d: out std_logic);
end mux_4to1;

architecture dataflow of mux_4to1 is
begin
  process(a,s)
    begin
    -- A switch statement replaces multiple
    -- if-else statements
      case s is
      when "00" => d <= a(1);
      when "01" => d <= a(2);
      when "10" => d <= a(3);
      when "11" => d <= a(4);
      when others => d <= '0';
      end case;
    end process;
  end dataflow;