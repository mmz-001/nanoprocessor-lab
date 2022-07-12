----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/11/2022 08:26:05 PM
-- Design Name: 
-- Module Name: TB_RCA3 - Behavioral
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

entity TB_RCA3 is
--  Port ( );
end TB_RCA3;

architecture Behavioral of TB_RCA3 is

component RCA_3
    Port (
    A : in STD_LOGIC_VECTOR (2 downto 0); 
    S : out STD_LOGIC_VECTOR (2 downto 0)); 
end component;

signal A, S : STD_LOGIC_VECTOR (2 downto 0);

begin

UUT : RCA_3
    PORT MAP(
        A=>A, 
        S=>S
    );

process
begin
    A <= "001";
    wait for 20 ns;
    
    A <= "010";
    wait for 20 ns;
    
    A <= "100";
    wait for 20 ns;
    
    A <= "011";
    wait for 20 ns;

end process;

end Behavioral;
