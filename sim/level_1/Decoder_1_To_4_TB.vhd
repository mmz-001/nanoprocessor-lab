library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Decoder_1_To_4_TB is

end Decoder_1_To_4_TB;

architecture Behavioral of Decoder_1_To_4_TB is

component Decoder_1_To_4
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           Z : out STD_LOGIC; 
           O : out STD_LOGIC; 
           N : out STD_LOGIC; 
           I : out STD_LOGIC); 
end component;   
    
signal a : STD_LOGIC_VECTOR (3 downto 0);
signal z,o,n,i : STD_LOGIC;

begin
UUT: Decoder_1_To_4
port map(
    A => a,
    Z => z,
    O => o,
    N => n,
    I => i);

process
begin
a <= "0000";
wait for 100 ns;

a <= "0001"; -- overflow 
wait for 100 ns;

a <= "0010"; -- zero
wait for 100 ns;

a <= "0100"; -- negative 
wait for 100 ns;

a <= "1000"; -- interrupt 
wait for 100 ns;

a <= "1010"; -- interrupt and zero 
wait for 100 ns;

a <= "1100"; -- interrupt and negative
wait for 100 ns;

a <= "1111"; -- WTF state;
wait for 100 ns;

wait;

end process;
end Behavioral;
