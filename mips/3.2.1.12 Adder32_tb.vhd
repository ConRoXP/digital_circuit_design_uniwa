library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Adder32_tb is
end Adder32_tb;

architecture behavior of Adder32_tb is
    signal in0, in1, result: std_logic_vector(31 downto 0);
begin

    uut: entity work.Adder32 port map(
            in0 => in0,
            in1 => in1,
            result => result);

    process
    begin
        in0 <= x"CCCCCCCC";
        in1 <= x"BBBBBBBB";
        wait for 10 ns;

        in0 <= x"BBBBBBBB";
        in1 <= x"55555556";
        wait for 10 ns;

        wait;
    end process;
end behavior;
