library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Nanoprocessor_8bit is
    Port ( Clk : in STD_LOGIC;
           Res : in STD_LOGIC;
           Switches : in STD_LOGIC_VECTOR (9 downto 0);
           Push_Buttons : in STD_LOGIC_VECTOR (7 downto 0);
           R7_LED_Out : out STD_LOGIC_VECTOR (7 downto 0);
           Anode_Out : out STD_LOGIC_VECTOR (3 downto 0);
           Seven_Seg_Out : out STD_LOGIC_VECTOR (7 downto 0);
           Flag_LED_Out : out STD_LOGIC_VECTOR (3 downto 0));
end Nanoprocessor_8bit;

architecture Behavioral of Nanoprocessor_8bit is

component Ins_Decoder_16
    Port (
        I : in STD_LOGIC_VECTOR (15 downto 0); -- 16 bit instruction
        R_In : in STD_LOGIC_VECTOR (7 downto 0);  -- Input Register
        Zero, Overflow, Negative, Interrupt : in STD_LOGIC;
        R_En, RA_Sel, RB_Sel : out STD_LOGIC_VECTOR (2 downto 0);
        Jmp_Flag : out STD_LOGIC;
        AU_Sel: out STD_LOGIC_VECTOR (2 downto 0);
        Load_Sel : out STD_LOGIC_VECTOR ( 1 downto 0);
        Jmp_Addr : out STD_LOGIC_VECTOR (4 downto 0);
        Im_Val : out STD_LOGIC_VECTOR (7 downto 0);
        M : in STD_LOGIC_VECTOR (4 downto 0));
end component;

component Decoder_1_To_4
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           Z : out STD_LOGIC; -- Zero 
           O : out STD_LOGIC; -- Overflow 
           N : out STD_LOGIC; -- Negative 
           I : out STD_LOGIC); -- Interrupt 
end component;      

component MUX_4_8
    Port ( A0 : in STD_LOGIC_VECTOR (7 downto 0);
           A1 : in STD_LOGIC_VECTOR (7 downto 0);
           A2 : in STD_LOGIC_VECTOR (7 downto 0);
           A3 : in STD_LOGIC_VECTOR (7 downto 0);
           Select_In : in STD_LOGIC_VECTOR (1 downto 0);
           Q : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component LUT_32_16
    Port ( D : in STD_LOGIC_VECTOR (4 downto 0);
           I : out STD_LOGIC_VECTOR (15 downto 0));
end component;

component PC_5
  Port (Res : in STD_LOGIC;
        Clk : in STD_LOGIC;
        Addr_Jump : in STD_LOGIC_VECTOR (4 downto 0);
        Jump_Flag : in STD_LOGIC; 
        M : out STD_LOGIC_VECTOR (4 downto 0)
);
end component;
   
component Slow_Clk
    Port ( Clk_In : in STD_LOGIC;
           Clk_Out : out STD_LOGIC);
end component;

component Encoder_10_To_8
    Port ( A : in STD_LOGIC_VECTOR (9 downto 0); -- mapped to switches 1 to 10 
                                                 -- representing decimal values 1 to 10 
           Q : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component MUX_8_8
    Port ( A0 : in STD_LOGIC_VECTOR (7 downto 0);
           A1 : in STD_LOGIC_VECTOR (7 downto 0);
           A2 : in STD_LOGIC_VECTOR (7 downto 0);
           A3 : in STD_LOGIC_VECTOR (7 downto 0);
           A4 : in STD_LOGIC_VECTOR (7 downto 0);
           A5 : in STD_LOGIC_VECTOR (7 downto 0);
           A6 : in STD_LOGIC_VECTOR (7 downto 0);
           A7 : in STD_LOGIC_VECTOR (7 downto 0);
           Q : out STD_LOGIC_VECTOR (7 downto 0);
           Select_In : in STD_LOGIC_VECTOR (2 downto 0));
end component;

component ALU_8
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           ALU_Sel : in STD_LOGIC_VECTOR (2 downto 0);
           ALU_Out : out STD_LOGIC_VECTOR (7 downto 0);
           Flags : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component SPU_8
    Port ( I : in STD_LOGIC_VECTOR (7 downto 0);
           Flags : in STD_LOGIC_VECTOR (3 downto 0);
           Clk : in STD_LOGIC;
           Seven_Seg_Out_L : out STD_LOGIC_VECTOR (6 downto 0);
           Anode_Out_L : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component Reg_8_8
    Port (
        Res : in STD_LOGIC;
        R_En : in STD_LOGIC_VECTOR (2 downto 0); -- regeister select
        Clk : in STD_LOGIC;
        R_In : in STD_LOGIC_VECTOR (7 downto 0); -- data in
        R_0 : out STD_LOGIC_VECTOR (7 downto 0); -- 8 bit regsiters
        R_1 : out STD_LOGIC_VECTOR (7 downto 0);
        R_2 : out STD_LOGIC_VECTOR (7 downto 0);
        R_3 : out STD_LOGIC_VECTOR (7 downto 0);
        R_4 : out STD_LOGIC_VECTOR (7 downto 0);
        R_5 : out STD_LOGIC_VECTOR (7 downto 0);
        R_6 : out STD_LOGIC_VECTOR (7 downto 0);
        R_7 : out STD_LOGIC_VECTOR (7 downto 0));
end component;    

signal Ins_Bus : STD_LOGIC_VECTOR (15 downto 0);
signal S_Clk,JMP_Flag : STD_LOGIC;
signal M,Jmp_Addr : STD_LOGIC_VECTOR (4 downto 0);
signal R_In,Im_val,Load_Sel_Mux_Out,AU_Out,SW_In,Push_In : STD_LOGIC_VECTOR (7 downto 0);
signal Zero,Overflow,Negative,Interrupt : STD_LOGIC;
signal R_En,RA_Sel,RB_Sel,ALU_Sel : STD_LOGIC_VECTOR (2 downto 0);
signal Load_Sel : STD_LOGIC_VECTOR (1 downto 0);
signal FLAGS : STD_LOGIC_VECTOR (3 downto 0);
signal R0,R1,R2,R3,R4,R5,R6,R7 : STD_LOGIC_VECTOR (7 downto 0);
           
begin

Ins_Decoder_0 : Ins_Decoder_16
port map(
    I => Ins_Bus,
    M => M,          
    R_In => R_In,
    Zero => zero, 
    Overflow => Overflow, 
    Negative => Negative, 
    Interrupt => interrupt,
    R_En => R_En, 
    RA_Sel => RA_Sel, 
    RB_Sel => RB_Sel,
    Jmp_Flag => Jmp_Flag,
    AU_Sel => ALU_Sel,
    Load_Sel => Load_Sel,
    Jmp_Addr => Jmp_Addr,
    Im_Val => Im_val);

Decoder_1_To_4_0 : Decoder_1_To_4
port map(
    A => FLAGS,
    O => Overflow,
    N => Negative,
    Z => Zero,
    I => Interrupt);

MUX_4_8_0 : MUX_4_8
port map(
    A0 => Im_val,
    A1 => AU_Out,
    A2 => SW_In,
    A3 => Push_In,
    Select_In => Load_Sel,
    Q => Load_Sel_Mux_Out);

Program_Rom : LUT_32_16
port map(
    I => Ins_Bus,
    D => M);

Program_Counter : PC_5
port map(
    Res => Res,
    Clk =>S_Clk,
    Addr_Jump => JMP_Addr,
    Jump_Flag => JMP_Flag,
    M => M);

Slow_Clock : Slow_Clk
port map(
    Clk_in => Clk,
    Clk_out => S_Clk);

Encoder_10_To_8_0 : Encoder_10_To_8
port map(
    A => Switches,
    Q => SW_In);

MUX_8_A : MUX_8_8
port map();

MUX_8_B : MUX_8_8
port map();

ALU : ALU_8
port map();

SPU : SPU_8
port map();

Reg_Bank : Reg_8_8
port map(
    Res => Res,
    R_En => R_En,
    Clk => S_Clk,
    R_In => Load_Sel_Mux_Out,
    R_0 => R0,
    R_1 => R1,
    R_2 => R2,
    R_3 => R3,
    R_4 => R4,
    R_5 => R5,
    R_6 => R6,
    R_7 => R7);

end Behavioral;
