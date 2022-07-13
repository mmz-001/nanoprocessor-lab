----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/07/2022 08:04:32 PM
-- Design Name: 
-- Module Name: TB_MUX_2_way_4_bit - Behavioral
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

entity TB_MUX_2_way_4_bit is
--  Port ( );
end TB_MUX_2_way_4_bit;

architecture Behavioral of TB_MUX_2_way_4_bit is
component MUX_2_way_4_bit

Port ( in_01 : in STD_LOGIC_VECTOR (3 downto 0);
       in_02 : in STD_LOGIC_VECTOR (3 downto 0);
       select_bit : in STD_LOGIC;
       out_bus : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal in1,in2,outbus : std_logic_vector(3 downto 0);
signal sel : std_logic;

begin

UUT: MUX_2_way_4_bit
port map(
    in_01 =>in1,
    in_02 =>in2,
    select_bit => sel,
    out_bus => outbus);

process
begin

in1 <= "1111";
in2 <= "0000";
sel <= '0';
wait for 100 ns;
sel <= '1';
wait for 100 ns;

end process; 

end Behavioral;
