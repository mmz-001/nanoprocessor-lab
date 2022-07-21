library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX_2_4_TB is
end MUX_2_4_TB;

architecture Behavioral of MUX_2_4_TB is
component MUX_2_4

Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
       B : in STD_LOGIC_VECTOR (3 downto 0);
       Sel : in STD_LOGIC;
       Q : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal A, B, Q : std_logic_vector(3 downto 0);
signal Sel : std_logic;

begin

    UUT: MUX_2_4
    port map(
        A =>A,
        B =>B,
        Sel => Sel,
        Q => Q);

    process
        begin

        A <= "1111";
        B <= "0000";
        Sel <= '0';
        wait for 100 ns;
        Sel <= '1';
        wait for 100 ns;

    end process; 

end Behavioral;
