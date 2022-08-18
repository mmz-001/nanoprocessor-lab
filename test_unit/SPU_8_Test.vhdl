library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity SPU_8_Test is
    Port ( Clk : in STD_LOGIC;
           Seven_Seg_Out_L : out STD_LOGIC_VECTOR (6 downto 0);
           Anode_Out_L : out STD_LOGIC_VECTOR (3 downto 0));
end SPU_8_Test;

architecture Behavioral of SPU_8_Test is
    component SPU_8
        Port ( I : in STD_LOGIC_VECTOR (7 downto 0);
        Flags : in STD_LOGIC_VECTOR (3 downto 0);
        Clk : in STD_LOGIC;
        Seven_Seg_Out_L : out STD_LOGIC_VECTOR (6 downto 0);
        Anode_Out_L : out STD_LOGIC_VECTOR (3 downto 0));
    end component;

begin
    SPU_8_0 : SPU_8
    Port Map (
        I => "10000101", -- -123
        Flags => "0000",
        Clk => Clk,
        Seven_Seg_Out_L => Seven_Seg_Out_L,
        Anode_Out_L => Anode_Out_L
    );
end Behavioral;