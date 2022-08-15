library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity Decoder_3_To_8_TB is

end Decoder_3_To_8_TB;

architecture Behavioral of Decoder_3_To_8_TB is
component Decoder_3_To_8
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           Q0 : out STD_LOGIC;
           Q1 : out STD_LOGIC;
           Q2 : out STD_LOGIC;
           Q3 : out STD_LOGIC;
           Q4 : out STD_LOGIC;
           Q5 : out STD_LOGIC;
           Q6 : out STD_LOGIC;
           Q7 : out STD_LOGIC);
end component;

signal q0,q1,q2,q3,q4,q5,q6,q7 : STD_LOGIC;
signal a : STD_LOGIC_VECTOR (2 downto 0);

begin
UUT : Decoder_3_To_8
port map(
    A  => a,
    Q0 => q0,
    Q1 => q1,
    Q2 => q2,
    Q3 => q3,
    Q4 => q4,
    Q5 => q5,
    Q6 => q6,
    Q7 => q7);

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
