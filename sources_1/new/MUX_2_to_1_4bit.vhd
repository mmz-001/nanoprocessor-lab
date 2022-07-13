----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/08/2022 06:56:17 AM
-- Design Name: 
-- Module Name: MUX_2_to_1_4bit - Behavioral
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

entity MUX_2_to_1_4bit is
    Port ( I0, I1 : in STD_LOGIC_VECTOR (3 downto 0);
        EN : in STD_LOGIC;
        Y : out STD_LOGIC_VECTOR (3 downto 0);
        S : in STD_LOGIC);
end MUX_2_to_1_4bit;

architecture Behavioral of MUX_2_to_1_4bit is

begin

-- 0th bit of the 3 bit output
Y(0) <= (S AND I0(0)) OR (NOT(S) AND I1(0));
-- 1st bit of the 3 bit output
Y(1) <= (S AND I0(1)) OR (NOT(S) AND I1(1));
-- 2nd bit of the 3 bit output
Y(2) <= (S AND I0(2)) OR (NOT(S) AND I1(2));
-- 3rd bit of the 3 bit output
Y(3) <= (S AND I0(3)) OR (NOT(S) AND I1(3));

end Behavioral;
