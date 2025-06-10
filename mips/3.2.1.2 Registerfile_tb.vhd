library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Registerfile_tb is
end Registerfile_tb;

architecture behavior of Registerfile_tb is
    signal clk: std_logic := '0';
    signal reset: std_logic := '0';
    signal read_reg1: std_logic_vector(4 downto 0);
    signal read_reg2: std_logic_vector(4 downto 0);
    signal write_reg: std_logic_vector(4 downto 0);
    signal write_data: std_logic_vector(31 downto 0);
    signal write_enable: std_logic;
    signal read_data1: std_logic_vector(31 downto 0);
    signal read_data2: std_logic_vector(31 downto 0);
    
    constant clk_period: time := 10 ns;
    
    begin
      uut: entity work.Registerfile port map(
        clk => clk,
        reset => reset,
        read_reg1 => read_reg1,
        read_reg2 => read_reg2,
        write_reg => write_reg,
        write_data => write_data,
        write_enable => write_enable,
        read_data1 => read_data1,
        read_data2 => read_data2);
        
        clk <= not clk after clk_period/2;
        
        process
          begin
            --Reset
            reset <= '1';
            wait for clk_period;
            reset <= '0';
            
            -- 6 -> $4
            write_enable <= '1';
            write_reg <= "00100";
            write_data <= std_logic_vector(to_signed(6,32));
            wait for clk_period;
            
            -- 9 -> $5
            write_reg <= "00101";
            write_data <= std_logic_vector(to_signed(9,32));
            wait for clk_period;
            
            -- 3 -> $6
            write_reg <= "00110";
            write_data <= std_logic_vector(to_signed(3,32));
            wait for clk_period;
            
            write_enable <= '0';
            read_reg1 <= "00100"; --$4
            read_reg2 <= "00101"; --$5
            wait for clk_period;
            std.env.stop;
                        
            wait;
          end process;
        end behavior;