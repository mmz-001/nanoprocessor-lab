library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity LUT_Dec_16_7 is
    Port ( I : in STD_LOGIC_VECTOR (3 downto 0);
           D : out STD_LOGIC_VECTOR (6 downto 0));
end LUT_Dec_16_7;

architecture Behavioral of LUT_Dec_16_7 is
    type rom_type is array (0 to 15) of STD_LOGIC_VECTOR(6 downto 0);
        signal sevenSegment_ROM : rom_type :=(
            "1000000",-- 0
            "1111001",-- 1
            "0100100",-- 2
            "0110000",-- 3
            "0011001",-- 4
            "0010010",-- 5
            "0000010",-- 6
            "1111000",-- 7
            "0000000",-- 8
            "0010000",-- 9
            "1111111",-- (off)
            "0111111",-- - (Minus)
            "0000110",-- E
            "0101111",-- r
            "1100011",-- v
            "0001110" -- f
        );  
begin
    D <= sevenSegment_ROM(to_integer(unsigned(I)));
end Behavioral;
