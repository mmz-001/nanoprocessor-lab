---------------------------------------------------------
-- Converts signed Hex values to decimal values with sign
---------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Hex_Dec_Converter is
    Port( D : in STD_LOGIC_VECTOR (7 downto 0);
          Sign, Ones, Tens, Hundreds : out STD_LOGIC_VECTOR (3 downto 0));
end Hex_Dec_Converter;

architecture Behavioral of Hex_Dec_Converter is
    signal Ones_Val, Tens_Val, Hundreds_Val  : integer;

begin
    process (D)
    begin
        if D(7) = '0' then
            Sign <= "1010"; -- Off
        else
            Sign <= "1011"; -- Neg
        end if;
    end process;
    Ones_Val <= abs(to_integer(signed(D))) mod 10;
    Ones <= STD_LOGIC_VECTOR(to_unsigned(Ones_Val, 4));
    Tens_Val <= (abs(to_integer(signed(D))) mod 100 - Ones_Val) / 10;
    Tens <= STD_LOGIC_VECTOR(to_unsigned(Tens_Val, 4));
    Hundreds_Val <= (abs(to_integer(signed(D))) mod 1000 - Tens_Val * 10  - Ones_Val) / 100;
    Hundreds <= STD_LOGIC_VECTOR(to_unsigned(Hundreds_Val, 4));
end Behavioral;