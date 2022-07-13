----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/12/2022 09:24:21 PM
-- Design Name: 
-- Module Name: TB_PC - Behavioral
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

entity TB_PC is
--  Port ( );
end TB_PC;

architecture Behavioral of TB_PC is

component PC
Port ( Reset, En : in STD_LOGIC;
   Clk : in STD_LOGIC;
   A : in STD_LOGIC_VECTOR (2 downto 0);
   S : out STD_LOGIC_VECTOR (2 downto 0));
end component;

signal Reset : STD_LOGIC;
signal En : STD_LOGIC := '1';
signal Clk : STD_LOGIC := '1';
signal A : STD_LOGIC_VECTOR (2 downto 0) := "000"; 
signal S : STD_LOGIC_VECTOR (2 downto 0);

begin

UUT : PC
PORT MAP(
    Reset=>Reset, En=>En, Clk => Clk,
    A => A, S => S
);

process
begin
    wait for 20 ns;
    Clk <= NOT(Clk);
end process;

process
begin
    Reset<='1';
    wait for 100 ns;
    Reset<='0';
    wait for 20 ns;
    
    A <= "000";
    wait for 200 ns;   

    A <= "001";
    wait for 200 ns;
    
    A <= "010";
    wait for 200 ns;
    
    A <= "011";
    wait for 200 ns;
    
    A <= "100";
    wait for 200 ns;
    
    A <= "101";
    wait for 200 ns;
    
    A <= "110";
    wait for 200 ns;
    
    A <= "111";
    wait for 200 ns;
end process;


end Behavioral;
