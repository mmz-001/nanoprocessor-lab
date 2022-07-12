----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/08/2022 07:27:40 AM
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
    Port (
    A : in STD_LOGIC_VECTOR (2 downto 0); 
    S : out STD_LOGIC_VECTOR (2 downto 0)); 
end RCA_3;

architecture Behavioral of RCA_3 is
component RCA_4
    Port ( 
    AddSubSel : in STD_LOGIC;
    A, B : in STD_LOGIC_VECTOR (3 downto 0); 
    S : out STD_LOGIC_VECTOR (3 downto 0);  
    C_out : out STD_LOGIC;
    Zero : out STD_LOGIC);
end component;

signal A1, B1, S1 : STD_LOGIC_VECTOR (3 downto 0);
begin

RCA_4_0 : RCA_4
Port Map(
    AddSubSel => '0',
    A => A1,
    B => B1,
    S => S1
);

B1 <= "0001";
A1(0) <= A(0); A1(1) <= A(1); A1(2) <= A(2); A1(3) <= '0';
S(0) <= S1(0); S(1) <= S1(1); S(2) <= S1(2);   
end Behavioral;
