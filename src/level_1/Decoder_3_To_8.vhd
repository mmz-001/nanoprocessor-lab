library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Decoder_3_To_8 is
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           Q0 : out STD_LOGIC;
           Q1 : out STD_LOGIC;
           Q2 : out STD_LOGIC;
           Q3 : out STD_LOGIC;
           Q4 : out STD_LOGIC;
           Q5 : out STD_LOGIC;
           Q6 : out STD_LOGIC;
           Q7 : out STD_LOGIC);
end Decoder_3_To_8;

architecture Behavioral of Decoder_3_To_8 is

signal Q : STD_LOGIC_VECTOR (7 downto 0);

begin

with A select Q<=
    "00000001" when "000",
    "00000010" when "001",
    "00000100" when "010",
    "00001000" when "011",
    "00010000" when "100",
    "00100000" when "101",
    "01000000" when "110",
    "10000000" when "111",
    (others => 'U') when others;

Q0 <= Q(0);
Q1 <= Q(1);
Q2 <= Q(2);
Q3 <= Q(3);
Q4 <= Q(4);
Q5 <= Q(5);
Q6 <= Q(6);
Q7 <= Q(7);

end Behavioral;
