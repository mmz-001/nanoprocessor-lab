----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/12/2022 12:05:50 PM
-- Design Name: 
-- Module Name: TB_NanoProcessor - Behavioral
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

entity TB_NanoProcessor is
--  Port ( );
end TB_NanoProcessor;

architecture Behavioral of TB_NanoProcessor is

component NanoProcessor
Port ( Clk : in STD_LOGIC;
       Reset, EN : in STD_LOGIC;
       Led_sum : out STD_LOGIC_VECTOR (3 downto 0);
       Led_zero : out STD_LOGIC;
       Led_carry : out STD_LOGIC);
end component;

signal En, Clk : STD_LOGIC := '1';
signal Reset : STD_LOGIC;
signal zero, carry : STD_LOGIC;
signal sum : STD_LOGIC_VECTOR (3 downto 0);
 
begin

UUT : NanoProcessor
PORT MAP(
    Clk => Clk,
    Reset => Reset, En => En,
    Led_zero => zero,
    Led_carry => carry,
    Led_sum => sum
);


process
begin
    Clk <= Not(Clk);
    wait for 20 ns;
end process;

process
begin
    Reset <='1';
    wait for 100 ns;
    Reset <= '0';
    wait;
end process;

end Behavioral;
