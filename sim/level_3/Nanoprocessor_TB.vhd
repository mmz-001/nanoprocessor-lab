library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Nanoprocessor_TB is
end Nanoprocessor_TB;

architecture Behavioral of Nanoprocessor_TB is

component Nanoprocessor
    port(LED_Out : out STD_LOGIC_VECTOR (3 downto 0);
        Overflow : out STD_LOGIC;
        Zero : out STD_LOGIC;
        Seven_Seg_Out_L : out STD_LOGIC_VECTOR(6 downto 0);   
        Anode_L : out STD_LOGIC_VECTOR (3 downto 0);         
        Clk : in STD_LOGIC;
        Res : in STD_LOGIC);
end component;

signal Clk : STD_LOGIC := '1';
signal Res,Overflow,Zero : STD_LOGIC;
signal LED_Out : STD_LOGIC_VECTOR (3 downto 0);
signal Anode_L : STD_LOGIC_VECTOR (3 downto 0);
signal Seven_Seg_Out_L : STD_LOGIC_VECTOR (6 downto 0);


begin
    UUT : Nanoprocessor
    port map (
        LED_Out => LED_Out,
        Overflow => Overflow, 
        Zero => Zero,
        Seven_Seg_Out_L => Seven_Seg_Out_L,
        Anode_L => Anode_L,
        Clk => Clk,
        Res => Res
        );
        
    process -- process for Clk 
    begin
        Clk <= not Clk;
        wait for 2 ns;
    end process;

    process -- main process 
    begin
        Res <='1';
        wait for 100 ns;
        Res <='0';
        wait;
end process;

end Behavioral;
