library ieee;
use ieee.std_logic_1164.all;

entity shiftn is
  generic(N: integer := 8);
  port (D: in std_logic_vector(N-1 downto 0);
    enable: in std_logic;
    load: in std_logic;
    sin: in std_logic;
    clock: in std_logic;
    Q: out std_logic_vector(N-1 downto 0));
end shiftn;
    
 architecture behavioral of shiftn is
  signal Qt: std_logic_vector(N-1 downto 0);
  begin
    process(clock)
      begin
      if enable= '1' then
        if rising_edge(clock) then
          if load= '1' then
            Qt<= D;
          else
            Qt(0)<= Qt(1);
            Qt(1)<= Qt(2);
            Qt(2)<= Qt(3);
            Qt(3)<= Qt(4);
            Qt(4)<= Qt(5);
            Qt(5)<= Qt(6);
            Qt(6)<= Qt(7);
            Qt(7)<= Sin;
          end if;
        end if;
      end if;
    end process;
    Q<= Qt;
  end behavioral;