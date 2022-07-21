----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/02/2022 02:59:00 PM
-- Design Name: 
-- Module Name: Mux_8_to_1 - Behavioral
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

entity Mux_8_to_1 is
    Port ( S : in STD_LOGIC_VECTOR (2 downto 0);
           EN : in STD_LOGIC;
           D : in STD_LOGIC_VECTOR (7 downto 0);
           Y : out STD_LOGIC);
end Mux_8_to_1;

architecture Behavioral of Mux_8_to_1 is
component Decoder_3_to_8
Port( I : in STD_LOGIC_VECTOR (2 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal mid : Std_logic_vector(7 downto 0); -- to get output from the AND gates to the final OR gate
signal dec_out : std_logic_vector(7 downto 0); -- to take output of 3 to 8 decoder to the and gates

begin
Decoder_3_to_8_0 : Decoder_3_to_8
port map(
    I=>S,
    EN=> EN,
    Y=>dec_out);
    
    mid(0)<=D(0) and dec_out(0);
    mid(1)<=D(1) and dec_out(1);
    mid(2)<=D(2) and dec_out(2);
    mid(3)<=D(3) and dec_out(3);
    mid(4)<=D(4) and dec_out(4);
    mid(5)<=D(5) and dec_out(5);
    mid(6)<=D(6) and dec_out(6);
    mid(7)<=D(7) and dec_out(7);

    Y<= mid(0) 
        or mid(1) 
        or mid(2) 
        or mid(3) 
        or mid(4) 
        or mid(5) 
        or mid(6) 
        or mid(7);
    

end Behavioral;
