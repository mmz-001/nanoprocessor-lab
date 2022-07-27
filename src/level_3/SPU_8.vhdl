library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity SPU_8 is
    Port ( I : in STD_LOGIC_VECTOR (7 downto 0);
           Flags : in STD_LOGIC_VECTOR (3 downto 0);
           Clk : in STD_LOGIC;
           Seven_Seg_Out_L : out STD_LOGIC_VECTOR (6 downto 0);
           Anode_Out_L : out STD_LOGIC_VECTOR (3 downto 0));
end SPU_8;

architecture Behavioral of SPU_8 is

    component Hex_Dec_Converter
        Port( D : in STD_LOGIC_VECTOR (7 downto 0);
        Sign, Ones, Tens, Hundreds : out STD_LOGIC_VECTOR (3 downto 0));
    end component;

    component Seven_Seg_Slow_Clk
        Port ( Clk_In : in STD_LOGIC;
        Clk_Out : out STD_LOGIC);
    end component;

    component SGA_8
        Port( Clk : in STD_LOGIC;
        Sign, Hundreds, Tens, Ones : in STD_LOGIC_VECTOR(3 downto 0);
        Anode_Out_L : out STD_LOGIC_VECTOR(3 downto 0);
        Seven_Seg_Out_L : out STD_LOGIC_VECTOR(6 downto 0));
    end component;


    signal Clk_Slow : STD_LOGIC;
    signal Sign, Hundreds, Tens, Ones : STD_LOGIC_VECTOR(3 downto 0);
    
begin
    Seven_Seg_Slow_Clk_0 : Seven_Seg_Slow_Clk
    Port Map (
        Clk_In => Clk,
        Clk_Out => Clk_Slow
    );

    Hex_Dec_Converter_0 : Hex_Dec_Converter
    Port Map (
        D => I,
        Sign => Sign,
        Ones => Ones,
        Tens => Tens,
        Hundreds => Hundreds
    );

    SGA_8_0 : SGA_8
    Port Map (
        Clk => Clk,
        Sign => Sign,
        Ones => Ones,
        Tens => Tens,
        Hundreds => Hundreds,
        Seven_Seg_Out_L => Seven_Seg_Out_L,
        Anode_Out_L => Anode_Out_L
    );
end Behavioral;