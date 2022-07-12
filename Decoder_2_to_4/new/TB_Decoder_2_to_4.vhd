----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/02/2022 02:01:58 PM
-- Design Name: 
-- Module Name: TB_Decoder_2_to_4 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TB_Decoder_2_to_4 is
--  Port ( );
end TB_Decoder_2_to_4;

architecture Behavioral of TB_Decoder_2_to_4 is

component Decoder_2_to_4
    Port ( I : in STD_LOGIC_VECTOR (1 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (3 downto 0));

end component;

signal I0: STD_LOGIC_VECTOR (1 downto 0);
signal EN0: STD_LOGIC;
signal Y0: STD_LOGIC_VECTOR (3 downto 0);


begin

UUT : Decoder_2_to_4
    PORT MAP(
        I => I0,
        EN => EN0,
        Y => Y0);

    process
    begin
        -- EN = 1
        EN0 <= '1';
        
        -- I = 00
        I0 <= "00";
        wait for 20 ns;
        
        I0 <= "01";
        wait for 20 ns;
        
        I0 <= "10";
        wait for 20 ns;
        
        I0 <= "11";
        wait for 20 ns;
        
        wait;
    
    
    end process;

end Behavioral;
