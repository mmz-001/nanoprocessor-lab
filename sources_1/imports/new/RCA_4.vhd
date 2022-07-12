----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/26/2022 04:28:50 PM
-- Design Name: 
-- Module Name: RCA_4 - Behavioral
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

entity RCA_4 is
 Port ( 
    AddSubSel : in STD_LOGIC;
    A, B : in STD_LOGIC_VECTOR (3 downto 0); 
    S : out STD_LOGIC_VECTOR (3 downto 0);  
    C_out : out STD_LOGIC;
    Zero : out STD_LOGIC);
end RCA_4;

architecture Behavioral of RCA_4 is
component FA
    PORT(
        A,B,C_in: in STD_LOGIC;
        S,C_out: out STD_LOGIC);
end component;
    
signal FA0_C, FA1_C, FA2_C, FA3_C : std_logic;
signal D  : std_logic_vector (3 downto 0);
signal Q: std_logic_vector (3 downto 0);
begin

FA_0 : FA
    PORT MAP(
        A => D(0),
        B => B(0),
        C_in => AddSubSel,
        S => Q(0),
        C_out => FA0_C
    );

FA_1 : FA
    PORT MAP(
        A => D(1),
        B => B(1),
        C_in => FA0_C,
        S => Q(1),
        C_out => FA1_C
    );

FA_2 : FA
    PORT MAP(
        A => D(2),
        B => B(2),
        C_in => FA1_C,
        S => Q(2),
        C_out => FA2_C
    );
 
FA_3 : FA
     PORT MAP(
        A => D(3),
        B => B(3),
        C_in => FA2_C,
        S => Q(3),
        C_out => C_out
    );       

-- Bits of the 2nd digit given in 2's complement format
D(0) <= (NOT(AddSubSel) AND A(0)) OR (AddSubSel AND NOT(A(0)));
D(1) <= (NOT(AddSubSel) AND A(1)) OR (AddSubSel AND NOT(A(1)));
D(2) <= (NOT(AddSubSel) AND A(2)) OR (AddSubSel AND NOT(A(2)));
D(3) <= (NOT(AddSubSel) AND A(3)) OR (AddSubSel AND NOT(A(3)));

-- Sum, Zero and Carry bits
S <= Q;
Zero <= NOT(Q(0)) AND NOT(Q(1)) AND NOT(Q(2)) AND NOT(Q(3));

end Behavioral;
