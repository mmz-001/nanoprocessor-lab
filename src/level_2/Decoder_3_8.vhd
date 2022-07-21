library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Decoder_3_8 is
    Port ( D : in STD_LOGIC_VECTOR (2 downto 0);
           En : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (7 downto 0));
end Decoder_3_8;

architecture Behavioral of Decoder_3_8 is
    component Decoder_2_4
        port ( D : in STD_LOGIC_VECTOR (1 downto 0);
               En : in STD_LOGIC;
               Q : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    signal D0,D1 : STD_LOGIC_VECTOR(1 downto 0);
    signal Q0,Q1 : STD_LOGIC_VECTOR(3 downto 0);
    signal En_0,En_1,D2 : STD_LOGIC;
    
begin

    Decoder_2_4_0 : Decoder_2_4
    port map(
        D=>D0,
        En => En_0,
        Q=>Q0);
        
    Decoder_2_4_1 : Decoder_2_4
    port map(
        D=>D1,
        En => En_1,
        Q => Q1);
        
    En_0 <= not(D(2)) and En; -- this is the En for the 3 to 8
    En_1 <= D(2) and En;
    
    D0 <= D(1 downto 0);
    D1 <= D(1 downto 0);
    D2 <= D(2);
    Q(3 downto 0) <= Q0;
    Q(7 downto 4) <= Q1;

end Behavioral;
