library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity INC_DEC_8_TB is

end INC_DEC_8_TB;

architecture Behavioral of INC_DEC_8_TB is
component INC_DEC_8
    Port ( INC_Sel : in STD_LOGIC;
           DEC_Sel : in STD_LOGIC;
           A : in STD_LOGIC_VECTOR (7 downto 0);
           INC_Out : out STD_LOGIC_VECTOR (7 downto 0);
           DEC_Out : out STD_LOGIC_VECTOR (7 downto 0);
           FLAG : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal a,inc_out,dec_out : STD_LOGIC_VECTOR (7 downto 0);
signal inc,dec : STD_LOGIC;
signal flg : STD_LOGIC_VECTOR (3 downto 0);

begin
UUT:INC_DEC_8
port map(
    INC_Sel => inc,
    DEC_Sel => dec,
    A => a,
    INC_Out => inc_out,
    DEC_Out => dec_out,
    FLAG => flg);

process
begin

inc <= '0';
dec <= '0';
a <= "00000001";
wait for 100 ns;

inc <= '1';
wait for 100 ns;
inc <= '0';

dec <= '1';
wait for 100 ns;
dec <= '0';

a <= "00000100";

inc <= '1';
wait for 100 ns;
inc <= '0';

dec <= '1';
wait for 100 ns;
dec <= '0';

a <= "11110000";

inc <= '1';
wait for 100 ns;
inc <= '0';

dec <= '1';
wait for 100 ns;
dec <= '0';

a <= "01111111"; -- testing overflow flag (overflow from positive limit)

inc <= '1';
wait for 100 ns;
inc <= '0';

dec <= '1';
wait for 100 ns;
dec <= '0';
wait;

end process;

end Behavioral;
