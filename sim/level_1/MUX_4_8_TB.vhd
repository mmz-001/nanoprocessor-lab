library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX_4_8_TB is

end MUX_4_8_TB;

architecture Behavioral of MUX_4_8_TB is

component MUX_4_8
    Port ( A0 : in STD_LOGIC_VECTOR (7 downto 0);
           A1 : in STD_LOGIC_VECTOR (7 downto 0);
           A2 : in STD_LOGIC_VECTOR (7 downto 0);
           A3 : in STD_LOGIC_VECTOR (7 downto 0);
           Select_In : in STD_LOGIC_VECTOR (1 downto 0);
           Q : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal a0,a1,a2,a3,q : STD_LOGIC_VECTOR (7 downto 0);
signal select_in : STD_LOGIC_VECTOR (1 downto 0);

begin
UUT : MUX_4_8
port map
   (A0 => a0,
    A1 => a1,
    A2 => a2,
    A3 => a3,
    Select_In => select_in,
    Q => q);

process begin
    -- setting values for inputs
    a0 <= "00000001";
    a1 <= "00000100";
    a2 <= "00010000";
    a3 <= "01000000";
    
    wait for 100 ns;
    -- selecting output one by one
    select_in <= "00"; 
    wait for 50 ns;
    
    select_in <= "01";
    wait for 50 ns; 
    
    select_in <= "10";
    wait for 50 ns;
    
    select_in <= "11";
    wait for 50 ns;
    
    wait;

end process;
end Behavioral;
