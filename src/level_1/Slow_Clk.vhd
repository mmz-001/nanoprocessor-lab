library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Slow_Clk is
    Port ( Clk_In : in STD_LOGIC;
           Clk_Out : out STD_LOGIC);
end Slow_Clk;

architecture Behavioral of Slow_Clk is

signal Count : integer := 1;
signal Clk_Status : STD_LOGIC := '0';

begin
    process (Clk_In) begin
        if (rising_edge(Clk_In)) then
            Count <= Count + 1;
            if (Count = 100000000) then -- Count 100000000 cycles to keep clock cycle to 2 seconds
                Clk_Status <= not Clk_Status;
                Clk_Out <= Clk_Status;
                Count <= 1;
            end if;
        end if;
    end process;

end Behavioral;
