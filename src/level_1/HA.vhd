library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity HA is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Carry : out STD_LOGIC;
           Sum : out STD_LOGIC);
end HA;

architecture Behavioral of HA is

begin
    Carry <=A AND B;
    Sum <= A XOR B;
end Behavioral;
