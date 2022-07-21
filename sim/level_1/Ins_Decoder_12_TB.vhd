library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Ins_Decoder_12_TB is
end Ins_Decoder_12_TB;

architecture Behavioral of Ins_Decoder_12_TB is
  component Ins_Decoder_12 
    Port (
      I : in STD_LOGIC_VECTOR (11 downto 0);
      R_In : in STD_LOGIC_VECTOR (3 downto 0);
      R_En, RA_Sel, RB_Sel, Jmp_Addr : out STD_LOGIC_VECTOR (2 downto 0);
      Load_Sel, Add_Sub_Sel, Jmp_Flag : out STD_LOGIC;
      Im_Val : out STD_LOGIC_VECTOR (3 downto 0)
    );
  end component;

  signal I : STD_LOGIC_VECTOR (11 downto 0);
  signal R_In : STD_LOGIC_VECTOR (3 downto 0);
  signal R_En, RA_Sel, RB_Sel, Jmp_Addr : STD_LOGIC_VECTOR (2 downto 0);
  signal Load_Sel, Add_Sub_Sel, Jmp_Flag : STD_LOGIC;
  signal Im_Val : STD_LOGIC_VECTOR (3 downto 0);

begin
  
  uut : Ins_Decoder_12
    port map (
      I => I,
      R_In => R_In,
      R_En => R_En,
      RA_Sel => RA_Sel,
      RB_Sel => RB_Sel,
      Jmp_Addr => Jmp_Addr,
      Load_Sel => Load_Sel,
      Add_Sub_Sel => Add_Sub_Sel,
      Jmp_Flag => Jmp_Flag,    
      Im_Val => Im_Val
    );

  process begin
    R_In <= "0000";

    -- Index number 200193U - 0011 0000 1110 0000 0001
    -- Index number 200595E - 00 110 000 111 110 010 011

    I <= "101110000001"; -- MOVI R7, 0001
    wait for 20 ns;

    I <= "100010000000"; -- MOVI R1, 0000
    wait for 20 ns;

    I <= "100100001110"; -- MOVI R2, 1110
    wait for 20 ns;

    I <= "010100000000"; -- NEG R2
    wait for 20 ns;

    I <= "001110100000"; -- ADD R7, R2
    wait for 20 ns;

    I <= "000010100000"; -- ADD R1, R2
    wait for 20 ns;

    I <= "110010000011"; -- JZR R1 011
    R_In <= "0011";
    wait for 20 ns;

    I <= "110000000010"; -- JZR R0 010
    R_In <= "0001";
    wait for 20 ns;

    I <= "110000000010"; -- JZR R0 010
    R_In <= "0000";
    wait;

  end process;

end Behavioral;
