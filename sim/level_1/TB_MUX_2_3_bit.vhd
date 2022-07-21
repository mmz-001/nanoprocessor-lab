----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/07/2022 03:46:27 PM
-- Design Name: 
-- Module Name: TB_MUX_2_3_bit - Behavioral
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

entity TB_MUX_2_3_bit is
--  Port ( );
end TB_MUX_2_3_bit;

architecture Behavioral of TB_MUX_2_3_bit is
component MUX_2_way_3_bit
    Port ( adder_in : in STD_LOGIC_VECTOR (2 downto 0);
           jump_in : in STD_LOGIC_VECTOR (2 downto 0);
           Jump_flag : in STD_LOGIC;
           out_bus : out STD_LOGIC_VECTOR (2 downto 0));
           
end component;

signal adin : std_logic_vector(2 downto 0);
signal jin : std_logic_vector(2 downto 0);
signal jflag : std_logic;
signal outbus : std_logic_vector(2 downto 0);

begin

UUT : MUX_2_way_3_bit
port map
    (adder_in => adin,
    jump_in => jin,
    Jump_flag => jflag,
    out_bus => outbus);
    
process 
begin


adin <="111";
jin <="000";
jflag <='0';

wait for 100 ns;

jflag <='1';
wait for 100 ns;


end process;

end Behavioral;
