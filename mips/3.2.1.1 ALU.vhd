library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

entity ALU is port(
  ALUin1: in std_logic_vector(31 downto 0);
  ALUin2: in std_logic_vector(31 downto 0);
  ALUctrl: in std_logic_vector(3 downto 0);
  ALUresult: out std_logic_vector(31 downto 0);
  zero: out std_logic);
end ALU;

architecture behavioral of ALU is
signal result: std_logic_vector(31 downto 0);
begin
  process(ALUin1, ALUin2, ALUctrl)
    begin
    case(ALUctrl) is
      when "0000" => result <= ALUin1 AND ALUin2;
      when "0001" => result <= ALUin1 OR ALUin2;
      when "0010" => result <= std_logic_vector(signed(ALUin1) + signed(ALUin2));
      when "0110" => result <= std_logic_vector(signed(ALUin1) - signed(ALUin2));
      when others => result <= (others => '0');
    end case;
  end process;
zero <= '1' when result = x"00000000" else '0';
ALUresult <= result;
end behavioral;