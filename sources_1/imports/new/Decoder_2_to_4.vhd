----------------------------------------------------------------------------------
-- Company: University of Moratuwa
-- Engineer: Isuru Gunarathne
-- 
-- Create Date: 06/02/2022 01:14:55 PM
-- Design Name: 
-- Module Name: Decoder_2_to_4 - Behavioral
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

entity Decoder_2_to_4 is
    Port ( I : in STD_LOGIC_VECTOR (1 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end Decoder_2_to_4;

architecture Behavioral of Decoder_2_to_4 is
    
begin
process(I)
begin

    Y(0)<= EN AND Not I(1) and Not I(0);
    Y(1)<= EN AND Not I(1) and I(0);
    Y(2)<= EN AND I(1) and Not I(0);
    Y(3)<= EN And I(1) and I(0);
    
end process;
end Behavioral;
