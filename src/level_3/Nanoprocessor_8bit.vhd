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
           
begin

Ins_Decoder_0 : Ins_Decoder_16
port map();

Decoder_1_To_4_0 : Decoder_1_To_4
port map();

MUX_4_8_0 : MUX_4_8
port map();

Program_Rom : LUT_32_16
port map();

Program_Counter : PC_5
port map();

Slow_Clock : Slow_Clk
port map();

Encoder_10_To_8_0 : Encoder_10_To_8
port map();

MUX_8_A : MUX_8_8
port map();

MUX_8_B : MUX_8_8
port map();

ALU : ALU_8
port map();

SPU : SPU_8
port map();

end Behavioral;
