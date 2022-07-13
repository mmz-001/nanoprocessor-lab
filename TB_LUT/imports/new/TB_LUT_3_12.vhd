----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/12/2022 09:12:52 PM
-- Design Name: 
-- Module Name: TB_LUT_3_12 - Behavioral
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

entity TB_LUT_3_12 is
--  Port ( );
end TB_LUT_3_12;

architecture Behavioral of TB_LUT_3_12 is
component LUT_3_12
    Port ( address : in STD_LOGIC_VECTOR (2 downto 0);
       D_out : out STD_LOGIC_VECTOR (11 downto 0));
end component;

signal address : STD_LOGIC_VECTOR (2 downto 0);
signal D_out : STD_LOGIC_VECTOR (11 downto 0);

begin

UUT : LUT_3_12
PORT MAP(
    address=>address,
    D_out => D_out
);

process
begin
    address <= "000";
    wait for 200 ns;
    
    address <= "001";
    wait for 200 ns;
    
    address <= "010";
    wait for 200 ns;
    
    address <= "100";
    wait for 200 ns;
    

end process;

end Behavioral;
