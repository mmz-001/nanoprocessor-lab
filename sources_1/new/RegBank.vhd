----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/07/2022 11:42:32 PM
-- Design Name: 
-- Module Name: RegBank - Behavioral
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

entity RegBank is
    Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
           RegSel : in STD_LOGIC_VECTOR (2 downto 0);
           Clk, Reset : in STD_LOGIC;
           I0 : out STD_LOGIC_VECTOR (3 downto 0) := "0000"; -- Hardcode value of R0 to all zeros
           I1, I2, I3, I4, I5, I6, I7 : out STD_LOGIC_VECTOR (3 downto 0));
end RegBank;

architecture Behavioral of RegBank is

component Reg 
   Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
        En, Reset : in STD_LOGIC;
        Clk : in STD_LOGIC;
        Q : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component Decoder_3_to_8
    Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal EN0 : STD_LOGIC := '1';
signal YD : STD_LOGIC_VECTOR (7 downto 0);

begin

-- 3 to 8 1 bit decoder
Decoder_3_to_8_0 : Decoder_3_to_8
    PORT MAP(
        I => RegSel,
        EN => EN0,
        Y => YD
    );

-- Register Bank have 8 Registers


Reg1 : Reg
    PORT MAP(
        D => D,
        EN => YD(1),Reset => Reset,
        Clk => Clk,
        Q => I1
    );
        
Reg2 : Reg
    PORT MAP(
        D => D,
        EN => YD(2),Reset => Reset,
        Clk => Clk,
        Q => I2
    );
    
Reg3 : Reg
    PORT MAP(
        D => D,
        EN => YD(3),Reset => Reset,
        Clk => Clk,
        Q => I3
    );
        
Reg4 : Reg
    PORT MAP(
        D => D,
        EN => YD(4),Reset => Reset,
        Clk => Clk,
        Q => I4
    );
            
Reg5 : Reg
    PORT MAP(
        D => D,
        EN => YD(5),Reset => Reset,
        Clk => Clk,
        Q => I5
    );

        
Reg6 : Reg
    PORT MAP(
        D => D,
        EN => YD(6),Reset => Reset,
        Clk => Clk,
        Q => I6
    );
            
Reg7 : Reg
    PORT MAP(
        D => D,
        EN => YD(7),Reset => Reset,
        Clk => Clk,
        Q => I7
    );


end Behavioral;
