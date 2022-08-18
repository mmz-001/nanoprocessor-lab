library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX_4_8 is
    Port ( A0 : in STD_LOGIC_VECTOR (7 downto 0);
           A1 : in STD_LOGIC_VECTOR (7 downto 0);
           A2 : in STD_LOGIC_VECTOR (7 downto 0);
           A3 : in STD_LOGIC_VECTOR (7 downto 0);
           Select_In : in STD_LOGIC_VECTOR (1 downto 0);
           Q : out STD_LOGIC_VECTOR (7 downto 0));
end MUX_4_8;

architecture Behavioral of MUX_4_8 is

begin

with Select_In select Q <=
    A0 when "00",
    A1 when "01",
    A2 when "10",
    A3 when "11",
    (others => 'U') when others; 

end Behavioral;
