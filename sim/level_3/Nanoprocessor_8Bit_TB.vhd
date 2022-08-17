library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Nanoprocessor_8bit_TB is

end Nanoprocessor_8bit_TB;

architecture Behavioral of Nanoprocessor_8bit_TB is
component Nanoprocessor_8bit
    Port ( Clk : in STD_LOGIC;
           Res : in STD_LOGIC;
           Switches : in STD_LOGIC_VECTOR (9 downto 0);
           Push_Buttons : in STD_LOGIC_VECTOR (7 downto 0);
           R7_LED_Out : out STD_LOGIC_VECTOR (7 downto 0);
           Anode_Out : out STD_LOGIC_VECTOR (3 downto 0);
           Seven_Seg_Out : out STD_LOGIC_VECTOR (6 downto 0);
           Flag_LED_Out : out STD_LOGIC_VECTOR (3 downto 0));
end component;     

signal Res : STD_LOGIC;
signal Clk : STD_LOGIC := '1';
signal Push_Buttons,R7_LED_Out : STD_LOGIC_VECTOR(7 downto 0);
signal Switches : STD_LOGIC_VECTOR (9 downto 0);
signal Anode_Out,Flag_LED_Out : STD_LOGIC_VECTOR (3 downto 0);
signal Seven_Seg_Out : STD_LOGIC_VECTOR (6 downto 0);

begin

UUT : Nanoprocessor_8bit
port map(
    Clk => clk,
    Res => Res,
    Push_Buttons => Push_Buttons,
    R7_LED_Out => R7_LED_Out,
    Switches => Switches,
    Anode_Out => Anode_Out,
    Flag_LED_Out => Flag_LED_Out,
    Seven_Seg_Out => Seven_Seg_Out);
    
process 
begin
Clk <= not Clk;
wait for 5 ns;
end process;

process
begin
Switches <= "1000000000";

Res <= '1';
wait for 100 ns;
Res <= '0';

wait;
end process;

end Behavioral;
