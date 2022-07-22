library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Nanoprocessor is
    port(LED_Out : out STD_LOGIC_VECTOR (3 downto 0);
        Overflow : out STD_LOGIC;
        Zero : out STD_LOGIC;
        Seven_Seg_Out_L : out STD_LOGIC_VECTOR(6 downto 0);
        Anode_L : out STD_LOGIC_VECTOR(3 downto 0);
        Clk : in STD_LOGIC;
        Res : in STD_LOGIC);
        
end Nanoprocessor;

architecture Behavioral of Nanoprocessor is

component Slow_Clk
    Port ( Clk_In : in STD_LOGIC;
           Clk_Out : out STD_LOGIC);
end component;

component Reg_8_4 
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

component MUX_8_4
    Port ( A0 : in STD_LOGIC_VECTOR (3 downto 0);
           A1 : in STD_LOGIC_VECTOR (3 downto 0);
           A2 : in STD_LOGIC_VECTOR (3 downto 0);
           A3 : in STD_LOGIC_VECTOR (3 downto 0);
           A4 : in STD_LOGIC_VECTOR (3 downto 0);
           A5 : in STD_LOGIC_VECTOR (3 downto 0);
           A6 : in STD_LOGIC_VECTOR (3 downto 0);
           A7 : in STD_LOGIC_VECTOR (3 downto 0);
           Sel : in STD_LOGIC_VECTOR (2 downto 0);
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component Add_Sub_4
  Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
         B : in STD_LOGIC_VECTOR (3 downto 0);
         Neg : in STD_LOGIC;
         Sum : out STD_LOGIC_VECTOR (3 downto 0);
         Overflow : out STD_LOGIC;
         Zero : out STD_LOGIC);
end component;

component MUX_2_4
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Sel : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0));

end component;

component RCA_3
    Port ( D : in STD_LOGIC_VECTOR (2 downto 0);
           Q : out STD_LOGIC_VECTOR (2 downto 0);
           Carry_Out : out STD_LOGIC);
end component;

component MUX_2_3
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           B : in STD_LOGIC_VECTOR (2 downto 0);
           Sel : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component PC_3
  Port (Res : in STD_LOGIC;
        Clk : in STD_LOGIC;
        D : in STD_LOGIC_VECTOR (2 downto 0);
        Q : out STD_LOGIC_VECTOR (2 downto 0)
   );
end component;

-- Program ROM
component LUT_12_8
    Port ( D : in STD_LOGIC_VECTOR (2 downto 0);
           I : out STD_LOGIC_VECTOR (11 downto 0));
end component;

-- 7-segment ROM
component LUT_16_7
    Port ( I : in STD_LOGIC_VECTOR (3 downto 0);
           D : out STD_LOGIC_VECTOR (6 downto 0));
end component;

component Ins_Decoder_12
  Port (
    I : in STD_LOGIC_VECTOR (11 downto 0); -- 12 bit instruction
    R_In : in STD_LOGIC_VECTOR (3 downto 0);
    R_En, RA_Sel, RB_Sel, Jmp_Addr : out STD_LOGIC_VECTOR (2 downto 0);
    Load_Sel, Add_Sub_Sel, Jmp_Flag, Add_Sub_Flag : out STD_LOGIC;
    Im_Val : out STD_LOGIC_VECTOR (3 downto 0)
  );

end component;

signal R_En : STD_LOGIC_VECTOR (2 downto 0);
signal Ins_Mux : STD_LOGIC_VECTOR (3 downto 0);

-- data bus from register bank to the 2 4 bit MUXes 
signal R0 : STD_LOGIC_VECTOR (3 downto 0);
signal R1 : STD_LOGIC_VECTOR (3 downto 0);
signal R2 : STD_LOGIC_VECTOR (3 downto 0);
signal R3 : STD_LOGIC_VECTOR (3 downto 0);
signal R4 : STD_LOGIC_VECTOR (3 downto 0);
signal R5 : STD_LOGIC_VECTOR (3 downto 0);
signal R6 : STD_LOGIC_VECTOR (3 downto 0);
signal R7 : STD_LOGIC_VECTOR (3 downto 0);

-- instruction bus (from ROM to decoder)
signal I : STD_LOGIC_VECTOR (11 downto 0);

-- address from 2 way 3 bit mux
signal D_In : STD_LOGIC_VECTOR (2 downto 0);

-- ouput from program counter 
signal M : STD_LOGIC_VECTOR (2 downto 0);

signal To_Mux_2_3 : STD_LOGIC_VECTOR (2 downto 0);
signal PC_Carry : STD_LOGIC;

-- Flag address 
signal Flag_Val : STD_LOGIC_VECTOR (2 downto 0);
-- flag enable 
signal Flag_En : STD_LOGIC;

-- value from add sub unit going to 2 way 4 bit mux 
signal Sum_To_Mux : STD_LOGIC_VECTOR (3 downto 0);

signal Add_Sub_Sel: STD_LOGIC;

-- data from the 2 8 way 4 bit MUXes to the add/sub unit 
signal A_in : STD_LOGIC_VECTOR (3 downto 0);
signal B_in : STD_LOGIC_VECTOR (3 downto 0);

-- select for mux A 
signal MUX_A_Sel : STD_LOGIC_VECTOR (2 downto 0);
-- select for mux B 
signal MUX_B_Sel : STD_LOGIC_VECTOR (2 downto 0);

signal MUX_2_4_Sel:STD_LOGIC; -- select bit for 2 way 4 bit mux 
signal I_Val : STD_LOGIC_VECTOR (3 downto 0);

-- Output from Add_Sub_4
signal Add_Sub_Overflow, Add_Sub_Zero : STD_LOGIC;

-- Add_Sub_Flag output from INSTRUCTION_DECODER
signal Add_Sub_Flag : STD_LOGIC;

-- Slow Clk signal
signal Clk_Slow : STD_LOGIC;

begin

    -- Activate Zero and Overflow flags only when
    -- performing using Add_Sub_4 unit

    Zero <= Add_Sub_Zero and Add_Sub_Flag;
    Overflow <= Add_Sub_Overflow and Add_Sub_Flag;

    Slow_Clk_0 : Slow_Clk
        Port Map(
            Clk_In => Clk,
            Clk_Out => Clk_Slow
        );

    Reg_8_4_0 : Reg_8_4
        Port map(
            Res => Res,
            R_En => R_En,
            Clk  => Clk_Slow,
            R_In => Ins_Mux,
            R_0  => R0,
            R_1  => R1,
            R_2  => R2,
            R_3  => R3,
            R_4  => R4,
            R_5  => R5,
            R_6  => R6,
            R_7  => R7
    );
    
    PC_3_0 : PC_3
        Port map (
        Res => Res,
        Clk => Clk_Slow,
        D  => D_In,
        Q  => M
   );

    LUT_12_8_0 : LUT_12_8
        Port map ( 
            D => M,
            I => I );

    RCA_3_0 : RCA_3
        port map(
        D => M ,
        Q=> To_Mux_2_3,
        Carry_Out => PC_carry );
        
    MUX_2_3_0 : MUX_2_3
        port map(
        A => To_Mux_2_3,
        B => Flag_Val,
        Sel => Flag_En,
        Q => D_In);
        
    Add_Sub_4_0 : Add_Sub_4
        port map (
         A => A_in,
         B => B_in,
         Neg => Add_Sub_Sel,
         Sum => Sum_To_Mux,
         Overflow =>Add_Sub_Overflow,
         Zero => Add_Sub_Zero);
                
    MUX_8_4_0 : MUX_8_4
        port map(
        A0 => R0,
        A1 => R1,
        A2 => R2,
        A3 => R3,
        A4 => R4,
        A5 => R5,
        A6 => R6,
        A7 => R7,
        Sel => MUX_A_Sel,
        Q => A_in);  

    MUX_8_4_1 : MUX_8_4
        port map(
        A0 => R0,
        A1 => R1,
        A2 => R2,
        A3 => R3,
        A4 => R4,
        A5 => R5,
        A6 => R6,
        A7 => R7,
        Sel => MUX_B_Sel,
        Q => B_in);  
        
    MUX_2_4_0 : MUX_2_4
    
        Port map( A => I_Val,
           B => Sum_To_Mux,
           Sel => MUX_2_4_Sel,
           Q => Ins_Mux);
           
           
    Ins_Decoder_12_0 : Ins_Decoder_12
        Port map (
        I => I,
        R_In => A_in,
        R_En => R_En, 
        RA_Sel => MUX_A_Sel, 
        RB_Sel => MUX_B_Sel, 
        Jmp_Addr => Flag_Val,
        Load_Sel => MUX_2_4_Sel , 
        Add_Sub_Sel => Add_Sub_Sel, 
        Jmp_Flag => Flag_En,
        Add_Sub_Flag => Add_Sub_Flag,
        Im_Val => I_Val
      );
    
    LED_Out <= R7;

    -- 7-segmenet display
    LUT_16_7_0: LUT_16_7
        Port map (
            I => R7,
            D => Seven_Seg_Out_L
        );
    -- Select 7-segment display
    Anode_L <= "1110";
    
end Behavioral;
