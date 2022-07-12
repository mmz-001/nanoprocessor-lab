----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/11/2022 09:09:09 PM
-- Design Name: 
-- Module Name: AU - Behavioral
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

entity AU is
    Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
           Clk, Reset, En : in STD_LOGIC;
           Reg_En : in STD_LOGIC_VECTOR (2 downto 0);
           Reg_Sel_A : in STD_LOGIC_VECTOR (2 downto 0);
           Reg_Sel_B : in STD_LOGIC_VECTOR (2 downto 0);
           Add_Sub_Sel : in STD_LOGIC;
           Sum, JumpReg : out STD_LOGIC_VECTOR (3 downto 0);
           C_out : out STD_LOGIC;
           Zero : out STD_LOGIC;
           Led : out STD_LOGIC_VECTOR (3 downto 0));
end AU;

architecture Behavioral of AU is

-- The Register Bank
component RegBank
Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
       RegSel : in STD_LOGIC_VECTOR (2 downto 0);
       Clk, Reset : in STD_LOGIC;
       I0, I1, I2, I3, I4, I5, I6, I7 : out STD_LOGIC_VECTOR (3 downto 0));
end component;

-- 8 way 4 bit MUXs
component Mux_8_to_1_4bit
Port ( I0, I1, I2, I3, I4, I5, I6, I7 : in STD_LOGIC_VECTOR (3 downto 0);
       EN : in STD_LOGIC;
       Y : out STD_LOGIC_VECTOR (3 downto 0);
       S : in STD_LOGIC_VECTOR (2 downto 0));
end component;

-- RCA Adder / Subtracter
component RCA_4
Port ( 
    AddSubSel : in STD_LOGIC;
    A, B : in STD_LOGIC_VECTOR (3 downto 0); 
    S : out STD_LOGIC_VECTOR (3 downto 0);  
    C_out : out STD_LOGIC;
    Zero : out STD_LOGIC);
end component;

-- outputs of the registers
signal A0,A1,A2,A3,A4,A5,A6,A7: STD_LOGIC_VECTOR (3 downto 0);
signal D0, D1 : STD_LOGIC_VECTOR (3 downto 0);
signal SumRCA : STD_LOGIC_VECTOR (3 downto 0);
begin

------- Register Bank ---------------
RegBank_0 : RegBank
PORT MAP(
    Clk => Clk, Reset => Reset,
    D => D, 
    RegSel => Reg_En,
    I0=>A0,I1=>A1,I2=>A2,I3=>A3,I4=>A4,I5=>A5,I6=>A6,I7=>A7 
);
-------------------------------------

-------- Mux 8 way 4 bit ------------
Mux_8_4bit_0 : Mux_8_to_1_4bit
PORT MAP(
    I0=>A0,I1=>A1,I2=>A2,I3=>A3,I4=>A4,I5=>A5,I6=>A6,I7=>A7,
    EN => En,
    S => Reg_Sel_A,
    Y => D0
);

Mux_8_4bit_1 : Mux_8_to_1_4bit
PORT MAP(
    I0=>A0,I1=>A1,I2=>A2,I3=>A3,I4=>A4,I5=>A5,I6=>A6,I7=>A7,
    EN => En,
    S => Reg_Sel_B,
    Y => D1
);
---------------------------------------

---- RCA 4 bit Adder/Subtractor -------
RCA_4_0 : RCA_4
PORT MAP(
    AddSubSel => Add_Sub_Sel,
    A => D0, B => D1,
    S => SumRCA, C_out => C_out, Zero => Zero
);

-- Jump Register
JumpReg <= D0;

end Behavioral;
