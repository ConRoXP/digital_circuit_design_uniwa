-- A 4bit adder
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;

ENTITY adder4 IS PORT (
  Cin : IN STD_LOGIC;
  X, Y : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
  S : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
  Cout : OUT STD_LOGIC);
END adder4;

architecture behavioral of adder4 is
begin
  process(X,Y,Cin)
    -- The compiler does not allow value assignment
    -- to an input signal inside the code block.
    -- To solve that, we use a variable.
     variable carry : STD_LOGIC := Cin;
    begin
      carry := Cin;
      for i in 0 to 3 loop
        S(i)<= X(i) xor Y(i) xor carry;
        carry:= (X(i) and Y(i)) or (Y(i) and carry) or (carry and X(i));
      end loop;
      Cout<= carry;
    end process;
  end behavioral;