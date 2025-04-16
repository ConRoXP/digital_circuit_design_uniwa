-- A 4 to 16 Decoder
LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity dec_4to16 is port (
  a: in std_logic_vector( 4 downto 1);
  d: out std_logic_vector(16 downto 1));
end dec_4to16;

architecture dataflow of dec_4to16 is
begin
    d(1) <= '1' when a= "0000" else '0';
    d(2) <= '1' when a= "0001" else '0';
    d(3) <= '1' when a= "0010" else '0';
    d(4) <= '1' when a= "0011" else '0';
    d(5) <= '1' when a= "0100" else '0';
    d(6) <= '1' when a= "0101" else '0';
    d(7) <= '1' when a= "0110" else '0';
    d(8) <= '1' when a= "0111" else '0';
    d(9) <= '1' when a= "1000" else '0';
    d(10)<= '1' when a= "1001" else '0';
    d(11)<= '1' when a= "1010" else '0';
    d(12)<= '1' when a= "1011" else '0';
    d(13)<= '1' when a= "1100" else '0';
    d(14)<= '1' when a= "1101" else '0';
    d(15)<= '1' when a= "1110" else '0';
    d(16)<= '1' when a= "1111" else '0';
end dataflow;