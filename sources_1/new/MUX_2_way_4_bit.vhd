----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/07/2022 08:02:13 PM
-- Design Name: 
-- Module Name: MUX_2_way_4_bit - Behavioral
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

entity MUX_2_way_4_bit is
    Port ( in_01 : in STD_LOGIC_VECTOR (3 downto 0);
           in_02 : in STD_LOGIC_VECTOR (3 downto 0);
           select_bit : in STD_LOGIC;
           out_bus : out STD_LOGIC_VECTOR (3 downto 0));
end MUX_2_way_4_bit;

architecture Behavioral of MUX_2_way_4_bit is

begin

with select_bit select out_bus <=
    in_01 when '0',
    in_02 when '1',
    (others => 'U') when others;   

end Behavioral;
