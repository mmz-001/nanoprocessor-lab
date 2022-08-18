library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SGA_8_TB is
end SGA_8_TB;

architecture Behavioral of SGA_8_TB is
    component SGA_8 
        Port( Clk : in STD_LOGIC;
        Sign, Hundreds, Tens, Ones : in STD_LOGIC_VECTOR(3 downto 0);
        Anode_Out_L : out STD_LOGIC_VECTOR(3 downto 0);
        Seven_Seg_Out_L : out STD_LOGIC_VECTOR(6 downto 0));
    end component;

    signal Clk : STD_LOGIC := '0';
    signal Sign, Hundreds, Tens, Ones, Anode_Out_L : STD_LOGIC_VECTOR(3 downto 0);
    signal Seven_Seg_Out_L : STD_LOGIC_VECTOR(6 downto 0);
begin
    uut : SGA_8
        port map (
            Clk => Clk,
            Sign => Sign,
            Hundreds => Hundreds,
            Tens => Tens,
            Ones => Ones,
            Anode_Out_L => Anode_Out_L,
            Seven_Seg_Out_L => Seven_Seg_Out_L
        );

    process
    begin
        Clk <= NOT Clk;
        wait for 20 ns;
    end process;

    process
    begin
        Sign <= "1010";
        Hundreds <= "1000";
        Tens <= "0100";
        Ones <= "0010";
        wait for 200 ns;

        Sign <= "1011";
        Hundreds <= "1001";
        Tens <= "0000";
        Ones <= "0101";
        wait for 200 ns;
    
    end process;
end Behavioral;
