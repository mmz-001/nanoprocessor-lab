library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Ins_Decoder_12 is
  Port (
    I : in STD_LOGIC_VECTOR (11 downto 0); -- 12 bit instruction
    R_In : in STD_LOGIC_VECTOR (3 downto 0);  -- Input Register
    R_En, RA_Sel, RB_Sel, Jmp_Addr : out STD_LOGIC_VECTOR (2 downto 0);
    Load_Sel, Add_Sub_Sel, Jmp_Flag, Add_Sub_Flag : out STD_LOGIC;
    Im_Val : out STD_LOGIC_VECTOR (3 downto 0)
  );
end Ins_Decoder_12;

architecture Behavioral of Ins_Decoder_12 is

  signal Ins : STD_LOGIC_VECTOR (1 downto 0);
  
begin
  Ins <= I(11 downto 10); -- 1st 2 bits have the type of instruction 

  process (I, Ins, R_In) 
  begin

    Jmp_Flag <= '0';
    Jmp_Addr <= I(2 downto 0);
    Im_Val <= I(3 downto 0);
    R_En <= I(9 downto 7);
    RA_Sel <= I(9 downto 7);
    RB_Sel <= I(6 downto 4);
    Load_Sel <= '0';
    Add_Sub_Sel <= '0';
    Add_Sub_Flag <= '0';
    
    if Ins = "10" then
      -- MOVI R_In, d
      Load_Sel <= '0';
      Im_Val <= I (3 downto 0);
      R_En <= I (9 downto 7);

    elsif Ins = "00" then
      -- ADD Ra, Rb 
      Load_Sel <= '1';
      Add_Sub_Sel <= '0'; -- adding 
      RA_Sel <= I (9 downto 7);
      RB_Sel <= I (6 downto 4);
      R_En <= I (9 downto 7);
      Add_Sub_Flag <= '1';

    elsif Ins = "01" then
      -- NEG R_In
      Load_Sel <= '1';
      RA_Sel <= "000"; -- register 0 has value 0
      RB_Sel <= I (9 downto 7);
      Add_Sub_Sel <= '1';
      R_En <= I (9 downto 7);
      Add_Sub_Flag <= '1';

    elsif Ins = "11" then
      -- JZR R_In, d 
      
      R_En <= "000";
      RA_Sel <= I (9 downto 7); -- opening mux to said register 
      -- now R_In will get the value in that register 
      
      Jmp_Addr <= I (2 downto 0);
      if R_In = "0000" then
        Jmp_Flag <= '1';
      else
        Jmp_Flag <= '0';
      end if;

    end if;
  end process;

end Behavioral;
