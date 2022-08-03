library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Encoder_10_To_8 is
    Port ( A : in STD_LOGIC_VECTOR (9 downto 0); -- mapped to switches 1 to 10 
                                                 -- representing decimal values 1 to 10 
           Q : out STD_LOGIC_VECTOR (7 downto 0));
end Encoder_10_To_8;

architecture Behavioral of Encoder_10_To_8 is

begin

with A select Q<=
    "00000000" when "0000000000", -- all switches are off 
    "00000001" when "0000000001", -- switch 1 on 
    "00000010" when "0000000010", -- swithc 2 on 
    "00000011" when "0000000100", -- swithc 3 on 
    "00000100" when "0000001000", -- swithc 4 on 
    "00000101" when "0000010000", -- swithc 5 on 
    "00000110" when "0000100000", -- swithc 6 on 
    "00000111" when "0001000000", -- swithc 7 on 
    "00001000" when "0010000000", -- swithc 8 on 
    "00001001" when "0100000000", -- swithc 9 on 
    "00001010" when "1000000000", -- swithc 10 on  
    (others => 'U') when others;

end Behavioral;