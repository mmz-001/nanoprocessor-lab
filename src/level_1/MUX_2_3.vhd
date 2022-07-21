library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX_2_3 is
    Port ( D : in STD_LOGIC_VECTOR (2 downto 0);
           Jmp_Addr : in STD_LOGIC_VECTOR (2 downto 0);
           Sel : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (2 downto 0));
end MUX_2_3;

architecture Behavioral of MUX_2_3 is

begin
with Sel select Q <=
    D when '0',
    Jmp_Addr when '1',
    (others => 'U') when others;   

end Behavioral;
