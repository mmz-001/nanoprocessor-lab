library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Nanoprocessor is
end Nanoprocessor;

architecture Behavioral of Nanoprocessor is

component REG_4_BANK_8 
  Port (Res : in STD_LOGIC;
        R_En : in STD_LOGIC_VECTOR (2 downto 0); -- regeister select
        Clk : in STD_LOGIC;
        R_In : in STD_LOGIC_VECTOR (3 downto 0); -- data in
        R_0 : out STD_LOGIC_VECTOR (3 downto 0);
        R_1 : out STD_LOGIC_VECTOR (3 downto 0);
        R_2 : out STD_LOGIC_VECTOR (3 downto 0);
        R_3 : out STD_LOGIC_VECTOR (3 downto 0);
        R_4 : out STD_LOGIC_VECTOR (3 downto 0);
        R_5 : out STD_LOGIC_VECTOR (3 downto 0);
        R_6 : out STD_LOGIC_VECTOR (3 downto 0);
        R_7 : out STD_LOGIC_VECTOR (3 downto 0)
  );
end component;

component MUX_8_way_4_bit
    Port ( A0 : in STD_LOGIC_VECTOR (3 downto 0);
           A1 : in STD_LOGIC_VECTOR (3 downto 0);
           A2 : in STD_LOGIC_VECTOR (3 downto 0);
           A3 : in STD_LOGIC_VECTOR (3 downto 0);
           A4 : in STD_LOGIC_VECTOR (3 downto 0);
           A5 : in STD_LOGIC_VECTOR (3 downto 0);
           A6 : in STD_LOGIC_VECTOR (3 downto 0);
           A7 : in STD_LOGIC_VECTOR (3 downto 0);
           sel_bus : in STD_LOGIC_VECTOR (2 downto 0);
           out_bus : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component ADD_SUB_4
  Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
         B : in STD_LOGIC_VECTOR (3 downto 0);
         Neg : in STD_LOGIC;
         S : out STD_LOGIC_VECTOR (3 downto 0);
         Overflow : out STD_LOGIC;
         Zero : out STD_LOGIC);
end component;

component MUX_2_way_4_bit
    Port ( in_01 : in STD_LOGIC_VECTOR (3 downto 0);
           in_02 : in STD_LOGIC_VECTOR (3 downto 0);
           select_bit : in STD_LOGIC;
           out_bus : out STD_LOGIC_VECTOR (3 downto 0));

end component;

component RCA_3
    Port ( PC_in : in STD_LOGIC_VECTOR (2 downto 0);
           PC_out : out STD_LOGIC_VECTOR (2 downto 0);
           c_out : out std_logic);
end component;

component MUX_2_way_3_bit
    Port ( adder_in : in STD_LOGIC_VECTOR (2 downto 0);
           jump_in : in STD_LOGIC_VECTOR (2 downto 0);
           Jump_flag : in STD_LOGIC;
           out_bus : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component PC_3
  Port (Res : in STD_LOGIC;
        Clk : in STD_LOGIC;
        D : in STD_LOGIC_VECTOR (2 downto 0);
        M : out STD_LOGIC_VECTOR (2 downto 0)
   );
end component;

component LUT_8_12
    Port ( M : in STD_LOGIC_VECTOR (2 downto 0);
           I : out STD_LOGIC_VECTOR (11 downto 0));
end component;

component INS_DECODER

  Port (
    I : in STD_LOGIC_VECTOR (11 downto 0); -- 12 bit instruction
    R : in STD_LOGIC_VECTOR (3 downto 0);
    R_En, RA_Sel, RB_Sel, JMP_Add : out STD_LOGIC_VECTOR (2 downto 0);
    Load_Sel, Add_Sub_Sel, JMP_Flag : out STD_LOGIC;
    Im_Val : out STD_LOGIC_VECTOR (3 downto 0)
  );

end component;


begin




end Behavioral;
