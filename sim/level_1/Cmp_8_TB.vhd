library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Cmp_8_TB is

end Cmp_8_TB;

architecture Behavioral of Cmp_8_TB is
component Cmp_8
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           Cmp_Sel : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (7 downto 0);
           Flags : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal A, B, Q : STD_LOGIC_VECTOR (7 downto 0);
signal Flags : STD_LOGIC_VECTOR (3 downto 0);
signal Cmp_Sel : STD_LOGIC;

begin
UUT : Cmp_8 
    port map(
        A => A,
        B => B,
        Cmp_Sel => Cmp_Sel,
        Q => Q,
        Flags => Flags
    );
process
begin
    A <= "00000001";
    B <= "00000001";
    Cmp_Sel <= '1';
    wait for 20 ns;

    A <= "00000010";
    B <= "00000001";
    Cmp_Sel <= '1';
    wait for 20 ns;

    A <= "00000001";
    B <= "00000010";
    Cmp_Sel <= '1';
    wait for 20 ns;

    A <= "00000001";
    B <= "00000001";
    Cmp_Sel <= '0';
    wait for 20 ns;

    A <= "00000001";
    B <= "00000010";
    Cmp_Sel <= '0';
    wait for 20 ns;

end process;

end Behavioral;