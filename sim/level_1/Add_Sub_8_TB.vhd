library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Add_Sub_8_TB is

end Add_Sub_8_TB;

architecture Behavioral of Add_Sub_8_TB is
component Add_Sub_8
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           Add_Sel : in STD_LOGIC;
           Sub_Sel : in STD_LOGIC;
           Add_Out : out STD_LOGIC_VECTOR (7 downto 0);
           Sub_Out : out STD_LOGIC_VECTOR (7 downto 0);
           Flag : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal a,b,add_out,sub_out : STD_LOGIC_VECTOR (7 downto 0);
signal aSel,sSel : STD_LOGIC;
signal flag : STD_LOGIC_VECTOR (3 downto 0);

begin
UUT : Add_Sub_8
port map(
    A => a,
    B => b,
    Add_Sel => aSel,
    Sub_Sel => sSel,
    Add_Out => add_out,
    Sub_Out => sub_out,
    Flag => flag);

process begin

a <= "00000010";
b <= "00000001";
aSel <= '0';
sSel <= '0';
wait for 100 ns;

aSel <= '1';
wait for 100 ns;

aSel <= '0';
sSel <= '1';
wait for 100 ns;

--testing positive overflow
a <= "01111111";
b <= "00000001";
aSel <= '0';
sSel <= '0';
wait for 100 ns;

aSel <= '1';
wait for 100 ns;

aSel <= '0';
sSel <= '1';
wait for 100 ns;

a <= "10000000";
b <= "00000001";
aSel <= '0';
sSel <= '0';
wait for 100 ns;

aSel <= '1';
wait for 100 ns;

aSel <= '0';
sSel <= '1';
wait for 100 ns;
wait;
end process;

end Behavioral;
