library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity LUT_12_8_TB is
end LUT_12_8_TB;

architecture Behavioral of LUT_12_8_TB is

component LUT_12_8
    Port ( D : in STD_LOGIC_VECTOR (2 downto 0);
           I : out STD_LOGIC_VECTOR (11 downto 0));
end component; 

signal D : std_logic_vector (2 downto 0);
signal I : std_logic_vector (11 downto 0);

begin
    UUT : LUT_12_8
    port map(
        D => D,
        I => I);

    process
    begin

        D<= "000";
        wait for 100 ns;
        D<= "001";
        wait for 100 ns;
        D<= "010";
        wait for 100 ns;
        D<= "011";
        wait for 100 ns;
        D<= "100";
        wait for 100 ns;
        D<= "101";
        wait for 100 ns;
        D<= "110";
        wait for 100 ns;
        D<= "111";
        wait;

    end process;
end Behavioral;
