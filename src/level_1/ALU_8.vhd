library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity ALU_8 is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           ALU_Sel : in STD_LOGIC_VECTOR (2 downto 0);
           ALU_Out : out STD_LOGIC_VECTOR (7 downto 0);
           Flags : out STD_LOGIC_VECTOR (3 downto 0)
    );
end ALU_8;

architecture Behavioral of ALU_8 is
    component Decoder_3_To_8
        Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
            Q0 : out STD_LOGIC;
            Q1 : out STD_LOGIC;
            Q2 : out STD_LOGIC;
            Q3 : out STD_LOGIC;
            Q4 : out STD_LOGIC;
            Q5 : out STD_LOGIC;
            Q6 : out STD_LOGIC;
            Q7 : out STD_LOGIC);
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

    component Add_Sub_8
        Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
        B : in STD_LOGIC_VECTOR (7 downto 0);
        Add_Sel : in STD_LOGIC := '0';
        Sub_Sel : in STD_LOGIC := '0';
        Add_Out : out STD_LOGIC_VECTOR (7 downto 0);
        Sub_Out : out STD_LOGIC_VECTOR (7 downto 0);
        Flag : out STD_LOGIC_VECTOR (3 downto 0));
    end component;

    component Div_Mod_8
        Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
        B : in STD_LOGIC_VECTOR (7 downto 0);
        Div_Sel : in STD_LOGIC;
        Mod_Sel : in STD_LOGIC;
        Div_Out : out STD_LOGIC_VECTOR (7 downto 0);
        Mod_Out : out STD_LOGIC_VECTOR (7 downto 0);
        Flags : out STD_LOGIC_VECTOR (3 downto 0));
    end component;

    component MUL
        Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
        B : in STD_LOGIC_VECTOR (7 downto 0);
        Mul_Sel : in STD_LOGIC;
        Q : out STD_LOGIC_VECTOR (7 downto 0);
        FLAG : out STD_LOGIC_VECTOR (3 downto 0));
    end component;

    component INC_DEC_8
        Port ( Inc_Sel : in STD_LOGIC := '0';
        Dec_Sel : in STD_LOGIC := '0';
        A : in STD_LOGIC_VECTOR (7 downto 0);
        Inc_Out : out STD_LOGIC_VECTOR (7 downto 0);
        Dec_Out : out STD_LOGIC_VECTOR (7 downto 0);
        Flag : out STD_LOGIC_VECTOR (3 downto 0));
    end component;

    component Cmp_8
        Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
        B : in STD_LOGIC_VECTOR (7 downto 0);
        Cmp_Sel : in STD_LOGIC;
        Q : out STD_LOGIC_VECTOR (7 downto 0);
        Flags : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    
signal Add_Sel, Sub_Sel, Div_Sel, Mod_Sel, Mul_Sel, Inc_Sel, Dec_Sel, Cmp_Sel : STD_LOGIC;
signal Add_Out, Sub_Out, Div_Out, Mod_Out, Mul_Out, Inc_Out, Dec_Out, Cmp_Out : STD_LOGIC_VECTOR (7 downto 0);
signal Flags_1, Flags_2, Flags_3, Flags_4, Flags_5 : STD_LOGIC_VECTOR (3 downto 0);
begin

    Decoder_3_To_8_0 : Decoder_3_To_8
    Port map (
        A => ALU_Sel,
        Q0 => Add_Sel,
        Q1 => Sub_Sel,
        Q2 => Div_Sel,
        Q3 => Mod_Sel,
        Q4 => Mul_Sel,
        Q5 => Inc_Sel,
        Q6 => Dec_Sel,
        Q7 => Cmp_Sel
    );

    Add_Sub_8_0 : Add_Sub_8
        Port Map( 
        A => A, 
        B => B, 
        Add_Sel => Add_Sel, 
        Sub_Sel => Sub_Sel, 
        Add_Out => Add_Out, 
        Sub_Out => Sub_Out, 
        Flag => Flags_1
        );

    Div_Mod_8_0 : Div_Mod_8
        Port Map ( 
        A => A,
        B => B,
        Div_Sel => Div_Sel,
        Mod_Sel => Mod_Sel,
        Div_Out => Div_Out,
        Mod_Out => Mod_Out,
        Flags => Flags_2,
        );
    
    MUL_0 : MUL
        Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
        B : in STD_LOGIC_VECTOR (7 downto 0);
        Mul_Sel : in STD_LOGIC;
        Q : out STD_LOGIC_VECTOR (7 downto 0);
        FLAG : out STD_LOGIC_VECTOR (3 downto 0));
    


    -- MUX_8_8_0 : MUX_8_8
    -- Port map (
    --     A0
    --     A1
    --     A2
    --     A3
    --     A4
    --     A5
    --     A6
    --     A7
    --     Q
    --     Select_In
    -- );
       


end Behavioral;