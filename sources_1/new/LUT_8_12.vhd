library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity LUT_8_12 is
    Port ( M : in STD_LOGIC_VECTOR (2 downto 0);
           I : out STD_LOGIC_VECTOR (11 downto 0));
end LUT_8_12;

architecture Behavioral of LUT_8_12 is
    type rom_type is array (0 to 7) of std_logic_vector(11 downto 0);
        signal sevenSegment_ROM : rom_type :=(
            "101110000000",-- MOVI R7, 0000
            "100010000011",-- MOVI R1, 0011
            "100100000001",-- MOVI R2, 0001
            "010100000000",-- NEG R2
            "001110100000",-- ADD R7, R2
            "000010100000",-- ADD R1, R2
            "110010000110",-- JZR R1 110
            "110000000100" -- JZR R0 100
        );  
begin
    data <= sevenSegment_ROM(to_integer(unsigned(address)));
end Behavioral;
