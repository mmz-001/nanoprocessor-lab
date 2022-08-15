library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Ins_Decoder_16 is
  Port (
    I : in STD_LOGIC_VECTOR (15 downto 0); -- 16 bit instruction
    R_In : in STD_LOGIC_VECTOR (7 downto 0);  -- Input Register
    Zero, Overflow, Negative, Interrupt : in STD_LOGIC;
    R_En, RA_Sel, RB_Sel : out STD_LOGIC_VECTOR (2 downto 0);
    Jmp_Flag : out STD_LOGIC;
    AU_Sel: out STD_LOGIC_VECTOR (2 downto 0);
    Load_Sel : out STD_LOGIC_VECTOR ( 1 downto 0);
    Jmp_Addr : out STD_LOGIC_VECTOR (4 downto 0);
    Im_Val : out STD_LOGIC_VECTOR (7 downto 0)
  );
end Ins_Decoder_16;

architecture Behavioral of Ins_Decoder_16 is

Signal Ins : STD_LOGIC_VECTOR (3 downto 0);
  
begin
  Ins <= I(15 downto 12); -- 1st 4 bits have the type of instruction 

  process (I, Ins, R_In, Zero, Overflow, Negative, Interrupt) 
  begin

    -- Initialize
    R_En <= "000";
    RA_Sel <= "000";
    RB_Sel <= "000";
    Jmp_Flag <= '0';
    AU_Sel <= "000";
    Load_Sel <= "00";
    Jmp_Addr <= I(4 downto 0);
    Im_Val <= "00000000";

    if Ins = "0000" then
     -- ADD, RA, RB
     RA_Sel <= I(11 downto 9);
     RB_Sel <= I(8 downto 6);
     R_En <= I(11 downto 9);
     Load_Sel <= "01"; -- AU output 
     AU_Sel <= "000";
     
    elsif Ins = "0001" then
     -- NEG, R
     RA_Sel <= "000"; -- register 0 hardcoded to zero 
     RB_Sel <= I(11 downto 9);
     R_En <= I(11 downto 9);
     Load_Sel <= "01";
     AU_Sel <="001";
     
    elsif Ins = "0010" then
     -- MOVI, R_In, d
     R_En <= I(11 downto 9);
     Load_Sel <= "00";
     Im_Val <= I(7 downto 0);
     
    elsif Ins = "0011" then
     -- JZR, R, d
     RA_Sel <= I(11 downto 9);
     if R_In = "00000000" then
        Jmp_Flag <= '1';
     else
        Jmp_Flag <= '0'; 
     end if;
     
    elsif Ins = "0100" then 
     -- MOV, RA, RB
    elsif Ins = "0101" then
     -- MUL, RA, RB 
    elsif Ins = "0110" then 
     -- DIV, RA, RB
    elsif Ins = "0111" then
     -- MOD, RA, RB 
    elsif Ins = "1000" then 
     -- IN, R, P
    elsif Ins = "1001" then
     -- CMP, RA, RB 
    elsif Ins = "1010" then 
     -- HALT 
    elsif Ins = "1011" then 
     -- JO, d
    elsif Ins = "1100" then 
     -- JS, d
    elsif Ins = "1101" then
     -- JINT, d
    elsif Ins = "1110" then 
     -- INC, R
    elsif Ins = "1111" then
     -- DEC, R 
    end if;
  end process;

end Behavioral;
