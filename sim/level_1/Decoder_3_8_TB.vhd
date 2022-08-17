library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity Decoder_3_8_TB is

end Decoder_3_8_TB;

architecture Behavioral of Decoder_3_8_TB is
component Decoder_3_8
Port (  D : in STD_LOGIC_VECTOR (2 downto 0);
        En : in STD_LOGIC;
        Q : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal q: STD_LOGIC_VECTOR (7 downto 0);
signal a : STD_LOGIC_VECTOR (2 downto 0);
signal En : STD_LOGIC := '1';

begin
UUT : Decoder_3_8
port map(
    D  => a,
    En => En,
    Q => q);

process
begin
a <= "000";
wait for 100 ns;

a <= "001";
wait for 100 ns;

a <= "010";
wait for 100 ns;

a <= "011";
wait for 100 ns;

a <= "100";
wait for 100 ns;

a <= "101";
wait for 100 ns;

a <= "110";
wait for 100 ns;

a <= "111";
wait for 100 ns;
wait;

end process;
end Behavioral;
