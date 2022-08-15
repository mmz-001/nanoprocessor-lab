library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity LUT_32_16 is
    Port ( D : in STD_LOGIC_VECTOR (4 downto 0);
           I : out STD_LOGIC_VECTOR (15 downto 0));
end LUT_32_16;

architecture Behavioral of LUT_32_16 is
    type rom_type is array (0 to 31) of std_logic_vector(15 downto 0);
        signal Instruction_ROM : rom_type :=(
           "0010111000000000",-- MOVI R7, 0000
           "0010001000000011",-- MOVI R1, 0011
           "0010010000000001",-- MOVI R2, 0001
           "0001010000000000",-- NEG R2
           "0000111001000000",-- ADD R7, R1
           "0000001010000000",-- ADD R1, R2
           "0011001000000110",-- JZR R1 110
           "0011000000000100",-- JZR R0 100
           "0000000000000000",
           "0000000000000000",
           "0000000000000000",
           "0000000000000000",
           "0000000000000000",
           "0000000000000000",
           "0000000000000000",
           "0000000000000000",
           "0000000000000000",
           "0000000000000000",
           "0000000000000000",
           "0000000000000000",
           "0000000000000000",
           "0000000000000000",
           "0000000000000000",
           "0000000000000000", 
           "0000000000000000",
           "0000000000000000",
           "0000000000000000",
           "0000000000000000",
           "0000000000000000",
           "0000000000000000",
           "0000000000000000",
           "0000000000000000"  
        );  
begin
    I <= Instruction_ROM(to_integer(unsigned(D)));
end Behavioral;
