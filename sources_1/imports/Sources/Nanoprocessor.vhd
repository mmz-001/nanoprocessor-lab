library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Nanoprocessor is
    port(Out_LED : out std_logic_vector (3 downto 0);
        overflow : out std_logic;
        zero : out std_logic;
        clock : in std_logic;
        reset : in std_logic);
        
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

signal reg_en : std_logic_vector (2 downto 0);
signal ins_mux_out : std_logic_vector (3 downto 0);

-- data bus from register bank to the 2 4 bit MUXes 
signal R0 : std_logic_vector (3 downto 0);
signal R1 : std_logic_vector (3 downto 0);
signal R2 : std_logic_vector (3 downto 0);
signal R3 : std_logic_vector (3 downto 0);
signal R4 : std_logic_vector (3 downto 0);
signal R5 : std_logic_vector (3 downto 0);
signal R6 : std_logic_vector (3 downto 0);
signal R7 : std_logic_vector (3 downto 0);

-- instruction bus (from ROM to decoder)
signal ins_bus : std_logic_vector (11 downto 0);

-- address from 2 way 3 bit mux
signal D_in : std_logic_vector (2 downto 0);

-- ouput from program counter 
signal M_out : std_logic_vector (2 downto 0);

signal to_mux_2_3 : std_logic_vector (2 downto 0);
signal pc_carry : std_logic;

-- Flag address 
signal Flag_val : std_logic_vector (2 downto 0);
-- flag enable 
signal flg_en : std_logic;

-- value from add sub unit going to 2 way 4 bit mux 
signal sum_to_mux : std_logic_vector (3 downto 0);

signal add_sub_sel: std_logic;

-- data from the 2 8 way 4 bit MUXes to the add/sub unit 
signal A_in : std_logic_vector (3 downto 0);
signal B_in : std_logic_vector (3 downto 0);

-- select for mux A 
signal mux_A_sel : std_logic_vector (2 downto 0);
-- select for mux B 
signal mux_B_sel : std_logic_vector (2 downto 0);

signal MUX_2_4_sel:std_logic; -- select bit for 2 way 4 bit mux 
signal I_val : std_logic_vector (3 downto 0);

begin

    Reg_Bank : REG_4_BANK_8
        Port map(Res => reset,
            R_En => reg_en,
            Clk  => clock,
            R_In => ins_mux_out,
            R_0  => R0,
            R_1  => R1,
            R_2  => R2,
            R_3  => R3,
            R_4  => R4,
            R_5  => R5,
            R_6  => R6,
            R_7  => R7
    );
    
    PC : PC_3
        Port map (Res => reset,
        Clk => clock,
        D  => D_in,
        M  => M_out
   );

    P_ROM : LUT_8_12
        Port map ( M => M_out,
           I => ins_bus );

    ADD_3_bit : RCA_3
        port map(
        PC_in => M_out ,
        PC_out=> to_mux_2_3,
        c_out => PC_carry );
        
    MUX_2_3_bit : MUX_2_way_3_bit
        port map(
        adder_in => to_mux_2_3,
        jump_in => Flag_val,
        Jump_flag => flg_en,
        out_bus => D_in);
        
    ADD_SUB : ADD_SUB_4
        port map (
         A => A_in,
         B => B_in,
         Neg => add_sub_sel,
         S => sum_to_mux,
         Overflow =>overflow,
         Zero => zero);
                
    MUX_A : MUX_8_way_4_bit
        port map(
        A0 => R0,
        A1 => R1,
        A2 => R2,
        A3 => R3,
        A4 => R4,
        A5 => R5,
        A6 => R6,
        A7 => R7,
        sel_bus => mux_A_sel,
        out_bus => A_in);  

    MUX_B : MUX_8_way_4_bit
        port map(
        A0 => R0,
        A1 => R1,
        A2 => R2,
        A3 => R3,
        A4 => R4,
        A5 => R5,
        A6 => R6,
        A7 => R7,
        sel_bus => mux_B_sel,
        out_bus => B_in);  
        
    MUX_2_4bit : MUX_2_way_4_bit
    
        Port map( in_01 => I_val,
           in_02 => sum_to_mux,
           select_bit => MUX_2_4_sel,
           out_bus => ins_mux_out);
           
           
    INS_DEC : INS_DECODER
        Port map (
        I => ins_bus,
        R => A_in,
        R_En => reg_en, 
        RA_Sel => mux_A_sel, 
        RB_Sel => mux_B_sel, 
        JMP_Add => Flag_val,
        Load_Sel => MUX_2_4_sel , 
        Add_Sub_Sel => add_sub_sel, 
        JMP_Flag => flg_en,
        Im_Val => I_val
      );
    
    Out_LED<=R7;
    
end Behavioral;
