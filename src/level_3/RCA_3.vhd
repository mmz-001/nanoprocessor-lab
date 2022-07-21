library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RCA_3 is
    Port ( D : in STD_LOGIC_VECTOR (2 downto 0);
           Q : out STD_LOGIC_VECTOR (2 downto 0);
           Carry_Out : out STD_LOGIC);
           
end RCA_3;

architecture Behavioral of RCA_3 is

component FA
    Port(
        A: in STD_LOGIC;
        B: in STD_LOGIC;
        Carry_In : in STD_LOGIC;
        Sum : out STD_LOGIC;
        Carry_Out : out STD_LOGIC);
end component;

signal FA_0_Carry, FA_1_Carry : STD_LOGIC;

begin

-- Add 1 to input

FA_0 : FA
    port map(
    A => D(0),
    B => '1',
    Carry_In => '0', -- Set ground to '0'
    Sum => Q(0),
    Carry_Out => FA_0_Carry);
    
FA_1 : FA
    port map(
    A => D(1),
    B => '0',
    Carry_In => FA_0_Carry,
    Sum => Q(1),
    Carry_Out => FA_1_Carry);
    
FA_2 : FA
    port map(
    A => D(2),
    B => '0',
    Carry_In => FA_1_Carry,
    Sum => Q(2),
    Carry_Out => Carry_Out);

end Behavioral;
