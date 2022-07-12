----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/11/2022 08:50:52 PM
-- Design Name: 
-- Module Name: PC - Behavioral
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

entity PC is
    Port ( Reset, En : in STD_LOGIC;
           Clk : in STD_LOGIC;
           A : in STD_LOGIC_VECTOR (2 downto 0);
           S : out STD_LOGIC_VECTOR (2 downto 0));
end PC;

architecture Behavioral of PC is
component Reg
Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
       En, Reset : in STD_LOGIC;
       Clk : in STD_LOGIC;
       Q : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal A1, S1 : STD_LOGIC_VECTOR (3 downto 0);
begin

PC_Reg : Reg
    PORT MAP(
        D => A1,
        En => En,
        Reset => Reset,
        Clk => Clk,
        Q => S1
    );

A1(0) <= A(0); A1(1) <= A(1); A1(2) <= A(2); A1(3) <= '0';
S(0) <= S1(0); S(1) <= S1(1); S(2) <= S1(2);

end Behavioral;
