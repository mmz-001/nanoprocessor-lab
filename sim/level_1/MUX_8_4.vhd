library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX_8_4_TB is
end MUX_8_4_TB;

architecture Behavioral of MUX_8_4_TB is
component MUX_8_4
    Port ( A0 : in STD_LOGIC_VECTOR (3 downto 0);
           A1 : in STD_LOGIC_VECTOR (3 downto 0);
           A2 : in STD_LOGIC_VECTOR (3 downto 0);
           A3 : in STD_LOGIC_VECTOR (3 downto 0);
           A4 : in STD_LOGIC_VECTOR (3 downto 0);
           A5 : in STD_LOGIC_VECTOR (3 downto 0);
           A6 : in STD_LOGIC_VECTOR (3 downto 0);
           A7 : in STD_LOGIC_VECTOR (3 downto 0);
           Sel : in STD_LOGIC_VECTOR (2 downto 0);
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal A0,A1,A2,A3,A4,A5,A6,A7,Q : STD_LOGIC_VECTOR (3 downto 0);
signal Sel : STD_LOGIC_VECTOR (2 downto 0);

begin
UUT : MUX_8_4

port map(
    A0 =>A0,
    A1 =>A1,
    A2 =>A2,
    A3 =>A3,
    A4 =>A4,
    A5 =>A5,
    A6 =>A6,
    A7 =>A7,
    Sel => Sel,
    Q => Q
    );

    process
    begin
        A0<="1010";
        A1<="0101";
        A2<="1111";
        A3<="0000";
        A4<="0001";
        A5<="0010";
        A6<="0100";
        A7<="1000";

        Sel<="000";
        wait for 100 ns;

        Sel<="001";
        wait for 100 ns;

        Sel<="010";
        wait for 100 ns;

        Sel<="011";
        wait for 100 ns;

        Sel<="100";
        wait for 100 ns;

        Sel<="101";
        wait for 100 ns;

        Sel<="110";
        wait for 100 ns;

        Sel<="111";
        wait for 100 ns;

        wait;
    end process;

end Behavioral;
