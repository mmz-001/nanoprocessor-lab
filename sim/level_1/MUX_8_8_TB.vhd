library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX_8_8_TB is

end MUX_8_8_TB;

architecture Behavioral of MUX_8_8_TB is

component MUX_8_8
    Port ( A0 : in STD_LOGIC_VECTOR (7 downto 0);
           A1 : in STD_LOGIC_VECTOR (7 downto 0);
           A2 : in STD_LOGIC_VECTOR (7 downto 0);
           A3 : in STD_LOGIC_VECTOR (7 downto 0);
           A4 : in STD_LOGIC_VECTOR (7 downto 0);
           A5 : in STD_LOGIC_VECTOR (7 downto 0);
           A6 : in STD_LOGIC_VECTOR (7 downto 0);
           A7 : in STD_LOGIC_VECTOR (7 downto 0);
           Q : out STD_LOGIC_VECTOR (7 downto 0);
           Select_In : in STD_LOGIC_VECTOR (2 downto 0));
end component;

signal a0,a1,a2,a3,a4,a5,a6,a7,q : STD_LOGIC_VECTOR (7 downto 0);
signal select_in : STD_LOGIC_VECTOR (2 downto 0);

begin
UUT : MUX_8_8 
port map
    ( A0 => a0,
     A1 => a1,
     A2 => a2,
     A3 => a3,
     A4 => a4,
     A5 => a5,
     A6 => a6,
     A7 => a7,
     Q => q,
     Select_In => select_in);
     
process begin
    -- setting values for inputs
    a0 <= "00000001";
    a1 <= "00000010";
    a2 <= "00000100";
    a3 <= "00001000";
    a4 <= "00010000";
    a5 <= "00100000";
    a6 <= "01000000";
    a7 <= "10000000";
    
    wait for 100 ns;
    -- selecting output one by one
    select_in <= "000"; 
    wait for 50 ns;
    
    select_in <= "001";
    wait for 50 ns; 
    
    select_in <= "010";
    wait for 50 ns;
    
    select_in <= "011";
    wait for 50 ns;
    
    select_in <= "100";
    wait for 50 ns;
    
    select_in <= "101";
    wait for 50 ns;
    
    select_in <= "110";
    wait for 50 ns;
    
    select_in <= "111";
    wait for 50 ns;
    
    wait;

end process;

end Behavioral;
