library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity LUT_16_16_TB is
end LUT_16_16_TB;

architecture Behavioral of LUT_16_16_TB is

component LUT_16_16
    Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
           I : out STD_LOGIC_VECTOR (15 downto 0));
end component; 

signal D : std_logic_vector (3 downto 0);
signal I : std_logic_vector (15 downto 0);

begin
    UUT : LUT_16_16
    port map(
        D => D,
        I => I);

    process
    begin

        D<= "0000";
        wait for 100 ns;
        D<= "0001";
        wait for 100 ns;
        D<= "0010";
        wait for 100 ns;
        D<= "0011";
        wait for 100 ns;
        D<= "0100";
        wait for 100 ns;
        D<= "0101";
        wait for 100 ns;
        D<= "0110";
        wait for 100 ns;
        D<= "0111";
        wait;

    end process;
end Behavioral;
