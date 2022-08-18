library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity SPU_8_TB is
end SPU_8_TB;

architecture Behavioral of SPU_8_TB is
    component SPU_8
        Port ( I : in STD_LOGIC_VECTOR (7 downto 0);
        Flags : in STD_LOGIC_VECTOR (3 downto 0);
        Clk : in STD_LOGIC;
        Seven_Seg_Out_L : out STD_LOGIC_VECTOR (6 downto 0);
        Anode_Out_L : out STD_LOGIC_VECTOR (3 downto 0));
    end component;

    signal Clk : STD_LOGIC := '0';
    signal Flags, Anode_Out_L : STD_LOGIC_VECTOR(3 downto 0);
    signal Seven_Seg_Out_L : STD_LOGIC_VECTOR(6 downto 0);
    signal I : STD_LOGIC_VECTOR(7 downto 0);
    
begin
    UUT : SPU_8
    Port Map (
        Clk => Clk,
        Flags => Flags,
        Anode_Out_L => Anode_Out_L,
        I => I,
        Seven_Seg_Out_L => Seven_Seg_Out_L
    );

    process
    begin
        Clk <= NOT Clk;   
        wait for 20 ns;     
    end process;

    process
    begin
        Flags <= "0000";
        I <= "00000010";  -- 2
        wait for 500 ns;

        I <= "00010000"; -- 16
        wait for 500 ns;

        I <= "11111111"; -- -1
        wait for 500 ns;

        I <= "01111111"; -- 127
        wait;
    end process;
end Behavioral;