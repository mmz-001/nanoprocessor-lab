library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Decoder_3_to_8 is
    port ( I : in std_logic_vector (2 downto 0);
           EN : in std_logic;
           Y : out std_logic_vector (7 downto 0));
end Decoder_3_to_8;

architecture Behavioral of Decoder_3_to_8 is
    component Decoder_2_to_4 
    port ( I : in std_logic_vector (1 downto 0);
           EN : in std_logic;
           Y : out std_logic_vector (3 downto 0)
    );
    end component;

    signal I0, I1 : std_logic_vector (1 downto 0);
    signal EN0, EN1: std_logic;
    signal Y0, Y1 : std_logic_vector (3 downto 0);


begin
    Decode_2_to_4_0 : Decoder_2_to_4
    port map (
        I => I0,
        EN => EN0,
        Y => Y0
    );

    Decode_2_to_4_1 : Decoder_2_to_4
    port map (
        I => I1,
        EN => EN1,
        Y => Y1
    );

    EN0 <= not(I(2)) and EN;
    EN1 <= I(2) and EN;
    I0 <= I(1 downto 0);
    I1 <= I(1 downto 0);
    Y(3 downto 0) <= Y0;
    Y(7 downto 4) <= Y1;

end Behavioral;
