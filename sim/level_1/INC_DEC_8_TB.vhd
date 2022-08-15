library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Inc_Dec_8_TB is

end Inc_Dec_8_TB;

architecture Behavioral of Inc_Dec_8_TB is
component Inc_Dec_8
    Port ( Inc_Sel : in STD_LOGIC;
           Dec_Sel : in STD_LOGIC;
           A : in STD_LOGIC_VECTOR (7 downto 0);
           Inc_Out : out STD_LOGIC_VECTOR (7 downto 0);
           Dec_Out : out STD_LOGIC_VECTOR (7 downto 0);
           Flag : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal a,Inc_out,Dec_out : STD_LOGIC_VECTOR (7 downto 0);
signal Inc,Dec : STD_LOGIC;
signal flg : STD_LOGIC_VECTOR (3 downto 0);

begin
UUT:Inc_Dec_8
port map(
    Inc_Sel => Inc,
    Dec_Sel => Dec,
    A => a,
    Inc_Out => Inc_out,
    Dec_Out => Dec_out,
    Flag => flg);

process
begin

    Inc <= '0';
    Dec <= '0';
    a <= "00000001";
    wait for 100 ns;

    Inc <= '1';
    wait for 100 ns;
    Inc <= '0';

    Dec <= '1';
    wait for 100 ns;
    Dec <= '0';

    a <= "00000100";

    Inc <= '1';
    wait for 100 ns;
    Inc <= '0';

    Dec <= '1';
    wait for 100 ns;
    Dec <= '0';

    a <= "11110000";

    Inc <= '1';
    wait for 100 ns;
    Inc <= '0';

    Dec <= '1';
    wait for 100 ns;
    Dec <= '0';

    a <= "01111111"; -- testing overflow Flag (overflow from positive limit)

    Inc <= '1';
    wait for 100 ns;
    Inc <= '0';

    Dec <= '1';
    wait for 100 ns;
    Dec <= '0';
    wait;

    end process;

end Behavioral;
