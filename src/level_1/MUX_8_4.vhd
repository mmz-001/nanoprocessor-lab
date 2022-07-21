library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX_8_4 is
    Port ( A0 : in STD_LOGIC_VECTOR (3 downto 0);
           A1 : in STD_LOGIC_VECTOR (3 downto 0);
           A2 : in STD_LOGIC_VECTOR (3 downto 0);
           A3 : in STD_LOGIC_VECTOR (3 downto 0);
           A4 : in STD_LOGIC_VECTOR (3 downto 0);
           A5 : in STD_LOGIC_VECTOR (3 downto 0);
           A6 : in STD_LOGIC_VECTOR (3 downto 0);
           A7 : in STD_LOGIC_VECTOR (3 downto 0);
           Sel : in STD_LOGIC_VECTOR (2 downto 0);
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end MUX_8_4;

architecture Behavioral of MUX_8_4 is

begin

with Sel select Q <=
    A0 when "000",
    A1 when "001",
    A2 when "010",
    A3 when "011",
    A4 when "100",
    A5 when "101",
    A6 when "110",
    A7 when "111",
    (others => 'U') when others; 


end Behavioral;
