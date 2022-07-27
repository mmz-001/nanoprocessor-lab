library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SGA_8 is
    Port( Clk : in STD_LOGIC;
          Sign, Hundreds, Tens, Ones : in STD_LOGIC_VECTOR(3 downto 0);
          Anode_Out_L : out STD_LOGIC_VECTOR(3 downto 0);
          Seven_Seg_Out_L : out STD_LOGIC_VECTOR(6 downto 0));
end SGA_8;

architecture Behavioral of SGA_8 is
    component Counter_2
        Port( Clk : in STD_LOGIC;
        Q : out STD_LOGIC_VECTOR(1 downto 0));
    end component;

    component Decoder_2_4
        Port ( D : in STD_LOGIC_VECTOR (1 downto 0);
        En : in STD_LOGIC;
        Q : out STD_LOGIC_VECTOR (3 downto 0));
    end component;

    component MUX_4_4
        Port ( A0 : in STD_LOGIC_VECTOR (3 downto 0);
        A1 : in STD_LOGIC_VECTOR (3 downto 0);
        A2 : in STD_LOGIC_VECTOR (3 downto 0);
        A3 : in STD_LOGIC_VECTOR (3 downto 0);
        Sel : in STD_LOGIC_VECTOR (1 downto 0);
        Q : out STD_LOGIC_VECTOR (3 downto 0));
    end component;

    component LUT_Dec_16_7
        Port ( I : in STD_LOGIC_VECTOR (3 downto 0);
        D : out STD_LOGIC_VECTOR (6 downto 0));
    end component;

    component Hex_Dec_Converter
        Port( D : in STD_LOGIC_VECTOR (7 downto 0);
        Sign, Ones, Tens, Hundreds : out STD_LOGIC_VECTOR (3 downto 0));
    end component;

    signal Digit_Sel : STD_LOGIC_VECTOR (1 downto 0);
    signal Anode_Out, Digit : STD_LOGIC_VECTOR (3 downto 0);

begin
     Counter_2_0 : Counter_2
        Port Map ( 
            Clk => Clk,
            Q => Digit_Sel
        );

      Decoder_2_4_0 : Decoder_2_4
      Port Map (
        D => Digit_Sel,
        En => '1',
        Q => Anode_Out
      );

      Anode_Out_L <= NOT (Anode_Out);

        
      MUX_4_4_0 : MUX_4_4
        Port Map (
        A0 => Ones,
        A1 => Tens,
        A2 => Hundreds,
        A3 => Sign,
        Sel => Digit_Sel,
        Q => Digit
        );

      LUT_Dec_16_7_0: LUT_Dec_16_7
        Port Map ( 
        I => Digit,
        D => Seven_Seg_Out_L
        );

    
end Behavioral;