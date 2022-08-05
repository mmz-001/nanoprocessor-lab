library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Slow_Clk is
    Port ( Clk_In : in STD_LOGIC;
           Clk_Out : out STD_LOGIC :='1');
end Slow_Clk;


architecture Behavioral of Slow_Clk is

signal Count : STD_LOGIC_VECTOR(27 downto 0) := (others => '0');
signal Clk : STD_LOGIC := '0';

-- attribute use_dsp : string;
-- attribute use_dsp of Count : signal is "yes";

begin
    process (Clk_In) begin
        if (rising_edge(Clk_In)) then
            Count <= Count + x"0000001";        
            if (Count = x"0000004") then -- Use 5f5e0ff for running on board
                Count <= x"0000001";
                Clk <= NOT (Clk);
                Clk_Out <= Clk;
            end if;
        end if;
    end process;

end Behavioral;
