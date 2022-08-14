library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity LUT_16_16 is
    Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
           I : out STD_LOGIC_VECTOR (15 downto 0));
end LUT_16_16;

architecture Behavioral of LUT_16_16 is
    type rom_type is array (0 to 15) of std_logic_vector(15 downto 0);
        signal Instruction_ROM : rom_type :=(
           "0010111000000000",-- MOVI R7, 0000
           "0010111000000000",-- MOVI R1, 0011
           "0010111000000000",-- MOVI R2, 0001
           "0010111000000000",-- NEG R2
           "0010111000000000",-- ADD R7, R1
           "0010111000000000",-- ADD R1, R2
           "0010111000000000",-- JZR R1 110
           "0010111000000000",-- JZR R0 100
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
