----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/12/2022 08:40:48 PM
-- Design Name: 
-- Module Name: TB_nanoProcessor - Behavioral
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

entity TB_nanoProcessor is
--  Port ( );
end TB_nanoProcessor;

architecture Behavioral of TB_nanoProcessor is

component Nanoprocessor
    port(Out_LED : out std_logic_vector (3 downto 0);
        overflow : out std_logic;
        zero : out std_logic;
        clock : in std_logic;
        reset : in std_logic);
end component;

signal clk : std_logic := '1';
signal reset,overflow,z : std_logic;
signal out_led : std_logic_vector (3 downto 0);

begin

UUT : Nanoprocessor
port map (
    Out_led => out_led,
    overflow => overflow, 
    zero => z,
    clock => clk,
    reset => reset
    );
    
process -- process for clock 
begin
clk <= not clk;
wait for 20 ns;
end process;

process -- main process 
begin
reset <='1';
wait for 40 ns;
reset <='0';
wait;
end process;

end Behavioral;
