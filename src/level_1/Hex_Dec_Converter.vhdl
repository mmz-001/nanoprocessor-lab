library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Hex_Dec_Converter is
    Port( I : in STD_LOGIC_VECTOR (7 downto 0);
          Flags : in STD_LOGIC_VECTOR (3 downto 0);
          Q0, Q1, Q2, Q3 : out STD_LOGIC_VECTOR (3 downto 0));
end Hex_Dec_Converter;

architecture Behavioral of Hex_Dec_Converter is

signal ones, tens, hundreds : integer;

begin
    -- FLAGS = overflow, zero, negative, interuppt
    ones <= to_integer(unsigned(I)) mod 10;
    tens <= (to_integer(unsigned(I)) mod 100) - ones;
    hundreds <= (to_integer(unsigned(I)) mod 1000) - (hundreds + ones); 

end Behavioral;