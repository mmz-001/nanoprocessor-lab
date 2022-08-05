library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Slow_Clk_TB is
end Slow_Clk_TB;

architecture Behavioral of Slow_Clk_TB is
    component Slow_Clk
        Port ( Clk_In : in STD_LOGIC;
        Clk_Out : out STD_LOGIC);
    end component;

    signal Clk_In, Clk_Out : STD_LOGIC := '0';

begin
    uut: Slow_Clk
        Port map (
            Clk_In => Clk_In,
            Clk_Out => Clk_Out
        );
    
    process begin
        Clk_In <= NOT (Clk_In);
        wait for 20 ns;
    end process;
end Behavioral;
