library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RCA_3_TB is
end RCA_3_TB;

architecture Behavioral of RCA_3_TB is
component RCA_3
    Port ( D : in STD_LOGIC_VECTOR (2 downto 0);
           Q : out STD_LOGIC_VECTOR (2 downto 0);
           Carry_Out : out STD_LOGIC);

end component;       

signal D : STD_LOGIC_VECTOR(2 downto 0);
signal Q: STD_LOGIC_VECTOR(2 downto 0);
signal Carry_Out : STD_LOGIC;

begin

    uut : RCA_3
        port map(
        D => D,
        Q => Q,
        Carry_Out => Carry_Out);

    process
        begin

        D <="000";
        wait for 100 ns;
        D <="101";
        wait for 100 ns;
        D <="111";
        wait for 100 ns;

    end process;

end Behavioral;
