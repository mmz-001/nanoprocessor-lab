library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUL_8_TB is

end MUL_8_TB;

architecture Behavioral of MUL_8_TB is
component MUL_8
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           Mul_Sel : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (7 downto 0);
           FLAG : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal a,b,q : STD_LOGIC_VECTOR (7 downto 0);
signal flg : STD_LOGIC_VECTOR (3 downto 0);
signal sel : STD_LOGIC;

begin
UUT : MUL_8 
port map(
    A => a,
    B => b,
    Mul_Sel => sel,
    Q => q,
    FLAG => flg);

process
begin

sel <= '1'; -- enabling the multiplication unit

a <= "00000000"; -- 0
b <= "00000000"; -- 0
wait for 100 ns;

a <= "00000001"; -- 1
b <= "11111111"; -- -1
wait for 100 ns;

a <= "00000000"; -- 0
b <= "00000001"; -- 1
wait for 100 ns;

a <= "00000001"; -- 1
b <= "00000001"; -- 1
wait for 100 ns;

a <= "00000111"; -- 7
b <= "00000111"; -- 7
wait for 100 ns;

a <= "00000111"; -- 7
b <= "00000101"; -- 5
wait for 100 ns;

a <= "00000111"; -- 7 
b <= "11111011"; -- -5
wait for 100 ns;

a <= "00110011"; -- 51
b <= "00001010"; -- 10
wait for 100 ns;

sel <= '0'; -- turning off
wait for 100 ns;
sel <= '1'; -- turning on again

wait;
end process;

end Behavioral;