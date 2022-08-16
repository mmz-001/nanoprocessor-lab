library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Decoder_3_8 is
    Port ( D : in STD_LOGIC_VECTOR (2 downto 0);
           En : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (7 downto 0));
end Decoder_3_8;

architecture Behavioral of Decoder_3_8 is
    signal Q_sel : STD_LOGIC_VECTOR(7 downto 0);

begin

    with D select Q_sel <=
        "00000001" when "000",
        "00000010" when "001",
        "00000100" when "010",
        "00001000" when "011",
        "00010000" when "100",
        "00100000" when "101",
        "01000000" when "110",
        "10000000" when "111",
        (others => 'U') when others;

    with En select Q <=
		Q_sel       when '1',
		"00000000"  when '0',
		(others => 'U') when others;

end Behavioral;
