library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity INS_DECODER is
  Port (
    I : in STD_LOGIC_VECTOR (11 downto 0);
    R : in STD_LOGIC_VECTOR (3 downto 0);
    R_En, RA_Sel, RB_Sel, JMP_Add : out STD_LOGIC_VECTOR (2 downto 0);
    Load_Sel, Add_Sub_Sel, JMP_Flag : out STD_LOGIC;
    Im_Val : out STD_LOGIC_VECTOR (3 downto 0)
  );
end INS_DECODER;

architecture Behavioral of INS_DECODER is

  signal Ins : STD_LOGIC_VECTOR (1 downto 0);
  
begin
  Ins <= I(11 downto 10);

  process (I, Ins, R) 
  begin

    JMP_Flag <= '0';
    JMP_Add <= I(2 downto 0);
    Im_Val <= I(3 downto 0);
    R_En <= I(9 downto 7);
    RA_Sel <= I(9 downto 7);
    RB_Sel <= I(6 downto 4);
    Load_Sel <= '0';
    Add_Sub_Sel <= '0';
    
    if Ins = "10" then
      -- MOVI R, d
      Load_Sel <= '0';

    elsif Ins = "00" then
      -- ADD Ra, Rb 
      Load_Sel <= '1';
      Add_Sub_Sel <= '0';

    elsif Ins = "01" then
      -- NEG R
      Load_Sel <= '1';
      RB_Sel <= "000";
      Add_Sub_Sel <= '1';

    elsif Ins = "11" then
      -- JZR R, d 

      if R = "0000" then
        JMP_Flag <= '1';
      else
        JMP_Flag <= '0';
      end if;

    end if;
  end process;

end Behavioral;
