library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity INC_DEC_8 is
    Port ( INC_Sel : in STD_LOGIC := '0';
           DEC_Sel : in STD_LOGIC := '0';
           A : in STD_LOGIC_VECTOR (7 downto 0);
           INC_Out : out STD_LOGIC_VECTOR (7 downto 0);
           DEC_Out : out STD_LOGIC_VECTOR (7 downto 0);
           FLAG : out STD_LOGIC_VECTOR (3 downto 0));
end INC_DEC_8;

architecture Behavioral of INC_DEC_8 is

signal One : STD_LOGIC_VECTOR (7 downto 0);
signal INC_Buff,DEC_Buff : STD_LOGIC_VECTOR (7 downto 0);
signal inc_zero,dec_zero : STD_LOGIC;

begin

One <= "00000001";

with INC_Sel select INC_Buff <= 
    STD_LOGIC_VECTOR(signed(A) + signed(One)) when '1',
    "00000000" when '0',
    (others => 'U') when others;

with DEC_Sel select DEC_Buff <= 
    STD_LOGIC_VECTOR(signed(A) - signed(One)) when '1',
    "00000000" when '0',
    (others => 'U') when others;
    
INC_Out <= INC_Buff;
DEC_Out <= DEC_Buff;

-- logic for flags
inc_zero <= not(INC_Buff(0) or INC_Buff(1) or INC_Buff(2) or INC_Buff(3) or INC_Buff(4) or INC_Buff(5) or INC_Buff(6) or INC_Buff(7));
dec_zero <= not(DEC_Buff(0) or DEC_Buff(1) or DEC_Buff(2) or DEC_Buff(3) or DEC_Buff(4) or DEC_Buff(5) or DEC_Buff(6) or DEC_Buff(7));

FLAG(0) <=  '1' when ((signed(INC_Buff) < signed(A))and (INC_Sel = '1')) or ((signed(DEC_Buff) > signed(A))and (DEC_Sel = '1')) else '0' ; -- overflow, 1 if either one of the outputs have overflow 
-- overflow occurs if inc_buff is less than input or dec_buff is greater than input, when the respective one is activated
FLAG(1) <=  (inc_zero and INC_Sel) or (dec_zero and DEC_Sel); -- zero if either one of the outputs is 0 when it is activated
FLAG(2) <=  INC_Buff(7) or DEC_Buff(7); -- negative, either one of the outputs has a negative value
FLAG(3) <=  '0'; -- interrupts



end Behavioral;
