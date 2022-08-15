library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity LUT_32_16_TB is
end LUT_32_16_TB;

architecture Behavioral of LUT_32_16_TB is

component LUT_32_16
    Port ( D : in STD_LOGIC_VECTOR (4 downto 0);
           I : out STD_LOGIC_VECTOR (15 downto 0));
end component; 

signal D : std_logic_vector (4 downto 0);
signal I : std_logic_vector (15 downto 0);

begin
    UUT : LUT_32_16
    port map(
        D => D,
        I => I);

    process
    begin

        D<= "00000";
        wait for 100 ns;
        D<= "00001";
        wait for 100 ns;
        D<= "00010";
        wait for 100 ns;
        D<= "00011";
        wait for 100 ns;
        D<= "00100";
        wait for 100 ns;
        D<= "00101";
        wait for 100 ns;
        D<= "00110";
        wait for 100 ns;
        D<= "00111";
        wait;

    end process;
end Behavioral;
