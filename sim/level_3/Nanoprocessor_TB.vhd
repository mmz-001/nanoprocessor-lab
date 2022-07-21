library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Nanoprocessor_TB is
end Nanoprocessor_TB;

architecture Behavioral of Nanoprocessor_TB is

component Nanoprocessor
    port(Out_LED : out std_logic_vector (3 downto 0);
        Overflow : out std_logic;
        Zero : out std_logic;
        Clk : in std_logic;
        Res : in std_logic);
end component;

signal Clk : std_logic := '1';
signal Res,Overflow,Zero : std_logic;
signal Out_LED : std_logic_vector (3 downto 0);

begin
    UUT : Nanoprocessor
    port map (
        Out_led => Out_LED,
        Overflow => Overflow, 
        Zero => Zero,
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
