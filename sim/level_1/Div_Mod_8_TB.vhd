library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Div_Mod_8_TB is

end Div_Mod_8_TB;

architecture Behavioral of Div_Mod_8_TB is
component Div_Mod_8
    Port (A : in STD_LOGIC_VECTOR (7 downto 0);
    B : in STD_LOGIC_VECTOR (7 downto 0);
    Div_Sel : in STD_LOGIC;
    Mod_Sel : in STD_LOGIC;
    Div_Out : out STD_LOGIC_VECTOR (7 downto 0);
    Mod_Out : out STD_LOGIC_VECTOR (7 downto 0);
    Flags : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal A, B, Div_Out, Mod_Out : STD_LOGIC_VECTOR (7 downto 0);
signal Flags : STD_LOGIC_VECTOR (3 downto 0);
signal Div_Sel, Mod_Sel : STD_LOGIC;

begin
    UUT : Div_Mod_8 
    port map(
        A => A,
        B => B,
        Div_Sel => Div_Sel,
        Mod_Sel => Mod_Sel,
        Div_Out => Div_Out,
        Mod_Out => Mod_Out,
        Flags => Flags);

    process
    begin

        Mod_Sel <= '1';
        Div_Sel <= '0';

        A <= "00001100"; -- 12
        B <= "00000100"; -- 4
        wait for 50 ns;

        A <= "00000101"; -- 5
        B <= "00000011"; -- 3
        wait for 50 ns;

        -- Mod by zero interrupt
        A <= "00000010"; -- 2
        B <= "00000000"; -- 0
        wait for 50 ns;

        Mod_Sel <= '0';
        Div_Sel <= '1';

        A <= "00101010"; -- 42
        B <= "00000111"; -- 7
        wait for 50 ns;

        A <= "00000111"; -- 7
        B <= "00000101"; -- 5
        wait for 50 ns;

        A <= "00000111"; -- 7 
        B <= "11111011"; -- -5
        wait for 50 ns;

        A <= "00110011"; -- 51
        B <= "00001010"; -- 10
        wait for 50 ns;

        -- Div by zero interrupt
        A <= "00110011"; -- 51
        B <= "00000000"; -- 0
        wait for 50 ns;

        Div_Sel <= '0';
        Mod_Sel <= '0';
        wait for 50 ns;

    end process;

end Behavioral;