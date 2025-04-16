-- A half-adder
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;

entity ha is port (
  A, B : in bit;
  S,C : out bit);
end ha;

architecture dataflow of ha is
begin
  S <= A xor B;
  C <= A and B;
end dataflow;