----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/02/2022 03:34:55 PM
-- Design Name: 
-- Module Name: TB_Mux_8_to_1 - Behavioral
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

entity TB_Mux_8_to_1 is
--  Port ( );
end TB_Mux_8_to_1;

architecture Behavioral of TB_Mux_8_to_1 is

component Mux_8_to_1_4bit
    Port ( I0, I1, I2, I3, I4, I5, I6, I7 : in STD_LOGIC_VECTOR (3 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (3 downto 0);
           S : in STD_LOGIC_VECTOR (2 downto 0));
end component;

signal I0, I1, I2, I3, I4, I5, I6, I7 : STD_LOGIC_VECTOR (3 downto 0);
signal EN0: STD_LOGIC;
signal Y : STD_LOGIC_VECTOR (3 downto 0);
signal S0 : STD_LOGIC_VECTOR (2 downto 0);
 
begin

UUT : Mux_8_to_1_4bit
    Port Map(
        I0 => I0, I1 => I1, I2 => I2, I3 => I3, I4 => I4, I5 => I5, I6 => I6, I7 => I7, 
        EN => EN0,
        Y => Y,
        S => S0
    );

    process
    begin
    
        -- Enable
        EN0 <= '1';
        -- Set Input lines
        I0 <= "0000";
        I1 <= "0001";
        I2 <= "0010";
        I3 <= "0011";
        I4 <= "0100";
        I5 <= "0101";
        I6 <= "0110";
        I7 <= "0111";

        
        
        -- Inputs: Index Number
        -- 200193 = 110 000 111 000 000 001
        -- 000
        S0 <= "000";
        wait for 20 ns;
                                  
        -- 001
        S0 <= "001";
        wait for 20 ns;
                
        -- 010
        S0 <= "010";
        wait for 20 ns;
                
        -- 011
        S0 <= "011";
        wait for 20 ns;
                
        -- 100
        S0 <= "100";
        wait for 20 ns;
                
        -- 101
        S0 <= "101";
        wait for 20 ns;
        
        -- 110
        S0 <= "110";
        wait for 20 ns;        
        
        
        -- 111
        S0 <= "111";
        wait for 20 ns;
        --
    end process;

end Behavioral;
