library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Reg_8_4 is
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
end Reg_8_4;

architecture Behavioral of Reg_8_4 is

  component Decoder_3_8
    port (
      D : in STD_LOGIC_VECTOR (2 downto 0);
      En : in STD_LOGIC;
      Q : out STD_LOGIC_VECTOR (7 downto 0)
    );
  end component;

  component Reg_4 
    port ( D : in STD_LOGIC_VECTOR (3 downto 0);
           Res : in STD_LOGIC;
           En : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0)
    );
  end component;

  signal R_Sel : STD_LOGIC_VECTOR (7 downto 0);

begin
  Decoder_3_8_0 : Decoder_3_8
    port map (
      D => R_En,
      En => '1',
      Q => R_Sel
    );

  Red_4_0 : Reg_4
    port map (
      D => "0000",  -- Hardcode R0 to "0000"
      En => R_Sel(0),
      Res => Res,
      Clk => Clk,
      Q => R_0
    );
  
  Red_4_1 : Reg_4
    port map (
      D => R_In,
      En => R_Sel(1),
      Res => Res,
      Clk => Clk,
      Q => R_1
    );
  
  Red_4_2 : Reg_4
    port map (
      D => R_In,
      En => R_Sel(2),
      Res => Res,
      Clk => Clk,
      Q => R_2
    );
  
  Red_4_3 : Reg_4
    port map (
      D => R_In,
      En => R_Sel(3),
      Res => Res,
      Clk => Clk,
      Q => R_3
    );
  
  Red_4_4 : Reg_4
    port map (
      D => R_In,
      En => R_Sel(4),
      Res => Res,
      Clk => Clk,
      Q => R_4
    );
  
  Red_4_5 : Reg_4
    port map (
      D => R_In,
      En => R_Sel(5),
      Res => Res,
      Clk => Clk,
      Q => R_5
    );
  
  Red_4_6 : Reg_4
    port map (
      D => R_In,
      En => R_Sel(6),
      Res => Res,
      Clk => Clk,
      Q => R_6
    );
  
  Red_4_7 : Reg_4
    port map (
      D => R_In,
      En => R_Sel(7),
      Res => Res,
      Clk => Clk,
      Q => R_7
    );
  
-- R_En(1) = '1' means register 1 is activated 


end Behavioral;
