library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity Add_Sub_8 is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           Add_Sel : in STD_LOGIC := '0';
           Sub_Sel : in STD_LOGIC := '0';
           Add_Out : out STD_LOGIC_VECTOR (7 downto 0);
           Sub_Out : out STD_LOGIC_VECTOR (7 downto 0);
           Flag : out STD_LOGIC_VECTOR (3 downto 0));
end Add_Sub_8;

architecture Behavioral of Add_Sub_8 is

Signal ADD_Buff,SUB_Buff : STD_LOGIC_VECTOR (7 downto 0);
Signal add_Z,sub_Z : STD_LOGIC;

begin

with (Add_Sel) select ADD_Buff<=
    STD_LOGIC_VECTOR(signed(A) + signed(B)) when '1',
    "00000000" when '0',
    (others => 'U') when others;

with (Sub_Sel) select SUB_Buff<=
    STD_LOGIC_VECTOR(signed(A) - signed(B)) when '1',
    "00000000" when '0',
    (others => 'U') when others;
    
Add_Out <= ADD_Buff;
Sub_Out <= SUB_Buff;

-- zeros for addition and subtraction 
add_Z <= NOT(ADD_Buff(7) or ADD_Buff(6) or ADD_Buff(5) or ADD_Buff(4) or ADD_Buff(3) or ADD_Buff(2) or ADD_Buff(1) or ADD_Buff(0));
sub_Z <= NOT(SUB_Buff(7) or SUB_Buff(6) or SUB_Buff(5) or SUB_Buff(4) or SUB_Buff(3) or SUB_Buff(2) or SUB_Buff(1) or SUB_Buff(0));

-- flags
FLAG (0) <= '1' when ((signed(ADD_Buff) < signed(A))and (Add_Sel = '1')) or ((signed(SUB_Buff) > signed(A))and (Sub_Sel = '1')) else '0' ; -- negative 
FLAG (1) <= (add_Z and Add_Sel) or (sub_Z and Sub_Sel); -- zero 
FLAG (2) <= SUB_Buff(7) or ADD_Buff(7); -- negative 
FLAG (3) <= '0'; -- interrupt 

end Behavioral;
