library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FA is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Carry_In : in STD_LOGIC;
           Sum : out STD_LOGIC;
           Carry_Out : out STD_LOGIC);
end FA;

architecture Behavioral of FA is

component HA
    Port (  A, B : in STD_LOGIC;
            Sum,Carry : out STD_LOGIC);
end component;

signal HA_0_Sum, HA_0_Carry, HA_1_Sum, HA_1_Carry : STD_LOGIC;

begin

    HA_0 : HA
        port map(
        A=>A,
        B=>B,
        Carry=>HA_0_Carry,
        Sum=>HA_0_Sum);
        
    HA_1 : HA
        port map(
        A=>HA_0_Sum,
        B=>Carry_In,
        Sum=>HA_1_Sum,
        Carry=>HA_1_Carry);
        
        
    Sum <= HA_1_Sum;
    Carry_Out<= HA_0_Carry OR HA_1_Carry;
    

end Behavioral;
