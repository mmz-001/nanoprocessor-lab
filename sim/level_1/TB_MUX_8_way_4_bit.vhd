----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/07/2022 08:31:54 PM
-- Design Name: 
-- Module Name: TB_MUX_8_way_4_bit - Behavioral
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

entity TB_MUX_8_way_4_bit is
--  Port ( );
end TB_MUX_8_way_4_bit;

architecture Behavioral of TB_MUX_8_way_4_bit is
component MUX_8_way_4_bit
Port ( A0 : in STD_LOGIC_VECTOR (3 downto 0);
           A1 : in STD_LOGIC_VECTOR (3 downto 0);
           A2 : in STD_LOGIC_VECTOR (3 downto 0);
           A3 : in STD_LOGIC_VECTOR (3 downto 0);
           A4 : in STD_LOGIC_VECTOR (3 downto 0);
           A5 : in STD_LOGIC_VECTOR (3 downto 0);
           A6 : in STD_LOGIC_VECTOR (3 downto 0);
           A7 : in STD_LOGIC_VECTOR (3 downto 0);
           sel_bus : in STD_LOGIC_VECTOR (2 downto 0);
           out_bus : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,outbus : std_logic_vector (3 downto 0);
signal selbus : std_logic_vector (2 downto 0);

begin
UUT : MUX_8_way_4_bit

port map(
    A0 =>A_0,
    A1 =>A_1,
    A2 =>A_2,
    A3 =>A_3,
    A4 =>A_4,
    A5 =>A_5,
    A6 =>A_6,
    A7 =>A_7,
    sel_bus => selbus,
    out_bus => outbus
    );

process
begin

A_0<="1010";
A_1<="0101";
A_2<="1111";
A_3<="0000";
A_4<="0001";
A_5<="0010";
A_6<="0100";
A_7<="1000";

selbus<="000";
wait for 100 ns;

selbus<="001";
wait for 100 ns;

selbus<="010";
wait for 100 ns;

selbus<="011";
wait for 100 ns;

selbus<="100";
wait for 100 ns;

selbus<="101";
wait for 100 ns;

selbus<="110";
wait for 100 ns;

selbus<="111";
wait for 100 ns;

wait;
end process;

end Behavioral;
