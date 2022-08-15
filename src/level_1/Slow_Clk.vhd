library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Slow_Clk is
    Port ( Clk_In : in STD_LOGIC;
           Clk_Out : out STD_LOGIC :='1');
end Slow_Clk;


architecture Behavioral of Slow_Clk is

--signal Count : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
signal Count : STD_LOGIC_VECTOR(25 downto 0) := (others => '0');

 attribute use_dsp : string;
 attribute use_dsp of Count : signal is "yes";

begin
    process (Clk_In) begin
        if (rising_edge(Clk_In)) then
            Count <= Count + '1';        
        end if;
--        Clk_Out <= Count(3);
      Clk_Out <= Count(25);
    end process;

end Behavioral;
