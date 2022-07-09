library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity REG_4_BANK_8 is
  Port (Res : in STD_LOGIC;
        R_En : in STD_LOGIC_VECTOR (2 downto 0);
        Clk : in STD_LOGIC;
        R_In : in STD_LOGIC_VECTOR (3 downto 0);
        R_0 : out STD_LOGIC_VECTOR (3 downto 0);
        R_1 : out STD_LOGIC_VECTOR (3 downto 0);
        R_2 : out STD_LOGIC_VECTOR (3 downto 0);
        R_3 : out STD_LOGIC_VECTOR (3 downto 0);
        R_4 : out STD_LOGIC_VECTOR (3 downto 0);
        R_5 : out STD_LOGIC_VECTOR (3 downto 0);
        R_6 : out STD_LOGIC_VECTOR (3 downto 0);
        R_7 : out STD_LOGIC_VECTOR (3 downto 0)
  );
end REG_4_BANK_8;

architecture Behavioral of REG_4_BANK_8 is

  component Decoder_3_to_8
    port (
      I : in STD_LOGIC_VECTOR (2 downto 0);
      EN : in STD_LOGIC;
      Y : out STD_LOGIC_VECTOR (7 downto 0)
    );
  end component;

  component REG_4 
    port ( D : in STD_LOGIC_VECTOR (3 downto 0);
           Res : in STD_LOGIC;
           En : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0)
    );
  end component;

  signal R_Sel : STD_LOGIC_VECTOR (7 downto 0);

begin
  Decoder_3_to_8_0 : Decoder_3_to_8
    port map (
      I => R_In,
      EN => '1',
      Y => R_Sel
    );

  REG_4_0 : REG_4
    port map (
      D => R_In,
      En => '1',
      Res => Res,
      Clk => Clk
    );
  

end Behavioral;
