----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/02/2022 03:15:55 PM
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

entity Mux_8_to_1_4bit is
    Port ( I0, I1, I2, I3, I4, I5, I6, I7 : in STD_LOGIC_VECTOR (3 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (3 downto 0);
           S : in STD_LOGIC_VECTOR (2 downto 0));
end Mux_8_to_1_4bit;

architecture Behavioral of Mux_8_to_1_4bit is

component Decoder_3_to_8
    Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal YD0, YD1, YD2, YD3 : STD_LOGIC_VECTOR (7 downto 0);

begin

-- Decoder for 0th bit
Decoder_3_to_8_0 : Decoder_3_to_8
    Port Map(
        I => S,
        EN => EN,
        Y => YD0
    ); 

-- Decoder for 1st bit
Decoder_3_to_8_1 : Decoder_3_to_8
    Port Map(
        I => S,
        EN => EN,
        Y => YD1
    ); 

-- Decoder for 2nd bit
Decoder_3_to_8_2 : Decoder_3_to_8
    Port Map(
        I => S,
        EN => EN,
        Y => YD2
    ); 

-- Decoder for 3rd bit
Decoder_3_to_8_3 : Decoder_3_to_8
    Port Map(
        I => S,
        EN => EN,
        Y => YD3
    ); 

-- 0th bit of 4 bit output Y
Y(0) <= (YD0(0) AND I0(0)) OR (YD0(1) AND I1(0)) OR (YD0(2) AND I2(0)) OR 
        (YD0(3) AND I3(0)) OR (YD0(4) AND I4(0)) OR (YD0(5) AND I5(0)) 
        OR (YD0(6) AND I6(0)) OR (YD0(7) AND I7(0));

-- 1st bit of 4 bit output Y
Y(1) <= (YD1(0) AND I0(1)) OR (YD1(1) AND I1(1)) OR (YD1(2) AND I2(1)) OR 
        (YD1(3) AND I3(1)) OR (YD1(4) AND I4(1)) OR (YD1(5) AND I5(1)) 
        OR (YD1(6) AND I6(1)) OR (YD1(7) AND I7(1));
        
-- 2nd bit of 4 bit output Y
Y(2) <= (YD2(0) AND I0(2)) OR (YD2(1) AND I1(2)) OR (YD2(2) AND I2(2)) OR 
        (YD2(3) AND I3(2)) OR (YD2(4) AND I4(2)) OR (YD2(5) AND I5(2)) 
        OR (YD2(6) AND I6(2)) OR (YD2(7) AND I7(2));

-- 3rd bit of 4 bit output Y
Y(3) <= (YD3(0) AND I0(3)) OR (YD3(1) AND I1(3)) OR (YD3(2) AND I2(3)) OR 
        (YD3(3) AND I3(3)) OR (YD3(4) AND I4(3)) OR (YD3(5) AND I5(3)) 
        OR (YD3(6) AND I6(3)) OR (YD3(7) AND I7(3));

        
end Behavioral;
