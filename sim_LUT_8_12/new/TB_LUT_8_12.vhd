----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/11/2022 08:49:00 PM
-- Design Name: 
-- Module Name: TB_LUT_8_12 - Behavioral
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

entity TB_LUT_8_12 is
--  Port ( );
end TB_LUT_8_12;

architecture Behavioral of TB_LUT_8_12 is

component LUT_8_12
    Port ( M : in STD_LOGIC_VECTOR (2 downto 0);
           I : out STD_LOGIC_VECTOR (11 downto 0));
end component; 

signal m : std_logic_vector (2 downto 0);
signal i : std_logic_vector (11 downto 0);

begin
UUT : LUT_8_12
port map(
    M => m,
    I => i);

process
begin

m<= "000";
wait for 100 ns;
m<= "001";
wait for 100 ns;
m<= "010";
wait for 100 ns;
m<= "011";
wait for 100 ns;
m<= "100";
wait for 100 ns;
m<= "101";
wait for 100 ns;
m<= "110";
wait for 100 ns;
m<= "111";
wait;

end process;
end Behavioral;
