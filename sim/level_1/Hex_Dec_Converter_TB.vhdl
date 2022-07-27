library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Hex_Dec_Converter_TB is
end Hex_Dec_Converter_TB;

architecture Behavioral of Hex_Dec_Converter_TB is
    component Hex_Dec_Converter
        Port( D : in STD_LOGIC_VECTOR (7 downto 0);
        Sign, Ones, Tens, Hundreds : out STD_LOGIC_VECTOR (3 downto 0));
    end component;

signal D : STD_LOGIC_VECTOR (7 downto 0);
signal Sign, Hundreds, Tens, Ones : STD_LOGIC_VECTOR (3 downto 0);

begin
    UUT : Hex_Dec_Converter
        Port Map (
            D => D,
            Sign => Sign,
            Ones => Ones,
            Tens => Tens,
            Hundreds => Hundreds
        );

    process
    begin
        -- Dec 0
        D <= "00000000";
        wait for 120 ns;

        -- Dec -1
        D <= "11111111";
        wait for 120 ns;

        -- Dec 86, Hex 56
        D <= "01010110";
        wait for 120 ns;

        -- Dec 127, Hex 7F
        D <= "01111111";
        wait for 120 ns;

        -- Dec -128
        D <= "10000000";
        wait;
    end process;
end Behavioral;