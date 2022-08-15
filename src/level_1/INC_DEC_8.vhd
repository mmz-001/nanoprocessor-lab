library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity Inc_Dec_8 is
    Port ( Inc_Sel : in STD_LOGIC := '0';
           Dec_Sel : in STD_LOGIC := '0';
           A : in STD_LOGIC_VECTOR (7 downto 0);
           Inc_Out : out STD_LOGIC_VECTOR (7 downto 0);
           Dec_Out : out STD_LOGIC_VECTOR (7 downto 0);
           Flag : out STD_LOGIC_VECTOR (3 downto 0));
end Inc_Dec_8;

architecture Behavioral of Inc_Dec_8 is

signal One : STD_LOGIC_VECTOR (7 downto 0);
signal Inc_Buff,Dec_Buff : STD_LOGIC_VECTOR (7 downto 0);
signal Inc_Zero,Dec_Zero : STD_LOGIC;

begin

    One <= "00000001";

    with Inc_Sel select Inc_Buff <= 
        STD_LOGIC_VECTOR(signed(A) + signed(One)) when '1',
        "00000000" when '0',
        (others => 'U') when others;

    with Dec_Sel select Dec_Buff <= 
        STD_LOGIC_VECTOR(signed(A) - signed(One)) when '1',
        "00000000" when '0',
        (others => 'U') when others;
        
    Inc_Out <= Inc_Buff;
    Dec_Out <= Dec_Buff;

    -- logic for Flags
    Inc_Zero <= not(Inc_Buff(0) or Inc_Buff(1) or Inc_Buff(2) or Inc_Buff(3) or Inc_Buff(4) or Inc_Buff(5) or Inc_Buff(6) or Inc_Buff(7));
    Dec_Zero <= not(Dec_Buff(0) or Dec_Buff(1) or Dec_Buff(2) or Dec_Buff(3) or Dec_Buff(4) or Dec_Buff(5) or Dec_Buff(6) or Dec_Buff(7));

    Flag(0) <=  '1' when ((signed(Inc_Buff) < signed(A))and (Inc_Sel = '1')) or ((signed(Dec_Buff) > signed(A))and (Dec_Sel = '1')) else '0' ; -- overflow, 1 if either one of the outputs have overflow 
    -- overflow occurs if Inc_buff is less than input or Dec_buff is greater than input, when the respective one is activated
    Flag(1) <=  (Inc_Zero and Inc_Sel) or (Dec_Zero and Dec_Sel); -- Zero if either one of the outputs is 0 when it is activated
    Flag(2) <=  Inc_Buff(7) or Dec_Buff(7); -- negative, either one of the outputs has a negative value
    Flag(3) <=  '0'; -- interrupts



end Behavioral;
