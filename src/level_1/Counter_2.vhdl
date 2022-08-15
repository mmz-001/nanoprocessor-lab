library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Counter_2 is
    Port( Clk : in STD_LOGIC;
          Q : out STD_LOGIC_VECTOR(1 downto 0) := "00");
end Counter_2;

architecture Behavioral of Counter_2 is

    signal Count : integer := 0;

begin
    process (Clk)
    begin
        if (rising_edge(Clk)) then
            Count <= (Count + 1) MOD 4;
            Q <= STD_LOGIC_VECTOR(to_unsigned(Count, Q'length));
        end if;
        
    end process;
end Behavioral;