library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity INS_DECODER is
  Port (
    I : in STD_LOGIC_VECTOR (12 downto 0);
    R : in STD_LOGIC_VECTOR (3 downto 0);
    R_En, RA_Sel, RB_Sel, JMP_Add : out STD_LOGIC_VECTOR (2 downto 0);
    Load_Sel, Add_Sub_Sel, JMP_Flag : out STD_LOGIC;
    Im_Val : out STD_LOGIC_VECTOR (3 downto 0)
  );
end INS_DECODER;

architecture Behavioral of INS_DECODER is

  signal Ins : STD_LOGIC_VECTOR (1 downto 0);
  signal RA, RB : STD_LOGIC_VECTOR (2 downto 0);
  
begin

  Ins <= I(1 downto 0);
  JMP_Flag <= '0';
  RA <= I(4 downto 2);
  RB <= I(5 downto 7);
  JMP_Add <= I(11 downto 8);
  Im_Val <= I(11 downto 8);

  process (INS, R) 
  begin
    R_En <= I(4 downto 2);

    if Ins = "10" then
      -- MOVI R, d
      Load_Sel <= '0';

    elsif Ins = "00" then
      -- ADD Ra, Rb 
      Load_Sel <= '1';
      RA_Sel <= RA;
      RB_Sel <= RB;
      Add_Sub_Sel <= '0';

    elsif Ins = "01" then
      -- NEG R
      Load_Sel <= '1';
      RA_Sel <= "0000";
      RB_Sel <= RA;
      Add_Sub_Sel <= '1';

    elsif Ins = "11" then
      -- JZR R, d 
      R_En <= "000";

      if R = "0000" then
        JMP_Flag <= '1';
      else
        JMP_Flag <= '0';
      end if;

    end if;
  end process;

end Behavioral;
