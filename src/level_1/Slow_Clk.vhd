library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Slow_Clk is
    Port ( D : in STD_LOGIC;
           Q : out STD_LOGIC);
end Slow_Clk;

architecture Behavioral of Slow_Clk is

signal Count : integer := 1;
signal Clk_Status : STD_LOGIC := '0';

begin
    process (D) begin
        if (rising_edge(D)) then
            Count <= Count + 1;
            if (Count = 100000000) then -- Count 100000000 cycles to keep clock cycle to 2 seconds
                Clk_Status <= not Clk_Status;
                Q <= Clk_Status;
                Count <= 1;
            end if;
        end if;
    end process;

end Behavioral;
