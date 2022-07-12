----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/26/2022 05:11:51 PM
-- Design Name: 
-- Module Name: TB_RCA_4 - Behavioral
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

entity TB_RCA_4 is
--  Port ( );
end TB_RCA_4;

architecture Behavioral of TB_RCA_4 is
-- Ripple carry adder component
    component RCA_4
         Port ( 
           AddSubSel : in STD_LOGIC;
           A, B : in STD_LOGIC_VECTOR (3 downto 0); 
           S : out STD_LOGIC_VECTOR (3 downto 0);  
           C_out : out STD_LOGIC;
           Zero : out STD_LOGIC);
    end component;
    
    signal A,B: STD_LOGIC_VECTOR (3 downto 0);
    signal C_out, Zero, AddSubSel  : STD_LOGIC;
    signal S: STD_LOGIC_VECTOR (3 downto 0);

begin

UUT : RCA_4
    PORT MAP(
        AddSubSel => AddSubSel,
        A=>A, B=>B,
        C_out => C_out, Zero => zero,
        S => S
   );

    process
    begin
    
    -- Addition
    AddSubSel <= '0';
    wait for 20 ns;
    -- 0000 + 0011 = 0011
    A<="0000"; B<="0011";
    wait for 20 ns;
    -- Zero Addition - 0000 and 0000 = 0000
    A<="0000"; B<="0000";
    wait for 20 ns;
    -- Overflow Addition
    -- 1000 + 1000 = 0000 and C_out = 1
    A<="1000"; B<="1000";
    wait for 20 ns;
    -- 1100 + 1100 = 1000 and C_out = 1
    A<="1100"; B<="1100";
    wait for 20 ns;
    
    -- Subtraction
    AddSubSel <= '1';
    wait for 20 ns;
    -- 0111 - 0011 = 0111 + 1101 = 0100 and C_out = 1
    A<="0111"; B<="0011";
    wait for 20 ns;
    -- 0011 - 0111 = 0011 + 1001 = 1100 and C_out = 0
    A<="0011"; B<="0111";
    wait for 20 ns;
    
    end process;

end Behavioral;
