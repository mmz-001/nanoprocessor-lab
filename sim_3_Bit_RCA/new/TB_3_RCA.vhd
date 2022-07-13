----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/07/2022 03:03:02 PM
-- Design Name: 
-- Module Name: TB_3_RCA - Behavioral
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

entity TB_3_RCA is
--  Port ( );
end TB_3_RCA;

architecture Behavioral of TB_3_RCA is
component RCA_3
    Port ( PC_in : in STD_LOGIC_VECTOR (2 downto 0);
           PC_out : out STD_LOGIC_VECTOR (2 downto 0);
           c_out : out std_logic);

end component;       

signal pcin : std_logic_vector(2 downto 0);
signal pcout: std_logic_vector(2 downto 0);
signal cout : std_logic;

begin

uut : RCA_3
    port map(
    pc_in => pcin,
    pc_out => pcout,
    c_out => cout);

process
begin

pcin <="000";
wait for 100 ns;
pcin <="101";
wait for 100 ns;
pcin <="111";
wait for 100 ns;

end process;

end Behavioral;
