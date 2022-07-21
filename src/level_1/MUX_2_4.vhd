
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX_2_4 is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Sel : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end MUX_2_4;

architecture Behavioral of MUX_2_4 is

begin

with Sel select Q <=
    A when '0', -- immediate value
    B when '1',
    (others => 'U') when others;   

end Behavioral;
