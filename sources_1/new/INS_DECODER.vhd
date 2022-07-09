library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity INS_DECODER is
  Port (
    Bus_12 : in STD_LOGIC_VECTOR (12 downto 0);
    R : in STD_LOGIC_VECTOR (3 downto 0);
    Reg_En, Reg_A_Sel, Reg_B_Sel, JMP_Add : out STD_LOGIC_VECTOR (2 downto 0);
    Load_Sel, Add_Sub_Sel, JMP_Flag : out STD_LOGIC;
    I :  out STD_LOGIC_VECTOR (3 downto 0)
  );
end INS_DECODER;

architecture Behavioral of INS_DECODER is

  signal RA, RB, D_3 : STD_LOGIC_VECTOR (2 downto 0);
  signal D_4 : STD_LOGIC_VECTOR (3 downto 0);
  signal INS : STD_LOGIC_VECTOR (1 downto 0);
begin

  INS <= Bus_12(1 downto 0);
  Reg_En <= Bus_12(4 downto 2);
  RA <= Bus_12(4 downto 2);
  RB <= Bus_12(5 downto 7);
  D_3 <= Bus_12(11 downto 8);
  D_4 <= Bus_12(11 downto 8);

  process (INS, R) 
  begin
    if INS = "10" then
      -- MOVI R, d
      Load_Sel <= '0';
      I <= D_3;
      -- Reg_En, Reg_A_Sel, Reg_B_Sel, JMP_Add <= "000";
      -- Add_Sub_Sel, JMP_Flag <= '0';

    elsif INS = "00" then
      -- ADD Ra, Rb 
    elsif INS = "01" then
      -- NEG R
    else 
      -- JZR R, d 
    end if;
  end process;





end Behavioral;
