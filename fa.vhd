-- A full-adder
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;

entity fa is port (
  A, B, Cin : in bit;
  S, Cout : out bit);
end fa;

architecture dataflow of fa is
begin
  S<= A xor B xor Cin;
  Cout<= ((A xor B) and Cin) or (A and B);
end dataflow;