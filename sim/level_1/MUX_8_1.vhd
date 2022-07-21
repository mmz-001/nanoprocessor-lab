library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX_8_1_TB is
end MUX_8_1_TB;

architecture Behavioral of MUX_8_1_TB is

component MUX_8_1
Port ( Sel : in STD_LOGIC_VECTOR (2 downto 0);
       En : in STD_LOGIC;
       D : in STD_LOGIC_VECTOR (7 downto 0);
       Q : out STD_LOGIC);
end component;

signal Sel : STD_LOGIC_VECTOR (2 downto 0);
signal En : STD_LOGIC;
signal D :  STD_LOGIC_VECTOR (7 downto 0);
signal Q : STD_LOGIC;


begin
    UUT : MUX_8_1
    port map(
        En => En,
        Sel=>Sel,
        D=>D,
        Q=>Q);
        
    process begin
        En<='1';
        D<="01010101"; -- odd places should give 1 and even places give 0
        Sel<="000";
        
        -- index number : 200189M
        -- binary of index number : 0011 0000 1101 1111 1101
        -- seperated into groups of 3 : 110 000 110 111 111 101
        -- first input : 101
        -- second input : 111
        -- third input : 110 (after ignoring the repeated 111)
        -- fourth input : 000
        
        wait for 50 ns;
        Sel<="101";
        
        wait for 50 ns;
        Sel<="111";
        
        wait for 50 ns;
        Sel<="110";
        
        wait for 50 ns;
        Sel<="000";
        
        wait for 350 ns;
        
        wait for 50 ns;
            Sel<="000"; --0    
        wait for 50 ns;
            Sel<="001"; --1
        wait for 50 ns;
            Sel<="010"; --2
        wait for 50 ns;
            Sel<="011"; --3
        wait for 50 ns;
            Sel<="100"; --4
        wait for 50 ns;
            Sel<="101"; --5
        wait for 50 ns;
            Sel<="110"; --6
        wait for 50 ns;
            Sel<="111"; --7
        wait;
    end process;

end Behavioral;
