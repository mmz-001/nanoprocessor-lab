library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Reg_8_TB is

end Reg_8_TB;
    
architecture Behavioral of Reg_8_TB is

component Reg_8

    Port ( Clk : in STD_LOGIC;
           Res : in STD_LOGIC;
           D : in STD_LOGIC_VECTOR (7 downto 0);
           En : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (7 downto 0));

end component;           

signal clk : STD_LOGIC := '1';
signal res,en : STD_LOGIC;
signal d,q : STD_LOGIC_VECTOR (7 downto 0);

begin
UUT : Reg_8 
    port map 
    (Clk => clk,
    Res => res,
    D => d,
    En => en,
    Q => q);

process begin -- process for clock
    clk <= NOT (clk);
    wait for 10 ns;
end process;

process begin
    res <= '1'; -- reseting 
    wait for 30 ns;
    res <= '0';
    
    d <= "10101010"; -- sending data
    wait for 30 ns;
    
    en <= '1'; -- enabling the register 
    wait for 30 ns;
    
end process;

end Behavioral;