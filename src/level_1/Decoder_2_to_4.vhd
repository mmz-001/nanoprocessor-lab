library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Decoder_2_To_4 is
    Port ( I : in STD_LOGIC_VECTOR (1 downto 0);
           En : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end Decoder_2_To_4;

architecture Behavioral of Decoder_2_To_4 is
    
begin
    process(I)
    begin
        Q(0)<= En AND NOT I(1) AND NOT I(0);
        Q(1)<= En AND NOT I(1) AND I(0);
        Q(2)<= En AND I(1) AND NOT I(0);
        Q(3)<= En And I(1) AND I(0);
    end process;
end Behavioral;
