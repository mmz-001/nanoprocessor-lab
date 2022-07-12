----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/02/2022 02:53:01 PM
-- Design Name: 
-- Module Name: TB_Decoder_3_to_8 - Behavioral
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

entity TB_Decoder_3_to_8 is
--  Port ( );
end TB_Decoder_3_to_8;

architecture Behavioral of TB_Decoder_3_to_8 is

component Decoder_3_to_8
    Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal I0 : STD_LOGIC_VECTOR (2 downto 0);
signal EN0 : STD_LOGIC;
signal Y0 : STD_LOGIC_VECTOR (7 downto 0);

begin

UUT : Decoder_3_to_8
    Port Map(
        I => I0,
        EN => EN0,
        Y => Y0
    );
    
    process    
    begin   
        -- Enable pin
        EN0 <= '1';
        
        -- Inputs: Index Number
        -- 200193 = 110 000 111 000 000 001
        -- 001
        I0 <= "001";
        wait for 20 ns;
                          
        -- 000
        I0 <= "000";
        wait for 20 ns;
        
        -- 000
        I0 <= "000";
        wait for 20 ns;
        
        -- 111
        I0 <= "111";
        wait for 20 ns;
        
        -- 000
        I0 <= "000";
        wait for 20 ns;
        
        -- 110
        I0 <= "110";
        wait for 20 ns;
        
    end process;
end Behavioral;
