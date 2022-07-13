----------------------------------------------------------------------------------
-- Company: University of Moratuwa
-- Engineer: Isuru Gunarathne
-- 
-- Create Date: 06/02/2022 03:14:38 PM
-- Design Name: 
-- Module Name: TB_Mux_8_to_1 - Behavioral
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

entity TB_Mux_8_to_1 is
--  Port ( );
end TB_Mux_8_to_1;

architecture Behavioral of TB_Mux_8_to_1 is

component Mux_8_to_1
Port ( S : in STD_LOGIC_VECTOR (2 downto 0);
           EN : in STD_LOGIC;
           D : in STD_LOGIC_VECTOR (7 downto 0);
           Y : out STD_LOGIC);
end component;

signal s : STD_LOGIC_VECTOR (2 downto 0);
signal en : STD_LOGIC;
signal d :  STD_LOGIC_VECTOR (7 downto 0);
signal y : STD_LOGIC;


begin
    UUT : Mux_8_to_1
    port map(
        EN => en,
        S=>s,
        D=>d,
        Y=>y);
        
    process
    begin
    en<='1';
    d<="01010101"; -- odd places should give 1 and even places give 0
    s<="000";
    
    -- index number : 200189M
    -- binary of index number : 0011 0000 1101 1111 1101
    -- seperated into groups of 3 : 110 000 110 111 111 101
    -- first input : 101
    -- second input : 111
    -- third input : 110 (after ignoring the repeated 111)
    -- fourth input : 000
    
    wait for 50 ns;
    s<="101";
    
    wait for 50 ns;
    s<="111";
    
    wait for 50 ns;
    s<="110";
    
    wait for 50 ns;
    s<="000";
    
    wait for 350 ns;
    
    wait for 50 ns;
        s<="000"; --0    
    wait for 50 ns;
        s<="001"; --1
    wait for 50 ns;
        s<="010"; --2
    wait for 50 ns;
        s<="011"; --3
    wait for 50 ns;
        s<="100"; --4
    wait for 50 ns;
        s<="101"; --5
    wait for 50 ns;
        s<="110"; --6
    wait for 50 ns;
        s<="111"; --7
    wait;
    end process;

end Behavioral;
