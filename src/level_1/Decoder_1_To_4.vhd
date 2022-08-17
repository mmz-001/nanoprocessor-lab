library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Decoder_1_To_4 is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           Z : out STD_LOGIC; -- Zero 
           O : out STD_LOGIC; -- Overflow 
           N : out STD_LOGIC; -- Negative 
           I : out STD_LOGIC); -- Interrupt 
end Decoder_1_To_4;

architecture Behavioral of Decoder_1_To_4 is

begin

O <= A(0);
Z <= A(1);
N <= A(2);
I <= A(3);

end Behavioral;
