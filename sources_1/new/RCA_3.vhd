----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/07/2022 02:40:34 PM
-- Design Name: 
-- Module Name: RCA_3 - Behavioral
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

entity RCA_3 is
    Port ( PC_in : in STD_LOGIC_VECTOR (2 downto 0);
           PC_out : out STD_LOGIC_VECTOR (2 downto 0);
           c_out : out std_logic);
           
end RCA_3;

architecture Behavioral of RCA_3 is

component FA
PORT(
    A: in std_logic;
    B: in std_logic;
    C_in : in std_logic;
    S : out std_logic;
    C_out : out std_logic);
end component;

signal FA0_C,FA1_C : std_logic;

begin

-- note we're just adding 1 to the input 

FA_0 : FA
    port map(
    A => PC_in(0),
    B => '1',
    C_in => '0', -- pdf asked to set to ground
    S => PC_out(0),
    C_out => FA0_C);
    
FA_1 : FA
    port map(
    A => PC_in(1),
    B => '0',
    C_in => FA0_C,
    S => PC_out(1),
    C_out => FA1_C);
    
FA_2 : FA
    port map(
    A => PC_in(2),
    B => '0',
    C_in => FA1_C,
    S => PC_out(2),
    C_out => c_out);


end Behavioral;
