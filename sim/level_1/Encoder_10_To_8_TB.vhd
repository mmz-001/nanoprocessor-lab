library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Encoder_10_To_8_TB is

end Encoder_10_To_8_TB;

architecture Behavioral of Encoder_10_To_8_TB is

component Encoder_10_To_8
    Port ( A : in STD_LOGIC_VECTOR (9 downto 0);                                                 
           Q : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal a : STD_LOGIC_VECTOR (9 downto 0);
signal q : STD_LOGIC_VECTOR (7 downto 0);

begin
UUT : Encoder_10_To_8
port map(
    A => a,
    Q => q);

process
begin
    a <= "0000000000";
    wait for 50 ns;
        
    a <= "0000000001";
    wait for 50 ns;
    
    a <= "0000000010";
    wait for 50 ns;
    
    a <= "0000000100";
    wait for 50 ns;
    
    a <= "0000001000";
    wait for 50 ns;
    
    a <= "0000010000";
    wait for 50 ns;
    
    a <= "0000100000";
    wait for 50 ns;
    
    a <= "0001000000";
    wait for 50 ns;
    
    a <= "0010000000";
    wait for 50 ns;
    
    a <= "0100000000";
    wait for 50 ns;
    
    a <= "1000000000";
    wait for 50 ns;
    wait;
    
end process;

end Behavioral;
