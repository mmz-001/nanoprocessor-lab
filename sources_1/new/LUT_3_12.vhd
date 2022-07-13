----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/11/2022 09:59:18 PM
-- Design Name: 
-- Module Name: LUT_4_12 - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity LUT_3_12 is
    Port ( address : in STD_LOGIC_VECTOR (2 downto 0);
           D_out : out STD_LOGIC_VECTOR (11 downto 0));
end LUT_3_12;

architecture Behavioral of LUT_3_12 is
type ROM is array(0 to 7) of std_logic_vector(11 downto 0);
-- The ROM has hardcoded instructions that are intended to be executed
signal ROM_Sel : ROM := (
    "100010000001", -- MOVI R1 1 = 10 001 000 0001 
    "100100000010", -- MOVI R2 2  = 10 010 000 0010 
    "101110000011", -- MOVI R7 3  = 10 111 000 0011
    "001110100000", -- ADD R7 R2 = 00 111 010 0000 
    "001110010000", -- ADD R7 R1 = 00 111 010 0000
    "110000000101", -- JZR R0 5 = 11 000 0000 101
    "000000000000", -- END = 000000000000
    "000000000000"); -- END = 000000000000
begin

process(address)
begin
    D_out <= ROM_Sel(to_integer(unsigned(address)));
end process;
end Behavioral;
