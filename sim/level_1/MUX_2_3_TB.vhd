library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX_2_3_TB is
end MUX_2_3_TB;

architecture Behavioral of TB_MUX_2_3_bit is
component MUX_2_3
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           B : in STD_LOGIC_VECTOR (2 downto 0);
           Sel : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (2 downto 0));
           
end component;

signal A : std_logic_vector(2 downto 0);
signal B : std_logic_vector(2 downto 0);
signal Sel : std_logic;
signal Q : std_logic_vector(2 downto 0);

begin
    UUT : MUX_2_3
    port map
        (A => A,
        B => B,
        Sel => Sel,
        Q => Q);
    
    process begin
        A <="111";
        B <="000";
        Sel <='0';
        wait for 100 ns;

        Sel <='1';
        wait for 100 ns;

    end process;

end Behavioral;
