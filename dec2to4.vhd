-- A 2 to 4 Decoder
LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity dec2to4 is
port (
  a: in std_logic_vector(2 downto 1);
  d: out std_logic_vector(4 downto 1));
end dec2to4;

architecture dataflow of dec2to4 is
begin
  with a select
    d<= "0001" when "00",
        "0010" when "01",
        "0100" when "10",
        "1000" when "11",
        "0000" when others; -- Required for the compiler
end dataflow;