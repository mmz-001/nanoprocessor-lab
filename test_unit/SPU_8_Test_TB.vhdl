library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SPU_8_Test_TB is
end SPU_8_Test_TB;

architecture Behavioral of SPU_8_Test_TB is
    component SPU_8_Test
        Port (Clk : in STD_LOGIC;
            Seven_Seg_Out_L : out STD_LOGIC_VECTOR (6 downto 0);
            Anode_Out_L : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    signal Clk : STD_LOGIC := '0';
    signal Seven_Seg_Out_L : STD_LOGIC_VECTOR (6 downto 0);
    signal Anode_Out_L : STD_LOGIC_VECTOR (3 downto 0);

begin
    uut : SPU_8_Test
    Port Map (
        Clk => Clk,
        Seven_Seg_Out_L => Seven_Seg_Out_L,
        Anode_Out_L => Anode_Out_L
    );

    process
    begin
        Clk <= NOT Clk;
        wait for 20 ns;
    end process;
end Behavioral;