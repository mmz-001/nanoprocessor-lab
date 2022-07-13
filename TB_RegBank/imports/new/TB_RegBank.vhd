----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/12/2022 03:32:51 PM
-- Design Name: 
-- Module Name: TB_RegBank - Behavioral
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

entity TB_RegBank is
--  Port ( );
end TB_RegBank;

architecture Behavioral of TB_RegBank is

component RegBank
Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
       RegSel : in STD_LOGIC_VECTOR (2 downto 0);
       Clk, Reset : in STD_LOGIC;
       I0, I1, I2, I3, I4, I5, I6, I7 : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal D : STD_LOGIC_VECTOR (3 downto 0) := "0000";
signal RegSel : STD_LOGIC_VECTOR (2 downto 0) := "000";
signal Clk_in : STD_LOGIC := '1';
signal Reset : STD_LOGIC;
signal I0, I1, I2, I3, I4, I5, I6, I7 : STD_LOGIC_VECTOR (3 downto 0);

begin

UUT : RegBank
PORT MAP(
    D => D, RegSel => RegSel,
    Clk => Clk_in, Reset => Reset,
    I0 => I0,I1 => I1,I2 => I2,I3 => I3,I4 => I4,I5 => I5,I6 => I6,I7 => I7   
); 

process
begin
    Clk_in <= NOT(Clk_in); 
    wait for 20 ns;
end process;

process
begin
Reset<='1';
wait for 100 ns;
Reset<='0';
wait for 100 ns;

-- Select R1
RegSel <= "001";
D <= "1010";
wait for 50 ns;

-- Select R2;
RegSel <= "010";
D<="1010";
wait for 50 ns;

-- Select R3
RegSel <= "011";
D <= "1010";
wait for 50 ns;

-- Select R4;
RegSel <= "100";
D<="1010";
wait for 50 ns;
end process;

end Behavioral;
