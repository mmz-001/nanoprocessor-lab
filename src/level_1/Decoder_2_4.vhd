library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Decoder_2_4 is
    Port ( D : in STD_LOGIC_VECTOR (1 downto 0);
           En : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end Decoder_2_4;

architecture Behavioral of Decoder_2_4 is
    
begin
        Q(0)<= En AND NOT D(1) AND NOT D(0);
        Q(1)<= En AND NOT D(1) AND D(0);
        Q(2)<= En AND D(1) AND NOT D(0);
        Q(3)<= En And D(1) AND D(0);
end Behavioral;
