library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALUcontrol is port(
funct: in std_logic_vector(5 downto 0);
ALUop: in std_logic_vector(1 downto 0);
ALUcontrol: out std_logic_vector(3 downto 0));
end ALUcontrol;

architecture behavioral of ALUcontrol is
  begin
    process(funct, ALUop)
      begin
        case ALUop is
          --lw, sw, addi
        when "00" => ALUcontrol <= "0010";
          
          --bne
        when "01" => ALUcontrol <= "0110";
          
          --R type
        when "10" =>
          case funct is
          when "100000" => ALUcontrol <= "0010";
          when "100010" => ALUcontrol <= "0110";
          when others => ALUcontrol <= "1111";
          end case;
          
        when others => ALUcontrol <= "1111";
        end case;
      end process;
    end behavioral;