library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity INS_DECODER_Sim is
end INS_DECODER_Sim;

architecture Behavioral of INS_DECODER_Sim is
  component INS_DECODER 
    Port (
      I : in STD_LOGIC_VECTOR (12 downto 0);
      R : in STD_LOGIC_VECTOR (3 downto 0);
      R_En, RA_Sel, RB_Sel, JMP_Add : out STD_LOGIC_VECTOR (2 downto 0);
      Load_Sel, Add_Sub_Sel, JMP_Flag : out STD_LOGIC;
      Im_Val : out STD_LOGIC_VECTOR (3 downto 0)
    );
  end component;

  signal I : STD_LOGIC_VECTOR (12 downto 0);
  signal R : STD_LOGIC_VECTOR (3 downto 0);
  signal R_En, RA_Sel, RB_Sel, JMP_Add : STD_LOGIC_VECTOR (2 downto 0);
  signal Load_Sel, Add_Sub_Sel, JMP_Flag : STD_LOGIC;
  signal Im_Val : STD_LOGIC_VECTOR (3 downto 0);

begin


end Behavioral;
